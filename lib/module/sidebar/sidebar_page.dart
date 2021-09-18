import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sentimen/data/widgets/windows/windows_button.dart';
import 'package:sentimen/module/auth/auth_controller.dart';
import 'package:sentimen/module/priority/priority_page.dart';
import 'package:sentimen/module/stalker/stalker_page.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sentimen/themes/theme_services.dart';
import 'sidebar_controller.dart';

class SidebarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 0, left: 0),
                  child: IndexedStack(
                    index: controller.tabIndex.value,
                    children: [
                      StalkerPage(),
                      // LoadingPage(),
                      PriorityPage(),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    width: 60,
                    color: Resources.color.colorPrimary,
                    child: Column(
                      children: [
                        Container(
                          height: 35,
                          child: Image(
                            image: Resources.images.whiteSmallLogo,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(height: 42),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(
                            left: 12,
                            right: 12,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SideBarItem(
                                  isSelectedMenu: controller.isStalkerPage,
                                  icon: Icons.travel_explore_rounded,
                                  onTap: () {
                                    controller.changeTabIndex(0);
                                  }),
                              SizedBox(height: 22),
                              SideBarItem(
                                  isSelectedMenu: controller.isPriorityPage,
                                  icon: FontAwesomeIcons.userSecret,
                                  onTap: () {
                                    controller.changeTabIndex(1);
                                  }),
                            ],
                          ),
                        )),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            height: 50,
                            width: 40,
                            child: DayNightSwitcherIcon(
                              nightBackgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              isDarkModeEnabled: controller.darkTheme.value,
                              onStateChanged: (bool isDarkModeEnabled) {
                                controller.changeTheme();
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: controller.auth.signOut,
                          child: Container(
                            child: Icon(
                              Icons.power_settings_new_rounded,
                              color: Resources.color.white,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: WindowTitleBarBox(
                    child: Row(
                      children: [
                        Expanded(
                            child: MoveWindow(
                          child: Container(
                              // color: Resources.color.colorPrimary,
                              ),
                        )),
                        MyWindowButtons()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.miniCenterDocked,
          // floatingActionButton: Container(
          //   margin: EdgeInsets.symmetric(vertical: 40),
          //   decoration: BoxDecoration(),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       NavItem(
          //         selected: controller.tabIndex.value == 0,
          //         title: 'Stalker',
          //         rightIcon: Icons.travel_explore_rounded,
          //         onTap: () {
          //           controller.changeTabIndex(0);
          //         },
          //       ),
          //       SizedBox(width: 20),
          //       NavItem(
          //         height: 80,
          //         selected: true,
          //         customWidget: Image(
          //           image: Resources.images.userPlaceholder,
          //           color: Resources.color.textColorWhite,
          //         ),
          //       ),
          //       SizedBox(width: 20),
          //       NavItem(
          //         selected: controller.tabIndex.value == 2,
          //         title: 'Priority',
          //         leftIcon: Icons.support_agent_rounded,
          //         onTap: () {
          //           controller.changeTabIndex(2);
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}

class SideBarItem extends StatelessWidget {
  final bool isSelectedMenu;
  final IconData icon;
  final void Function() onTap;
  const SideBarItem({
    Key? key,
    required this.isSelectedMenu,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 90,
        child: Stack(
          children: [
            AnimatedContainer(
              height: isSelectedMenu ? 50 : 0,
              width: 90,
              alignment: Alignment.center,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutExpo,
              decoration: ShapeDecoration(
                color: isSelectedMenu
                    ? Resources.color.white
                    : Resources.color.colorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 90,
              child: Icon(
                icon,
                color: isSelectedMenu
                    ? Resources.color.colorPrimaryLight
                    : Resources.color.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
