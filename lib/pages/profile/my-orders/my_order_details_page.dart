import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/return_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../drawer/custom_drawer.dart';

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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Number',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                                Text(
                                  '#65675',
                                  style: AppTheme.textStyleSemiBoldBlack16,
                                )
                              ],
                            ),
                            const Spacer(),
                            ProfileController.to.isCancel.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetsConstant.verified,
                                        height: 25,
                                      ),
                                      CustomSizedBox.space8W,
                                      const Text(
                                        'Submit Cancellation\nRequest',
                                        style: AppTheme.textStyleNormalBlack12,
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  )
                                : CustomButton(
                                    onPressed: ProfileController.to.currentStep.value == ProfileController.to.processes.length - 1
                                        ? () {
                                            Get.toNamed(ReturnScreen.routeName);
                                          }
                                        : () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => const CancelOrderDialogWidget(),
                                            );
                                          },
                                    label: ProfileController.to.currentStep.value == ProfileController.to.processes.length - 1 ? 'Make a return' : 'Cancel Order',
                                    width: MediaQuery.of(context).size.width / 3.5,
                                    marginHorizontal: 8,
                                    marginVertical: 0,
                                    primary: Colors.white,
                                    borderColor: Colors.black.withOpacity(.8),
                                    isBorder: true,
                                    elevation: 0,
                                    labelColor: Colors.black.withOpacity(.8),
                                  ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.kborderColor,
                        thickness: 2,
                        height: 2,
                      ),
                      StepProcessWidget(currentStep: ProfileController.to.currentStep.value, processList: ProfileController.to.processes),
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
                                const Text(
                                  'District: Dhaka',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                                CustomSizedBox.space4H,
                                const Text(
                                  'City: Dhaka',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                                CustomSizedBox.space4H,
                                const Text(
                                  'Address: Dhanmondi 32, Kalabagan, Dhaka',
                                  style: AppTheme.textStyleMediumCustomBlack12,
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                ProfileController.to.markStepAsCompleted(ProfileController.to.currentStep.value);
                              },
                              child: const Text('step'))
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
                            const Text(
                              'Online payment via SslCommerz',
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
                                3,
                                (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColors.kborderColor, width: .5)),
                                                child: const CustomNetworkImage(
                                                  networkImagePath: '',
                                                  errorImagePath: AssetsConstant.megaDeals2,
                                                  height: 100,
                                                  width: 90,
                                                  borderRadius: 4,
                                                  fit: BoxFit.contain,
                                                )),
                                            CustomSizedBox.space12W,
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Li...',
                                                    style: AppTheme.textStyleMediumBlack14,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  CustomSizedBox.space4H,
                                                  Row(
                                                    children: [
                                                      RichText(
                                                        text: const TextSpan(text: 'Brand: ', style: AppTheme.textStyleNormalBlack14, children: [
                                                          TextSpan(
                                                            text: 'Lakme',
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
                                                        text: const TextSpan(text: 'Size: ', style: AppTheme.textStyleNormalBlack14, children: [
                                                          TextSpan(
                                                            text: '3.4ml',
                                                            style: AppTheme.textStyleBoldBlack14,
                                                          )
                                                        ]),
                                                      ),
                                                    ],
                                                  ),
                                                  CustomSizedBox.space8H,
                                                  Row(
                                                    children: [
                                                      RichText(
                                                        text: const TextSpan(text: 'Qty: ', style: AppTheme.textStyleNormalBlack14, children: [
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
                                                        text: const TextSpan(text: 'Amount: ', style: AppTheme.textStyleNormalBlack14, children: [
                                                          TextSpan(
                                                            text: '৳550',
                                                            style: AppTheme.textStyleBoldBlack14,
                                                          )
                                                        ]),
                                                      ),
                                                    ],
                                                  ),
                                                  CustomSizedBox.space12H,
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        CustomSizedBox.space12H,
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: AppColors.kborderColor,
                                        ),
                                      ],
                                    ))),
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
                              '৳ 1450.00',
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
                              '04 Nov, 2023',
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
                              'Discount',
                              style: AppTheme.textStyleSemiBoldFadeBlack14,
                            ),
                            const Spacer(),
                            Text(
                              '৳ 1450.00',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            )
                          ],
                        ),
                      ),
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
                              '-৳ 50',
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
                            const Text(
                              '৳ 1450.00',
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
  final int currentStep;
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
                      color: process.isComplete
                          ? Colors.black
                          : index == currentStep
                              ? AppColors.kPrimaryColor
                              : const Color(0xffCBD5E1),
                    ),
                    index != processList.length - 1
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 57,
                              width: 3,
                              color: process.isComplete
                                  ? Colors.black
                                  : index == currentStep && !ProfileController.to.isCancel.value
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
                      currentStep == processList.length - 1 && index == processList.length - 1 ? 'Deliverd' : process.topic,
                      style: AppTheme.textStyleNormalFadeBlack14,
                    ),
                    (process.topic == 'Ordered' || process.topic == 'Estimated Delivery' || process.topic == 'Return Started')
                        ? const Text(
                            '24 Nov, 2023',
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox.space8H,
              Text(
                'Order Number',
                style: AppTheme.textStyleMediumCustomBlack12,
              ),
              Text(
                '#65675',
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
                    if (ProfileController.to.currentStep.value == 1) {
                      ProfileController.to.processes.insert(2, Process(name: '3', isComplete: false, topic: 'Cancellation Requested'));
                      ProfileController.to.isCancel.value = true;
                      ProfileController.to.processes[1].isComplete = true;
                      ProfileController.to.currentStep.value = 2;
                    }
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
