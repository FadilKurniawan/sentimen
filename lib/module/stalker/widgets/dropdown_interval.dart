// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:sentimen/module/stalker/stalker_page_controller.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DropdownInterval extends StatelessWidget {
  DropdownInterval(
    this.controller, {
    Key? key,
  }) : super(key: key);
  StalkerPageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        width: 20.w,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: Resources.color.colorPrimary),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButton<String>(
          value: controller.selectedInterval.value,
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: Resources.color.colorPrimary,
            size: 30,
          ),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: TextStyle(color: Resources.color.textColor),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            controller.setSelectedInterval(newValue!);
          },
          items: controller.interval
              .map<DropdownMenuItem<String>>((String? value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value ?? ''),
            );
          }).toList(),
        ),
      ),
    );
  }
}
