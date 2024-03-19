import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/widgets/order_widget.dart';
import 'package:perfecto/pages/profile/my-orders/return_process.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ReturnScreen extends StatelessWidget {
  static const String routeName = '/make_a_return';
  const ReturnScreen({super.key});

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
              // Container(
              //     margin:
              //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //     decoration: BoxDecoration(
              //         border:
              //             Border.all(color: AppColors.kborderColor, width: 0.5),
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(4)),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(16.0),
              //           child: Row(
              //             children: [
              //               const Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Order Number',
              //                     style: AppTheme.textStyleMediumCustomBlack12,
              //                   ),
              //                   Text(
              //                     '#65675',
              //                     style: AppTheme.textStyleSemiBoldBlack16,
              //                   )
              //                 ],
              //               ),
              //               const Spacer(),
              //               /* ProfileController.to.isCancel.value?Row(
              //
              //           mainAxisAlignment: MainAxisAlignment.start,
              //
              //           children: [
              //             Image.asset(AssetsConstant.verified,height: 25,),
              //             CustomSizedBox.space8W,
              //             const Text('Submit Cancellation\nRequest',style: AppTheme.textStyleNormalBlack12,textAlign: TextAlign.left,)
              //           ],
              //         ): */
              //               CustomButton(
              //                 onPressed: () {Get.back();},
              //                 label: 'Cancel Return',
              //                 width: MediaQuery.of(context).size.width / 3.5,
              //                 marginHorizontal: 8,
              //                 marginVertical: 0,
              //                 primary: Colors.white,
              //                 borderColor: Colors.black.withOpacity(.8),
              //                 isBorder: true,
              //                 elevation: 0,
              //                 labelColor: Colors.black.withOpacity(.8),
              //               ),
              //             ],
              //           ),
              //         ),
              //         const Divider(
              //           color: AppColors.kborderColor,
              //           thickness: 2,
              //           height: 2,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(
              //               vertical: 8.0, horizontal: 16),
              //           child: Row(
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                     shape: BoxShape.circle, color: Colors.black),
              //                 child: Text(
              //                   '1',
              //                   style: AppTheme.textStyleSemiBoldWhite12,
              //                 ),
              //                 padding: EdgeInsets.all(6),
              //               ),
              //               CustomSizedBox.space8W,
              //               Text(
              //                 'Select Item(s) that you want to return',
              //                 style: AppTheme.textStyleSemiBoldFadeBlack14,
              //               )
              //             ],
              //           ),
              //         ),
              //         ...List.generate(
              //           3,
              //           (index) => Padding(
              //               padding:
              //                   const EdgeInsets.symmetric(horizontal: 16.0),
              //               child: Obx(() {
              //                 return Column(
              //                   children: [
              //                     ProductDetailsWidget(
              //                       isDivider: false,
              //                       needCheckbox: true,
              //                       index: index,
              //                     ),
              //                     ProfileController.to.checked[index]
              //                         ? Column(
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.start,
              //                             children: [
              //                               Text(
              //                                 'Reason for cancellation',
              //                                 style: AppTheme
              //                                     .textStyleSemiBoldBlack14,
              //                               ),
              //                               CustomTextField(
              //                                 marginVertical: 12,
              //                                 hintText: 'Select reason',
              //                                 marginHorizontal: 0,
              //                                 isRequired: true,
              //                                 fillColor: AppColors.kborderColor,
              //                                 suffixIcon: Icon(
              //                                   Icons
              //                                       .keyboard_arrow_down_outlined,
              //                                   size: 20,
              //                                 ),
              //                                 focusColor: Colors.black,
              //                               ),
              //                             ],
              //                           )
              //                         : SizedBox.shrink(),
              //                     index == (3 - 1)
              //                         ? SizedBox.shrink()
              //                         : Padding(
              //                             padding: const EdgeInsets.only(
              //                                 bottom: 8.0),
              //                             child: Divider(
              //                               height: 1,
              //                               thickness: 1,
              //                               color: AppColors.kborderColor,
              //                             ),
              //                           ),
              //                   ],
              //                 );
              //               })),
              //         )
              //       ],
              //     )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor, width: 0.5), color: Colors.white, borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                              child: Text(
                                '1',
                                style: AppTheme.textStyleSemiBoldWhite12,
                              ),
                              padding: EdgeInsets.all(6),
                            ),
                            CustomSizedBox.space8W,
                            Text(
                              'Return Method',
                              style: AppTheme.textStyleSemiBoldFadeBlack14,
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
                              'Drop off at Perfecto store',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                            CustomSizedBox.space8H,
                            Container(
                              decoration: BoxDecoration(color: AppColors.klightAccentColor, borderRadius: BorderRadius.circular(6)),
                              padding: EdgeInsets.all(12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Image.asset(
                                      AssetsConstant.alertIcon,
                                      height: 20,
                                    ),
                                  ),
                                  CustomSizedBox.space8W,
                                  Flexible(
                                      child: Text(
                                    'To return any product(s), product(s) must be in intact condition. It the product(s) condition is not as per our return policy wise, then the product(s) may not be accepted for return. For further assistance contact us at +88017********',
                                    style: AppTheme.textStyleSemiBoldBlack12,
                                  ))
                                ],
                              ),
                            ),
                            CustomSizedBox.space8H,
                            CustomSizedBox.space8H,
                            Text(
                              'Return product(s) through your nearest Perfecto store.',
                              style: AppTheme.textStyleSemiBoldlightFadeBlack14,
                            ),
                            CustomSizedBox.space8H,
                            Text(
                              'Find the nearest store',
                              style: AppTheme.textStyleSemiBoldlightFadeBlack14,
                            ),
                            CustomSizedBox.space8H,
                            Text(
                              'Free',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ))
        ],
      ),
      bottomNavigationBar: CustomButton(
        label: 'Okay',
        marginHorizontal: 16,
        marginVertical: 20,
        onPressed: () {
          Get.back();
          // Get.toNamed(ReturnProcess.routeName);
        },
      ),
    );
  }
}
