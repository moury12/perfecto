import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = '/change_password';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              isPassword: true,
              marginVertical: 6,
              hintText: 'Enter New Password',
              labelText: 'New Password',
              errorMessage: AuthController.to.errorForChangePassword.value!.isEmpty ? null : AuthController.to.errorForChangePassword.value,
              focusNode: AuthController.to.passwordForChangeFocusNode,
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 8) {
                  AuthController.to.errorForChangePassword.value = '';
                } else {
                  if (value.isEmpty) {
                    AuthController.to.errorForChangePassword.value = 'Enter a Password';
                  } else if (value.length < 8) {
                    AuthController.to.errorForChangePassword.value = 'Enter 8 Character Password!';
                  }
                }
              },
              onSubmitted: (p0) {
                if (AuthController.to.passwordForChangeController.text.isEmpty) {
                  AuthController.to.errorForChangePassword.value = 'Enter a Password';
                } else if (AuthController.to.passwordForChangeController.text.length < 8) {
                  AuthController.to.errorForChangePassword.value = 'Enter 8 Character Password!';
                } else {
                  AuthController.to.passwordForChangeFocusNode.unfocus();
                }
              },
              controller: AuthController.to.passwordForChangeController,
              focusColor: AppColors.kPrimaryColor,
              enableBorderColor: AppColors.kPrimaryColor,
            ),
            CustomTextField(
              isPassword: true,
              focusNode: AuthController.to.confirmPasswordFocusNode,
              errorMessage: AuthController.to.errorForChangeREPassword.value!.isEmpty ? null : AuthController.to.errorForChangeREPassword.value,
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 8 && AuthController.to.passwordForChangeController.text == value) {
                  AuthController.to.errorForChangeREPassword.value = '';
                } else {
                  if (value.isEmpty) {
                    AuthController.to.errorForChangeREPassword.value = 'Enter a Password';
                  } else if (AuthController.to.passwordForChangeController.text != value) {
                    AuthController.to.errorForChangeREPassword.value = 'Passwords did not match!';
                  }
                }
              },
              onSubmitted: (p0) {
                if (AuthController.to.passwordForChangeConfirmController.text.isEmpty) {
                  AuthController.to.errorForChangeREPassword.value = 'Enter a Password';
                } else if (AuthController.to.passwordForChangeController.text != AuthController.to.passwordForChangeConfirmController.text) {
                  AuthController.to.errorForChangeREPassword.value = 'Passwords did not match!';
                } else {
                  AuthController.to.confirmPasswordFocusNode.unfocus();
                }
              },
              controller: AuthController.to.passwordForChangeConfirmController,
              marginVertical: 6,
              hintText: ' Confirm New Password',
              labelText: 'Confirm New Password',
              focusColor: AppColors.kPrimaryColor,
              enableBorderColor: AppColors.kPrimaryColor,
            ),
            CustomButton(
              label: 'Change Password',
              onPressed: () {
                if (AuthController.to.passwordForChangeController.text.length >= 8 &&
                    AuthController.to.passwordForChangeController.text.isNotEmpty &&
                    AuthController.to.passwordForChangeConfirmController.text == AuthController.to.passwordForChangeController.text &&
                    AuthController.to.passwordForChangeConfirmController.text.isNotEmpty) {
                  AuthController.to.changePassword(AuthController.to.passwordForChangeController.text, AuthController.to.passwordForChangeConfirmController.text);

                  AuthController.to.passwordForChangeController.clear();
                  AuthController.to.passwordForChangeConfirmController.clear();
                } else {
                  if (AuthController.to.passwordForChangeController.text.isEmpty) {
                    AuthController.to.errorForChangePassword.value = 'Enter a Password';
                  }
                  if (AuthController.to.passwordForChangeController.text.length < 8) {
                    AuthController.to.errorForChangePassword.value = 'Enter 8 Character Password!';
                  }
                  if (AuthController.to.passwordForChangeConfirmController.text.isEmpty) {
                    AuthController.to.errorForChangeREPassword.value = 'Enter a Password';
                  }
                  if (AuthController.to.passwordForChangeConfirmController.text != AuthController.to.passwordForChangeController.text) {
                    AuthController.to.errorForChangeREPassword.value = 'Passwords did not match!';
                  }
                }
              },
              marginVertical: 12,
            ),
            CustomSizedBox.space12H,
          ],
        );
      }),
    );
  }
}
