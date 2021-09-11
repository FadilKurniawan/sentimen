import 'package:get/get.dart';

import '../../module/stalker/stalker_page_controller.dart';

class StalkerpageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StalkerPageController>(() => StalkerPageController());
  }
}
