import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_app/screens/LoginScreen.dart';
import 'package:task_app/screens/SplashScreen.dart';
import 'package:task_app/utils/AppText.dart';

void main() async {
  await GetStorage.init();
  checkTokenExpiry();
  runApp(const MyApp());
}

final box = GetStorage();
checkTokenExpiry() {
  var savedExpiry = box.read(AppText.expiresIn);
  //convert expiry to dateTime
  if(savedExpiry != null) {
    DateTime saveDate = DateTime.fromMillisecondsSinceEpoch(savedExpiry);
    var currentDateTime = DateTime.now();
    if (saveDate.isBefore(currentDateTime)) {
      //session out logout the user
      print("Token is expired");
      //clear data
      box.erase();
      // Get.offAll(() => LoginScreen());
    }
    else {
      print("Token is valid");
    }
  }
  else {
    print("New Login");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
