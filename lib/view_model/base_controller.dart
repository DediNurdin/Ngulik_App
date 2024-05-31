import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/countries_view.dart';
import '../view/profile_view.dart';

class BaseController extends GetxController {
  RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions;

  BaseController() {
    widgetOptions = <Widget>[
      HomeView(),
      ProfileView(),
    ];
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
