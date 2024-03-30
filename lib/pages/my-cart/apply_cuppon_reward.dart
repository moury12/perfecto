import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          CartController.to.couponController.text = '';
          return;
        }
        Get.back();
      },
      child: Scaffold(
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.24), blurRadius: 2)]),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data != 'coupon'
                            ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  'You have total ${UserController.to.getUserInfo.rewardPoints} reward points to redeem. ${HomeApiController.to.rewardPointInfo.value.rewardPoint} point value is ${HomeApiController.to.rewardPointInfo.value.rewardPointValue} BDT.',
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
                          hintText: data == 'coupon' ? 'Enter Coupon Code' : 'Enter redeemable points',
                          focusColor: AppColors.kPrimaryColor,
                          keyboardType: data == 'coupon' ? TextInputType.text : TextInputType.number,
                          marginVertical: 14,
                          onChanged: (value) {
                            if (data != 'coupon') {
                              if ((value.toInt() /
                                      HomeApiController.to.rewardPointInfo.value.rewardPoint!.toInt() *
                                      HomeApiController.to.rewardPointInfo.value.rewardPointValue!.toInt()) <=
                                  (UserController.to.cartTotalPrice() /*-
                                      UserController.to.cartTotalDiscountPrice() */
                                      -
                                      UserController.to.upToDiscount.value.toDouble() -
                                      (HomeApiController.to.couponInfo.value.amount ?? '0').toDouble())) {
                                CartController.to.couponController.text = value;
                              } else {
                                CartController.to.couponController.text =
                                    (((UserController.to.cartTotalPrice() /*-
                                                UserController.to.cartTotalDiscountPrice() */
                                                    -
                                                    UserController.to.upToDiscount.value.toDouble() -
                                                    (HomeApiController.to.couponInfo.value.amount ?? '0').toDouble()) /
                                                HomeApiController.to.rewardPointInfo.value.rewardPointValue!.toInt()) *
                                            HomeApiController.to.rewardPointInfo.value.rewardPoint!.toInt())
                                        .floor()
                                        .toStringAsFixed(0);
                                showSnackBar(
                                    msg:
                                        'You can not redeem more than ${(((UserController.to.cartTotalPrice() /*- UserController.to.cartTotalDiscountPrice()*/ - (HomeApiController.to.couponInfo.value.amount ?? '0').toDouble()) / HomeApiController.to.rewardPointInfo.value.rewardPointValue!.toInt()) * HomeApiController.to.rewardPointInfo.value.rewardPoint!.toInt())} points');
                              }
                            }
                          },
                        ),
                        CustomButton(
                          label: data == 'coupon' ? 'Apply Coupon Code' : 'Redeem Points',
                          onPressed: () {
                            if (data == 'coupon') {
                              if (CartController.to.couponController.text.isNotEmpty) {
                                HomeApiController.to.addCouponCode(CartController.to.couponController.text);
                              } else {
                                showSnackBar(msg: 'Please Enter coupon code!');
                              }
                            } else {
                              if (CartController.to.couponController.text.isNotEmpty) {
                                if (CartController.to.couponController.text.toInt() > UserController.to.getUserInfo.rewardPoints!.toInt()) {
                                  showSnackBar(msg: 'You have only ${UserController.to.getUserInfo.rewardPoints} reward points!');
                                  return;
                                }
                                HomeApiController.to.rewardPointApply(CartController.to.couponController.text);
                                Get.back();
                              } else {
                                showSnackBar(msg: 'Please Enter Reward Point!');
                              }
                            }
                          },
                          marginHorizontal: 0,
                          marginVertical: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
