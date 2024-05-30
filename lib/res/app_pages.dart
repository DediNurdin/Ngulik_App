// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:theme_with_getx/helper/base_binding.dart';
import 'package:theme_with_getx/view/base_view.dart';
import 'package:theme_with_getx/view/countries_view.dart';
import 'package:theme_with_getx/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.BASE;

  static getRoutes() => [
        GetPage(
          name: '/base',
          page: () => const BaseView(),
          binding: BaseBinding(),
        ),
        GetPage(
          name: '/',
          page: () => const SplashView(),
        ),
        GetPage(
          name: '/countries',
          page: () => CountriesView(),
        ),
      ];
}
