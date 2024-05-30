import 'package:get/get.dart';
import 'package:theme_with_getx/helper/base_binding.dart';
import 'package:theme_with_getx/view/base_view.dart';
import 'package:theme_with_getx/view/countries_view.dart';
import 'package:theme_with_getx/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const SPLASH = Routes.SPLASH;

  static getRoutes() => [
        GetPage(
          name: Routes.BASE,
          page: () => const BaseView(),
          binding: BaseBinding(),
        ),
        GetPage(
          name: Routes.SPLASH,
          page: () => SplashView(),
        ),
        GetPage(
          name: Routes.HOME,
          page: () => HomeView(),
        ),
      ];
}
