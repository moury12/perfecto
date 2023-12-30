import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/auth/forget_password_page.dart';
import 'package:perfecto/pages/auth/registration_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            CustomSizedBox.space32H,
            Image.asset(
              AssetsConstant.perfectoLogo,
              height: 30,
            ),
            CustomSizedBox.space32H,
            Text(
              'Sign in with a phone Number',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
            CustomTextField(
              hintText: 'Phone Numbar',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AssetsConstant.phoneLogin,
                  height: 20,
                ),
              ),
            ),
            CustomButton(
              label: 'Login',
              onPressed: () {},
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
                      CustomCheckboxWidget(),
                      CustomSizedBox.space8W,
                      Text(
                        'Remember Me',
                        style: AppTheme.textStyleNormalBlack12,
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(ForgetPasswordScreen.routeName);
                    },
                    child: Text(
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
              child: Row(
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
              primary: Color(0xff3C579B),
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
