import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/pages/auth/change_password_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
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
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController emailControllerForgetPass = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneLoginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordForChangeController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController passwordForChangeConfirmController =
      TextEditingController();

  TextEditingController otpController = TextEditingController();
  TextEditingController otpForgetPassController = TextEditingController();
  Rx<String?> errorEmail = ''.obs;
  Rx<String?> errorForgetPassEmail = ''.obs;
  Rx<String?> errorLoginEmail = ''.obs;
  Rx<String?> errorLoginPass = ''.obs;
  Rx<String?> errorLoginPhone = ''.obs;
  Rx<String?> errorLoginOtp = ''.obs;
  Rx<String?> errorForgetPassOtp = ''.obs;
  Rx<String?> errorPhone = ''.obs;
  Rx<String?> errorPassword = ''.obs;
  Rx<String?> errorForChangePassword = ''.obs;
  Rx<String?> errorREPassword = ''.obs;
  Rx<String?> errorForChangeREPassword = ''.obs;
  Rx<String?> errorName = ''.obs;
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode emailForgetPassFocusNode = FocusNode();
  final FocusNode emailLoginFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode phoneLoginFocusNode = FocusNode();
  final FocusNode otpLoginFocusNode = FocusNode();
  final FocusNode otpForgetPassFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordForChangeFocusNode = FocusNode();
  final FocusNode passwordLoginFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordForChangeFocusNode = FocusNode();
  RxBool isRemember = false.obs;
  RxBool isOtp = false.obs;
  RxBool isVerifyEmail = false.obs;
  RxString registerEmail = ''.obs;
  RxInt unAuthenticateIndex = (-1).obs;

  RxBool isLoggedIn = false.obs;

  @override
  Future<void> onInit() async {
    final loginUser = await dbHelper.getSingleItemAll(
        tableName: DatabaseHelper.loginTable,
        whereKey: DatabaseHelper.isLogIn,
        whereValue: 1);
    globalLogger.d(loginUser);
    isLoggedIn.value = loginUser.isNotEmpty;
    if (isLoggedIn.value) {
      final user = await dbHelper.getSingleItemSpecific(
          tableName: DatabaseHelper.loginTable,
          selectedItem: [DatabaseHelper.accessToken],
          whereKey: DatabaseHelper.isLogIn,
          whereValue: 1);

      ServiceAPI.setAuthToken(user[DatabaseHelper.accessToken]);
      // globalLogger.d(user, user.runtimeType);
    }
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    otpForgetPassController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    emailLoginController.dispose();
    emailControllerForgetPass.dispose();
    phoneController.dispose();
    passwordForChangeConfirmController.dispose();
    passwordForChangeController.dispose();
    phoneLoginController.dispose();
    passwordLoginController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    otpController.dispose();

    super.onClose();
  }

  logoutFunc() {
    _delete();
    ServiceAPI.setAuthToken('');
    isLoggedIn.value = false;
    NavigationController.to.selectedIndex.value = 0;
    Get.offAllNamed(MainHomeScreen.routeName);
  }

  Future<bool> registerRequest(String fName, String lName, String email,
      String phone, String password, String cPassword) async {
    registerEmail(email);
    final isCreated = await AuthService.registerCall({
      "f_name": fName,
      "l_name": lName,
      "phone": phone,
      "email": email,
      "password": password,
      "c_password": cPassword,
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

  Future<bool> loginRequest(
      {String? email,
      String? phone,
      String? password,
      String? otp,
      required LogInType type}) async {
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
      ServiceAPI.setAuthToken(token);
      _insert(accessToken: token, phone: isCreated['phone'] ?? '');
      isLoggedIn.value = true;
      showSnackBar(
        msg: 'Login successfully!',
      );
      unAuthenticateIndex.value = NavigationController.to.selectedIndex.value;
      unAuthenticateIndex.value = -1;
      Get.back();
      // afterLogin(isCreated);
    } else if (type == LogInType.phone && isCreated.isNotEmpty) {
      globalLogger.d(isCreated['otp']);
    }
    return isCreated.isNotEmpty;
  }

  void _insert({String? phone, required String accessToken}) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.userMobile: phone ?? '',
      DatabaseHelper.accessToken: accessToken,
      DatabaseHelper.isLogIn: 1,
      DatabaseHelper.updatedAt: DateTime.now().millisecondsSinceEpoch,
      DatabaseHelper.createdAt: DateTime.now().millisecondsSinceEpoch
    };
    final id = await dbHelper.insert(DatabaseHelper.loginTable, row);
    globalLogger.d('inserted row id: $id');
  }

  Future<void> forgetPassword(String email, [bool isResend = false]) async {
    registerEmail(email);
    final verifyEmail = await AuthService.forgetPassword({"email": email});
    if (verifyEmail.isNotEmpty) {
      showSnackBar(msg: 'Use OTP to Change Password.');
      globalLogger.d(verifyEmail['otp']);
      isVerifyEmail = !isResend ? true.obs : false.obs;
    }
  }

  Future<void> verifyEmailForgetPassword(String otp) async {
    bool verifyEmail = await AuthService.verifyEmail(
        {"email": registerEmail.value, "otp": otp});
    if (verifyEmail) {
      showSnackBar(msg: '"Otp verify successfully."');
      Get.offAndToNamed(ChangePasswordScreen.routeName);
    }
  }

  Future<void> changePassword(
    String password,
    String cPassword,
  ) async {
    // getProgressDialog('Verify and Changing Password');
    bool isVerified = await AuthService.changePassword({
      "email": registerEmail.value,
      "new_password": password,
      "c_password": cPassword,
    });
    if (isVerified) {
      showSnackBar(msg: 'New password reset successfully!');
      Get.offAllNamed(LoginScreen.routeName);
    }
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    // final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(DatabaseHelper.accessToken,
        DatabaseHelper.loginTable, ServiceAPI.getToken);
    globalLogger.d('deleted $rowsDeleted row(s): User ${ServiceAPI.getToken}');
  }

  Future<void> logout() async {
    showSnackBar(
        msg: 'Loging out..',
        actionLabel: '',
        actionLabelColor: Colors.transparent);
    final logingOut = await AuthService.logoutCall(
      forceLogout: () {
        logoutFunc();
      },
    );
    if (logingOut) {
      logoutFunc();
    }
  }
}
