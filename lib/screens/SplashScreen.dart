import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/SplashController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (splash) => Scaffold());
  }
}
