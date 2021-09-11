import 'package:get/get.dart';
import 'package:sentimen/data/binding/sidebar_binding.dart';
import 'package:sentimen/data/binding/login_binding.dart';
import 'package:sentimen/module/loader/loading_page.dart';
import 'package:sentimen/module/login/login_page.dart';
import 'package:sentimen/module/sidebar/sidebar_page.dart';

import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: PageName.LOADER,
      page: () => LoadingPage(),
    ),
    GetPage(
        name: PageName.DASHBOARD,
        page: () => SidebarPage(),
        binding: DashBoardTabBinding()),
  ];
}
