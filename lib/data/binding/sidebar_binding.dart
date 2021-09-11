import 'package:get/get.dart';
import 'package:sentimen/module/priority/priority_page_controller.dart';
import 'package:sentimen/module/sidebar/sidebar_controller.dart';
import 'package:sentimen/module/stalker/stalker_page_controller.dart';

class DashBoardTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideBarController>(() => SideBarController());
    Get.lazyPut<StalkerPageController>(() => StalkerPageController());
    Get.lazyPut<PriorityPageController>(() => PriorityPageController());
  }
}
