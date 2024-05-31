import 'package:get/get.dart';
import '../helper/base_binding.dart';
import '../view/base_view.dart';
import '../view/countries_view.dart';
import '../view/splash_view.dart';

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
