import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/my-cart/cart_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';

import '../../theme/theme_data.dart';
import '../home/widgets/home_top_widget.dart';

class ApplyCupponRewardScreen extends StatelessWidget {
  static const String routeName = '/cuppon_page';
  const ApplyCupponRewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
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
                  data == 'coupon' ? 'Apply Coupons' : 'Reward Points',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space4W,
              ],
            ),
            isSearchInclude: false,
          ),
          CustomSizedBox.space16H,
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.24),
                              blurRadius: 2)
                        ]),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data != 'coupon'
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  'You have total 500 reward points to redeem',
                                  style: AppTheme.textStyleSemiBoldBlack14,
                                ),
                              )
                            : SizedBox.shrink(),
                        Text(
                          data == 'coupon' ? 'Coupon Code' : 'Reward Points',
                          style: AppTheme.textStyleSemiBoldBlack14,
                        ),
                        CustomTextField(
                          controller: CartController.to.couponController,
                          marginHorizontal: 0,
                          hintText: data == 'coupon'
                              ? 'Enter Coupon Code'
                              : 'Enter redeemable points',
                          focusColor: AppColors.kPrimaryColor,
                          marginVertical: 14,
                        ),
                        CustomButton(
                          label: data == 'coupon'
                              ? 'Apply Coupon Code'
                              : 'Redeem Points',
                          onPressed: () {},
                          marginHorizontal: 0,
                          marginVertical: 12,
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
