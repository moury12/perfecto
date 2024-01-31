import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/checkout-page/checkout_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  const CheckoutScreen({super.key});

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
                  'Checkout',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
              ],
            ),
            isSearchInclude: false,
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomSizedBox.space8H,
              CheckoutWidget(
                widget: Column(
                  children: [
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter your full name',
                      labelText: 'Full Name',
                      isRequired: true,
                      focusColor: Colors.black,
                    ),
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter phone number',
                      labelText: 'Phone',
                      isRequired: true,
                      focusColor: Colors.black,
                    ),
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter your email',
                      labelText: 'Email (Optional)',
                      focusColor: Colors.black,
                    ),
                    TitleDropdown(
                      dwItems: ['Dhaka', 'Chittagong'],
                      dwValue: null,
                      onChange: () {},
                      fillColor: AppColors.kborderColor,
                      hintText: 'Select your district',
                      title: 'District / State',
                      rightIconBgColor: Colors.transparent,
                    ),
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter your city name',
                      labelText: 'City',
                      isRequired: true,
                      focusColor: Colors.black,
                    ),
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter your Address',
                      labelText: 'Address',
                      isRequired: true,
                      focusColor: Colors.black,
                    ),
                    CustomSizedBox.space8H,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 16),
                      child: Row(
                        children: [
                          Obx(() {
                            return GestureDetector(
                              onTap: () {
                                CheckOutController.to.checked.value = !CheckOutController.to.checked.value;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: CheckOutController.to.checked.value ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 0.5, color: CheckOutController.to.checked.value ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                                alignment: Alignment.center,
                                child: CheckOutController.to.checked.value
                                    ? Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            );
                          }),
                          CustomSizedBox.space8W,
                          Text(
                            'Save this information for next time',
                            style: AppTheme.textStyleMediumBlack12,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomSizedBox.space8H,
              CheckoutWidget(
                widget: Column(
                  children: [
                    CustomSizedBox.space8H,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                CheckOutController.to.checked2.value = !CheckOutController.to.checked2.value;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CheckOutController.to.checked2.value ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 1, color: CheckOutController.to.checked2.value ? AppColors.kPrimaryColor : Colors.black)),
                                alignment: Alignment.center,
                                child: CheckOutController.to.checked2.value
                                    ? Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                            CustomSizedBox.space12W,
                            Text(
                              'Inside Dhaka (Delivery charge: ৳ 60)',
                              style: CheckOutController.to.checked2.value ? AppTheme.textStyleSemiBoldBlack14 : AppTheme.textStyleNormalBlack14,
                            )
                          ],
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                CheckOutController.to.checked3.value = !CheckOutController.to.checked3.value;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CheckOutController.to.checked3.value ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 1, color: CheckOutController.to.checked3.value ? AppColors.kPrimaryColor : Colors.black)),
                                alignment: Alignment.center,
                                child: CheckOutController.to.checked3.value
                                    ? Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                            CustomSizedBox.space12W,
                            Text(
                              'Outside Dhaka (Delivery charge: ৳ 100)',
                              style: CheckOutController.to.checked3.value ? AppTheme.textStyleSemiBoldBlack14 : AppTheme.textStyleNormalBlack14,
                            )
                          ],
                        );
                      }),
                    ),
                    CustomSizedBox.space12H
                  ],
                ),
                title: 'Choose Shipping Method',
              ),
              CustomSizedBox.space8H,
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                  child: CustomTextField(
                    labelText: 'Order Notes (Optional)',
                    hintText: 'Enter order notes',
                    marginHorizontal: 16,
                    focusColor: Colors.black,
                    marginVertical: 12,
                  )),
              CustomSizedBox.space8H,
              CheckoutWidget(
                widget: Column(
                  children: [
                    CustomSizedBox.space8H,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                CheckOutController.to.checked2.value = !CheckOutController.to.checked2.value;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CheckOutController.to.checked2.value ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 1, color: CheckOutController.to.checked2.value ? AppColors.kPrimaryColor : Colors.black)),
                                alignment: Alignment.center,
                                child: CheckOutController.to.checked2.value
                                    ? Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                            CustomSizedBox.space12W,
                            Flexible(
                              child: Column(
                                children: [
                                  Text(
                                    'Online payment via SslCommerz',
                                    style: AppTheme.textStyleMediumBlack16,
                                  ),
                                  Text(
                                    'The largest payment gateway aggregator in Bangladesh and a pioneer in the FinTech industry since 2010',
                                    style: AppTheme.textStyleNormalBlack10,
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                CheckOutController.to.checked3.value = !CheckOutController.to.checked3.value;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CheckOutController.to.checked3.value ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 1, color: CheckOutController.to.checked3.value ? AppColors.kPrimaryColor : Colors.black)),
                                alignment: Alignment.center,
                                child: CheckOutController.to.checked3.value
                                    ? Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                            CustomSizedBox.space12W,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash on delivery (COD)',
                                  style: AppTheme.textStyleMediumBlack16,
                                ),
                                Text(
                                  'Pay with cash upon delivery',
                                  style: AppTheme.textStyleNormalBlack10,
                                )
                              ],
                            )
                          ],
                        );
                      }),
                    ),
                    CustomSizedBox.space12H
                  ],
                ),
                title: 'Choose Payment Method',
              ),
              CustomSizedBox.space8H,
              CheckoutWidget(
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ...List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Li...' * 2,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.textStyleMediumBlack14,
                                    ),
                                    CustomSizedBox.space8H,
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(text: 'Qty: ', style: AppTheme.textStyleNormalBlack14, children: [
                                            TextSpan(
                                              text: '1',
                                              style: AppTheme.textStyleBoldBlack14,
                                            )
                                          ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Container(
                                            color: Colors.black.withOpacity(.2),
                                            height: 15,
                                            width: 1,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(text: 'Size: ', style: AppTheme.textStyleNormalBlack14, children: [
                                            TextSpan(
                                              text: '3.4ml',
                                              style: AppTheme.textStyleBoldBlack14,
                                            )
                                          ]),
                                        ),
                                        Spacer(),
                                        Text(
                                          '৳ 1,450',
                                          style: AppTheme.textStyleBoldBlack14,
                                        )
                                      ],
                                    ),
                                    CustomSizedBox.space12H,
                                    Divider(
                                      color: AppColors.kborderColor,
                                      thickness: 2,
                                      height: 2,
                                    ),
                                  ],
                                ),
                              )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                        child: Row(
                          children: [
                            Text(
                              'Items Subtotal',
                              style: AppTheme.textStyleMediumBlack14,
                            ),
                            Spacer(),
                            Text(
                              '৳ 1,450',
                              style: AppTheme.textStyleMediumBlack14,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                        child: Row(
                          children: [
                            Text(
                              'Shipping Fee',
                              style: AppTheme.textStyleMediumBlack14,
                            ),
                            Spacer(),
                            Text(
                              '৳ 1,450',
                              style: AppTheme.textStyleMediumBlack14,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: AppColors.kborderColor,
                          thickness: 2,
                          height: 2,
                        ),
                      ),
                      CustomSizedBox.space8H,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                        child: Row(
                          children: [
                            Text(
                              'Grand Total',
                              style: AppTheme.textStyleSemiBoldBlack16,
                            ),
                            Spacer(),
                            Text(
                              '৳ 1,450',
                              style: AppTheme.textStyleSemiBoldBlack16,
                            )
                          ],
                        ),
                      ),
                      CustomSizedBox.space8H,
                    ],
                  ),
                ),
                title: 'Your Order Summary',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  children: [
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          CheckOutController.to.checked.value = !CheckOutController.to.checked.value;
                        },
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: CheckOutController.to.checked.value ? AppColors.kPrimaryColor : Colors.white,
                              border: Border.all(width: 0.5, color: CheckOutController.to.checked.value ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                          alignment: Alignment.center,
                          child: CheckOutController.to.checked.value
                              ? Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 15,
                                )
                              : SizedBox.shrink(),
                        ),
                      );
                    }),
                    CustomSizedBox.space8W,
                    RichText(
                      text: TextSpan(text: 'I’ve read and accept the ', style: AppTheme.textStyleNormalBlack12, children: [
                        TextSpan(
                          text: 'T&Cs ',
                          style: AppTheme.textStyleBoldBlack12,
                        ),
                        TextSpan(
                          text: 'and ',
                          style: AppTheme.textStyleNormalBlack12,
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTheme.textStyleBoldBlack12,
                        ),
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 4)]),
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
              width: 200,
              height: 50,
              onPressed: () {
                // CartController.to.isbagEmpty.value=true;
                Get.toNamed(CheckoutScreen.routeName);
              },
              label: 'Place Order',
            )
          ],
        ),
      ),
    );
  }
}

class CheckoutWidget extends StatelessWidget {
  final String? title;
  final Widget widget;
  const CheckoutWidget({
    super.key,
    this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title ?? 'Shipping Information',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          Divider(
            color: AppColors.kborderColor,
            thickness: 2,
            height: 2,
          ),
          widget
        ],
      ),
    );
  }
}
