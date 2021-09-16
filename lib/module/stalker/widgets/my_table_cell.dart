import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';

class MyTableCell extends StatelessWidget {
  final String? value;
  final Color? color;
  final double? cellWidth;
  final Color? textColor;
  final FontWeight? fontWeight;
  final bool isHeader;
  final Widget? child;
  MyTableCell({
    this.value,
    this.color,
    this.cellWidth = 200,
    this.textColor,
    this.fontWeight,
    this.isHeader = false,
    this.child,
  });

  final borderStyle = BorderSide(
    color: Resources.color.borderColor.withOpacity(0.1),
    style: BorderStyle.solid,
    width: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      height: 50,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        border: Border(
          bottom: borderStyle,
          // right: borderStyle,
        ),
      ),
      alignment: Alignment.center,
      child: child ??
          Text(
            '${value ?? ''}',
            style: TextStyle(
              fontSize: 12.0,
              color: textColor ??
                  (isHeader
                      ? Resources.color.textColor
                      : Resources.color.subTextColor),
              fontWeight: fontWeight ??
                  (isHeader ? FontWeight.bold : FontWeight.normal),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
    );
  }
}
