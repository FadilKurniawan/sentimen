import 'package:flutter/material.dart';
import 'package:sentimen/module/stalker/widgets/dropdown_interval.dart';
import 'package:sentimen/resources/resources.dart';

import '../stalker_page_controller.dart';

class MenuStalker extends StatelessWidget {
  MenuStalker(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final StalkerPageController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            controller.auth.signOut();
          },
          child: Text(
            'Log out',
            style: TextStyle(fontSize: 12),
          ),
        ),
        ElevatedButton(
          onPressed: controller.selectFile,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.folder,
              color: Resources.color.textColorWhite,
              size: 35,
            ),
          ),
        ),
        DropdownInterval(controller),
      ],
    );
  }
}
