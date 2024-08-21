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

class EditPasswordScreen extends StatelessWidget {
  static const String routeName ='/edit_pass';
  const EditPasswordScreen({super.key});

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
                'My Orders',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              CustomSizedBox.space4W,

            ],
          ),
          isSearchInclude: false,
        ),
        Expanded(child: ListView(padding: EdgeInsets.zero,
          children: [
            CustomSizedBox.space12H,
            CheckoutWidget(
              title: 'Edit Password',
              widget: Column(
                children: [
                  CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter Old Password',
                    labelText: 'Old Password',

                    focusColor: Colors.black,
                  ),CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter New Password',
                    labelText: 'New Password',

                    focusColor: Colors.black,
                  ),

                  CustomTextField(
                    marginVertical: 6,
                    hintText: ' Confirm New Password',
                    labelText: 'Confirm New Password',
                    focusColor: Colors.black,
                  ),

                  CustomButton(label: 'Change Password',onPressed: () {

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