import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
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
        child: Obx(() {
          return Column(
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
                errorMessage: AuthController.to.errorName.value!.isEmpty ? null : AuthController.to.errorName.value,
                controller: AuthController.to.firstNameController,
                enableBorderColor: AppColors.kPrimaryColor,
                focusNode: AuthController.to.firstNameFocusNode,
                onChanged: (value) {
                  if (value.isNotEmpty && value.length >= 3) {
                    AuthController.to.errorName.value = '';
                  } else {
                    if (value.isEmpty) {
                      AuthController.to.errorName.value = 'Enter a name';
                    } else if (value.length < 3) {
                      AuthController.to.errorName.value = 'Enter minimum 3 character of your name!';
                    }
                  }
                },
                onSubmitted: (p0) {
                  if (AuthController.to.firstNameController.text.isEmpty) {
                    AuthController.to.errorName.value = 'Enter A name';
                  } else if (AuthController.to.firstNameController.text.length < 3) {
                    AuthController.to.errorName.value = 'Enter minimum 3 character of your name!';
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
                errorMessage: AuthController.to.errorEmail.value!.isEmpty ? null : AuthController.to.errorEmail.value,
                focusNode: AuthController.to.emailFocusNode,
                onChanged: (value) {
                  if (value.isNotEmpty && value.isEmail) {
                    AuthController.to.errorEmail.value = '';
                  } else {
                    if (value.isEmpty) {
                      AuthController.to.errorEmail.value = 'Enter a email address';
                    } else if (!value.isEmail) {
                      AuthController.to.errorEmail.value = 'Enter a valid email address!';
                    }
                  }
                },
                onSubmitted: (p0) {
                  if (AuthController.to.emailController.text.isEmpty) {
                    AuthController.to.errorEmail.value = 'Enter an email address';
                  } else if (!AuthController.to.emailController.text.isEmail) {
                    AuthController.to.errorEmail.value = 'Enter a valid email address!';
                  } else {
                    AuthController.to.emailFocusNode.unfocus();
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
                focusNode: AuthController.to.phoneFocusNode,
                errorMessage: AuthController.to.errorPhone.value!.isEmpty ? null : AuthController.to.errorPhone.value,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (value.isNotEmpty && value.isPhoneNumber) {
                    AuthController.to.errorPhone.value = '';
                  } else {
                    if (value.isEmpty) {
                      AuthController.to.errorPhone.value = 'Enter a phone number';
                    } else if (value.length < 3) {
                      AuthController.to.errorPhone.value = 'Enter a valid phone number!';
                    }
                  }
                },
                onSubmitted: (p0) {
                  if (AuthController.to.phoneController.text.isEmpty) {
                    AuthController.to.errorPhone.value = 'Enter A phone number';
                  } else if (!AuthController.to.phoneController.text.isPhoneNumber) {
                    AuthController.to.errorPhone.value = 'Enter a valid phone number!';
                  } else {
                    AuthController.to.phoneFocusNode.unfocus();
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
                errorMessage: AuthController.to.errorPassword.value!.isEmpty ? null : AuthController.to.errorPassword.value,
                focusNode: AuthController.to.passwordFocusNode,
                onChanged: (value) {
                  if (value.isNotEmpty && value.length >= 8) {
                    AuthController.to.errorPassword.value = '';
                  } else {
                    if (value.isEmpty) {
                      AuthController.to.errorPassword.value = 'Enter a Password';
                    } else if (value.length < 8) {
                      AuthController.to.errorPassword.value = 'Enter 8 Character Password!';
                    }
                  }
                },
                onSubmitted: (p0) {
                  if (AuthController.to.passwordController.text.isEmpty) {
                    AuthController.to.errorPassword.value = 'Enter a Password';
                  } else if (AuthController.to.passwordController.text.length < 8) {
                    AuthController.to.errorPassword.value = 'Enter 8 Character Password!';
                  } else {
                    AuthController.to.passwordFocusNode.unfocus();
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
                focusNode: AuthController.to.confirmPasswordFocusNode,
                errorMessage: AuthController.to.errorREPassword.value!.isEmpty ? null : AuthController.to.errorREPassword.value,
                onChanged: (value) {
                  if (value.isNotEmpty && value.length >= 8 && AuthController.to.passwordController.text == value) {
                    AuthController.to.errorREPassword.value = '';
                  } else {
                    if (value.isEmpty) {
                      AuthController.to.errorREPassword.value = 'Enter a Password';
                    } else if (AuthController.to.passwordController.text != value) {
                      AuthController.to.errorREPassword.value = 'Passwords did not match!';
                    }
                  }
                },
                onSubmitted: (p0) {
                  if (AuthController.to.passwordConfirmController.text.isEmpty) {
                    AuthController.to.errorREPassword.value = 'Enter a Password';
                  } else if (AuthController.to.passwordConfirmController.text != AuthController.to.passwordController.text) {
                    AuthController.to.errorREPassword.value = 'Passwords did not match!';
                  } else {
                    AuthController.to.confirmPasswordFocusNode.unfocus();
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
                onPressed: () async {
                  if (AuthController.to.firstNameController.text.isNotEmpty &&
                      AuthController.to.phoneController.text.isNotEmpty &&
                      AuthController.to.emailController.text.isNotEmpty &&
                      AuthController.to.passwordConfirmController.text.isNotEmpty &&
                      AuthController.to.passwordController.text.isNotEmpty &&
                      AuthController.to.passwordConfirmController.text == AuthController.to.passwordController.text &&
                      AuthController.to.passwordController.text.length >= 8 &&
                      AuthController.to.firstNameController.text.length >= 3) {
                    final isCreated = await AuthController.to.registerRequest(
                        AuthController.to.firstNameController.text,
                        AuthController.to.lastNameController.text,
                        AuthController.to.emailController.text,
                        AuthController.to.phoneController.text,
                        AuthController.to.passwordController.text,
                        AuthController.to.passwordConfirmController.text);
                    if (isCreated) {
                      showSnackBar(msg: 'User register successfully.');
                      AuthController.to.firstNameController.text = '';
                      AuthController.to.lastNameController.text = '';
                      AuthController.to.emailController.text = '';
                      AuthController.to.phoneController.text = '';
                      AuthController.to.passwordController.text = '';
                      AuthController.to.passwordConfirmController.text = '';
                    }
                  } else {
                    if (AuthController.to.firstNameController.text.isEmpty) {
                      AuthController.to.errorName.value = 'Enter A name';
                    }
                    if (!AuthController.to.emailController.text.isEmail) {
                      AuthController.to.errorEmail.value = 'Enter a valid email address!';
                    }
                    if (AuthController.to.firstNameController.text.length < 3) {
                      AuthController.to.errorName.value = 'Enter minimum 3 character of your name!';
                    }
                    if (AuthController.to.emailController.text.isEmpty) {
                      AuthController.to.errorEmail.value = 'Enter an email address';
                    }
                    /* if (AuthController.to.emailController.text.isEmail) {
                      AuthController.to.errorEmail.value =
                      'Enter a valid email address!';
                    }*/
                    if (AuthController.to.phoneController.text.isEmpty) {
                      AuthController.to.errorPhone.value = 'Enter A Phone number';
                    }
                    if (AuthController.to.phoneController.text.length < 3) {
                      AuthController.to.errorPhone.value = 'Enter a valid phone number!';
                    }
                    if (AuthController.to.passwordController.text.isEmpty) {
                      AuthController.to.errorPassword.value = 'Enter a Password';
                    }
                    if (AuthController.to.passwordController.text.length < 8) {
                      AuthController.to.errorPassword.value = 'Enter 8 Character Password!';
                    }
                    if (AuthController.to.passwordConfirmController.text.isEmpty) {
                      AuthController.to.errorREPassword.value = 'Enter a Confirm Password';
                    }
                    if (AuthController.to.passwordConfirmController.text != AuthController.to.passwordController.text) {
                      AuthController.to.errorREPassword.value = 'Passwords did not match!';
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
