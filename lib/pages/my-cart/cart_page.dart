import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/my-cart/apply_cuppon_reward.dart';
import 'package:perfecto/pages/my-cart/cart_controller.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';
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
                  Text(
                    '(${UserController.to.cartList.length} Items)',
                    style: AppTheme.textStyleNormalFadeBlack12,
                  ),
                ],
              ),
              isSearchInclude: false,
            ),
            UserController.to.cartList.isNotEmpty
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
                              CartController.to.couponController.text = HomeApiController.to.couponCode.value;
                              Get.toNamed(ApplyCupponRewardScreen.routeName, arguments: 'coupon');
                            },
                            child: const CouponsWidget()),
                        GestureDetector(
                          onTap: () {
                            CartController.to.couponController.text = HomeApiController.to.rewardPointApply.value;
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
                                      '৳ ${UserController.to.cartTotalPrice().toStringAsFixed(2)}',
                                      style: AppTheme.textStyleMediumBlack12,
                                    ),
                                  ],
                                ),
                                CustomSizedBox.space8H,
                                // Row(
                                //   children: [
                                //     const Text(
                                //       'Discount',
                                //       style: AppTheme.textStyleMediumBlack10,
                                //     ),
                                //     const Spacer(),
                                //     Text(
                                //       '-৳ ${UserController.to.cartTotalDiscountPrice().toStringAsFixed(2)}',
                                //       style: AppTheme.textStyleMediumBlack12,
                                //     ),
                                //   ],
                                // ),
                                // CustomSizedBox.space8H,
                                if (UserController.to.upToDiscount.value.toDouble() > 0) ...[
                                  Row(
                                    children: [
                                      const Text(
                                        'Discount (Upto Sale Offer)',
                                        style: AppTheme.textStyleMediumBlack10,
                                      ),
                                      const Spacer(),
                                      Text(
                                        '-৳ ${UserController.to.upToDiscount.value.toDouble().toStringAsFixed(2)}',
                                        style: AppTheme.textStyleMediumBlack12,
                                      ),
                                    ],
                                  ),
                                  CustomSizedBox.space8H,
                                ],
                                if (HomeApiController.to.couponInfo.value.couponCode != null &&
                                    HomeApiController.to.couponInfo.value.couponCode!.isNotEmpty &&
                                    HomeApiController.to.couponInfo.value.minimumExpenses != null &&
                                    HomeApiController.to.couponInfo.value.minimumExpenses!.isNotEmpty &&
                                    (UserController.to.cartTotalPrice() /* - UserController.to.cartTotalDiscountPrice()*/) >=
                                        double.parse(HomeApiController.to.couponInfo.value.minimumExpenses!)) ...[
                                  Row(
                                    children: [
                                      Text(
                                        'Cupon',
                                        style: AppTheme.textStyleMediumBlack10,
                                      ),
                                      Spacer(),
                                      Text(
                                        '-৳ ${HomeApiController.to.couponInfo.value.amount!}',
                                        style: AppTheme.textStyleMediumBlack12,
                                      )
                                    ],
                                  ),
                                  CustomSizedBox.space8H,
                                ],
                                // if(HomeApiController.to.rewardPointInfo.value.rewardPointValue!=null && HomeApiController.to.rewardPointInfo.value.rewardPointValue!.isNotEmpty && UserController.to.cartTotalPrice() - UserController.to.cartTotalDiscountPrice()>=double.parse(HomeApiController.to.rewardPointInfo.value.rewardPointValue!)
                                if (HomeApiController.to.rewardPointApply.value != '0') ...[
                                  Row(
                                    children: [
                                      Text(
                                        'Reward Points Discount',
                                        style: AppTheme.textStyleMediumBlack10,
                                      ),
                                      Spacer(),
                                      Text(
                                        '-৳ ${UserController.to.rewardPointCalculation(HomeApiController.to.rewardPointInfo.value.rewardPointValue ?? '0', HomeApiController.to.rewardPointApply.value, HomeApiController.to.rewardPointInfo.value.rewardPoint ?? '0').toStringAsFixed(2)}',
                                        style: AppTheme.textStyleMediumBlack12,
                                      ),
                                    ],
                                  ),
                                  CustomSizedBox.space4H,
                                ],
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
                                      '৳ ${UserController.to.cartTotalPriceWithCouponAndReward().toStringAsFixed(2)}',
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
                              Get.back();
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
        bottomNavigationBar: UserController.to.cartList.isNotEmpty
            ? Container(
                margin: EdgeInsets.zero,
                height: 100,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 4)]),
                padding: const EdgeInsets.all(16),
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
                          '৳ ${UserController.to.cartTotalPriceWithCouponAndReward().toStringAsFixed(2)}',
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
                        try {
                          AddressController.to.setData();
                        } catch (e) {
                          globalLogger.e(e);
                        }
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
