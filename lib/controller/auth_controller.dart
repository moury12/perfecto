import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/services/auth_service.dart';

import '../pages/auth/login_page.dart';

class AuthController extends GetxController{
  static AuthController get to => Get.find();
  TextEditingController firstNameController =TextEditingController();
  TextEditingController lastNameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController passwordConfirmController =TextEditingController();
  RxString? errorEmail;
  RxString? errorPhone;
  RxString? errorPassword;
  RxString? errorREPassword;
  RxString? errorName;
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.onClose();
  }
  RxBool isRemember=false.obs;
  RxBool isOtp=false.obs;
  RxString registerEmail = ''.obs;
  Future<bool> registerRequest(String name, String email, String phone, String password) async {
    registerEmail(email);
    final isCreated = await AuthService.RegisterCall({
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    });
    if (isCreated) {
      showSnackBar(
        msg: 'Your Account created successfully!',
      );
      Get.offAllNamed(LoginScreen.routeName);
      // afterLogin(isCreated);
    }
    return isCreated;
  }
}