import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sentimen/data/widgets/half_circle_button.dart';
import 'package:sentimen/data/widgets/state_handle_widget.dart';
import 'package:sentimen/module/stalker/stalker_page_controller.dart';
import 'package:sentimen/module/stalker/widgets/forms_widget.dart';
import 'package:sentimen/module/stalker/widgets/menu_stalker.dart';
import 'package:sentimen/module/stalker/widgets/my_table_body.dart';
import 'package:sentimen/module/stalker/widgets/my_table_head.dart';
import 'package:sentimen/resources/resources.dart';

class StalkerPage extends StatefulWidget {
  @override
  _StalkerPageState createState() => _StalkerPageState();
}

class _StalkerPageState extends State<StalkerPage> {
  final formKeys = GlobalKey<FormBuilderState>();

  final LinkedScrollControllerGroup _controllers1 =
      LinkedScrollControllerGroup();
  ScrollController? headerScrollController;
  ScrollController? bodyScrollController;
  @override
  void initState() {
    headerScrollController = _controllers1.addAndGet();
    bodyScrollController = _controllers1.addAndGet();
    super.initState();
  }

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
                      height: double.infinity,
                      // width: 1200,
                      // color: Colors.black45,
                      margin: EdgeInsets.only(top: 40, bottom: 20, right: 24),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                left: 140,
                                bottom: 20,
                              ),
                              child: MenuStalker(controller)),
                          //Data Table
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 12),
                              child: StateHandleWidget(
                                emptyEnabled: controller.isEmpty,
                                emptySubtitle: 'Empty Data',
                                loadingEnabled: controller.isLoading,
                                shimmerView: Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: Center(
                                    child: Image(
                                      image: Resources.images.oceanSpark,
                                    ),
                                  ),
                                ),
                                body: Container(
                                  margin: EdgeInsets.only(
                                    left: 140,
                                  ),
                                  child: Column(
                                    children: [
                                      controller.isEmpty
                                          ? Container()
                                          : MyTableHead(
                                              baseController: controller,
                                              scrollController:
                                                  headerScrollController!,
                                              listChild: controller.dbModel
                                                  .value.columnHeadersStalker!,
                                            ),
                                      controller.isEmpty
                                          ? Container()
                                          : Expanded(
                                              child: MyTableBody(
                                                baseController: controller,
                                                bodyController:
                                                    bodyScrollController!,
                                                listData: controller.tableData,
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ),
                  // Form input
                  ListFormWidget(controller, formKeys),
                ],
              ),
              // Surfing Button
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(
                    right: controller.surfingState.value ? 400 : 0, top: 40),
                child: HalfCircleButton(
                  width: 40,
                  onPressed: controller.surfingStateChange,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.surfing_rounded,
                      color: Resources.color.white,
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
