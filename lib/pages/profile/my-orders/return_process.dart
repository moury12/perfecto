import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_details_page.dart';
import 'package:perfecto/pages/profile/my-orders/return_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../drawer/custom_drawer.dart';

class ReturnProcess extends StatelessWidget {
  static const String routeName = '/return_process';
  const ReturnProcess({super.key});

  @override
  Widget build(BuildContext context) {
    final cancel = Get.arguments;
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
                            cancel == 'cancel'
                                ? SizedBox.shrink()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetsConstant.verified,
                                        height: 25,
                                      ),
                                      CustomSizedBox.space8W,
                                      const Text(
                                        'Submit Return\nRequest',
                                        style: AppTheme.textStyleNormalBlack12,
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  )
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.kborderColor,
                        thickness: 2,
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cancel == 'cancel' ? 'Order cancel successfully' : 'Your return ID is: #6268716eagfg66',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                            Text(
                              'You will receive an return confirmation email with details.',
                              style: AppTheme.textStyleSemiBoldfadeBlack12,
                            ),
                          ],
                        ),
                      ),
                      // StepProcessWidget(
                      //     currentStep: cancel == 'cancel' ? ProfileController.to.currentStepForCancel.value : ProfileController.to.currentStepForReturn.value,
                      //     processList: cancel == 'cancel' ? ProfileController.to.cancelProcesses : ProfileController.to.Returnprocesses),
                      cancel == 'cancel'
                          ? SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomDividerWidget(),
                                  CustomSizedBox.space12H,
                                  Text(
                                    'Return Method',
                                    style: AppTheme.textStyleSemiBoldBlack14,
                                  ),
                                  CustomSizedBox.space4H,
                                  const Text(
                                    'Drop off at Perfecto store',
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        child: Row(
                          children: [
                            Text(
                              'Total',
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
              )
            ],
          ))
        ],
      ),
    );
  }
}
