import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/initializer.dart';
import 'package:sentimen/routes/page_names.dart';
import 'package:sentimen/routes/page_routes.dart';
import 'package:sentimen/themes/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
  doWhenWindowReady(() {
    // final initialSize = Size(600, 450);
    // appWindow.minSize = initialSize;
    // appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "OCEAN";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PageName.LOADER,
        getPages: PageRoutes.pages,
        theme: AppTheme.buildThemeData(false),
      );
    });
  }
}
