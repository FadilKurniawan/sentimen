import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sentimen/data/storage/validator.dart';
import 'package:sentimen/data/widgets/currency_text_formatter.dart';
import 'package:sentimen/data/widgets/forms/form_builder_text_icon.dart';
import 'package:sentimen/data/widgets/input_label.dart';
import 'package:sentimen/data/widgets/primary_button.dart';
import 'package:sentimen/data/widgets/scrollview_with_expanded.dart';
import 'package:sentimen/model/stalker_model.dart';
import 'package:sentimen/module/stalker/widgets/dropdown_widgets.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sentimen/themes/theme_services.dart';

import '../stalker_page_controller.dart';

class ListFormWidget extends StatefulWidget {
  ListFormWidget(
    this.controller,
    this.formKeys, {
    Key? key,
  }) : super(key: key);
  final StalkerPageController controller;
  final GlobalKey<FormBuilderState> formKeys;
  @override
  _ListFormWidgetState createState() => _ListFormWidgetState();
}

class _ListFormWidgetState extends State<ListFormWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 500),
      width: widget.controller.surfingState.value ? 400 : 0,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: ThemeService().isDarkMode()
                ? Resources.color.formDarkColor
                : Resources.color.formColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            )),
        child:
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: 1,
            //   scrollDirection: Axis.vertical,
            //   itemBuilder: (BuildContext context, int index) {
            // return
            ScrollViewWithExpanded(
          child: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: ShapeDecoration(
                      color: ThemeService().isDarkMode()
                          ? Resources.color.scaffoldDarkColor
                          : Resources.color.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
                    child: !widget.controller.formState.value
                        ? Container()
                        : AnimatedOpacity(
                            duration: Duration(milliseconds: 1200),
                            opacity:
                                widget.controller.formState.value ? 1.0 : 0,
                            child: FormBuilder(
                              key: widget.formKeys,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Center(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: InputLabel(
                                            title: 'Account :',
                                            child: Container(
                                              height: 40,
                                              child: FormBuilderTextIcon(
                                                  name: 'account',
                                                  enabled: !widget
                                                      .controller.isLoading,
                                                  iconPrefix: Icons
                                                      .account_circle_rounded,
                                                  labelText: '@insta',
                                                  maxLines: 1,
                                                  validator:
                                                      FormBuilderValidator
                                                          .required(context),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onChanged: (value) {}),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        InputLabel(
                                          title: 'Link :',
                                          child: Container(
                                            height: 40,
                                            child: FormBuilderTextIcon(
                                              name: 'link',
                                              enabled:
                                                  !widget.controller.isLoading,
                                              iconPrefix: Icons.link,
                                              labelText: 'https://...',
                                              maxLines: 1,
                                              validator:
                                                  FormBuilderValidator.required(
                                                      context),
                                              keyboardType: TextInputType.url,
                                              onChanged: (value) => widget
                                                  .controller
                                                  .formData
                                                  .value
                                                  .link = value,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        InputLabel(
                                          title: 'Follower :',
                                          child: Container(
                                            height: 40,
                                            child: FormBuilderTextIcon(
                                              name: 'follower',
                                              enabled:
                                                  !widget.controller.isLoading,
                                              iconPrefix:
                                                  Icons.supervisor_account,
                                              labelText: '20.000',
                                              maxLines: 1,
                                              validator:
                                                  FormBuilderValidator.required(
                                                      context),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]')),
                                                CurrencyTextFormatter()
                                              ],
                                              onChanged: (value) => widget
                                                  .controller
                                                  .formData
                                                  .value
                                                  .follower = value,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        InputLabel(
                                          title: 'Sentiment :',
                                          child: Container(
                                            height: 40,
                                            child: DropdownWidgets(
                                                name: 'sentiment',
                                                selectedItem: widget.controller
                                                    .selectedSentiment,
                                                onChanged: widget.controller
                                                    .setSelectedSentiment,
                                                // ignore: invalid_use_of_protected_member
                                                listString: widget.controller
                                                    .sentiment.value),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        InputLabel(
                                          title: 'Follow Up :',
                                          child: Container(
                                            height: 40,
                                            child: DropdownWidgets(
                                                name: 'follow_up',
                                                selectedItem: widget.controller
                                                    .selectedFollowup,
                                                onChanged: widget.controller
                                                    .setSelectedFollowUp,
                                                // ignore: invalid_use_of_protected_member
                                                listString: widget
                                                    .controller.followup.value),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Container(
                                          height: 90,
                                          child: InputLabel(
                                            title: 'Detail :',
                                            child: Container(
                                              height: 40,
                                              child: FormBuilderTextIcon(
                                                name: 'detail',
                                                width: 400,
                                                enabled: !widget
                                                    .controller.isLoading,
                                                iconPrefix:
                                                    Icons.info_outline_rounded,
                                                labelText: 'anything',
                                                maxLines: 1,
                                                validator: FormBuilderValidator
                                                    .required(context),
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (value) => value,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 90,
                                          child: InputLabel(
                                            title: 'Capture Link :',
                                            child: Container(
                                              height: 40,
                                              child: FormBuilderTextIcon(
                                                name: 'capture_link',
                                                width: 400,
                                                enabled: !widget
                                                    .controller.isLoading,
                                                iconPrefix: Icons.link_rounded,
                                                labelText: 'https://...',
                                                maxLines: 1,
                                                validator: FormBuilderValidator
                                                    .required(context),
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (value) => value,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(top: 20),
                                          // alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Time :'),
                                              Container(
                                                height: 40,
                                                child: DropdownWidgets(
                                                  name: 'time',
                                                  width: 120,
                                                  selectedItem: widget
                                                      .controller.selectedTime,
                                                  onChanged: widget.controller
                                                      .setSelectedTime,
                                                  // ignore: invalid_use_of_protected_member
                                                  listString: widget
                                                      .controller.times.value,
                                                  isExpanded: true,
                                                  icon: Icon(
                                                    Icons
                                                        .access_time_filled_rounded,
                                                    color: Resources
                                                        .color.colorPrimary,
                                                    size: 20,
                                                  ),
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      stops: [0.0, 1.0],
                                                      colors: <Color>[
                                                        Resources.color
                                                            .scaffoldColor,
                                                        Resources
                                                            .color.scaffoldColor
                                                      ],
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                    shadows: <BoxShadow>[
                                                      BoxShadow(
                                                        color: Colors.blueGrey
                                                            .withOpacity(0.4),
                                                        offset:
                                                            Offset(0.0, 1.5),
                                                        blurRadius: 4,
                                                        spreadRadius: 0.0,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 46),
                                        widget.controller.isLoading
                                            ? CircularProgressIndicator()
                                            : Container(),
                                        widget.controller.isLoading
                                            ? Container()
                                            : PrimaryButton(
                                                height: 40,
                                                width: 400,
                                                title: 'Submit',
                                                onPressed: () async {
                                                  if (widget
                                                      .formKeys.currentState!
                                                      .saveAndValidate()) {
                                                    final formData = widget
                                                        .formKeys
                                                        .currentState
                                                        ?.value;
                                                    widget.controller.addNewRow(
                                                        StalkerModel.fromJson(
                                                            formData!));
                                                    widget
                                                        .formKeys.currentState!
                                                        .reset();
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
                  ),
                ],
              ),
            ),
          ],
        ),
        //   },
        // ),
      ),
    );
  }
}
