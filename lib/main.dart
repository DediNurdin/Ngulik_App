import 'package:flutter/material.dart';
import 'package:theme_with_getx/app.dart';
import 'helper/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  runApp(
    const App(),
  );
}
