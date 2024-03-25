import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mh_core/mh_core.dart';

import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/models/product_model.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/review/review_page.dart';
import 'package:perfecto/pages/product-details/review/verified_user_page.dart';

import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'dart:ui' as ui;

import '../../../../controller/auth_controller.dart';
import '../../../auth/login_page.dart';

class CommentWidget extends StatelessWidget {
  final Reviews? reviews;
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
    this.reviews,
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
            : const SizedBox.shrink(),
        GestureDetector(
          onTap: () {
            Get.toNamed(VerifiedUserScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              children: [
                CustomNetworkImage(
                  networkImagePath: reviews?.user?.avatar ?? '',
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
                      reviews?.user?.name ?? '',
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
                        const Text(
                          'Verified Buyer',
                          style: AppTheme.textStyleNormalFadeBlack10,
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  DateFormat('dd MMM yyyy').format(DateTime.parse(reviews?.createdAt ?? DateTime.now().toString())),
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
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                child: Row(children: [
                  Text(
                    reviews?.star?.toString() ?? '0',
                    style: AppTheme.textStyleBoldWhite12,
                  ),
                  CustomSizedBox.space4W,
                  const Icon(
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
              if (reviews?.shade != null)
                CustomNetworkImage(
                  networkImagePath: reviews?.shade?.image ?? '',
                  errorImagePath: AssetsConstant.lipstickShade,
                  borderRadius: 2,
                  height: 21,
                  width: 21,
                ),
              if (reviews?.shade != null) CustomSizedBox.space8W,
              Text(
                reviews?.shade?.name ?? reviews?.size?.name ?? '-',
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
                '“${reviews?.title ?? 'Velvet in bullet.....'}”',
                style: AppTheme.textStyleBoldBlack14,
              ),
              CustomSizedBox.space4H,
              Obx(() {
                return Text(
                  reviews?.comment ?? 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                  style: AppTheme.textStyleNormalFadeBlack14,
                  maxLines: fromProductDetails
                      ? ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).readMore!
                          ? 100
                          : 1
                      : ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).readMore!
                          ? 100
                          : 1,
                  overflow: TextOverflow.ellipsis,
                );
              }),
              Obx(
                () => !(fromProductDetails
                            ? ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).readMore!
                            : ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).readMore!) &&
                        countLinesWithoutNewline(reviews?.comment ?? 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu', context) > 1
                    ? GestureDetector(
                        onTap: () {
                          globalLogger.d('Read more');
                          // reviews!.readMore = !reviews!.readMore!;
                          if (fromProductDetails) {
                            ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).readMore = true;
                            ProductDetailsController.to.product.refresh();
                          } else {
                            ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).readMore = true;
                            ProductDetailsController.to.allReviews.refresh();
                          }
                        },
                        child: Text(
                          ' Read more',
                          style: AppTheme.textStyleSemiBoldBlack14,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Wrap(
                children: [
                  ...List.generate(
                    reviews?.productReviewImages?.length ?? 5,
                    (index) => Container(
                      height: 48,
                      width: 48,
                      margin: const EdgeInsets.symmetric(vertical: 8).copyWith(right: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        /*image: DecorationImage(
                              image: AssetImage(
                                AssetsConstant.megaDeals3,
                              ),
                              fit: BoxFit.cover)*/
                      ),
                      child: CustomNetworkImage(
                          networkImagePath: reviews?.productReviewImages?[index].image ?? '',
                          imagePathList: reviews!.productReviewImages!.map((e) => getImageUrl(e.image!)).toList(),
                          height: 48,
                          width: 48,
                          errorImagePath: AssetsConstant.megaDeals3,
                          fit: BoxFit.cover,
                          borderRadius: 4,
                          isPreviewPageNeed: true),
                    ),
                  ),
                ],
              ),
              CustomSizedBox.space8H,
              Obx(() {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (AuthController.to.isLoggedIn.value) {
                          ProductDetailsController.to.storeReviewHelpful(reviewId: reviews!.id!);
                        } else {
                          Get.toNamed(LoginScreen.routeName);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: fromProductDetails
                                ? ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).reviewHelpful!.isNotEmpty &&
                                        ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).reviewHelpful![0].helpful == '1'
                                    ? AppColors.kPrimaryColor
                                    : null
                                : ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).reviewHelpful!.isNotEmpty &&
                                        ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).reviewHelpful![0].helpful == '1'
                                    ? AppColors.kPrimaryColor
                                    : null,
                            border: Border.all(color: AppColors.kPrimaryColor, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/like.png',
                              height: 17,
                              color: fromProductDetails
                                  ? ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).reviewHelpful!.isNotEmpty &&
                                          ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).reviewHelpful![0].helpful == '1'
                                      ? Colors.white
                                      : null
                                  : ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).reviewHelpful!.isNotEmpty &&
                                          ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).reviewHelpful![0].helpful == '1'
                                      ? Colors.white
                                      : null,
                            ),
                            CustomSizedBox.space4W,
                            Text(
                              'Helpful',
                              style: fromProductDetails
                                  ? ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).reviewHelpful!.isNotEmpty &&
                                          ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).reviewHelpful![0].helpful == '1'
                                      ? AppTheme.textStyleSemiBoldWhite14
                                      : AppTheme.textStyleSemiBoldPrimary14
                                  : ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).reviewHelpful!.isNotEmpty &&
                                          ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).reviewHelpful![0].helpful == '1'
                                      ? AppTheme.textStyleSemiBoldWhite14
                                      : AppTheme.textStyleSemiBoldPrimary14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomSizedBox.space8W,
                    Text(
                      '${fromProductDetails ? ProductDetailsController.to.product.value.reviews!.firstWhere((element) => element.id == reviews!.id).reviewHelpfulCount ?? 0 : ProductDetailsController.to.allReviews.firstWhere((element) => element.id == reviews!.id).reviewHelpfulCount ?? 0} people found this helpful',
                      style: AppTheme.textStyleNormalFadeBlack14,
                    ),
                  ],
                );
              })
            ],
          ),
        ),
        CustomSizedBox.space12H,
      ],
    );
  }
}

int countLinesWithoutNewline(String str, BuildContext context) {
  final textSpan = TextSpan(text: str);
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: ui.TextDirection.ltr,
  );
  textPainter.layout(
    maxWidth: MediaQuery.of(context).size.width,
  );

  return textPainter.computeLineMetrics().length;
}
