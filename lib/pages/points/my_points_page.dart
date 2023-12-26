import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MyPointsScreen extends StatelessWidget {
  static const String routeName='/points';
  const MyPointsScreen({super.key});

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
              'My Wallet',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
            CustomSizedBox.space4W,

          ],
        ),
        isSearchInclude: false,
      ),
      Expanded(child: ListView(children: [
       Container(width: double.infinity,
         decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.pointsBanner),fit: BoxFit.fitWidth,alignment: Alignment.topCenter)),child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
Text('Your Redeemable Points',style: AppTheme.textStyleSemiBoldWhite14,),
Text('Your Redeemable Points',style: AppTheme.textStyleSemiBoldWhite14,),
Text('Your Redeemable Points',style: AppTheme.textStyleSemiBoldWhite14,),
         ],
       ),)
      ],))
    ],),);
  }
}
