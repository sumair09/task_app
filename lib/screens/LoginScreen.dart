import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/LoginController.dart';
import 'package:task_app/utils/AppColors.dart';
import 'package:task_app/utils/AppText.dart';

import '../utils/AppButton.dart';
import '../utils/AppInputField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (login) => Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(Get.height *0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppText.login,),
                      AppInputField(
                        controller: login.emailController,
                        hintText: AppText.username,
                        errorText: login.errorText,
                      ),
                      SizedBox(height: Get.height * 0.02,),
                      AppInputField(
                        controller: login.passController,
                        hintText: AppText.password,
                        errorText: login.passError,
                        isPassword: login.passShow,
                        rightIconCallBack: () {
                          login.showHidePass();
                        },
                      ),
                      SizedBox(height: Get.height * 0.05,),
                      AppButton(
                        isLoad: login.isLoad,
                        onPress: () {
                          if(login.validateUserName(context) && login.validatePassword(context)) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            login.checkLogin();
                          }
                        },
                        text: AppText.submit,
                        btnColor: Colors.red,
                        height: Get.height * 0.055,
                        textColor: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
