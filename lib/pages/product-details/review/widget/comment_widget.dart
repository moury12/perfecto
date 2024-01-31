import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';

import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/review/review_page.dart';
import 'package:perfecto/pages/product-details/review/verified_user_page.dart';

import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class CommentWidget extends StatelessWidget {
  final int index;
  final bool isHelpful;
  final bool readMore;
  final Function()? function;
  final bool fromProductDetails;
  const CommentWidget({
    super.key,
    required this.index,
    this.isHelpful = true,
    this.fromProductDetails = false,
    this.readMore = false,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        index != 0
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  thickness: 1.5,
                ),
              )
            : SizedBox.shrink(),
        GestureDetector(
          onTap: () {
            Get.toNamed(VerifiedUserScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              children: [
                CustomNetworkImage(
                  networkImagePath: '',
                  errorImagePath: AssetsConstant.profile,
                  borderRadius: 360,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                CustomSizedBox.space8W,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vinod Kumar',
                      style: AppTheme.textStyleBoldBlack14,
                    ),
                    CustomSizedBox.space4H,
                    Row(
                      children: [
                        Image.asset(
                          AssetsConstant.verified,
                          height: 14,
                        ),
                        CustomSizedBox.space4W,
                        Text(
                          'Verified Buyers',
                          style: AppTheme.textStyleNormalFadeBlack10,
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Text(
                  '20 July 2023',
                  style: AppTheme.textStyleNormalFadeBlack12,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                child: Row(children: [
                  Text(
                    '5',
                    style: AppTheme.textStyleBoldWhite12,
                  ),
                  CustomSizedBox.space4W,
                  Icon(
                    Icons.star_rate_rounded,
                    color: Colors.white,
                    size: 16,
                  )
                ]),
              ),
              CustomSizedBox.space8W,
              Container(
                color: Colors.black.withOpacity(.4),
                height: 20,
                width: .5,
              ),
              CustomSizedBox.space8W,
              CustomNetworkImage(
                networkImagePath: '',
                errorImagePath: AssetsConstant.lipstickShade,
                borderRadius: 2,
                height: 21,
                width: 21,
              ),
              CustomSizedBox.space8W,
              Text(
                'Nude Shade Color',
                style: AppTheme.textStyleNormalFadeBlack14,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox.space8H,
              Text(
                '“Velvet in bullet.....”',
                style: AppTheme.textStyleBoldBlack14,
              ),
              CustomSizedBox.space4H,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                  style: AppTheme.textStyleNormalFadeBlack14,
                ),
                readMore
                    ? TextSpan(
                        text: 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                        style: AppTheme.textStyleNormalFadeBlack14,
                        children: [
                            TextSpan(
                              text: ' Read Less',
                              style: AppTheme.textStyleSemiBoldBlack14,
                              recognizer: TapGestureRecognizer()..onTap = function,
                            )
                          ])
                    : TextSpan(
                        text: '...Read More',
                        style: AppTheme.textStyleSemiBoldBlack14,
                        recognizer: TapGestureRecognizer()
                          ..onTap = function ??
                              () {
                                Get.toNamed(ReviewScreen.routeName);
                              },
                      )
              ])),
              Wrap(
                children: [
                  ...List.generate(
                    5,
                    (index) => Container(
                      height: 48,
                      width: 48,
                      margin: EdgeInsets.symmetric(vertical: 8).copyWith(right: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        /*image: DecorationImage(
                              image: AssetImage(
                                AssetsConstant.megaDeals3,
                              ),
                              fit: BoxFit.cover)*/
                      ),
                      child: CustomNetworkImage(
                          networkImagePath: '', height: 48, width: 48, errorImagePath: AssetsConstant.megaDeals3, fit: BoxFit.cover, borderRadius: 4, isPreviewPageNeed: true),
                    ),
                  ),
                ],
              ),
              isHelpful
                  ? Obx(() {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ProductDetailsController.to.isHelpfull.value = !ProductDetailsController.to.isHelpfull.value;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ProductDetailsController.to.isHelpfull.value ? AppColors.kPrimaryColor : null,
                                  border: Border.all(color: AppColors.kPrimaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(4)),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/like.png',
                                    height: 17,
                                    color: ProductDetailsController.to.isHelpfull.value ? Colors.white : null,
                                  ),
                                  CustomSizedBox.space4W,
                                  Text(
                                    'Helpful',
                                    style: ProductDetailsController.to.isHelpfull.value ? AppTheme.textStyleSemiBoldWhite14 : AppTheme.textStyleSemiBoldPrimary14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomSizedBox.space8W,
                          Text(
                            '12 people found this helpful',
                            style: AppTheme.textStyleNormalFadeBlack14,
                          ),
                        ],
                      );
                    })
                  : Text(
                      '12 people found this helpful',
                      style: AppTheme.textStyleNormalFadeBlack14,
                    ),
            ],
          ),
        ),
        CustomSizedBox.space12H,
      ],
    );
  }
}
