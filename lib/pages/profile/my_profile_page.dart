import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../home/widgets/home_top_widget.dart';

class MyProfileScreen extends StatelessWidget {
  static const String routeName='/my_profile';
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: AppColors.kBackgroundColor,
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
        ),
        CustomSizedBox.space12H,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
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
                    Spacer(),CustomButton(marginVertical: 0, marginHorizontal: 0,onPressed: () {

                    },
                      primary: Colors.transparent,
                      borderColor: Colors.grey, isBorder: true,borderWidth: 1,boxShadowColor: Colors.transparent,elevation: 0,prefixImage: AssetsConstant.edit,prefixImageHeight: 18,height: 40,
                      label: 'Edit',labelColor: Colors.black,width: 78,)
                  ],
                ),
              ),
              Divider(
                color: AppColors.kborderColor,
                thickness: 2,
                height: 2,
              ),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Full Name',style: AppTheme.textStyleSemiBoldFadeBlack14,),
      CustomSizedBox.space4H,
      Text('User3444',style: AppTheme.textStyleBoldBlack14,),
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
  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Email Address',style: AppTheme.textStyleSemiBoldFadeBlack14,),
      CustomSizedBox.space4H,
      Text('sohanahmed@gmail.com',style: AppTheme.textStyleBoldBlack14,),
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
  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Phone Number',style: AppTheme.textStyleSemiBoldFadeBlack14,),
      CustomSizedBox.space4H,
      Text('+880 1434521465',style: AppTheme.textStyleBoldBlack14,),
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
        ), CustomSizedBox.space12H,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
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
                    Spacer(),CustomButton(marginVertical: 0, marginHorizontal: 0,onPressed: () {

                    },
                      primary: Colors.transparent,
                      borderColor: Colors.grey, isBorder: true,borderWidth: 1,boxShadowColor: Colors.transparent,elevation: 0,height: 40,
                      label: 'Change',labelColor: Colors.black,width: 78,)
                  ],
                ),
              ),
              Divider(
                color: AppColors.kborderColor,
                thickness: 2,
                height: 2,
              ),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text('**************',style: AppTheme.textStyleBoldBlack14,),
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
      ],),
    );
  }
}
