import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/profile/edit_password_page.dart';
import 'package:perfecto/pages/profile/edit_profile_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../home/widgets/home_top_widget.dart';

class MyProfileScreen extends StatelessWidget {
  static const String routeName = '/my_profile';
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
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
                    'My Profile',
                    style: AppTheme.textStyleSemiBoldBlack16,
                  ),
                  CustomSizedBox.space4W,
                ],
              ),
              isSearchInclude: false,
            ),
            CustomSizedBox.space12H,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor, width: .5), color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Personal Details',
                          style: AppTheme.textStyleSemiBoldBlack16,
                        ),
                        Spacer(),
                        CustomButton(
                          marginVertical: 0,
                          marginHorizontal: 0,
                          onPressed: () {
                            UserController.to.editController(UserController.to.userInfo.value);
                            Get.to(EditProfileScreen(
                              userModel: UserController.to.userInfo.value,
                            ));
                          },
                          primary: Colors.white,
                          borderColor: Colors.grey,
                          isBorder: true,
                          borderWidth: 1,
                          boxShadowColor: Colors.white,
                          elevation: 0,
                          prefixImage: AssetsConstant.edit,
                          prefixImageHeight: 18,
                          height: 40,
                          label: 'Edit',
                          labelColor: Colors.black,
                          width: 78,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.kborderColor,
                    thickness: 2,
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        CustomSizedBox.space4H,
                        Obx(() {
                          return Text(
                            UserController.to.userInfo.value.name ?? 'Anonymous User',
                            style: AppTheme.textStyleBoldBlack14,
                          );
                        }),
                        CustomSizedBox.space4H,
                        Divider(
                          color: AppColors.kborderColor,
                          thickness: 1,
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        CustomSizedBox.space4H,
                        Obx(() {
                          return Text(
                            UserController.to.userInfo.value.email ?? '-',
                            style: AppTheme.textStyleBoldBlack14,
                          );
                        }),
                        CustomSizedBox.space4H,
                        Divider(
                          color: AppColors.kborderColor,
                          thickness: 1,
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        CustomSizedBox.space4H,
                        Obx(() {
                          return Text(
                            UserController.to.userInfo.value.phone ?? '-',
                            style: AppTheme.textStyleBoldBlack14,
                          );
                        }),
                        CustomSizedBox.space4H,
                        Divider(
                          color: AppColors.kborderColor,
                          thickness: 1,
                          height: 1,
                        ),
                        CustomSizedBox.space12H
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomSizedBox.space12H,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor, width: .5), color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Password',
                          style: AppTheme.textStyleSemiBoldBlack16,
                        ),
                        Spacer(),
                        Obx(
                          () => CustomButton(
                            marginVertical: 0,
                            marginHorizontal: 0,
                            onPressed: () {
                              Get.toNamed(EditPasswordScreen.routeName);
                            },
                            primary: Colors.white,
                            borderColor: Colors.grey,
                            isBorder: true,
                            borderWidth: 1,
                            boxShadowColor: Colors.transparent,
                            elevation: 0,
                            height: 40,
                            label: UserController.to.userInfo.value.isGoogleLogin == '1' ? 'Set Password' : 'Change',
                            labelColor: Colors.black,
                            width: UserController.to.getUserInfo.isGoogleLogin == '1' ? 100 : 78,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => (UserController.to.userInfo.value.isGoogleLogin == '0')
                      ? Column(
                          children: [
                            Divider(
                              color: AppColors.kborderColor,
                              thickness: 2,
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '**************',
                                    style: AppTheme.textStyleBoldBlack14,
                                  ),
                                  CustomSizedBox.space4H,
                                  Divider(
                                    color: AppColors.kborderColor,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  CustomSizedBox.space12H
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
