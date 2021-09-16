import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sentimen/resources/resources.dart';

class MyMinWindowButton extends StatelessWidget {
  MyMinWindowButton(
      {Key? key,
      WindowButtonColors? colors,
      VoidCallback? onPressed,
      bool? animate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appWindow.titleBarButtonSize.height,
      width: appWindow.titleBarButtonSize.width,
      decoration: ShapeDecoration(
          color: Resources.color.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Resources.color.colorPrimaryLight,
          onTap: () => appWindow.minimize(),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
          child: Stack(
            children: [
              Container(
                // color: Resources.color.colorPrimary,
                // padding: EdgeInsets.only(bottom: 9),
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.minus,
                  color: Resources.color.white,
                  size: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
