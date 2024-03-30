import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class EditPasswordScreen extends StatelessWidget {
  static const String routeName = '/edit_pass';
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        children: [
          HomeTopWidget(
            title: Row(
              children: [
                GestureDetector(
                  child: Image.asset(
                    AssetsConstant.backRoute,
                    height: 20,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                CustomSizedBox.space8W,
                Text(
                  'My Orders',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space4W,
              ],
            ),
            isSearchInclude: false,
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomSizedBox.space12H,
              CheckoutWidget(
                title: 'Edit Password',
                widget: Obx(() {
                  return Column(
                    children: [
                      if (UserController.to.getUserInfo.isGoogleLogin == '0')
                        CustomTextField(
                          isPassword: true,
                          errorMessage: AuthController.to.errorOldPassword.value!.isEmpty ? null : AuthController.to.errorOldPassword.value,
                          focusNode: AuthController.to.passwordOldFocusNode,
                          onChanged: (value) {
                            if (value.isNotEmpty && value.length >= 8) {
                              AuthController.to.errorOldPassword.value = '';
                            } else {
                              if (value.isEmpty) {
                                AuthController.to.errorOldPassword.value = 'Enter a Password';
                              } else if (value.length < 8) {
                                AuthController.to.errorOldPassword.value = 'Enter 8 Character Password!';
                              }
                            }
                          },
                          onSubmitted: (p0) {
                            if (AuthController.to.passwordOldController.text.isEmpty) {
                              AuthController.to.errorOldPassword.value = 'Enter a Password';
                            } else if (AuthController.to.passwordOldController.text.length < 8) {
                              AuthController.to.errorOldPassword.value = 'Enter 8 Character Password!';
                            } else {
                              AuthController.to.passwordOldFocusNode.unfocus();
                            }
                          },
                          controller: AuthController.to.passwordOldController,
                          marginVertical: 6,
                          hintText: 'Enter Old Password',
                          labelText: 'Old Password',
                          focusColor: Colors.black,
                        ),
                      CustomTextField(
                        errorMessage: AuthController.to.errorForNewPassword.value!.isEmpty ? null : AuthController.to.errorForNewPassword.value,
                        focusNode: AuthController.to.passwordForNewFocusNode,
                        isPassword: true,
                        onChanged: (value) {
                          if (value.isNotEmpty && value.length >= 8) {
                            AuthController.to.errorForNewPassword.value = '';
                          } else {
                            if (value.isEmpty) {
                              AuthController.to.errorForNewPassword.value = 'Enter a Password';
                            } else if (value.length < 8) {
                              AuthController.to.errorForNewPassword.value = 'Enter 8 Character Password!';
                            }
                          }
                        },
                        onSubmitted: (p0) {
                          if (AuthController.to.passwordForNewController.text.isEmpty) {
                            AuthController.to.errorForNewPassword.value = 'Enter a Password';
                          } else if (AuthController.to.passwordForNewController.text.length < 8) {
                            AuthController.to.errorForNewPassword.value = 'Enter 8 Character Password!';
                          } else {
                            AuthController.to.passwordForNewFocusNode.unfocus();
                          }
                        },
                        controller: AuthController.to.passwordForNewController,
                        marginVertical: 6,
                        hintText: 'Enter New Password',
                        labelText: 'New Password',
                        focusColor: Colors.black,
                      ),
                      CustomTextField(
                        isPassword: true,
                        focusNode: AuthController.to.confirmPasswordForNewFocusNode,
                        errorMessage: AuthController.to.errorForNewREPassword.value!.isEmpty ? null : AuthController.to.errorForNewREPassword.value,
                        onChanged: (value) {
                          if (value.isNotEmpty && value.length >= 8 && AuthController.to.passwordForNewController.text == value) {
                            AuthController.to.errorForNewREPassword.value = '';
                          } else {
                            if (value.isEmpty) {
                              AuthController.to.errorForNewREPassword.value = 'Enter a Password';
                            } else if (AuthController.to.passwordForNewController.text != value) {
                              AuthController.to.errorForNewREPassword.value = 'Passwords did not match!';
                            }
                          }
                        },
                        onSubmitted: (p0) {
                          if (AuthController.to.passwordForNewConfirmController.text.isEmpty) {
                            AuthController.to.errorForNewREPassword.value = 'Enter a Password';
                          } else if (AuthController.to.passwordForNewConfirmController.text != AuthController.to.passwordForNewController.text) {
                            AuthController.to.errorForNewREPassword.value = 'Passwords did not match!';
                          } else {
                            AuthController.to.confirmPasswordForNewFocusNode.unfocus();
                          }
                        },
                        controller: AuthController.to.passwordForNewConfirmController,
                        marginVertical: 6,
                        hintText: ' Confirm New Password',
                        labelText: 'Confirm New Password',
                        focusColor: Colors.black,
                      ),
                      CustomButton(
                        label: '${UserController.to.getUserInfo.isGoogleLogin == '1' ? 'Set' : 'Change'} Password',
                        onPressed: () async {
                          if ((UserController.to.getUserInfo.isGoogleLogin == '1' ||
                                  (AuthController.to.passwordOldController.text.isNotEmpty && AuthController.to.passwordOldController.text.length >= 8)) &&
                              AuthController.to.passwordForNewController.text.isNotEmpty &&
                              AuthController.to.passwordForNewController.text.length >= 8 &&
                              AuthController.to.passwordForNewConfirmController.text.isNotEmpty &&
                              AuthController.to.passwordForNewConfirmController.text == AuthController.to.passwordForNewController.text) {
                            await UserController.to.editPassword(AuthController.to.passwordOldController.text, AuthController.to.passwordForNewController.text,
                                AuthController.to.passwordForNewConfirmController.text);
                          } else {
                            if (AuthController.to.passwordForNewConfirmController.text.isEmpty) {
                              AuthController.to.errorForNewREPassword.value = 'Enter a Password';
                            }
                            if (AuthController.to.passwordForNewConfirmController.text != AuthController.to.passwordForNewController.text) {
                              AuthController.to.errorForNewREPassword.value = 'Passwords did not match!';
                            }
                            if (AuthController.to.passwordForNewController.text.isEmpty) {
                              AuthController.to.errorForNewPassword.value = 'Enter a Password';
                            }
                            if (AuthController.to.passwordForNewController.text.length < 8) {
                              AuthController.to.errorForNewPassword.value = 'Enter 8 Character Password!';
                            }
                            if (AuthController.to.passwordOldController.text.isEmpty) {
                              AuthController.to.errorOldPassword.value = 'Enter a Password';
                            }
                            if (AuthController.to.passwordOldController.text.length < 8) {
                              AuthController.to.errorOldPassword.value = 'Enter 8 Character Password!';
                            }
                          }
                        },
                        marginVertical: 12,
                      ),
                      CustomSizedBox.space12H,
                    ],
                  );
                }),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
