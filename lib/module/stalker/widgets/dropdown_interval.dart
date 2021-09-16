// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:sentimen/model/db_model.dart';
import 'package:sentimen/module/stalker/stalker_page_controller.dart';
import 'package:sentimen/resources/fonts.gen.dart';
import 'package:sentimen/resources/resources.dart';

class DropdownInterval extends StatelessWidget {
  DropdownInterval(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final StalkerPageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: ShapeDecoration(
        color: Resources.color.textColorWhite,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: Resources.color.borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        // shadows: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.blueGrey.withOpacity(0.4),
        //     offset: Offset(0.0, 1.5),
        //     blurRadius: 4,
        //     spreadRadius: 0.0,
        //   )
        // ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButton<int>(
        value: controller.selectedInterval.value.id,
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Resources.color.colorPrimary,
          size: 30,
        ),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        style: TextStyle(
          color: Resources.color.textColor,
          fontFamily: FontFamily.comfortaa,
          fontSize: 12,
        ),
        underline: Container(
          height: 0,
        ),
        onChanged: (int? newValue) {
          controller.setSelectedInterval(newValue!);
        },
        items: controller.interval.value
            .map<DropdownMenuItem<int>>((Intervals value) {
          return DropdownMenuItem<int>(
            value: value.id,
            child: Text(value.value ?? ''),
          );
        }).toList(),
      ),
    );
  }
}
