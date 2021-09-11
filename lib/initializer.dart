import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentimen/module/auth/auth_controller.dart';
import 'data/storage/storage_constants.dart';

class Initializer {
  static Future<void> init() async {
    try {
      await globalLocalData();
      globalController();
    } catch (err) {
      rethrow;
    }
  }

  static globalController() {
    Get.put<AuthController>(AuthController());
  }

  static globalLocalData() async {
    // Global Local Database
    await Get.putAsync<GetStorage>(() async {
      var stor = GetStorage(StorageName.STORAGE_NAME);
      await stor.initStorage;
      return stor;
    });
  }
}
