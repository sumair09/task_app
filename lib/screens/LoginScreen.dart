import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/LoginController.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (splash) => Scaffold());
  }
}
