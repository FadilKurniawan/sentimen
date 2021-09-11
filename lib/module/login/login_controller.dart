import 'package:firedart/auth/exceptions.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/base/base_refresher_status.dart';
import 'package:sentimen/model/user.dart';
import 'package:sentimen/module/auth/auth_controller.dart';
import 'package:sentimen/resources/resources.dart';

enum SignType { IN, UP }

class LoginController extends GetxController {
  final AuthController authController = AuthController.find;
  var status = RefresherStatus.initial.obs;
  var sign = SignType.IN.obs;

  bool get isInitial => status.value == RefresherStatus.initial;
  bool get isLoading => status.value == RefresherStatus.loading;
  bool get isShimmering => isLoading && isEmptyData;
  bool get isEmptyData =>
      status.value == RefresherStatus.empty || authController.user == null;
  bool get isSuccess => status.value == RefresherStatus.success;
  bool get isError => status.value == RefresherStatus.failed;

  var nameController = ''.obs;
  var emailController = ''.obs;
  var passwordController = ''.obs;
  var hidePass = true.obs;

  @override
  void onClose() {
    super.onClose();
  }

  void signWithEmailAndPassword() async {
    status.value = RefresherStatus.loading;
    update();
    var auth = FirebaseAuth.instance;
    // Monitor sign-in state
    // auth.signInState.listen((state) => print("Signed ${state ? "in" : "out"}"));
    try {
      if (sign.value == SignType.IN) {
        await auth.signIn(emailController.value, passwordController.value);
      } else {
        await auth.signUp(emailController.value, passwordController.value);
      }
      var user = await auth.getUser();
      var token = await auth.tokenProvider.idToken;
      var finalUser = user.toMap();
      finalUser['token'] = token;

      debugPrint('user:' + finalUser.toString());
      status.value = RefresherStatus.success;
      update();
      authController.saveAuthData(user: User.fromJson(finalUser), token: token);
    } on AuthException catch (e) {
      showErrorHandle(e.message);
      debugPrint(e.body);
    } catch (e) {
      showErrorHandle(e.toString());
      debugPrint(e.toString());
    }
  }

  void changeType() async {
    if (sign.value == SignType.IN) {
      sign.value = SignType.UP;
    } else {
      sign.value = SignType.IN;
    }
    update();
    // auth.setAuth();
  }

  void showErrorHandle(String message) {
    status.value = RefresherStatus.failed;
    if (message.contains('INVALID_EMAIL')) {
      message = 'Account not found';
    } else if (message.contains('INVALID_PASSWORD')) {
      message = 'Wrong Password';
    } else if (message.contains('EMAIL_EXISTS')) {
      message = 'You Already Have an Account Please login';
    } else {
      message = 'Something Went Wrong';
    }
    Get.snackbar(
      'Oops..',
      message,
      duration: Duration(seconds: 5),
      backgroundColor: Resources.color.errorColor,
      colorText: Resources.color.textColorWhite,
      margin: EdgeInsets.all(24),
      maxWidth: 350,
    );
    update();
  }

  void showHidePass() {
    hidePass.value = !hidePass.value;
    update();
  }
}
