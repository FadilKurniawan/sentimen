import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentimen/data/widgets/windows/close_win_button.dart';
import 'package:sentimen/data/widgets/windows/max_win_button.dart';
import 'package:sentimen/data/widgets/windows/min_win_button.dart';

class MyWindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          MyMinWindowButton(),
          MyMaxWindowButton(),
          MyCloseWindowButton(),
        ],
      ),
    );
  }
}
