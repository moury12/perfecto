import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class WriteReviewScreen extends StatelessWidget {
  static const String routeName = '/write_review';
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ProductDetailsController.to.imageList.clear();
        return Future.value(true);
      },
      child: Scaffold(
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
                    'Write Review',
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
                const TitleTextWidget(tileText: 'Select product rating'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Obx(() {
                      return GestureDetector(
                        onTap: () {
                          // Set the rating when a star is tapped

                          ProductDetailsController.to.rating.value = index + 1;
                        },
                        child: Icon(
                          index < ProductDetailsController.to.rating.value ? Icons.star_rate_rounded : Icons.star_border_rounded,
                          color: const Color(0xffFFAC0A),
                          size: 60,
                        ),
                      );
                    });
                  }),
                ),
                CustomSizedBox.space4W,
                Obx(() {
                  return Text(
                    '${ProductDetailsController.to.rating.value}/5',
                    style: AppTheme.textStyleSemiBoldBlack14,
                    textAlign: TextAlign.center,
                  );
                }),
                CustomSizedBox.space12H,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleTextWidget(tileText: 'Add photos'),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                surfaceTintColor: Colors.white,
                                actionsAlignment: MainAxisAlignment.center,
                                titlePadding: const EdgeInsets.only(top: 19, right: 20),
                                title: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        CupertinoIcons.multiply,
                                        color: Colors.black,
                                        size: 30,
                                      )),
                                ),
                                actions: [
                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: AppColors.kPrimaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.symmetric(vertical: 16),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.camera_alt_outlined,
                                            color: AppColors.kPrimaryColor,
                                          ),
                                          CustomSizedBox.space4W,
                                          Text(
                                            'Camera',
                                            style: AppTheme.textStyleMediumPrimary12,
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      ProductDetailsController.to.selectedImageCamera();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: AppColors.kPrimaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.symmetric(vertical: 16).copyWith(top: 0),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.image,
                                            color: AppColors.kPrimaryColor,
                                          ),
                                          CustomSizedBox.space4W,
                                          Text(
                                            'Gallery',
                                            style: AppTheme.textStyleMediumPrimary12,
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      ProductDetailsController.to.selectedImage();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.kPrimaryColor, width: 2)),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: AppColors.kPrimaryColor,
                              ),
                              Text(
                                'Add photo',
                                style: AppTheme.textStyleMediumPrimary12,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomSizedBox.space12H,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Obx(() {
                          return ProductDetailsController.to.imageList.isEmpty
                              ? const SizedBox.shrink()
                              : Wrap(
                                  children: [
                                    ...List.generate(
                                      ProductDetailsController.to.imageList.length,
                                      (index) => Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 8, bottom: 8),
                                            decoration: BoxDecoration(border: Border.all(color: AppColors.kPrimaryColor, width: 2), borderRadius: BorderRadius.circular(4)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(2),
                                              child: Image.file(
                                                File(ProductDetailsController.to.imageList[index]),
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 2,
                                              right: 10,
                                              child: GestureDetector(
                                                onTap: () {
                                                  ProductDetailsController.to.imageList.removeAt(index);
                                                },
                                                child: Container(
                                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                                                    child: const Icon(Icons.close, color: Colors.white60, size: 20)),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                        }),
                      )
                    ],
                  ),
                ),
                CustomSizedBox.space12H,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleTextWidget(tileText: 'Add Review Title'),
                      CustomTextField(
                          controller: ProductDetailsController.to.reviewTitleController.value,
                          borderRadius: 10,
                          hintText: 'Add Review Title',
                          enableBorderColor: AppColors.kPrimaryColor,
                          borderWidth: 2,
                          focusColor: AppColors.kPrimaryColor,
                          marginVertical: 0,
                          maxLine: 5),
                      CustomSizedBox.space4H,
                      const TitleTextWidget(tileText: 'Add Review Comment'),
                      CustomTextField(
                          controller: ProductDetailsController.to.reviewCommentController.value,
                          borderRadius: 10,
                          height: 100,
                          hintText: 'Add Review Comment',
                          enableBorderColor: AppColors.kPrimaryColor,
                          borderWidth: 2,
                          focusColor: AppColors.kPrimaryColor,
                          marginVertical: 0,
                          maxLine: 5),
                      CustomSizedBox.space12H
                    ],
                  ),
                ),
                CustomButton(
                  label: 'Submit',
                  onPressed: () {
                    // Submit the review
                    // final data = {
                    //   "product_id": ProductDetailsController.to.product.value.id,
                    //   "order_id": ProductDetailsController.to.product.value.orderId,
                    //   "title": ProductDetailsController.to.reviewTitleController.value.text,
                    //   "comment": ProductDetailsController.to.reviewCommentController.value.text,
                    //   "star": ProductDetailsController.to.rating.value.toString()
                    // };

                    ProductDetailsController.to.postReview(/*data*/);
                  },
                  marginVertical: 16,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
