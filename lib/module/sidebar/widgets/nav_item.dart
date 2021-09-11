import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';

// ignore: must_be_immutable
class NavItem extends StatelessWidget {
  NavItem({
    Key? key,
    required this.selected,
    this.leftIcon,
    this.rightIcon,
    this.title,
    this.onTap,
    this.customWidget,
    this.height,
  }) : super(key: key);
  double? height;
  Widget? customWidget;
  bool selected;
  String? title;
  IconData? leftIcon;
  IconData? rightIcon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var textOrIconColor =
        selected ? Resources.color.textColorWhite : Resources.color.textColor;

    var decoration = ShapeDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1.0],
        colors: <Color>[
          selected
              ? Resources.color.colorPrimaryLight
              : Resources.color.scaffoldColor,
          selected
              ? Resources.color.colorSecondary
              : Resources.color.scaffoldColor
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      shadows: selected
          ? <BoxShadow>[
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.4),
                offset: Offset(0.0, 1.5),
                blurRadius: 4,
                spreadRadius: 0.0,
              )
            ]
          : null,
    );

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        height: height ?? 50,
        padding: EdgeInsets.all(12),
        decoration: decoration,
        duration: Duration(milliseconds: 200),
        child: customWidget ??
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                leftIcon != null
                    ? Icon(
                        leftIcon,
                        color: textOrIconColor,
                      )
                    : Container(),
                leftIcon != null ? SizedBox(width: 6) : Container(),
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 16,
                    color: textOrIconColor,
                  ),
                ),
                rightIcon != null ? SizedBox(width: 6) : Container(),
                rightIcon != null
                    ? Icon(
                        rightIcon,
                        color: textOrIconColor,
                      )
                    : Container(),
              ],
            ),
      ),
    );
  }
}
