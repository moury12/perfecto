import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/reg';
  const RegistrationScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            Text(
              'Personal Details',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
            CustomSizedBox.space20H,
            CustomTextField(

              hintText: 'First name',
              controller: AuthController.to.firstNameController,
              enableBorderColor: AppColors.kPrimaryColor,
              focusNode: AuthController.to.firstNameFocusNode,
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 3) {
                  AuthController.to.errorName = null;

                } else {
                  if (value.isEmpty) {
                    AuthController.to.errorName!.value = 'Enter a name';
                  } else if (value.length < 3) {
                    AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                  }
                }
              },
              onSubmitted: (p0) {
                if (AuthController.to.firstNameController.text.isEmpty) {
                  AuthController.to.errorName!.value = 'Enter A name';
                } else if (AuthController.to.firstNameController.text.length < 3) {
                  AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                } else {
                  AuthController.to.firstNameFocusNode.unfocus();
                }
              },
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/user_icon.png',
                  color: Colors.grey,
                  height: 20,
                ),
              ),
            ),
            CustomTextField(
              focusNode: AuthController.to.lastNameFocusNode,
              // onChanged: (value) {
              //   if (value.isNotEmpty && value.length >= 3) {
              //     AuthController.to.errorName = null;
              //
              //   } else {
              //     if (value.isEmpty) {
              //       AuthController.to.errorName!.value = 'Enter a name';
              //     } else if (value.length < 3) {
              //       AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
              //     }
              //   }
              // },
              // onSubmitted: (p0) {
              //   if (AuthController.to.firstNameController.text.isEmpty) {
              //     AuthController.to.errorName!.value = 'Enter A name';
              //   } else if (AuthController.to.firstNameController.text.length < 3) {
              //     AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
              //   } else {
              //     AuthController.to.firstNameFocusNode.unfocus();
              //   }
              // },
              controller: AuthController.to.lastNameController,
              hintText: 'Last name',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/user_icon.png',
                  color: Colors.grey,
                  height: 20,
                ),
              ),
            ),
            CustomSizedBox.space20H,
            Text(
              'Account Details',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
            CustomSizedBox.space20H,
            CustomTextField(
              focusNode: AuthController.to.emailFocusNode,
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 3) {
                  AuthController.to.errorEmail = null;

                } else {
                  if (value.isEmpty) {
                    AuthController.to.errorEmail!.value = 'Enter a email address';
                  } else if (!value.isEmail) {
                    AuthController.to.errorEmail!.value = 'Enter minimum 3 character of your name!';
                  }
                }
              },
              onSubmitted: (p0) {
                if (AuthController.to.firstNameController.text.isEmpty) {
                  AuthController.to.errorName!.value = 'Enter A name';
                } else if (AuthController.to.firstNameController.text.length < 3) {
                  AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                } else {
                  AuthController.to.firstNameFocusNode.unfocus();
                }
              },
              controller: AuthController.to.emailController,
              hintText: 'Username of Email',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AssetsConstant.email,
                  height: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            CustomTextField(
              focusNode: AuthController.to.firstNameFocusNode,
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 3) {
                  AuthController.to.errorName = null;

                } else {
                  if (value.isEmpty) {
                    AuthController.to.errorName!.value = 'Enter a name';
                  } else if (value.length < 3) {
                    AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                  }
                }
              },
              onSubmitted: (p0) {
                if (AuthController.to.firstNameController.text.isEmpty) {
                  AuthController.to.errorName!.value = 'Enter A name';
                } else if (AuthController.to.firstNameController.text.length < 3) {
                  AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                } else {
                  AuthController.to.firstNameFocusNode.unfocus();
                }
              },
              controller: AuthController.to.phoneController,
              hintText: 'phone Number',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AssetsConstant.phoneFill,
                  height: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            CustomTextField(
              focusNode: AuthController.to.firstNameFocusNode,
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 3) {
                  AuthController.to.errorName = null;

                } else {
                  if (value.isEmpty) {
                    AuthController.to.errorName!.value = 'Enter a name';
                  } else if (value.length < 3) {
                    AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                  }
                }
              },
              onSubmitted: (p0) {
                if (AuthController.to.firstNameController.text.isEmpty) {
                  AuthController.to.errorName!.value = 'Enter A name';
                } else if (AuthController.to.firstNameController.text.length < 3) {
                  AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                } else {
                  AuthController.to.firstNameFocusNode.unfocus();
                }
              },
              controller: AuthController.to.passwordController,
              hintText: 'Password',
              isPassword: true,
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/password.png',
                  height: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            CustomTextField(
              focusNode: AuthController.to.firstNameFocusNode,
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 3) {
                  AuthController.to.errorName = null;

                } else {
                  if (value.isEmpty) {
                    AuthController.to.errorName!.value = 'Enter a name';
                  } else if (value.length < 3) {
                    AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                  }
                }
              },
              onSubmitted: (p0) {
                if (AuthController.to.firstNameController.text.isEmpty) {
                  AuthController.to.errorName!.value = 'Enter A name';
                } else if (AuthController.to.firstNameController.text.length < 3) {
                  AuthController.to.errorName!.value = 'Enter minimum 3 character of your name!';
                } else {
                  AuthController.to.firstNameFocusNode.unfocus();
                }
              },
              controller: AuthController.to.passwordConfirmController,
              hintText: 'confirm Password',
              isPassword: true,
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/password.png',
                  height: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            CustomButton(
              label: 'Sing Up',
              marginVertical: 20,
              onPressed: () {},
            ),
            CustomSizedBox.space16H,
          ],
        ),
      ),
    );
  }
}
