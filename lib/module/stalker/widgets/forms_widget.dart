import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentimen/data/storage/validator.dart';
import 'package:sentimen/data/widgets/currency_text_formatter.dart';
import 'package:sentimen/data/widgets/forms/form_input_field_with_icon.dart';
import 'package:sentimen/data/widgets/input_label.dart';
import 'package:sentimen/data/widgets/primary_button.dart';
import 'package:sentimen/data/widgets/scrollview_with_expanded.dart';
import 'package:sentimen/module/login/login_page.dart';
import 'package:sentimen/module/stalker/widgets/dropdown_widgets.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:get/get.dart';

import '../stalker_page_controller.dart';

class ListFormWidget extends StatelessWidget {
  ListFormWidget(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final StalkerPageController controller;
  final GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 500),
      width: controller.surfingState.value ? 400 : 0,
      color: Resources.color.textColorWhite,
      child: ScrollViewWithExpanded(
        child: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Resources.color.colorSilver,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  )),
              child:
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: 1,
                  //   scrollDirection: Axis.vertical,
                  //   itemBuilder: (BuildContext context, int index) {
                  // return
                  Container(
                // height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    colors: <Color>[
                      Resources.color.scaffoldColor,
                      Resources.color.scaffoldColor
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  shadows: <BoxShadow>[
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.4),
                      offset: Offset(0.0, 1.5),
                      blurRadius: 4,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: Form(
                  key: formKeys,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  selectTime(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: Resources.color.colorPrimary,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.selectedTime.value,
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 1.0],
                                  colors: <Color>[
                                    Resources.color.scaffoldColor,
                                    Resources.color.scaffoldColor
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                shadows: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(0.4),
                                    offset: Offset(0.0, 1.5),
                                    blurRadius: 4,
                                    spreadRadius: 0.0,
                                  )
                                ],
                              ),
                            ),
                            InputLabel(
                              title: 'Account :',
                              child: FormInputFieldWithIcon(
                                width: 600,
                                enabled: !controller.isLoading,
                                iconPrefix: Icons.account_circle_rounded,
                                labelText: '@insta',
                                maxLines: 1,
                                validator: Validator().notEmpty,
                                keyboardType: TextInputType.text,
                                onChanged: (value) => null,
                                onSaved: (value) => null,
                              ),
                            ),
                            SizedBox(height: 16),
                            InputLabel(
                              title: 'Link :',
                              child: FormInputFieldWithIcon(
                                width: 400,
                                enabled: !controller.isLoading,
                                iconPrefix: Icons.link,
                                labelText: 'https://...',
                                maxLines: 1,
                                validator: Validator().notEmpty,
                                keyboardType: TextInputType.url,
                                onChanged: (value) => null,
                                onSaved: (value) => null,
                              ),
                            ),
                            SizedBox(height: 16),
                            InputLabel(
                              title: 'Follower :',
                              child: FormInputFieldWithIcon(
                                width: 400,
                                enabled: !controller.isLoading,
                                iconPrefix: Icons.supervisor_account,
                                labelText: '20.000',
                                maxLines: 1,
                                validator: Validator().notEmpty,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  CurrencyTextFormatter()
                                ],
                                onChanged: (value) => null,
                                onSaved: (value) => null,
                              ),
                            ),
                            SizedBox(height: 16),
                            InputLabel(
                              title: 'Sentiment :',
                              child: DropdownWidgets(
                                  selectedItem: controller.selectedSentiment,
                                  onChanged: controller.setSelectedSentiment,
                                  listString: controller.sentiment),
                            ),
                            SizedBox(height: 16),
                            InputLabel(
                              title: 'Follow Up :',
                              child: DropdownWidgets(
                                  selectedItem: controller.selectedFollowup,
                                  onChanged: controller.setSelectedFollowUp,
                                  listString: controller.followup),
                            ),
                            SizedBox(height: 16),
                            Container(
                              height: 100,
                              child: InputLabel(
                                title: 'Detail :',
                                child: FormInputFieldWithIcon(
                                  width: 400,
                                  enabled: !controller.isLoading,
                                  iconPrefix: Icons.info_outline_rounded,
                                  labelText: 'anything',
                                  maxLines: 1,
                                  validator: Validator().notEmpty,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) => null,
                                  onSaved: (value) => null,
                                ),
                              ),
                            ),
                            FormVerticalSpace(height: 48),
                            controller.isLoading
                                ? CircularProgressIndicator()
                                : Container(),
                            controller.isLoading
                                ? Container()
                                : PrimaryButton(
                                    height: 40,
                                    width: 400,
                                    title: 'Submit',
                                    onPressed: () async {
                                      if (formKeys.currentState!.validate()) {
                                        // controller.signWithEmailAndPassword();
                                      }
                                    }),
                            SizedBox(height: 48.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //   },
              // ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        });

    if (pickedS != null &&
        pickedS.toString() != controller.selectedTime.value) {
      controller.setSelectedTime('${pickedS.hour}:${pickedS.minute}');
    }
  }
}
