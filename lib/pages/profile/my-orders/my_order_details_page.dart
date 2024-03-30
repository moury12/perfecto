import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/return_page.dart';
import 'package:perfecto/pages/profile/my-orders/widgets/order_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  static const String routeName = '/order_details';
  const MyOrderDetailsScreen({super.key});

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
                const Text(
                  'My Orders',
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
              CustomSizedBox.space12H,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor, width: 0.5), color: Colors.white, borderRadius: BorderRadius.circular(4)),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Number',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                                Text(
                                  '#${UserController.to.orderDetails.value.orderNo}',
                                  style: AppTheme.textStyleSemiBoldBlack16,
                                )
                              ],
                            ),
                            const Spacer(),
                            UserController.to.orderDetails.value.status == '5'
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetsConstant.verified,
                                        height: 25,
                                      ),
                                      CustomSizedBox.space8W,
                                      const Text(
                                        'Order Cancelled',
                                        style: AppTheme.textStyleNormalBlack12,
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  )
                                : UserController.to.orderDetails.value.status == '4' || UserController.to.orderDetails.value.status == '1'
                                    ? CustomButton(
                                        onPressed: UserController.to.orderDetails.value.status == '4'
                                            ? () {
                                                Get.toNamed(ReturnScreen.routeName);
                                              }
                                            : () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => const CancelOrderDialogWidget(),
                                                );
                                              },
                                        label: UserController.to.orderDetails.value.status == '4'
                                            ? 'Make a return'
                                            : UserController.to.orderDetails.value.status == '1'
                                                ? 'Cancel '
                                                    'Order'
                                                : "",
                                        width: MediaQuery.of(context).size.width / 3.5,
                                        marginHorizontal: 8,
                                        marginVertical: 0,
                                        primary: Colors.white,
                                        borderColor: Colors.black.withOpacity(.8),
                                        isBorder: true,
                                        elevation: 0,
                                        labelColor: Colors.black.withOpacity(.8),
                                      )
                                    : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.kborderColor,
                        thickness: 2,
                        height: 2,
                      ),
                      StepProcessWidget(
                          currentStep: UserController.to.orderDetails.value.status!,
                          processList: UserController.to.orderDetails.value.status == '5' ? ProfileController.to.cancelProcesses : ProfileController.to.processes),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomDividerWidget(),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Address',
                                  style: AppTheme.textStyleSemiBoldBlack14,
                                ),
                                CustomSizedBox.space4H,
                                Text(
                                  'City: ${UserController.to.orderDetails.value.shipping!.cityName}',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                                CustomSizedBox.space4H,
                                Text(
                                  'Zone: ${UserController.to.orderDetails.value.shipping!.zoneName}',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                                CustomSizedBox.space4H,
                                Text(
                                  'Area: ${UserController.to.orderDetails.value.shipping!.areaName}',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                                CustomSizedBox.space4H,
                                Text(
                                  'Address: ${UserController.to.orderDetails.value.shipping!.address}',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                              ],
                            ),
                          ),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       ProfileController.to.markStepAsCompleted(ProfileController.to.currentStep.value);
                          //     },
                          //     child: const Text('step'))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomDividerWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Method',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                            CustomSizedBox.space4H,
                            Text(
                              UserController.to.orderDetails.value.paymentMethod == "COD" ? "COD" : 'Online payment via SslCommerz',
                              // 'Online payment via SslCommerz',
                              style: AppTheme.textStyleMediumCustomBlack12,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomDividerWidget(),
                      ),
                      CustomSizedBox.space8H,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            ...List.generate(
                                UserController.to.orderDetails.value.orderDetails!.length,
                                (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ProductDetailsWidget(
                                      orderDetails: UserController.to.orderDetails.value.orderDetails![index],
                                    ))),
                            CustomSizedBox.space12H
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              'Items Subtotal',
                              style: AppTheme.textStyleSemiBoldFadeBlack14,
                            ),
                            const Spacer(),
                            Text(
                              '৳ ${(UserController.to.orderDetails.value.subTotal!.toDouble() - UserController.to.orderDetails.value.totalDiscountAmount!.toDouble()).toStringAsFixed(2)}',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            )
                          ],
                        ),
                      ),
                      // if (UserController.to.orderDetails.value.totalDiscountAmount!.toDouble() > 0)
                      //   Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           'Discount',
                      //           style: AppTheme.textStyleSemiBoldFadeBlack14,
                      //         ),
                      //         const Spacer(),
                      //         Text(
                      //           '-৳ ${UserController.to.orderDetails.value.totalDiscountAmount}',
                      //           style: AppTheme.textStyleSemiBoldBlack14,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      if (UserController.to.orderDetails.value.totalOfferDiscountAmount!.toDouble() > 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                'Discount (Upto offer)',
                                style: AppTheme.textStyleSemiBoldFadeBlack14,
                              ),
                              const Spacer(),
                              Text(
                                '-৳ ${UserController.to.orderDetails.value.totalOfferDiscountAmount}',
                                style: AppTheme.textStyleSemiBoldBlack14,
                              )
                            ],
                          ),
                        ),
                      if (UserController.to.orderDetails.value.couponDiscount!.toDouble() > 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                'Coupon Discount',
                                style: AppTheme.textStyleSemiBoldFadeBlack14,
                              ),
                              const Spacer(),
                              Text(
                                '-৳ ${UserController.to.orderDetails.value.couponDiscount}',
                                style: AppTheme.textStyleSemiBoldBlack14,
                              )
                            ],
                          ),
                        ),
                      if (UserController.to.orderDetails.value.rewardDiscountAmount!.toDouble() > 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'Reward Points Discount',
                                style: AppTheme.textStyleSemiBoldFadeBlack14,
                              ),
                              const Spacer(),
                              Text(
                                '-৳ ${UserController.to.orderDetails.value.rewardDiscountAmount}',
                                style: AppTheme.textStyleSemiBoldBlack14,
                              )
                            ],
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              'Shipping Fee',
                              style: AppTheme.textStyleSemiBoldFadeBlack14,
                            ),
                            const Spacer(),
                            Text(
                              '৳ ${UserController.to.orderDetails.value.deliveryCharge}',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            )
                          ],
                        ),
                      ),
                      CustomSizedBox.space8H,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomDividerWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        child: Row(
                          children: [
                            Text(
                              'Grand Total',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                            const Spacer(),
                            Text(
                              '৳ ${UserController.to.orderDetails.value.grandTotal!.toDouble().toStringAsFixed(2)}',
                              style: AppTheme.textStyleBoldBlack14,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
              CustomSizedBox.space12H,
            ],
          ))
        ],
      ),
    );
  }
}

class StepProcessWidget extends StatelessWidget {
  final List processList;
  final String currentStep;
  const StepProcessWidget({
    super.key,
    required this.processList,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        children: [
          ...List.generate(processList.length, (index) {
            final process = processList[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: index < currentStep.toInt()
                          ? Colors.black
                          : process.name == currentStep
                              ? AppColors.kPrimaryColor
                              : const Color(0xffCBD5E1),
                    ),
                    index != processList.length - 1
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 57,
                              width: 3,
                              color: index < currentStep.toInt() - 1
                                  ? Colors.black
                                  : process.name == currentStep && !ProfileController.to.isCancel.value
                                      ? AppColors.kPrimaryColor
                                      : const Color(0xffCBD5E1),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                CustomSizedBox.space12W,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentStep == '3' && process.topic == 'Estimated Delivery'
                          ? 'Delivery'
                          : currentStep == '4' && process.topic == 'Estimated Delivery'
                              ? 'Delivered'
                              : process.topic,
                      style: AppTheme.textStyleNormalFadeBlack14,
                    ),
                    (process.topic == 'Ordered' || (process.topic == 'Estimated Delivery' && currentStep != '4') || process.topic == 'Return Started')
                        ? Text(
                            DateFormat('dd MMM, yyyy').format(DateTime.parse(UserController.to.orderDetails.value.createdAt!).add(Duration(days: process.name == '1' ? 0 : 2))),
                            style: AppTheme.textStyleNormalFadeBlack14,
                          )
                        : const SizedBox.shrink(),
                    (process.name == '5' || (process.name == '4' && currentStep == '4'))
                        ? Text(
                            DateFormat('dd MMM, yyyy').format(DateTime.parse(UserController.to.orderDetails.value.updatedAt!)),
                            style: AppTheme.textStyleNormalFadeBlack14,
                          )
                        : const SizedBox.shrink(),
                  ],
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}

class CancelOrderDialogWidget extends StatelessWidget {
  const CancelOrderDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox.space8H,
              Text(
                'Order Number',
                style: AppTheme.textStyleMediumCustomBlack12,
              ),
              Text(
                '#${UserController.to.orderDetails.value.orderNo}',
                style: AppTheme.textStyleSemiBoldBlack16,
              )
            ],
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(CupertinoIcons.multiply)),
        ],
      ),
      actionsPadding: EdgeInsets.zero,
      titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      contentPadding: const EdgeInsets.symmetric(vertical: 12).copyWith(top: 0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1.5,
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order cancel request',
                  style: AppTheme.textStyleSemiBoldBlack14,
                ),
                CustomSizedBox.space4H,
                const Text(
                  'We do our best to honor cancellation requests. We’ll send an email to let you know if your order’s been cancelled.',
                  style: AppTheme.textStyleMediumCustomBlack12,
                ),
                Text(
                  'Reason for cancellation',
                  style: AppTheme.textStyleSemiBoldBlack14,
                ),
                CustomSizedBox.space4H,
                const CustomTextField(
                  marginVertical: 8,
                  hintText: 'Select reason',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                  marginHorizontal: 0,
                ),
                CustomSizedBox.space8H,
                CustomButton(
                  label: 'Confirm',
                  marginVertical: 0,
                  marginHorizontal: 0,
                  onPressed: () {
                    // if (ProfileController.to.currentStep.value == 1) {
                    //   ProfileController.to.processes.insert(2, Process(name: '3', isComplete: false, topic: 'Cancellation Requested'));
                    //   ProfileController.to.isCancel.value = true;
                    //   ProfileController.to.processes[1].isComplete = true;
                    //   ProfileController.to.currentStep.value = 2;
                    // }

                    UserController.to.cancelOrder(UserController.to.orderDetails.value.id!);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Process {
  String name;
  String topic;
  bool isComplete;

  Process({required this.name, required this.isComplete, required this.topic});
}
