import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/initializer.dart';
import 'package:sentimen/routes/page_names.dart';
import 'package:sentimen/routes/page_routes.dart';
import 'package:sentimen/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  runApp(MyApp());
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
