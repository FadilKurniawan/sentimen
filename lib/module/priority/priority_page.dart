import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sentimen/module/priority/priority_page_controller.dart';

class PriorityPage extends StatefulWidget {
  @override
  _PriorityPageState createState() => _PriorityPageState();
}

class _PriorityPageState extends State<PriorityPage> {
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
      body: GetBuilder<PriorityPageController>(
        init: PriorityPageController(),
        initState: (_) {},
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          );
        },
      ),
    );
  }
}
