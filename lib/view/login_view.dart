// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/view/base_view.dart';
import '../view_model/login_controller.dart';
import '../view_model/theme_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final LoginViewModel _viewModel = Get.put(LoginViewModel());

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _formType == FormType.login
            ? const Text('Login')
            : const Text('Register'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: _formType == FormType.login ? loginForm() : registerForm(),
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
        ),
        ElevatedButton(
          onPressed: () async {
            // if (formKey.currentState?.validate() ?? false) {
            //   await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
            // }
            Get.to(() => const BaseView());
          },
          child: const Text('Login'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.register;
            });
          },
          child: const Text('Does not have an account?'),
        )
      ]),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty || value != passwordCtr.text)
                ? 'Passwords does not match'
                : null;
          },
          decoration: inputDecoration('Retype Password', Icons.lock),
        ),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.registerUser(emailCtr.text, passwordCtr.text);
            }
          },
          child: const Text('Register'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: const Text('Login'),
        )
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
  );
}

enum FormType { login, register }
