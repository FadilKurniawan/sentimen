import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/base/base_refresher_status.dart';
import 'package:sentimen/data/storage/storage_constants.dart';
import 'package:sentimen/environment.dart';
import 'package:sentimen/model/db_model.dart';
import 'package:sentimen/module/auth/auth_controller.dart';
import 'package:intl/intl.dart';
import 'package:sentimen/module/stalker/widgets/print_report.dart';
import 'package:sentimen/resources/resources.dart';

class BaseFileController extends GetxController {
  AuthController auth = AuthController.find;

  get isLoading => status.value == RefresherStatus.loading;
  get isEmpty =>
      (status.value == RefresherStatus.initial ||
          status.value == RefresherStatus.empty) &&
      !isLoading &&
      currentExcel == null;

  var status = RefresherStatus.initial.obs;

  Rx<DBModel> dbModel = DBModel().obs;
  Excel? currentExcel;
  String? selectFilepath;
  bool exist = false;
  int? maxRows;
  var cellHover = 0.obs;
  var searchText = ''.obs;
  var searchTextController = TextEditingController().obs;

  var tableData = [
    ['']
  ].obs;

  var allData = [
    ['']
  ].obs;
  var searchData = [
    ['']
  ].obs;

  int get newRow => maxRows ?? currentExcel!.tables['Sheet1']!.maxRows;

  String filePath({String? extra = ''}) =>
      selectFilepath ??
      Env.stalkerPath +
          "\\${DateFormat('dd-MM-yyyy').format(DateTime.now())} ($extra).xlsx";
  @override
  void onInit() {
    tableData.clear();
    allData.clear();
    searchData.clear();
    getModelFromLocal();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchTextController.close();
    super.onClose();
  }

  initialStorage() {
    checkExistDir(Env.dirAppPath);
    checkExistDir(Env.stalkerPath);
  }

  Future<void> checkExistDir(String path) async {
    bool exists = await Directory(path).exists();
    if (!exists) {
      Directory(path).create();
    }
  }

  void getModelFromLocal() async {
    initialStorage();
    dbModel.value = DBModel.fromJson(auth.storage.get(StorageName.DB_Model));
    update();
  }

  Future<void> createFile(String? extra) async {
    selectFilepath = null;
    maxRows = null;
    exist = await File(filePath(extra: extra)).exists();
    debugPrint('EXIST $exist $filePath');
    if (!exist) {
      currentExcel = Excel.createExcel();
      List<dynamic> listHead = dbModel.value.columnHeadersStalker!
          .asMap()
          .values
          .map((e) => e.value ?? '')
          .toList();

      currentExcel?['Sheet1'].insertRowIterables(listHead, newRow);
      saveFile(extra: extra);
    } else {
      error('File Already Exist');
      loading();
    }
    var isFill = await loadFromPath(filePath(extra: extra));
    status.value = isFill ? RefresherStatus.success : RefresherStatus.failed;
    update();
  }

  saveFile({String? extra}) {
    try {
      var fileBytes = currentExcel?.save();
      File(filePath(extra: extra))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
      success('File $newRow saved to $filePath()');
    } catch (e) {
      error(e.toString());
    }
  }

  addNewRowtoFile(List<dynamic> model) async {
    if (currentExcel != null) {
      currentExcel?['Sheet1'].insertRowIterables(model, newRow);
      saveFile();
      var isFill = await loadExcelFile(currentExcel!);
      status.value = isFill ? RefresherStatus.success : RefresherStatus.failed;
      update();
    } else {
      error('please select a file or create a new one');
    }
  }

  loading() {
    status.value = RefresherStatus.loading;
    update();
  }

  error(String message) {
    Get.snackbar(
      'Oops..',
      message,
      duration: Duration(seconds: 5),
      backgroundColor: Resources.color.errorColor,
      colorText: Resources.color.textColorWhite,
      margin: EdgeInsets.all(24),
      maxWidth: 350,
    );
  }

  success(String message) {
    Get.snackbar(
      'Success',
      message,
      duration: Duration(seconds: 5),
      backgroundColor: Resources.color.successColor,
      colorText: Resources.color.textColorWhite,
      margin: EdgeInsets.all(24),
      maxWidth: 350,
    );
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['xlsx'], type: FileType.custom);
    status.value = RefresherStatus.loading;
    update();
    var isFill = false;
    if (result != null) {
      exist = true;
      selectFilepath = result.files.single.path;
      isFill = await loadFromPath(result.files.single.path);
    }

    status.value = isFill ? RefresherStatus.success : RefresherStatus.failed;
    update();
  }

  Future<bool> loadFromPath(String path) async {
    var bytes = await File(path).readAsBytes();
    currentExcel = Excel.decodeBytes(bytes);
    return await loadExcelFile(currentExcel!);
  }

  Future<bool> loadExcelFile(Excel excel) async {
    for (var table in excel.tables.keys) {
      // print(table); //sheet Name
      // print(excel.tables[table]?.maxCols);
      maxRows = excel.tables[table]?.maxRows;
      var rows = excel.tables[table]?.rows;
      if (rows != null) {
        allData.clear();
        tableData.clear();
        //looping rows
        List<List<String>> tempList = [];
        rows.asMap().forEach((indexrow, col) {
          List<String> listCol = [];
          if (indexrow > 0) {
            //looping column
            dbModel.value.columnHeadersStalker!
                .asMap()
                .forEach((indexcol, head) {
              var val =
                  col[indexcol] != null ? col[indexcol]!.value.toString() : '';
              listCol.add(val);
            });
            tempList.add(listCol);
          }
        });
        tableData.addAll(tempList.reversed);
        allData.addAll(tempList.reversed);
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void printReport(String title, String date, String body) async {
    Get.dialog(PrintReport(
      title: title,
      date: date,
      body: body,
    ));
  }

  double getWidthCell(int i) {
    switch (i) {
      case 0:
        return 70;
      case 1:
        return 170;
      case 2:
        return 50;
      case 3:
        return 100;
      case 4:
        return 80;
      case 7:
        return 80;
      default:
        return 200;
    }
  }

  double getWidthBody(int i) {
    double j = 0;
    for (var index = 2; index <= i; index++) {
      j += getWidthCell(index);
    }
    return j;
  }
  // Lagging so bad
  // void setHoverIndex(int y) {
  //   cellHover.value = y;
  //   update();
  // }

  void searchDataChanged(String s) {
    if (allData.isNotEmpty) {
      if (s.isNotEmpty) {
        loading();
        searchData.clear();
        allData.asMap().forEach((key, value) {
          var searchInColumn =
              value.indexWhere((element) => element.toLowerCase().contains(s));
          if (searchInColumn != -1) {
            searchData.add(value);
          }
        });
        tableData.clear();
        tableData.addAll(searchData);
        status.value = RefresherStatus.success;
        update();
      } else {
        tableData.clear();
        tableData.addAll(allData);
      }
    }
    update();
  }

  bool get isSearchFill => searchTextController.value.text.isNotEmpty;
  clearSearchField() {
    searchTextController.value.clear();
    tableData.clear();
    tableData.addAll(allData);
    update();
  }
}
