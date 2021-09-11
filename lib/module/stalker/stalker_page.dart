import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/storage/validator.dart';
import 'package:sentimen/data/widgets/forms/form_input_field_with_icon.dart';
import 'package:sentimen/data/widgets/primary_button.dart';
import 'package:sentimen/module/login/login_page.dart';
import 'package:sentimen/module/stalker/stalker_page_controller.dart';
import 'package:sentimen/module/stalker/widgets/dropdown_interval.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sizer/sizer.dart';

class StalkerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<StalkerPageController>(
        initState: (_) {},
        builder: (controller) {
          return Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        width: 120.w,
                        // color: Colors.black45,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                controller.auth.signOut();
                              },
                              child: Text('Log out'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DropdownInterval(controller),
                                ElevatedButton(
                                  onPressed: controller.selectFile,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.folder,
                                      color: Resources.color.textColorWhite,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Data Table
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 40),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(20.0),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        controller.isLoading
                                            ? CircularProgressIndicator()
                                            : DataTable(
                                                sortAscending: true,
                                                showCheckboxColumn: true,
                                                headingRowColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                            (Set<MaterialState>
                                                                states) {
                                                  return Resources.color.silver;
                                                }),
                                                columns: List.generate(
                                                  controller.headers.length,
                                                  (index) => DataColumn(
                                                    label: Text(
                                                      controller.headers[index],
                                                    ),
                                                  ),
                                                ),
                                                rows: List.generate(
                                                  controller.dataExcel.length,
                                                  (row) => DataRow(
                                                    cells: List.generate(
                                                      controller.dataExcel[row]
                                                          .length,
                                                      (col) => DataCell(
                                                        SelectableText(
                                                          controller.dataExcel[
                                                              row][col],
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Form input
                  AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 200),
                    width: controller.surfingState.value ? 45.w : 0,
                    color: Resources.color.colorSilver,
                    // margin: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final GlobalKey<FormState> _formKeys =
                            GlobalKey<FormState>();
                        return Container(
                          height: 20.h,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
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
                            key: _formKeys,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 20),
                                          height: 130,
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onChanged: (value) => null,
                                          // controller.emailController.value = value,
                                          onSaved: (value) => null,
                                          // controller.emailController.value = value!,
                                        ),
                                        // FormVerticalSpace(),
                                        // FormInputFieldWithIcon(
                                        //   width: 400,
                                        //   enabled: !controller.isLoading,
                                        //   iconPrefix: Icons.lock,
                                        //   labelText: 'password',
                                        //   validator: Validator().password,
                                        //   onChanged: (value) {
                                        //     value;
                                        //   },
                                        //   onSaved: (value) => value,
                                        //   maxLines: 1,
                                        //   controller: null,
                                        // ),
                                        FormVerticalSpace(height: 48),
                                        controller.isLoading
                                            ? CircularProgressIndicator()
                                            : Container(),
                                        controller.isLoading
                                            ? Container()
                                            : PrimaryButton(
                                                width: 400,
                                                title: 'Submit',
                                                onPressed: () async {
                                                  if (_formKeys.currentState!
                                                      .validate()) {
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
                        );
                      },
                    ),
                  ),
                ],
              ),
              //Surfing Button
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                    right: controller.surfingState.value ? 42.w : 0.w),
                child: ElevatedButton(
                  onPressed: controller.surfingStateChange,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.surfing_rounded,
                      color: Resources.color.textColorWhite,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
