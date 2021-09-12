import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/base/base_refresher_status.dart';
import 'package:sentimen/module/auth/auth_controller.dart';

class StalkerPageController extends GetxController {
  AuthController auth = AuthController.find;

  get isLoading => status.value == RefresherStatus.loading;
  get isEmpty =>
      (status.value == RefresherStatus.initial ||
          status.value == RefresherStatus.empty) &&
      !isLoading;

  var status = RefresherStatus.initial.obs;
  var surfingState = true.obs;
  var selectedInterval = 'Interval AA'.obs;
  var selectedSentiment = 'Netral'.obs;
  var selectedFollowup = 'Tweet OOT'.obs;
  var selectedTime = '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}'.obs;

  //AA 08-17,AC 14-23, AZ 23-08
  var interval = ['Interval AA', 'Interval AC', 'Interval AZ'];
  var sentiment = ['Positif', 'Netral', 'Negatif'];
  var followup = [
    'Tweet OOT',
    'Belum ada balasan agent ',
    'sudah ada balasan agent',
    'apresisasi'
  ];

  List<DataColumn> headers = [
    DataColumn(label: Text('Interval')),
    DataColumn(label: Text('Akun')),
    DataColumn(label: Text('Link')),
    DataColumn(label: Text('Follower')),
    DataColumn(label: Text('Sentimen')),
    DataColumn(label: Text('Follow')),
    DataColumn(label: Text('Detail')),
  ].obs;

  // socmed
  // [11:32 PM, 9/7/2021] Adit: Facebook,intagram,media,twitter,tiktok,Web,Youtube

  List<DataRow> dataRow = [DataRow(cells: [])].obs;

  DataCell getCell(String? str) => DataCell(
        SelectableText(
          str ?? '',
          style: TextStyle(fontSize: 12),
          autofocus: true,
        ),
      );

  @override
  void onInit() {
    dataRow.clear();
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

  void setSelectedSentiment(String? val) {
    selectedSentiment.value = val ?? '';
    update();
  }

  void setSelectedFollowUp(String? val) {
    selectedFollowup.value = val ?? '';
    update();
  }

  void surfingStateChange() {
    surfingState.value = !surfingState.value;
    update();
  }

  void setSelectedTime(String? string) {
    selectedTime.value = string ?? '';
    update();
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    status.value = RefresherStatus.loading;
    update();
    var isFill = false;
    if (result != null) {
      await Future.delayed(Duration(seconds: 2));
      var bytes = File(result.files.single.path).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      isFill = await loadExcelFile(excel);
    }

    status.value = isFill ? RefresherStatus.success : RefresherStatus.failed;
    update();
  }

  Future<bool> loadExcelFile(Excel excel) async {
    for (var table in excel.tables.keys) {
      // print(table); //sheet Name
      // print(excel.tables[table]?.maxCols);
      // print(excel.tables[table]?.maxRows);
      var rows = excel.tables[table]?.rows;
      if (rows != null) {
        dataRow.clear();
        rows.asMap().forEach((index, row) {
          List<DataCell> dataCell = [];
          if (index > 0) {
            for (var col in row) {
              var val = col != null ? col.value.toString() : '';
              dataCell.add(getCell(val));
            }
            dataRow.add(DataRow(cells: dataCell));
          }
        });
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
