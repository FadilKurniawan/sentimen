import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/base/base_refresher_status.dart';
import 'package:sentimen/module/auth/auth_controller.dart';

class StalkerPageController extends GetxController {
  AuthController auth = AuthController.find;

  get isLoading => status.value == RefresherStatus.loading;

  var status = RefresherStatus.initial.obs;
  var surfingState = false.obs;
  var selectedInterval = 'Interval AA'.obs;
  var interval = ['Interval AA', 'Interval AC', 'Interval AZ'];

  List<String> headers = [
    'Interval',
    'Akun',
    'Link',
    'Follower',
    'Sentimen',
    'Follow',
    'Detail',
  ].obs;

  List<List<String>> dataExcel = [
    ['']
  ].obs;

  @override
  void onInit() {
    dataExcel.clear();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSelectedInterval(String val) {
    selectedInterval.value = val;
    update();
  }

  void surfingStateChange() {
    surfingState.value = !surfingState.value;
    update();
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    status.value = RefresherStatus.loading;
    update();
    if (result != null) {
      var bytes = File(result.files.single.path).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table]?.maxCols);
        print(excel.tables[table]?.maxRows);
        var rows = excel.tables[table]?.rows;
        if (rows != null) {
          dataExcel.clear();
          rows.asMap().forEach((index, row) {
            List<String> valInRow = [];
            if (index > 0) {
              for (var col in row) {
                var val = col != null ? col.value.toString() : '';
                var rest = val.substring(
                    0, val.toString().length > 26 ? 26 : val.toString().length);
                valInRow.add(rest.length == 26 ? rest + '...' : rest);
                print("${col?.value}");
              }
              dataExcel.add(valInRow);
            }
          });
        }
      }
    }
    status.value = RefresherStatus.success;
    update();
  }
}
