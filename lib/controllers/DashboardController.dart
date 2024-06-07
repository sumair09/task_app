import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_app/screens/Dashboard.dart';
import 'package:task_app/screens/LoginScreen.dart';
import 'package:task_app/utils/AppText.dart';

class DashboardController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userName = box.read(AppText.userName);
    update();
  }

  final box = GetStorage();

  var userName;
  var isLoad = false;

  logout() {
    isLoad = true;
    box.erase();
    update();
    Future.delayed(const Duration(seconds: 2), () {
      isLoad = false;
      update();
      Get.offAll(() => LoginScreen());

    });
  }

}