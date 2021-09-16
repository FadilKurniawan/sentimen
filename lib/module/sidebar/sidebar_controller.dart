import 'package:get/get.dart';
import 'package:sentimen/module/auth/auth_controller.dart';

class SideBarController extends GetxController {
  AuthController auth = AuthController.find;
  var tabIndex = 0.obs;

  bool get isStalkerPage => tabIndex.value == 0;
  bool get isPriorityPage => tabIndex.value == 1;
  bool get isReportPage => tabIndex.value == 2;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
