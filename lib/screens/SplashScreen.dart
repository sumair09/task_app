import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/SplashController.dart';
import 'package:task_app/utils/AppColors.dart';
import 'package:task_app/utils/AppText.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (splash) => Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
              gradient:    LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      AppColors.blue,
                      AppColors.lightBlue,
                    ],
                  )
              ),
              height: Get.height,
              width: Get.width,
              child: Center(
                child: Image.asset(AppText.splashBg),
              ),
            ),
          ),
        ));
  }
}
