import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/view/countries_view.dart';
import 'package:theme_with_getx/view/profile_view.dart';

class BaseController extends GetxController {
  RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions;

  BaseController() {
    widgetOptions = <Widget>[
      CountriesView(),
      const ProfileView(),
    ];
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
