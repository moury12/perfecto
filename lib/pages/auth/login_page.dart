import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/pages/auth/forget_password_page.dart';
import 'package:perfecto/pages/auth/registration_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class LoginScreen extends StatelessWidget {

  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            CustomSizedBox.space20H,
            Image.asset(
              AssetsConstant.perfectoLogo,
              height: 30,
            ),
            CustomSizedBox.space32H,
            Obx(
             () {
                return Text(
                  AuthController.to.isOtp.value ? 'Enter Otp' : 'Sign in with a phone Number',
                  style: AppTheme.textStyleSemiBoldBlack16,
                );
              }
            ),
            Obx(
             () {
                return CustomTextField(
                  hintText: AuthController.to.isOtp.value ? 'OTP Code' : 'Phone Numbar',
                  enableBorderColor: AppColors.kPrimaryColor,
                  prefixWidget: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      AuthController.to.isOtp.value ? 'assets/otp.png' : AssetsConstant.phoneLogin,
                      height: 20,
                    ),
                  ),
                );
              }
            ),
            CustomButton(
              label: 'Login',
              onPressed: () {
                AuthController.to.isOtp.value=!AuthController.to.isOtp.value;
              },
              marginVertical: 16,
            ),
            CustomSizedBox.space12H,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset('assets/auth.png'),
            ),
             Text(
              'Sign in with Email & Password',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
            CustomTextField(
              hintText: 'Username of Email',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AssetsConstant.email,
                  height: 20,
                ),
              ),
            ),
            CustomTextField(
              hintText: 'Password',
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
                            AuthController.to.isRemember.value=!AuthController.to.isRemember.value;
                          },
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: AuthController.to.isRemember.value
                                    ? AppColors.kPrimaryColor
                                    : const Color(0xffE7E7E7),
                                border: Border.all(
                                    width: 0.5, color: AppColors.kPrimaryColor)),
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
              onPressed: () {},
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
            CustomButton(
              label: 'Continue with Facebook',
              primary: const Color(0xff3C579B),
              onPressed: () {},
              marginVertical: 12,
              prefixImage: AssetsConstant.facebook,
              prefixImageHeight: 20,
            ),
            CustomButton(
              label: 'Continue with Facebook',
              primary: Colors.white,
              onPressed: () {},
              isBorder: true,
              borderColor: Colors.grey,
              labelColor: Colors.black,
              marginVertical: 0,
              prefixImage: AssetsConstant.google,
              prefixImageHeight: 20,
            ),
            CustomSizedBox.space16H,
          ],
        ),
      ),
    );
  }
}
