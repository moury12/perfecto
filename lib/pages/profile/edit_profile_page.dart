import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/user_model.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = '/edit_profile';
  final UserModel? userModel;
  const EditProfileScreen({super.key, this.userModel});

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
                const Text(
                  'My Profile',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space4W,
              ],
            ),
            isSearchInclude: false,
          ),
          CustomSizedBox.space12H,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Obx(() {
              return GestureDetector(
                onTap: () {
                  if (UserController.to.pickedImagePath.value.isEmpty) {
                    UserController.to.pickImage();
                  } else {}
                },
                child: UserController.to.pickedImagePath.value.isNotEmpty
                    ? ClipOval(
                        child: Image.file(
                          File(UserController.to.pickedImagePath.value),
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : CustomNetworkImage(
                        height: 120,
                        width: 120,
                        networkImagePath: UserController.to.image.value,
                        errorImagePath: 'assets/dummy_profile.png',
                      ),
              );
            }),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CheckoutWidget(
                title: 'Edit Personal Details',
                widget: Obx(() {
                  return Column(
                    children: [
                      CustomTextField(
                        marginVertical: 6,
                        hintText: 'Enter your full name',
                        labelText: 'Full Name',
                        focusNode: UserController.to.nameFocusNode,
                        controller: UserController.to.nameController,
                        errorMessage: UserController.to.errorName.value!.isEmpty ? null : UserController.to.errorName.value,
                        focusColor: Colors.black,
                      ),
                      CustomTextField(
                        isEnable: userModel!.email == null || userModel!.email!.isEmpty,
                        marginVertical: 6,
                        hintText: 'Enter your email',
                        labelText: 'Email Address',
                        focusNode: UserController.to.emailFocusNode,
                        controller: UserController.to.emailController,
                        errorMessage: UserController.to.errorEmail.value!.isEmpty ? null : UserController.to.errorEmail.value,
                        focusColor: Colors.black,
                      ),
                      CustomTextField(
                        isEnable: userModel!.phone == null || userModel!.phone!.isEmpty,
                        marginVertical: 6,
                        hintText: 'Enter your phone',
                        labelText: 'Phone Number',
                        focusNode: UserController.to.phoneFocusNode,
                        controller: UserController.to.phoneController,
                        errorMessage: UserController.to.errorPhone.value!.isEmpty ? null : UserController.to.errorPhone.value,
                        focusColor: Colors.black,
                      ),
                      CustomButton(
                        label: 'Save',
                        onPressed: () {
                          if (UserController.to.nameController.text.isNotEmpty &&
                              UserController.to.emailController.text.isNotEmpty &&
                              UserController.to.phoneController.text.isNotEmpty &&
                              UserController.to.phoneController.text.isPhoneNumber) {
                            UserController.to.updateUser(UserController.to.nameController.text, UserController.to.emailController.text, UserController.to.phoneController.text);
                          } else {
                            if (UserController.to.nameController.text.isEmpty) {
                              UserController.to.errorName.value = 'Name is Required';
                            }
                            if (UserController.to.emailController.text.isEmpty) {
                              UserController.to.errorEmail.value = 'Email is Required';
                            }
                            if (UserController.to.phoneController.text.isEmpty) {
                              UserController.to.errorPhone.value = 'Phone is Required';
                            }
                            if (!UserController.to.phoneController.text.isPhoneNumber) {
                              UserController.to.errorPhone.value = 'provide valid phone number';
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
