import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import 'widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'My Bag',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              CustomSizedBox.space4W,
              Text(
                '(3 Items)',
                style: AppTheme.textStyleNormalFadeBlack12,
              )
            ],
          ),
          isSearchInclude: false,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => CartWidget(),
                itemCount: 3,
              ),
              CouponsWidget(),
              CouponsWidget(
                  img: AssetsConstant.rewardIcon,
                  title: 'Reward Points',
                  isRewardPoint: true,
                  subtitle: 'Apply now and save extra!'),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.24), blurRadius: 2)
                      ]),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary',
                        style: AppTheme.textStyleSemiBoldBlack16,
                      ),
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'Items Subtotal',
                                  style: AppTheme.textStyleMediumBlack12,
                                  children: [
                                TextSpan(
                                  text: ' (3 Items)',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500),
                                )
                              ])),
                          Spacer(),
                          Text(
                            '৳ 1,650',
                            style: AppTheme.textStyleMediumBlack12,
                          ),
                        ],
                      ),
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          Text(
                            'Discount',
                            style: AppTheme.textStyleMediumBlack10,
                          ),
                          Spacer(),
                          Text(
                            '-৳ 250',
                            style: AppTheme.textStyleMediumBlack12,
                          ),
                        ],
                      ),
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          Text(
                            'Shipping Fee',
                            style: AppTheme.textStyleMediumBlack10,
                          ),
                          Spacer(),
                          Text(
                            '৳ 1,650',
                            style: AppTheme.textStyleMediumBlack12,
                          )
                        ],
                      ),
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          Text(
                            'Reward Points Discount',
                            style: AppTheme.textStyleMediumBlack10,
                          ),
                          Spacer(),
                          Text(
                            '-৳ 50',
                            style: AppTheme.textStyleMediumBlack12,
                          ),
                        ],
                      ),
                      CustomSizedBox.space4H,
                      Divider(
                        color: Color(0xffECECEC),
                        thickness: 1,
                      ),
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          Text(
                            'Total',
                            style: AppTheme.textStyleSemiBoldBlack14,
                          ),
                          Spacer(),
                          Text(
                            '৳ 1,450',
                            style: AppTheme.textStyleSemiBoldBlack14,
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        )
      ]),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3))]),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Grand total',
                  style: AppTheme.textStyleMediumBlack12,
                ),
                Text(
                  '৳ 1,450',
                  style: AppTheme.textStyleBoldBlack20,
                )
              ],
            ),
            CustomButton(
              primary: AppColors.kPrimaryColor,
              marginHorizontal: 0,
              marginVertical: 0,
               width: 150,
               height: 50,
               onPressed: () {

               },
              label: 'Proceed',
              suffixImage: 'assets/arrow_right.png',
              suffixImageColor: Colors.white,
              suffixImageHeight:15 ,
            )
          ],
        ),
      ),
    );
  }
}
