import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/storage/storage_constants.dart';
import 'package:sentimen/data/storage/storage_manager.dart';
import 'package:sentimen/model/user.dart';
import 'package:sentimen/routes/page_names.dart';

import '../../environment.dart';
import 'auth_state.dart';

class AuthController extends GetxController {
  static AuthController find = Get.find();
  Rxn<AuthState> authState = Rxn<AuthState>();

  Stream<AuthState?> get stream => authState.stream;
  AuthState? get state => authState.value;

  var storage = StorageManager();

  User? get user {
    if (storage.has(StorageName.USERS)) {
      return User.fromJson(storage.get(StorageName.USERS));
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    FirebaseAuth.initialize(Env.apiKey, VolatileStore());
    authState.value = AuthState(appStatus: AppType.INITIAL);
    update();
    super.onInit();
  }

  @override
  void onReady() async {
    ever(authState, authChanged);
    authChanged(state);
    super.onReady();
  }

  authChanged(AuthState? state) async {
    if (state?.appStatus == AppType.INITIAL) {
      await setup();
      checkUser();
    } else if (state?.appStatus == AppType.UNAUTHENTICATED) {
      clearData();
      Get.offAllNamed(PageName.LOGIN);
    } else if (state?.appStatus == AppType.AUTHENTICATED) {
      Get.offAllNamed(PageName.DASHBOARD);
    } else {
      Get.toNamed(PageName.LOADER);
    }
    update();
  }

  void checkUser() {
    if (storage.has(StorageName.USERS)) {
      setAuth();
    } else {
      signOut();
    }
  }

  Future<void> clearData() async {
    if (storage.has(StorageName.USERS)) {
      storage.delete(StorageName.USERS);
      var firebaseAuth = FirebaseAuth.instance;
      firebaseAuth.signOut();
    }
  }

  Future<void> saveAuthData({required User user, required String token}) async {
    storage.write(StorageName.USERS, user.toJson());
    setAuth();
  }

  Future<void> signOut() async {
    debugPrint('UNAUTHENTICATED');
    authState.value = AuthState(appStatus: AppType.UNAUTHENTICATED);
    update();
  }

  void setAuth() {
    debugPrint('AUTHENTICATED');
    authState.value = AuthState(appStatus: AppType.AUTHENTICATED);
    update();
  }

  setup() async {
    if (!storage.has(StorageName.FIRST_INSTALL)) {
      debugPrint('FIRST INSTALL');
      storage.write(StorageName.FIRST_INSTALL, true);
    } else {
      debugPrint('OPENED');
    }
  }
}
