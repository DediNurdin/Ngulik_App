import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/data/core/authentication_manager.dart';
import 'package:theme_with_getx/view_model/theme_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final AuthenticationManager _authManager = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            GetBuilder<ThemeController>(
              builder: (controller) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.light_mode),
                    Switch(
                      activeColor: Colors.amber,
                      value: controller.isDark,
                      onChanged: (value) {
                        controller.changeTheme(value);
                      },
                    ),
                    const Icon(Icons.dark_mode),
                  ],
                );
              },
            ),
          ],
        ),
        body: Center(
          child: ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                _authManager.logOut();
              }),
        ));
  }
}
