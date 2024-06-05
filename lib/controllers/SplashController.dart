import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_app/screens/Dashboard.dart';
import 'package:task_app/screens/LoginScreen.dart';
import 'package:task_app/utils/AppText.dart';

class SplashController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    changeScreen();
  }

  final box = GetStorage();

  changeScreen() {
    var token = box.read(AppText.authToken);
    update();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => token == null ? const LoginScreen() :  Dashboard(),
          transition: Transition.leftToRight);
    });
  }

}