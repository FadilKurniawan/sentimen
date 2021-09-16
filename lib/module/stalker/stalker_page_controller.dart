import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/base/base_file_controller.dart';
import 'package:sentimen/data/base/base_refresher_status.dart';
import 'package:sentimen/environment.dart';
import 'package:sentimen/model/db_model.dart';
import 'package:sentimen/model/stalker_model.dart';
import 'package:sentimen/module/auth/auth_controller.dart';
import 'package:intl/intl.dart';

class StalkerPageController extends BaseFileController {
  AuthController auth = AuthController.find;
  final GlobalKey<FormBuilderState> formKeys = GlobalKey<FormBuilderState>();

  var status = RefresherStatus.initial.obs;
  var surfingState = false.obs;
  var formState = false.obs;

  //menu
  var selectedInterval = Intervals(
      value: 'Interval AA', id: 0, time: [StringId(id: 0, value: '08.00')]).obs;

  //forms
  var sentiment = [StringId(value: 'Netral', id: 1)].obs;
  var followup = [StringId(value: 'Tweet OOT', id: 0)].obs;
  var times = [StringId(id: 0, value: '08.00')].obs;
  var selectedSentiment = StringId(value: 'Netral', id: 1).obs;
  var selectedFollowup = StringId(value: 'Tweet OOT', id: 0).obs;
  var selectedTime = StringId(id: 0, value: '08.00').obs;

  //AA 08-17,AC 14-23, AZ 23-08
  var interval = [
    Intervals(
        value: 'Interval AA', id: 0, time: [StringId(id: 0, value: '08.00')])
  ].obs;

  Rx<StalkerModel> formData = StalkerModel().obs;
  Excel? currentExcel;
  String? selectFilepath;
  bool exist = false;
  int? maxRows;

  createFileStalker() {
    createFile(selectedInterval.value.value?.replaceAll('Interval ', ''));
  }

  @override
  getModelFromLocal() {
    super.getModelFromLocal();
    selectedInterval.value = dbModel.value.intervals![0];
    checkExistDir(Env.dirAppPath);
    checkExistDir(Env.stalkerPath);
    interval.value = dbModel.value.intervals ?? [];
    sentiment.value = dbModel.value.sentiments ?? [];
    followup.value = dbModel.value.followuper ?? [];
    times.value = dbModel.value.intervals?[0].time ?? [];
    selectedSentiment.value = StringId();
    selectedFollowup.value = StringId();
    selectedTime.value = StringId();
    update();
  }

  Future<void> checkExistDir(String path) async {
    bool exists = await Directory(path).exists();
    if (!exists) {
      Directory(path).create();
    }
  }

  void setSelectedInterval(int? val) {
    var old = selectedInterval.value;
    var intr = interval.firstWhere((element) => element.id == val);
    selectedInterval.value = intr;
    times.value = intr.time ?? [];
    selectedTime.value = getTimeOnInterval(old, intr);
    update();
  }

  StringId getTimeOnInterval(Intervals older, Intervals newer) {
    return newer.time!.firstWhere((newVal) =>
        older.time!.any((element) => element.value == newVal.value));
  }

  void setSelectedSentiment(String? val) {
    selectedSentiment.value =
        sentiment.firstWhere((element) => element.value == val);
    update();
  }

  void setSelectedFollowUp(String? val) {
    selectedFollowup.value =
        followup.firstWhere((element) => element.value == val);
    update();
  }

  void setSelectedTime(String? val) {
    selectedTime.value = times.firstWhere((element) => element.value == val);
    update();
  }

  Future<void> surfingStateChange() async {
    surfingState.value = !surfingState.value;
    update();
    if (surfingState.value) {
      await Future.delayed(Duration(milliseconds: 600));
    }
    formState.value = surfingState.value;
    update();
  }

  addNewRow(StalkerModel stalkerModel) async {
    stalkerModel.time = selectedTime.value.value;
    debugPrint(stalkerModel.toJson().toString());
    addNewRowtoFile(stalkerModel.toList());
  }

  void printReportStalker() {
    if (selectedInterval.value.time!.isNotEmpty) {
      String printRow = '';
      String print2Row = '';
      selectedInterval.value.time?.asMap().forEach((key, value) {
        final time = '${value.value!.substring(0, 2)}';
        debugPrint('=> TIME: $time');
        final getListTime = allData.where((element) {
          return element[0].substring(0, 2) == time;
        });
        final listTwit = getListTime.where((element) => getlink(element[2], 0));
        final listYoutube =
            getListTime.where((element) => getlink(element[2], 1));
        final listInsta =
            getListTime.where((element) => getlink(element[2], 2));
        final listFacebook =
            getListTime.where((element) => getlink(element[2], 3));
        final listTiktok =
            getListTime.where((element) => getlink(element[2], 4));
        final listWebsite =
            getListTime.where((element) => getlink(element[1], 5));
        final listPos = getListTime.where((element) => getlink(element[4], 6));
        final listNet = getListTime.where((element) => getlink(element[4], 7));
        final listNeg = getListTime.where((element) => getlink(element[4], 8));

        var socmed =
            '${getSocmedString(0, listTwit)}${getSocmedString(1, listYoutube)}${getSocmedString(2, listInsta)}${getSocmedString(3, listFacebook)}${getSocmedString(4, listTiktok)}${getSocmedString(5, listWebsite)}';
        socmed = socmed.isEmpty ? ' ' : socmed;
        printRow = printRow +
            '$time | ${getListTime.length} | $socmed| ${listPos.length} | ${listNeg.length} | ${listNet.length} \n';
      });
      List<List<String>> tempList = [];
      tempList.addAll(allData.reversed);
      tempList.asMap().forEach((key, value) {
        print2Row = print2Row +
            '${key + 1} | ${value[1]} | ${value[3]} | ${value[4]} | ${value[5]}\n';
      });
      printReport(
          'Report Stalker',
          '${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now())}',
          'Interval | Jumlah Case | Channel | Pos | Neg | Net \n\n$printRow\n\n No | Akun | Followers | Sentiment | Follow Up\n\n$print2Row');
    } else {
      error('Please Select Interval first');
    }
  }

  getSocmedString(int type, Iterable<List<String>> list) {
    switch (type) {
      case 0:
        return list.isNotEmpty ? 'TW(${list.length}) ' : '';
      case 1:
        return list.isNotEmpty ? 'YT(${list.length}) ' : '';
      case 2:
        return list.isNotEmpty ? 'IG(${list.length}) ' : '';
      case 3:
        return list.isNotEmpty ? 'FB(${list.length}) ' : '';
      case 4:
        return list.isNotEmpty ? 'TT(${list.length}) ' : '';
      case 5:
        return list.isNotEmpty ? 'WB(${list.length}) ' : '';
      default:
    }
  }

  bool getlink(String str, int socmed) {
    switch (socmed) {
      case 0:
        return str.toLowerCase().contains('https://twitter.com/');
      case 1:
        return str.toLowerCase().contains('https://www.youtube.com/');
      case 2:
        return str.toLowerCase().contains('https://www.instagram.com/');
      case 3:
        return str.toLowerCase().contains('https://www.facebook.com/');
      case 4:
        return str.toLowerCase().contains('https://www.tiktok.com/');
      case 5:
        return str.toLowerCase().contains('.website');
      case 6:
        return str.toLowerCase().contains('positif');
      case 7:
        return str.toLowerCase().contains('netral');
      case 8:
        return str.toLowerCase().contains('negatif');
      default:
        return false;
    }
  }
}
