import 'package:flutter/material.dart';
import 'package:sentimen/data/widgets/forms/form_input_field_with_icon.dart';
import 'package:sentimen/data/widgets/secondary_button.dart';
import 'package:sentimen/module/stalker/widgets/dropdown_interval.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sentimen/themes/theme_services.dart';

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
      child: Column(
        // runSpacing: 24,
        children: [
          Container(
            width: 950,
            // height: 50,
            child: Wrap(
              runSpacing: 12,
              // crossAxisAlignment: WrapCrossAlignment.start,
              // alignment: WrapAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownInterval(controller),
                SizedBox(width: 2),
                SecondaryButton(
                  width: 120,
                  reverse: true,
                  onPressed: controller.createFileStalker,
                  color1: ThemeService().isDarkMode()
                      ? Resources.color.dropdownDarkButtonColor
                      : Resources.color.colorPrimary,
                  color2: ThemeService().isDarkMode()
                      ? Resources.color.dropdownDarkButtonColor
                      : Resources.color.colorPrimary,
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
                SizedBox(width: 2),
                SecondaryButton(
                  width: 100,
                  reverse: true,
                  onPressed: controller.printReportStalker,
                  color1: ThemeService().isDarkMode()
                      ? Resources.color.dropdownDarkButtonColor
                      : Resources.color.twitter,
                  color2: ThemeService().isDarkMode()
                      ? Resources.color.dropdownDarkButtonColor
                      : Resources.color.twitter,
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
                SizedBox(width: 2),
                SecondaryButton(
                  width: 120,
                  reverse: true,
                  onPressed: controller.selectFile,
                  color1: ThemeService().isDarkMode()
                      ? Resources.color.dropdownDarkButtonColor
                      : Resources.color.web,
                  color2: ThemeService().isDarkMode()
                      ? Resources.color.dropdownDarkButtonColor
                      : Resources.color.web,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
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
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 950,
            height: 45,
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                Container(
                  // width: 950,
                  height: 45,
                  alignment: Alignment.centerLeft,
                  child: FormInputFieldWithIcon(
                    controller: controller.searchTextController.value,
                    iconPrefix: Icons.search_rounded,
                    labelText: 'Search',
                    onChanged: (String s) {
                      controller.searchDataChanged(s);
                    },
                    onSaved: (String? s) {},
                    validator: (String? s) {},
                    iconSuffix:
                        controller.isSearchFill ? Icons.close_rounded : null,
                    suffixTooltip: 'clear',
                    onSuffixTap: controller.clearSearchField,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
