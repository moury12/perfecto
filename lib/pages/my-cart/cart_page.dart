import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/my-cart/apply_cuppon_reward.dart';
import 'package:perfecto/pages/my-cart/cart_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import 'widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        body: Column(
          children: [
            HomeTopWidget(
              isCartPage: true,
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
                  const Text(
                    'My Bag',
                    style: AppTheme.textStyleSemiBoldBlack16,
                  ),
                  CustomSizedBox.space4W,
                  Obx(() {
                    return Text(
                      '(${UserController.to.cartList.length} Items)',
                      style: AppTheme.textStyleNormalFadeBlack12,
                    );
                  })
                ],
              ),
              isSearchInclude: false,
            ),
            !CartController.to.isbagEmpty.value
                ? Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            final cartModel = UserController.to.cartList[index];
                            return CartWidget(
                              cartModel: UserController.to.cartList[index],
                            );
                          },
                          itemCount: UserController.to.cartList.length,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(ApplyCupponRewardScreen.routeName, arguments: 'coupon');
                            },
                            child: const CouponsWidget()),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(ApplyCupponRewardScreen.routeName);
                          },
                          child: const CouponsWidget(img: AssetsConstant.rewardIcon, title: 'Reward Points', isRewardPoint: true, subtitle: 'Apply now and save extra!'),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.24), blurRadius: 2)]),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Order Summary',
                                  style: AppTheme.textStyleSemiBoldBlack16,
                                ),
                                CustomSizedBox.space8H,
                                Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(text: 'Items Subtotal', style: AppTheme.textStyleMediumBlack12, children: [
                                      TextSpan(
                                        text: ' (${UserController.to.cartList.length} Items)',
                                        style: const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w500),
                                      )
                                    ])),
                                    const Spacer(),
                                    Text(
                                      '৳ ${UserController.to.cartTotalPrice()}',
                                      style: AppTheme.textStyleMediumBlack12,
                                    ),
                                  ],
                                ),
                                CustomSizedBox.space8H,
                                Row(
                                  children: [
                                    const Text(
                                      'Discount',
                                      style: AppTheme.textStyleMediumBlack10,
                                    ),
                                    const Spacer(),
                                    Text(
                                      '-৳ ${UserController.to.cartTotalDiscountPrice()}',
                                      style: AppTheme.textStyleMediumBlack12,
                                    ),
                                  ],
                                ),
                                CustomSizedBox.space8H,
                                const Row(
                                  children: [
                                    Text(
                                      'Cupon',
                                      style: AppTheme.textStyleMediumBlack10,
                                    ),
                                    Spacer(),
                                    Text(
                                      '-৳ 1,650',
                                      style: AppTheme.textStyleMediumBlack12,
                                    )
                                  ],
                                ),
                                CustomSizedBox.space8H,
                                const Row(
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
                                const Divider(
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
                                    const Spacer(),
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
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(),
                          Image.asset(AssetsConstant.emptyBag, height: 215),
                          CustomSizedBox.space20H,
                          const Text(
                            'Your Shopping Bag is Empty',
                            style: AppTheme.textStyleSemiBoldBlack20,
                            textAlign: TextAlign.center,
                          ),
                          CustomSizedBox.space20H,
                          const Text(
                            'Looks like you haven’t made your choice yet, add all your favourite products',
                            style: AppTheme.textStyleNormalBlack14,
                            textAlign: TextAlign.center,
                          ),
                          CustomButton(
                            label: 'Start Shopping',
                            marginHorizontal: 0,
                            marginVertical: 20,
                            onPressed: () {
                              // Your button's onPressed logic here
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
            // CustomSizedBox.space8H,
          ],
        ),
        bottomNavigationBar: !CartController.to.isbagEmpty.value
            ? Container(
                margin: EdgeInsets.zero,
                height: 100,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 4)]),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
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
                        // CartController.to.isbagEmpty.value=true;
                        Get.toNamed(CheckoutScreen.routeName);
                      },
                      label: 'Proceed',
                      suffixImage: 'assets/arrow_right.png',
                      suffixImageColor: Colors.white,
                      suffixImageHeight: 15,
                    )
                  ],
                ),
              )
            : const SizedBox.shrink(),
      );
    });
  }
}
