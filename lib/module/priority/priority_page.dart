import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/module/priority/priority_page_controller.dart';
import 'package:sentimen/resources/resources.dart';

class PriorityPage extends GetView<PriorityPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.2
              ],
              colors: <Color>[
                Resources.color.colorPrimary,
                Resources.color.colorSecondary
              ]),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.construction_rounded,
              size: 120,
              color: Resources.color.white,
            ),
            Text(
              'Coming Soon..',
              style: TextStyle(color: Resources.color.white),
            ),
          ],
        )),
      ),
    );
  }
}
