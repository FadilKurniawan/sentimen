import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sentimen/themes/theme_services.dart';

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
    color: ThemeService().isDarkMode()
        ? Resources.color.borderDarkColor
        : Resources.color.borderColor.withOpacity(0.1),
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
        border: isHeader
            ? Border(
                bottom: borderStyle,
                // right: borderStyle,
              )
            : null,
        // boxShadow: isHeader
        //     ? null
        //     : <BoxShadow>[
        //         BoxShadow(
        //           color: Colors.blueGrey.withOpacity(0.4),
        //           offset: Offset(0.0, 1.5),
        //           blurRadius: 4,
        //           spreadRadius: 0.0,
        //         )
        //       ],
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
                      : Resources.color.textColor),
              fontWeight: fontWeight ??
                  (isHeader ? FontWeight.w900 : FontWeight.normal),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
    );
  }
}
