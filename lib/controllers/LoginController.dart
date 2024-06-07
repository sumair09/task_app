
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:task_app/apiController/ApiRequests.dart';
import 'package:task_app/apiController/Apis.dart';
import 'package:task_app/screens/Dashboard.dart';
import 'package:task_app/utils/AppText.dart';
import 'package:task_app/utils/MessageBox.dart';

class LoginController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String errorText = "";
  String passError = "";
  bool passShow = true;

  showHidePass() {
    passShow = !passShow;
    update();
  }

  void usernameChanged(String val) {
    emailController.text = val;
    update();
  }

  bool validateUserName(context) {
    if (emailController.text.isEmpty) {
      errorText = 'Username cannot be empty';
      update();
      return false;
    }
    else {
      errorText = "";
      update();
    }
    return true;
  }

  bool validatePassword(context) {
    if(passController.text.isEmpty) {
      passError = 'Password cannot be empty';
      update();
      return false;
    }
    else {
      passError = "";
      update();
    }
    return true;
  }


  var isLoad = false;
  final box = GetStorage();
  checkLogin() {
    isLoad = true;
    update();
    Map data = {
      "userName": emailController.text,
      "password": passController.text
    };
    ApiRequests().postRest(Apis.loginApi, null, data, (success) {
      print("Success == $success");
      isLoad = false;
      var js = json.decode(success);
      update();
      box.write(AppText.authToken, js['data']['accessToken']);
      box.write(AppText.expiresIn, js['data']['expiresIn']);

      //decode jwt token
      Map<String, dynamic> decodedToken = JwtDecoder.decode(js['data']['accessToken']);
      print(decodedToken['unique_name']);
      box.write(AppText.userName, decodedToken['unique_name']);
      Get.offAll(() =>  Dashboard(), transition: Transition.rightToLeft);
    }, (fail) {
      print("Error == $fail");
      isLoad = false;
      var js = json.decode(fail);
      update();
      MessageBox.showInSnackBar(Get.context!, js['userMessage']);
    });

  }

}