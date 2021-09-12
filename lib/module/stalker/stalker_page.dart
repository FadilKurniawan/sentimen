import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/widgets/scrollview_with_expanded.dart';
import 'package:sentimen/module/stalker/stalker_page_controller.dart';
import 'package:sentimen/module/stalker/widgets/forms_widget.dart';
import 'package:sentimen/module/stalker/widgets/menu_stalker.dart';
import 'package:sentimen/resources/resources.dart';

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
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        // width: 1200,
                        // color: Colors.black45,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                        child: Column(
                          children: [
                            MenuStalker(controller),
                            //Data Table
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 40),
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              20.0),
                                    ),
                                    shadows: controller.isLoading
                                        ? null
                                        : <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.blueGrey
                                                  .withOpacity(0.4),
                                              offset: Offset(0.0, 1.5),
                                              blurRadius: 2,
                                              spreadRadius: 0.0,
                                            )
                                          ]),
                                child: controller.isLoading
                                    ? Container(
                                        height: 50,
                                        width: double.infinity,
                                        child: Center(
                                          child: Image(
                                            image: Resources.images.oceanSpark,
                                          ),
                                        ),
                                      )
                                    : ScrollViewWithExpandedXY(
                                        child: [
                                          DataTable(
                                            sortAscending: true,
                                            showCheckboxColumn: true,
                                            columns: controller.headers,
                                            rows: controller.dataRow,
                                          ),
                                          controller.isEmpty
                                              ? Expanded(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: Column(
                                                      children: [
                                                        Image(
                                                            image: Resources
                                                                .images
                                                                .imgEmpty,
                                                            height: 100),
                                                        Text('Empty Data',
                                                            style: TextStyle(
                                                                fontSize: 12)),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                              ),
                            ),

                            SizedBox(height: 120),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Form input
                  ListFormWidget(controller),
                ],
              ),
              //Surfing Button
              // AnimatedContainer(
              //   duration: Duration(milliseconds: 500),
              //   alignment: Alignment.centerRight,
              //   margin: EdgeInsets.only(
              //       right: controller.surfingState.value ? 365 : 0),
              //   child: ElevatedButton(
              //     onPressed: controller.surfingStateChange,
              //     child: Padding(
              //       padding: const EdgeInsets.all(12.0),
              //       child: Icon(
              //         Icons.surfing_rounded,
              //         color: Resources.color.textColorWhite,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
