import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MyPointsScreen extends StatelessWidget {
  static const String routeName = '/points';
  const MyPointsScreen({super.key});

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
                  'My Wallet',
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetsConstant.pointsBanner),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSizedBox.space12H,
                    CustomSizedBox.space12H,
                    Text(
                      'Your Redeemable Points',
                      style: AppTheme.textStyleSemiBoldWhite14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Image.asset(
                        AssetsConstant.pointsIcon,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '250 Points',
                      style: AppTheme.textStyleBoldWhite16,
                    ),
                    CustomSizedBox.space12H,
                    CustomSizedBox.space12H,
                  ],
                ),
              ),CustomSizedBox.space12H,
              OutlinedCustomContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to Earn Perfecto Reward Points',
                      style: AppTheme.textStyleSemiBoldBlack16,
                    ),
                    CustomSizedBox.space12H,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.klightAccentColor,
                          border: Border(
                              left: BorderSide(
                                  color: AppColors.kPrimaryColor, width: 4))),
                      padding: EdgeInsets.all(16),
                      child: RichText(
                        text: TextSpan(
                            text: 'More you buy, the more you earn: ',
                            style: AppTheme.textStyleSemiBoldBlack12,
                            children: [
                              TextSpan(
                                  text:
                                      'Earn 1 point for every 100 taka purchases.',
                                  style: AppTheme.textStyleNormalBlack12)
                            ]),
                      ),
                    ),
                    CustomSizedBox.space12H,
                  ],
                ),
              ),
              OutlinedCustomContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to Redeem Perfecto Reward Point?',
                      style: AppTheme.textStyleSemiBoldBlack16,
                    ),
                    CustomSizedBox.space12H,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.klightAccentColor,
                          border: Border(
                              left: BorderSide(
                                  color: AppColors.kPrimaryColor, width: 4))),
                      padding: EdgeInsets.all(16),
                      child: RichText(
                        text: TextSpan(
                            text: '',
                            style: AppTheme.textStyleSemiBoldBlack12,
                            children: [
                              TextSpan(
                                  text:
                                      'While buying products from Perfecto, you can use your available reward points by applying at checkout. ',
                                  style: AppTheme.textStyleNormalBlack12)
                            ]),
                      ),
                    ),
                    CustomSizedBox.space12H,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.kborderColor, width: 0.5),
                    borderRadius: BorderRadius.circular(6)),
                
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Reward Points History',style: AppTheme.textStyleSemiBoldFadeBlack14,),
                  ),
                  Divider(thickness: 2,color: AppColors.kborderColor,height: 2,),
                  CustomSizedBox.space12H,
               ...List.generate(3, (index) =>    OutlinedCustomContainer(widget: Column(children: [
                 Row(
                   children: [
                     Text('24 Nov, 2023, 03:23 PM',style: AppTheme.textStyleSemiBoldBlack12,),Spacer(),
                     Text('#635465 - EU',style: AppTheme.textStyleNormalFadeBlack14,)
                   ],
                 ),CustomSizedBox.space12H,Row(
                   children: [
                     RichText(
                       text: TextSpan(
                           text: index==1?'return:':'Purchase:',
                           style:AppTheme.textStyleNormalBlack12 ,
                           children: [
                             TextSpan(
                                 text:
                                 ' ৳ 550',
                                 style:AppTheme.textStyleSemiBoldBlack12 )
                           ]),
                     ),Spacer(),
                     Image.asset(AssetsConstant.pointsIcon,color: AppColors.kPrimaryColor,height: 16,),
                     CustomSizedBox.space8W,
                     Text('+55',style: index==1?TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.w600): AppTheme.textStyleSemiBoldPrimary14,)
                   ],
                 )
               ],),)),
                  CustomSizedBox.space12H
                ],),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class OutlinedCustomContainer extends StatelessWidget {
  final Widget widget;
  final double? padding;
  const OutlinedCustomContainer({
    super.key,
    required this.widget,  this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.kborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(6)),
      padding: EdgeInsets.all(padding??16),
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: widget,
    );
  }
}
