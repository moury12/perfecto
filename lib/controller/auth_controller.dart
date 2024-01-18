import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/services/auth_service.dart';

import '../DB/database_helper.dart';
import '../main.dart';
import '../pages/auth/login_page.dart';
import '../utils.dart';
import 'navigation_controller.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
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
  RxBool isRemember = false.obs;
  RxBool isOtp = false.obs;
  RxBool isLogin = false.obs;
  RxString registerEmail = ''.obs;
  RxInt unAuthenticateIndex = (-1).obs;

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

  Future<bool> registerRequest(String name, String email, String phone, String password) async {
    registerEmail(email);
    final isCreated = await AuthService.registerCall({
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

  Future<bool> loginRequest({String? email, String? phone, String? password, String? otp, required LogInType type}) async {
    dynamic body = {};
    if (type == LogInType.email) {
      body = {
        "email": email!,
        "password": password!,
      };
      registerEmail(email);
    } else if (type == LogInType.phone) {
      body = {
        "phone": phone!,
      };
      registerEmail(phone);
    } else if (type == LogInType.verifyOTP) {
      body = {
        "phone": registerEmail.value,
        "otp": otp!,
      };
    }
    final isCreated = await AuthService.loginCall(body, type: type);
    final token = isCreated['token'];
    globalLogger.d(token, 'Token');
    if (type != LogInType.phone && isCreated.isNotEmpty) {
      showSnackBar(
        msg: 'Login successfully!',
      );
      NavigationController.to.selectedIndex.value = unAuthenticateIndex.value;
      unAuthenticateIndex.value = -1;
      Get.back();
      // afterLogin(isCreated);
    }
    return isCreated;
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.userId: '5',
      DatabaseHelper.isLogIn: 0,
      DatabaseHelper.updatedAt: DateTime.now().millisecondsSinceEpoch,
      DatabaseHelper.createdAt: DateTime.now().millisecondsSinceEpoch
    };
    final id = await dbHelper.insert(row);
    globalLogger.d('inserted row id: $id');
  }

  void _delete(dynamic userId) async {
    // Assuming that the number of rows is the id for the last row.
    // final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(DatabaseHelper.userId, userId);
    globalLogger.d('deleted $rowsDeleted row(s): User $userId');
  }
}
