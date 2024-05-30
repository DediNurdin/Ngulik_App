import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/themes/controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
      body: Column(
        children: [
          const Text(
            "Dedi Nurdiansyah",
            textScaler: TextScaler.linear(3),
          ),
          const Card(
            child:
                Padding(padding: EdgeInsets.all(10), child: Text('Ini Card')),
          ),
          MaterialButton(child: const Text('Ini Button'), onPressed: () {})
        ],
      ),
    );
  }
}
