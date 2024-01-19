import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName ='/change_password';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CustomTextField(
              marginVertical: 6,
              hintText: 'Enter New Password',
              labelText: 'New Password',

              focusColor: AppColors.kPrimaryColor,
              enableBorderColor: AppColors.kPrimaryColor,
              controller: AuthController.to.changePasswordController,
            ),

             CustomTextField(
              controller: AuthController.to.changePasswordConfirmController,
              marginVertical: 6,
              hintText: ' Confirm New Password',
              labelText: 'Confirm New Password',
              focusColor: AppColors.kPrimaryColor,
              enableBorderColor: AppColors.kPrimaryColor,
            ),

            CustomButton(label: 'Change Password',onPressed: () {
AuthController.to.changePassword(AuthController.to.changePasswordController
    .text, AuthController.to.changePasswordConfirmController.text);
AuthController.to.changePasswordController.clear();
AuthController.to.changePasswordConfirmController.clear();
            },marginVertical: 12,),
            CustomSizedBox.space12H,
          ],
        ),
    );
  }
}