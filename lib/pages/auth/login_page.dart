import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/auth/forget_password_page.dart';
import 'package:perfecto/pages/auth/registration_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../utils.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});
  _login({String? email, String? avatar, String? phone, String? googleId, String? name, String? password, String? otp, String? fbId, required LogInType type}) {
    final data = AuthController.to.loginRequest(email: email, phone: phone, password: password, type: type, otp: otp, googleId: googleId, fbId: fbId, name: name, avatar: avatar);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (AuthController.to.unAuthenticateIndex.value != -1) {
          AuthController.to.unAuthenticateIndex.value = -1;
          return true;
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        body: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                CustomSizedBox.space20H,
                Image.asset(
                  AssetsConstant.perfectoLogo,
                  height: 30,
                ),
                CustomSizedBox.space32H,
                Obx(() {
                  return Text(
                    AuthController.to.isOtp.value ? 'Enter Otp' : 'Sign in with a phone Number',
                    style: AppTheme.textStyleSemiBoldBlack16,
                  );
                }),
                Obx(() {
                  return CustomTextField(
                    keyboardType: TextInputType.phone,
                    focusNode: AuthController.to.isOtp.value ? AuthController.to.otpLoginFocusNode : AuthController.to.phoneLoginFocusNode,
                    errorMessage: AuthController.to.isOtp.value
                        ? AuthController.to.errorLoginOtp.value!.isEmpty
                            ? null
                            : AuthController.to.errorLoginOtp.value
                        : AuthController.to.errorLoginPhone.value!.isEmpty
                            ? null
                            : AuthController.to.errorLoginPhone.value,
                    onChanged: (value) {
                      if (AuthController.to.isOtp.value) {
                        if (value.isNotEmpty) {
                          AuthController.to.errorLoginOtp.value = '';
                        }
                        if (value.isEmpty) {
                          AuthController.to.errorLoginOtp.value = 'Enter otp';
                        }
                      } else {
                        if (value.isNotEmpty && value.length >= 11) {
                          AuthController.to.errorLoginPhone.value = '';
                        }
                        if (value.isEmpty) {
                          AuthController.to.errorLoginOtp.value = 'Enter a phone '
                              'number';
                        } else if (value.length < 11) {
                          AuthController.to.errorLoginPhone.value = 'Enter a '
                              'valid phone number';
                        }
                      }
                    },
                    onSubmitted: (p0) {
                      if (AuthController.to.isOtp.value) {
                        if (AuthController.to.otpController.text.isEmpty) {
                          AuthController.to.errorLoginOtp.value = 'Enter otp';
                        } else {
                          AuthController.to.otpLoginFocusNode.unfocus();
                        }
                      } else {
                        if (AuthController.to.phoneLoginController.text.isEmpty) {
                          AuthController.to.errorLoginPhone.value = 'Enter a '
                              'phone number';
                        } else if (AuthController.to.phoneLoginController.text.length < 11) {
                          AuthController.to.errorLoginPhone.value = 'Enter a '
                              'valid'
                              ' phone number';
                        } else {
                          AuthController.to.phoneLoginFocusNode.unfocus();
                        }
                      }
                    },
                    hintText: AuthController.to.isOtp.value ? 'OTP Code' : 'Phone Number',
                    controller: AuthController.to.isOtp.value ? AuthController.to.otpController : AuthController.to.phoneLoginController,
                    enableBorderColor: AppColors.kPrimaryColor,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        AuthController.to.isOtp.value ? 'assets/otp.png' : AssetsConstant.phoneLogin,
                        height: 20,
                      ),
                    ),
                  );
                }),
                CustomButton(
                  label: 'Login',
                  onPressed: () {
                    if (!AuthController.to.isOtp.value) {
                      if (AuthController.to.phoneLoginController.text.isNotEmpty && AuthController.to.phoneLoginController.text.length >= 11) {
                        _login(type: LogInType.phone, phone: AuthController.to.phoneLoginController.text);

                        // AuthController.to.isOtp.value = true;
                        // showSnackBar(
                        //   msg: 'Use OTP to Login.',
                        // );
                      } else {
                        if (AuthController.to.phoneLoginController.text.isEmpty) {
                          AuthController.to.errorLoginPhone.value = 'Enter a phone number';
                        }
                        if (AuthController.to.phoneLoginController.text.length < 11) {
                          AuthController.to.errorLoginPhone.value = 'Enter a valid phone number';
                        }
                      }
                    } else {
                      if (AuthController.to.otpController.text.isNotEmpty) {
                        _login(type: LogInType.verifyOTP, otp: AuthController.to.otpController.text);

                        AuthController.to.isOtp.value = false;
                        AuthController.to.otpController.text = '';
                        AuthController.to.phoneLoginController.text = '';
                      } else {
                        if (AuthController.to.otpController.text.isEmpty) {
                          AuthController.to.errorLoginOtp.value = 'Enter otp';
                        }
                      }
                    }
                  },
                  marginVertical: 16,
                ),
                CustomSizedBox.space12H,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset('assets/auth.png'),
                ),
                CustomSizedBox.space16H,
                Text(
                  'Sign in with Email & Password',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomTextField(
                  focusNode: AuthController.to.emailLoginFocusNode,
                  hintText: 'Username of Email',
                  errorMessage: AuthController.to.errorLoginEmail.value!.isEmpty ? null : AuthController.to.errorLoginEmail.value,
                  enableBorderColor: AppColors.kPrimaryColor,
                  controller: AuthController.to.emailLoginController,
                  onChanged: (value) {
                    if (value.isNotEmpty && value.isEmail) {
                      AuthController.to.errorLoginEmail.value = '';
                    } else if (value.isEmpty) {
                      AuthController.to.errorLoginEmail.value = 'Enter an email';
                    } else if (!value.isEmail) {
                      AuthController.to.errorLoginEmail.value = 'Enter an '
                          'valid email';
                    }
                  },
                  onSubmitted: (p0) {
                    if (AuthController.to.emailLoginController.text.isEmpty) {
                      AuthController.to.errorLoginEmail.value = 'Enter an email';
                    } else if (!AuthController.to.emailLoginController.text.isEmail) {
                      AuthController.to.errorLoginEmail.value = 'Enter an '
                          'valid email';
                    } else {
                      AuthController.to.emailLoginFocusNode.unfocus();
                    }
                  },
                  prefixWidget: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      AssetsConstant.email,
                      height: 20,
                    ),
                  ),
                ),
                CustomTextField(
                  focusNode: AuthController.to.passwordLoginFocusNode,
                  errorMessage: AuthController.to.errorLoginPass.value!.isEmpty ? null : AuthController.to.errorLoginPass.value,
                  hintText: 'Password',
                  onChanged: (value) {
                    if (value.isNotEmpty && value.length >= 8) {
                      AuthController.to.errorLoginPass.value = '';
                    } else if (value.isEmpty) {
                      AuthController.to.errorLoginPass.value = 'Enter a password';
                    } else if (value.length < 8) {
                      AuthController.to.errorLoginPass.value = 'Enter at least 8'
                          ' digit of your password';
                    } else {
                      AuthController.to.passwordLoginFocusNode.unfocus();
                    }
                  },
                  onSubmitted: (p0) {
                    if (AuthController.to.passwordLoginController.text.isEmpty) {
                      AuthController.to.errorLoginPass.value = 'Enter a password';
                    } else if (AuthController.to.passwordLoginController.text.length < 8) {
                      AuthController.to.errorLoginPass.value = 'Enter at least 8'
                          ' digit of your password';
                    } else {
                      AuthController.to.passwordLoginFocusNode.unfocus();
                    }
                  },
                  controller: AuthController.to.passwordLoginController,
                  enableBorderColor: AppColors.kPrimaryColor,
                  isPassword: true,
                  prefixWidget: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/password.png',
                      height: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Obx(() {
                            return GestureDetector(
                              onTap: () {
                                AuthController.to.isRemember.value = !AuthController.to.isRemember.value;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: AuthController.to.isRemember.value ? AppColors.kPrimaryColor : const Color(0xffE7E7E7),
                                    border: Border.all(width: 0.5, color: AppColors.kPrimaryColor)),
                                alignment: Alignment.center,
                                child: AuthController.to.isRemember.value
                                    ? const Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            );
                          }),
                          CustomSizedBox.space8W,
                          const Text(
                            'Remember Me',
                            style: AppTheme.textStyleNormalBlack12,
                          )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(ForgetPasswordScreen.routeName);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: AppTheme.textStyleMediumBlack12,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  label: 'Login',
                  marginVertical: 20,
                  onPressed: () {
                    if (AuthController.to.emailLoginController.text.isNotEmpty &&
                        AuthController.to.emailLoginController.text.isEmail &&
                        AuthController.to.passwordLoginController.text.length >= 8 &&
                        AuthController.to.passwordLoginController.text.isNotEmpty) {
                      _login(email: AuthController.to.emailLoginController.text, password: AuthController.to.passwordLoginController.text, type: LogInType.email);
                      AuthController.to.emailLoginController.clear();
                      AuthController.to.passwordLoginController.clear();
                    } else {
                      if (AuthController.to.passwordLoginController.text.isEmpty) {
                        AuthController.to.errorLoginPass.value = 'Enter a password';
                      }
                      if (AuthController.to.passwordLoginController.text.length < 8) {
                        AuthController.to.errorLoginPass.value = 'Enter at least 8'
                            ' digit of your password';
                      }
                      if (AuthController.to.emailLoginController.text.isEmpty) {
                        AuthController.to.errorLoginEmail.value = 'Enter an email';
                      } else if (!AuthController.to.emailLoginController.text.isEmail) {
                        AuthController.to.errorLoginEmail.value = 'Enter an '
                            'valid email';
                      }
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RegistrationScreen.routeName);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Here?',
                        style: AppTheme.textStyleMediumBlack12,
                      ),
                      Text(
                        ' Create A New one',
                        style: AppTheme.textStyleMediumPrimary12,
                      ),
                    ],
                  ),
                ),
                CustomSizedBox.space16H,
                // CustomButton(
                //   label: 'Continue with Facebook',
                //   primary: const Color(0xff3C579B),
                //   onPressed: () async {
                //     final isLogIn = await AuthController.to.loginWithFacebook();
                //     if (isLogIn) {
                //       _login(
                //           email: AuthController.to.userData!['email'],
                //           name: AuthController.to.userData!['name'],
                //           fbId: AuthController.to.userData!['id'],
                //           type: LogInType.facebook,
                //           avatar: AuthController.to.userData!['picture'] != null ? AuthController.to.userData!['picture']['data']['url'] : null);
                //     }
                //   },
                //   marginVertical: 12,
                //   prefixImage: AssetsConstant.facebook,
                //   prefixImageHeight: 20,
                // ),
                CustomButton(
                  label: 'Continue with Google',
                  primary: Colors.white,
                  onPressed: () async {
                    final googleId = await AuthController.to.googleSignIn();
                    globalLogger.d(googleId.toString());
                    _login(email: googleId!.email, googleId: googleId.id, name: googleId.displayName, type: LogInType.google, avatar: googleId.photoUrl);
                  },
                  isBorder: true,
                  borderColor: Colors.grey,
                  labelColor: Colors.black,
                  marginVertical: 0,
                  prefixImage: AssetsConstant.google,
                  prefixImageHeight: 20,
                ),
                CustomSizedBox.space16H,
              ],
            );
          }),
        ),
      ),
    );
  }
}
