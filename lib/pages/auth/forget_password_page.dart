import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forget_pass';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              AssetsConstant.backRoute,
              height: 20,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.kBackgroundColor,
      ),
      backgroundColor: AppColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Forgot Password',
                  style: AppTheme.textStyleSemiBoldBlack24,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Enter the email address you used when you registered and we’ll send you instructions to reset your password.',
                  style: AppTheme.textStyleNormalBlack14,
                ),
              ),
              CustomTextField(
                focusNode: AuthController.to.emailForgetPassFocusNode,
                errorMessage: AuthController.to.errorForgetPassEmail.value!.isEmpty ? null : AuthController.to.errorForgetPassEmail.value,
                onChanged: (value) {
                  if (value.isNotEmpty && value.isEmail) {
                    AuthController.to.errorForgetPassEmail.value = '';
                  } else {
                    if (value.isEmpty) {
                      AuthController.to.errorForgetPassEmail.value = 'Enter '
                          'an email';
                    }
                    if (!value.isEmail) {
                      AuthController.to.errorForgetPassEmail.value = 'Enter '
                          'a valid email';
                    }
                  }
                },
                onSubmitted: (p0) {
                  if (AuthController.to.emailControllerForgetPass.text.isEmpty) {
                    AuthController.to.errorForgetPassEmail.value = 'Enter '
                        'an email';
                  } else if (!AuthController.to.emailControllerForgetPass.text.isEmail) {
                    AuthController.to.errorForgetPassEmail.value = 'Enter '
                        'a valid email';
                  } else {
                    AuthController.to.emailForgetPassFocusNode.unfocus();
                  }
                },
                controller: AuthController.to.emailControllerForgetPass,
                hintText: 'Enter Your email',
                focusColor: AppColors.kPrimaryColor,
                enableBorderColor: AppColors.kPrimaryColor,
                prefixWidget: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    AssetsConstant.email,
                    color: Colors.grey,
                    height: 20,
                  ),
                ),
              ),
              AuthController.to.isVerifyEmail.value
                  ? CustomTextField(
                      errorMessage: AuthController.to.errorForgetPassOtp.value!.isEmpty ? null : AuthController.to.errorForgetPassOtp.value,
                      focusNode: AuthController.to.otpForgetPassFocusNode,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          AuthController.to.errorForgetPassOtp.value = '';
                        } else {
                          AuthController.to.errorForgetPassOtp.value = 'Enter'
                              ' otp';
                        }
                      },
                      onSubmitted: (p0) {
                        if (AuthController.to.otpForgetPassController.text.isEmpty) {
                          AuthController.to.errorForgetPassOtp.value = 'Enter otp';
                        } else {
                          AuthController.to.otpForgetPassFocusNode.unfocus();
                        }
                      },
                      hintText: 'OTP Code',
                      focusColor: AppColors.kPrimaryColor,
                      controller: AuthController.to.otpForgetPassController,
                      enableBorderColor: AppColors.kPrimaryColor,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/otp.png',
                          height: 20,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              CustomButton(
                label: 'Send reset instructions',
                marginVertical: 20,
                onPressed: () {
                  if (!AuthController.to.isVerifyEmail.value) {
                    if (AuthController.to.emailControllerForgetPass.text.isEmail && AuthController.to.emailControllerForgetPass.text.isNotEmpty) {
                      AuthController.to.forgetPassword(AuthController.to.emailControllerForgetPass.text);
                      // AuthController.to.emailControllerForgetPass.clear();
                      AuthController.to.isVerifyEmail.value = true;
                    } else {
                      if (AuthController.to.emailControllerForgetPass.text.isEmpty) {
                        AuthController.to.errorForgetPassEmail.value = 'Enter '
                            'an email';
                      }
                      if (!AuthController.to.emailControllerForgetPass.text.isEmail) {
                        AuthController.to.errorForgetPassEmail.value = 'Enter '
                            'a valid email';
                      }
                    }
                  } else {
                    if (AuthController.to.emailControllerForgetPass.text.isEmail &&
                        AuthController.to.emailControllerForgetPass.text.isNotEmpty &&
                        AuthController.to.otpForgetPassController.text.isNotEmpty) {
                      AuthController.to.verifyEmailForgetPassword(AuthController.to.otpForgetPassController.text);
                      AuthController.to.emailControllerForgetPass.clear();
                      AuthController.to.otpForgetPassController.clear();
                      AuthController.to.isVerifyEmail.value = false;
                    } else {
                      if (AuthController.to.emailControllerForgetPass.text.isEmpty) {
                        AuthController.to.errorForgetPassEmail.value = 'Enter '
                            'an email';
                      }
                      if (!AuthController.to.emailControllerForgetPass.text.isEmail) {
                        AuthController.to.errorForgetPassEmail.value = 'Enter '
                            'a valid email';
                      }
                      if (AuthController.to.otpForgetPassController.text.isEmpty) {
                        AuthController.to.errorForgetPassOtp.value = 'Enter otp';
                      }
                    }
                  }
                },
              ),
              CustomSizedBox.space16H,
            ],
          );
        }),
      ),
    );
  }
}
