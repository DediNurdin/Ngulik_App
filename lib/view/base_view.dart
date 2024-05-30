import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/view_model/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      init: BaseController(),
      builder: (controller) => Scaffold(
        body: Obx(() =>
            controller.widgetOptions.elementAt(controller.selectedIndex.value)),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onItemTapped,
            )),
      ),
    );
  }
}
