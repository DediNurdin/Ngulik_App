import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/core/authentication_manager.dart';
import 'base_view.dart';
import 'login_view.dart';

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
