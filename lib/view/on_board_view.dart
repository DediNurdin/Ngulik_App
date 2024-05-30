import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/data/core/authentication_manager.dart';
import 'package:theme_with_getx/view/base_view.dart';
import 'package:theme_with_getx/view/login_view.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? const BaseView() : const LoginView();
    });
  }
}
