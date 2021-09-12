import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/storage/validator.dart';
import 'package:sentimen/data/widgets/forms/form_input_field_with_icon.dart';
import 'package:sentimen/data/widgets/primary_button.dart';
import 'package:sentimen/resources/resources.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: GetBuilder<LoginController>(
                    init: LoginController(),
                    initState: (_) async {},
                    builder: (controller) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            height: 170,
                            child: Image(
                              image: Resources.images.logoOcean,
                            ),
                          ),
                          FormInputFieldWithIcon(
                            width: 400,
                            enabled: !controller.isLoading,
                            iconPrefix: Icons.email,
                            labelText: 'email',
                            validator: Validator().email,
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            onChanged: (value) =>
                                controller.emailController.value = value,
                            onSaved: (value) =>
                                controller.emailController.value = value!,
                          ),
                          FormVerticalSpace(),
                          FormInputFieldWithIcon(
                            width: 400,
                            enabled: !controller.isLoading,
                            iconPrefix: Icons.lock,
                            labelText: 'password',
                            validator: Validator().password,
                            iconSuffix: controller.hidePass.value
                                ? Icons.visibility
                                : Icons.visibility_off_rounded,
                            onSuffixTap: controller.showHidePass,
                            obscureText: controller.hidePass.value,
                            onChanged: (value) {
                              controller.passwordController.value = value;
                            },
                            onSaved: (value) =>
                                controller.passwordController.value = value!,
                            maxLines: 1,
                            controller: null,
                          ),
                          FormVerticalSpace(height: 48),
                          controller.isLoading
                              ? Center(
                                  child: Image(
                                    image: Resources.images.oceanSpark,
                                    height: 50,
                                  ),
                                )
                              : Container(),
                          controller.isLoading
                              ? Container()
                              : PrimaryButton(
                                  width: 400,
                                  title: controller.sign.value == SignType.IN
                                      ? 'Login'
                                      : 'Register',
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      controller.signWithEmailAndPassword();
                                    }
                                  }),
                          FormVerticalSpace(height: 20),
                          // controller.isLoading
                          //     ? Container()
                          //     : Container(
                          //         width: 400,
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Expanded(
                          //                 child: Divider(
                          //               color: Resources.color.textColor
                          //                   .withOpacity(0.2),
                          //             )),
                          //             Padding(
                          //               padding: const EdgeInsets.all(16.0),
                          //               child: Text(
                          //                 controller.sign.value == SignType.IN
                          //                     ? "Don't have an Account?"
                          //                     : 'Already have an Account?',
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodyText2
                          //                     ?.copyWith(
                          //                         fontSize: 14,
                          //                         color: Resources
                          //                             .color.textColor),
                          //               ),
                          //             ),
                          //             Expanded(
                          //                 child: Divider(
                          //               color: Resources.color.textColor
                          //                   .withOpacity(0.2),
                          //             )),
                          //           ],
                          //         ),
                          //       ),
                          // controller.isLoading || !kDebugMode
                          //     ? Container()
                          //     : PrimaryButton(
                          //         width: 400,
                          //         title: controller.sign.value == SignType.IN
                          //             ? 'Register Now'
                          //             : 'Login Now',
                          //         reverse: true,
                          //         onPressed: () async {
                          //           controller.changeType();
                          //         }),
                          SizedBox(height: 48.0),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormVerticalSpace extends SizedBox {
  FormVerticalSpace({double height = 24.0}) : super(height: height);
}
