import 'package:flutter/material.dart';
import 'package:sentimen/data/widgets/forms/form_input_field_with_icon.dart';
import 'package:sentimen/data/widgets/secondary_button.dart';
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
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(right: 45),
      width: double.infinity,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        runSpacing: 12,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 300,
            height: 45,
            child: FormInputFieldWithIcon(
              controller: controller.searchTextController.value,
              iconPrefix: Icons.search_rounded,
              labelText: 'Search',
              onChanged: (String s) {
                controller.searchDataChanged(s);
              },
              onSaved: (String? s) {},
              validator: (String? s) {},
              iconSuffix: controller.isSearchFill ? Icons.close_rounded : null,
              suffixTooltip: 'clear',
              onSuffixTap: controller.clearSearchField,
            ),
          ),
          DropdownInterval(controller),
          SecondaryButton(
            width: 120,
            reverse: true,
            onPressed: controller.createFileStalker,
            color1: Resources.color.colorPrimary,
            color2: Resources.color.colorPrimary,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.post_add_rounded,
                    color: Resources.color.white,
                    size: 27,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'New Doc',
                    style: TextStyle(
                      fontSize: 12,
                      color: Resources.color.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          SecondaryButton(
            width: 100,
            reverse: true,
            onPressed: controller.printReportStalker,
            color1: Resources.color.twitter,
            color2: Resources.color.twitter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.print_rounded,
                    color: Resources.color.white,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Print',
                    style: TextStyle(
                      fontSize: 12,
                      color: Resources.color.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          SecondaryButton(
            width: 120,
            reverse: true,
            onPressed: controller.selectFile,
            color1: Resources.color.web,
            color2: Resources.color.web,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.folder_rounded,
                    color: Resources.color.white,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Open File',
                    style: TextStyle(
                      fontSize: 12,
                      color: Resources.color.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          // SecondaryButton(
          //   width: 120,
          //   reverse: true,
          //   color1: Resources.color.colorSalmon,
          //   color2: Resources.color.colorSalmon,
          //   onPressed: () {
          //     controller.auth.signOut();
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Icon(
          //           Icons.power_settings_new_rounded,
          //           color: Resources.color.white,
          //           size: 20,
          //         ),
          //         SizedBox(width: 6),
          //         Text(
          //           'Log Out',
          //           style: TextStyle(
          //             fontSize: 12,
          //             color: Resources.color.white,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
