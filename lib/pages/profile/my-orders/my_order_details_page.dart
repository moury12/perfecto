import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_binding.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
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
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.kborderColor, width: 0.5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Obx(
                   () {
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
                              CustomButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const CancelOrderDialogWidget(),
                                  );
                                },
                                label:ProfileController.to.currentStep==ProfileController.to.processes.length-1?'Make a return' :'Cancel Order',
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
                     Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 12),
                          child: Column(children: [      ...List.generate(ProfileController.to.processes.length,
                                  (index) {
                                final process = ProfileController.to.processes[index];
                                return Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle,
                          color: process.isComplete
                              ? Colors.black
                              : index ==
                              ProfileController
                                  .to.currentStep.value
                              ? AppColors.kPrimaryColor
                              : Color(0xffCBD5E1),
                        ),
                        index != ProfileController.to.processes.length - 1
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0),
                          child: Container(
                            height: 57,
                            width: 3,
                            color: process.isComplete
                                ? Colors.black
                                : index ==
                                ProfileController
                                    .to.currentStep.value
                                ? AppColors.kPrimaryColor
                                : Color(0xffCBD5E1),
                          ),
                        )
                            : SizedBox.shrink()
                      ],
                    ),
                    CustomSizedBox.space12W,
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ProfileController.to.currentStep==ProfileController.to.processes.length-1?'Delivered':process.topic,style: AppTheme.textStyleNormalFadeBlack14,),
                        (process.topic=='Ordered'||process.topic=='Estimated Delivery')? Text('24 Nov, 2023',style: AppTheme.textStyleNormalFadeBlack14,):SizedBox.shrink(),
                      ],
                    )
                                  ],
                                );
                              }),
                          ],),
                        )
                       ,                   const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomDividerWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomDividerWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(4),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .kborderColor,
                                                          width: .5)),
                                                  child: const CustomNetworkImage(
                                                    networkImagePath: '',
                                                    errorImagePath:
                                                        AssetsConstant.megaDeals2,
                                                    height: 100,
                                                    width: 90,
                                                    borderRadius: 4,
                                                    fit: BoxFit.contain,
                                                  )),
                                              CustomSizedBox.space12W,
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Li...',
                                                      style: AppTheme
                                                          .textStyleMediumBlack14,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    CustomSizedBox.space4H,
                                                    Row(
                                                      children: [
                                                        RichText(
                                                          text: const TextSpan(
                                                              text: 'Brand: ',
                                                              style: AppTheme
                                                                  .textStyleNormalBlack14,
                                                              children: [
                                                                TextSpan(
                                                                  text: 'Lakme',
                                                                  style: AppTheme
                                                                      .textStyleBoldBlack14,
                                                                )
                                                              ]),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 8.0),
                                                          child: Container(
                                                            color: Colors.black
                                                                .withOpacity(.2),
                                                            height: 15,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        RichText(
                                                          text: const TextSpan(
                                                              text: 'Size: ',
                                                              style: AppTheme
                                                                  .textStyleNormalBlack14,
                                                              children: [
                                                                TextSpan(
                                                                  text: '3.4ml',
                                                                  style: AppTheme
                                                                      .textStyleBoldBlack14,
                                                                )
                                                              ]),
                                                        ),
                                                      ],
                                                    ),
                                                    CustomSizedBox.space8H,
                                                    Row(
                                                      children: [
                                                        RichText(
                                                          text: const TextSpan(
                                                              text: 'Qty: ',
                                                              style: AppTheme
                                                                  .textStyleNormalBlack14,
                                                              children: [
                                                                TextSpan(
                                                                  text: '1',
                                                                  style: AppTheme
                                                                      .textStyleBoldBlack14,
                                                                )
                                                              ]),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 8.0),
                                                          child: Container(
                                                            color: Colors.black
                                                                .withOpacity(.2),
                                                            height: 15,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        RichText(
                                                          text: const TextSpan(
                                                              text: 'Amount: ',
                                                              style: AppTheme
                                                                  .textStyleNormalBlack14,
                                                              children: [
                                                                TextSpan(
                                                                  text: '৳550',
                                                                  style: AppTheme
                                                                      .textStyleBoldBlack14,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                'Items Subtotal',
                                style: AppTheme.textStyleSemiBoldFadeBlack14,
                              ),
                              const Spacer(),
                              Text(
                                'Shipped',
                                style: AppTheme.textStyleSemiBoldBlack14,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomDividerWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
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
                  }
                ),
              )
            ],
          ))
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
      title: const Row(
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
                '#65675',
                style: AppTheme.textStyleSemiBoldBlack16,
              )
            ],
          ),
          Icon(CupertinoIcons.multiply),
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
                  onPressed:() {
                    ProfileController.to.processes.insert(2, Process(name: '3', isComplete: false, topic: 'Cancellation Requested'));
                    ProfileController.to.processes[1].isComplete=true;
                    ProfileController.to.currentStep.value=2;
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
