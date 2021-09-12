// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sentimen/resources/resources.dart';

class DropdownWidgets extends StatelessWidget {
  DropdownWidgets({
    Key? key,
    required this.selectedItem,
    required this.onChanged,
    required this.listString,
  }) : super(key: key);

  final RxString selectedItem;
  final List<String> listString;
  final void Function(String? val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: Resources.color.borderColor),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: DropdownButton<String>(
          value: selectedItem.value,
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: Resources.color.colorPrimary,
            size: 30,
          ),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: TextStyle(color: Resources.color.textColor),
          underline: Container(height: 0),
          onChanged: onChanged,
          items: listString.map<DropdownMenuItem<String>>((String? value) {
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
