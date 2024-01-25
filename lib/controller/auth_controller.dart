import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/user_controller.dart';

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
  TextEditingController passwordOldController = TextEditingController();
  TextEditingController passwordForChangeController = TextEditingController();
  TextEditingController passwordForNewController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController passwordForChangeConfirmController = TextEditingController();
  TextEditingController passwordForNewConfirmController = TextEditingController();

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
  Rx<String?> errorOldPassword = ''.obs;
  Rx<String?> errorForChangePassword = ''.obs;
  Rx<String?> errorForNewPassword = ''.obs;
  Rx<String?> errorREPassword = ''.obs;
  Rx<String?> errorForChangeREPassword = ''.obs;
  Rx<String?> errorForNewREPassword = ''.obs;
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
  final FocusNode passwordOldFocusNode = FocusNode();
  final FocusNode passwordForChangeFocusNode = FocusNode();
  final FocusNode passwordForNewFocusNode = FocusNode();
  final FocusNode passwordLoginFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordForChangeFocusNode = FocusNode();
  final FocusNode confirmPasswordForNewFocusNode = FocusNode();
  RxBool isRemember = false.obs;
  RxBool isOtp = false.obs;
  RxBool isVerifyEmail = false.obs;
  RxString registerEmail = ''.obs;
  RxInt unAuthenticateIndex = (-1).obs;

  RxBool isLoggedIn = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LogInType? currentLoginType;
  @override
  Future<void> onInit() async {
    final loginUser = await dbHelper.getSingleItemAll(tableName: DatabaseHelper.loginTable, whereKey: DatabaseHelper.isLogIn, whereValue: 1);
    globalLogger.d(loginUser);
    isLoggedIn.value = loginUser.isNotEmpty;
    if (isLoggedIn.value) {
      final user =
          await dbHelper.getSingleItemSpecific(tableName: DatabaseHelper.loginTable, selectedItem: [DatabaseHelper.accessToken], whereKey: DatabaseHelper.isLogIn, whereValue: 1);

      ServiceAPI.setAuthToken(user[DatabaseHelper.accessToken]);
      globalLogger.d(user[DatabaseHelper.accessToken], 'token');
      Get.put<UserController>(UserController(), permanent: true);
      Get.put<HomeApiController>(HomeApiController(), permanent: true);
      // UserController.to.getUserInfoCall();
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
    passwordForNewConfirmController.dispose();
    passwordForChangeController.dispose();
    passwordForNewController.dispose();
    phoneLoginController.dispose();
    passwordLoginController.dispose();
    passwordController.dispose();
    passwordOldController.dispose();
    passwordConfirmController.dispose();
    otpController.dispose();

    super.onClose();
  }

  logoutFunc() {
    _delete();
    Get.delete<UserController>(force: true);
    ServiceAPI.setAuthToken('');
    if (currentLoginType == LogInType.google) {
      _googleSignIn.signOut();
    }
    if (currentLoginType == LogInType.facebook) {
      FacebookAuth.instance.logOut();
    }
    isLoggedIn.value = false;
    NavigationController.to.selectedIndex.value = 0;
    Get.offAllNamed(MainHomeScreen.routeName);
  }

  Future<bool> registerRequest(String fName, String lName, String email, String phone, String password, String cPassword) async {
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
      Get.back();
      // afterLogin(isCreated);
    }
    return isCreated;
  }

  Future<bool> loginRequest(
      {String? email, String? phone, String? password, String? otp, String? name, String? googleId, String? fbId, String? avatar, required LogInType type}) async {
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
    } else if (type == LogInType.google) {
      body = {
        "email": email!,
        "google_id": googleId!,
        "name": name!,
        "avatar": avatar!,
      };
    } else if (type == LogInType.facebook) {
      body = {
        "email": email!,
        "fb_id": fbId!,
        "name": name!,
        "avatar": avatar!,
      };
    }
    final isCreated = await AuthService.loginCall(body, type: type);
    final token = isCreated['token'];
    globalLogger.d(token, 'Token');
    if (type != LogInType.phone && isCreated.isNotEmpty) {
      ServiceAPI.setAuthToken(token);
      currentLoginType = type;
      _insert(accessToken: token, phone: isCreated['phone'] ?? '', loginType: type.name);
      isLoggedIn.value = true;

      showSnackBar(
        msg: 'Login successfully!',
      );
      unAuthenticateIndex.value = NavigationController.to.selectedIndex.value;
      unAuthenticateIndex.value = -1;

      Get.put<UserController>(UserController(), permanent: true);
      // UserController.to.getUserInfoCall();
      Get.back();
      // afterLogin(isCreated);
    } else if (type == LogInType.phone && isCreated.isNotEmpty) {
      globalLogger.d(isCreated['otp']);
    }
    return isCreated.isNotEmpty;
  }

  void _insert({String? phone, required String accessToken, String? loginType}) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.userMobile: phone ?? '',
      DatabaseHelper.accessToken: accessToken,
      DatabaseHelper.isLogIn: 1,
      DatabaseHelper.signInType: loginType,
      DatabaseHelper.updatedAt: DateTime.now().millisecondsSinceEpoch,
      DatabaseHelper.createdAt: DateTime.now().millisecondsSinceEpoch
    };
    final id = await dbHelper.insert(DatabaseHelper.loginTable, row);
    globalLogger.d('inserted row id: $id $loginType');
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
    final verifyEmail = await AuthService.verifyEmail({"email": registerEmail.value, "otp": otp});
    if (verifyEmail.isNotEmpty) {
      final token = verifyEmail['token'];
      globalLogger.d(token, 'Token');
      ServiceAPI.setAuthToken(token);
      _insert(accessToken: token);
      showSnackBar(msg: '"Otp verify successfully."');
      Get.offAndToNamed(ChangePasswordScreen.routeName);
    }
  }

  Future<void> changePassword(
    String password,
    String cPassword,
  ) async {
    globalLogger.d(registerEmail.value, 'email');
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

  Future<GoogleSignInAccount?> googleSignIn() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print('Error during Google Sign In: $error');
      return null;
    }
  }

  Map<String, dynamic>? userData;
  AccessToken? accessToken;
  bool _checking = true;
  Future<bool> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    ); // by default we request the email and the public profile
    // loginBehavior is only supported for Android devices, for ios it will be ignored
    // final result = await FacebookAuth.instance.login(
    //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    //   loginBehavior: LoginBehavior
    //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
    // );

    if (result.status == LoginStatus.success) {
      accessToken = result.accessToken;

      // get the user data
      // by default we get the userId, email,name and picture
      final userDataTemp = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      userData = userDataTemp;
      globalLogger.d(userData, 'userData');
      return true;
    } else {
      print(result.status);
      print(result.message);
    }
    return false;
  }

  // Future<void> loginWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.instance.getUserData();
  //       // userData contains information about the logged-in user
  //       print(userData);
  //     } else {
  //       print('Facebook login failed.');
  //     }
  //   } catch (e) {
  //     print('Error during Facebook login: $e');
  //   }
  // }
  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    // final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(DatabaseHelper.accessToken, DatabaseHelper.loginTable, ServiceAPI.getToken);
    globalLogger.d('deleted $rowsDeleted row(s): User ${ServiceAPI.getToken}');
  }

  Future<void> logout() async {
    showSnackBar(msg: 'Loging out..', actionLabel: '', actionLabelColor: Colors.transparent);
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
