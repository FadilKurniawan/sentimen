import 'package:get/get.dart';
import 'package:sentimen/module/auth/auth_controller.dart';
import 'package:sentimen/themes/theme_services.dart';

class SideBarController extends GetxController {
  AuthController auth = AuthController.find;
  var tabIndex = 0.obs;
  var darkTheme = false.obs;

  bool get isStalkerPage => tabIndex.value == 0;
  bool get isPriorityPage => tabIndex.value == 1;
  bool get isReportPage => tabIndex.value == 2;

  @override
  void onInit() {
    darkTheme.value = ThemeService().isDarkMode();
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  void changeTheme() {
    ThemeService().switchTheme();
    darkTheme.value = ThemeService().isDarkMode();
    update();
  }
}
