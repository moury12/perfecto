import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/reg';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(AssetsConstant.backRoute,height: 20,),
        ),
      ),elevation: 0,backgroundColor: AppColors.kBackgroundColor,),
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
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                'assets/user_icon.png',color: Colors.grey,
                  height: 20,
                ),
              ),
            ),  CustomTextField(
              hintText: 'Last name',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                'assets/user_icon.png',color: Colors.grey,
                  height: 20,
                ),
              ),
            ),

            CustomSizedBox.space20H,

            Text(
              'Account Details',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),  CustomSizedBox.space20H,
            CustomTextField(
              hintText: 'Username of Email',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AssetsConstant.email,
                  height: 20,color: Colors.grey,
                ),
              ),
            ),
            CustomTextField(
              hintText: 'Password',
              isPassword: true,
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/password.png',
                  height: 20,color: Colors.grey,
                ),
              ),
            ),CustomTextField(
              hintText: 'confirm Password',
              isPassword: true,
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/password.png',
                  height: 20,color: Colors.grey,
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
