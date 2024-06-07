import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/DashboardController.dart';
import 'package:task_app/utils/AppText.dart';

import '../utils/AppButton.dart';
import '../utils/AppColors.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (dc) => SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome ${dc.userName.toString().capitalizeFirst.toString()} to Task App",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: Get.height * 0.028),
                  ),
                  SizedBox(height: Get.height * 0.03,),
                  AppButton(
                    isLoad: dc.isLoad,
                    onPress: () {
                      dc.logout();
                    },
                    text: AppText.logout,
                    btnColor: Colors.red,
                    height: Get.height * 0.055,
                    textColor: AppColors.white,
                  )

                ],
              ),
            )),
      ),
    );
  }
}
