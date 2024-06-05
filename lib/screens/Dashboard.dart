import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  var userName;

  Dashboard({this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Text(
        "Hello ${userName.toString().capitalizeFirst.toString()}",
        textAlign: TextAlign.center,
                style: TextStyle(fontSize: Get.height * 0.028),
      ))),
    );
  }
}
