import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';

class MyCloseWindowButton extends StatelessWidget {
  MyCloseWindowButton(
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
          hoverColor: Resources.color.colorSalmon,
          onTap: () => appWindow.close(),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.close_rounded,
                  color: Resources.color.white,
                  size: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
