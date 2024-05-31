import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'res/app_pages.dart';
import 'themes/themes.dart';
import 'view_model/theme_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.getRoutes(),
        theme: Themes.light,
        darkTheme: Themes.dark,
        title: 'Ngulik App',
        themeMode: controller.isDark ? ThemeMode.dark : ThemeMode.light,
        initialRoute: AppPages.SPLASH,
      ),
    );
  }
}
