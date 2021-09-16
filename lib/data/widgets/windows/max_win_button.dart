import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sentimen/resources/resources.dart';

class MyMaxWindowButton extends StatelessWidget {
  MyMaxWindowButton(
      {Key? key,
      WindowButtonColors? colors,
      VoidCallback? onPressed,
      bool? animate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appWindow.titleBarButtonSize.height,
      width: appWindow.titleBarButtonSize.width,
      color: Resources.color.colorPrimary,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Resources.color.colorPrimaryLight,
          onTap: () => appWindow.maximizeOrRestore(),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.windowMaximize,
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
