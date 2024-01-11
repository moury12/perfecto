import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController get to => Get.find();
  RxBool isRemember=false.obs;
  RxBool isOtp=false.obs;
}