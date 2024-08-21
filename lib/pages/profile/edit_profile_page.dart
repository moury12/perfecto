import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName ='/edit_profile';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.kBackgroundColor,
      body: Column(children: [
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
        ),CustomSizedBox.space12H,
        Expanded(child: ListView(padding: EdgeInsets.zero,
          children: [
            CheckoutWidget(
              title: 'Edit Personal Details',
              widget: Column(
                children: [
                  CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter your full name',
                    labelText: 'Full Name',
                    
                    focusColor: Colors.black,
                  ),

                  CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter your email',
                    labelText: 'Email Address',
                    focusColor: Colors.black,
                  ),
                 
                CustomButton(label: 'Save',onPressed: () {
                  
                },marginVertical: 12,),
CustomSizedBox.space12H,
                ],
              ),
            ),
          ],))
      ],),
    );
  }
}