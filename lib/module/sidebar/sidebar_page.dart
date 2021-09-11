import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sentimen/module/loader/loading_page.dart';
import 'package:sentimen/module/priority/priority_page.dart';
import 'package:sentimen/module/sidebar/widgets/nav_item.dart';
import 'package:sentimen/module/stalker/stalker_page.dart';
import 'package:sentimen/resources/resources.dart';

import 'sidebar_controller.dart';

class SidebarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                StalkerPage(),
                StalkerPage(),
                PriorityPage(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NavItem(
                  selected: controller.tabIndex.value == 0,
                  title: 'Stalker',
                  rightIcon: Icons.travel_explore_rounded,
                  onTap: () {
                    controller.changeTabIndex(0);
                  },
                ),
                SizedBox(width: 20),
                NavItem(
                  height: 80,
                  selected: true,
                  customWidget: Image(
                    image: Resources.images.userPlaceholder,
                    color: Resources.color.textColorWhite,
                  ),
                ),
                SizedBox(width: 20),
                NavItem(
                  selected: controller.tabIndex.value == 2,
                  title: 'Priority',
                  leftIcon: Icons.support_agent_rounded,
                  onTap: () {
                    controller.changeTabIndex(2);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
