import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
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
              TitleTextWidget(tileText: 'Select product rating'),
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
                        index < ProductDetailsController.to.rating.value
                            ? Icons.star_rate_rounded
                            : Icons.star_border_rounded,
                        color: Color(0xffFFAC0A),
                        size: 60,
                      ),
                    );
                  });
                }),
              ),
              CustomSizedBox.space4W,
              Text(
                '4.3/5',
                style: AppTheme.textStyleSemiBoldBlack14,
                textAlign: TextAlign.center,
              ),
              CustomSizedBox.space12H,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextWidget(tileText: 'Add photos'),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              surfaceTintColor: Colors.white,
                              actionsAlignment: MainAxisAlignment.center,
                              titlePadding: EdgeInsets.only(top: 19,right: 20),
                              title: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Align(alignment: Alignment.topRight,

                                    child: Icon(CupertinoIcons.multiply,color: Colors.black,size: 30,)),
                              ),
                              actions: [
                                GestureDetector(

                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.kPrimaryColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.symmetric(vertical: 16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                        CustomSizedBox.space4W,
                                        Text(
                                          'Camera',
                                          style:
                                              AppTheme.textStyleMediumPrimary12,
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
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.kPrimaryColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.symmetric(vertical: 16)
                                        .copyWith(top: 0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.image,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                        CustomSizedBox.space4W,
                                        Text(
                                          'Gallery',
                                          style:
                                              AppTheme.textStyleMediumPrimary12,
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
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.kPrimaryColor, width: 2)),
                        child: Column(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Obx(
                      () {
                          return ProductDetailsController.to.imageList.isEmpty&&ProductDetailsController.to.captureImage.value.isEmpty?SizedBox.shrink():Wrap(children: [...List.generate(ProductDetailsController.to.imageList.length, (index) => Padding(
                            padding: const EdgeInsets.all(4.0).copyWith(top: 0),
                            child: Image.file(File(ProductDetailsController.to.imageList[index]),height: 80,width: 80,fit: BoxFit.cover,),
                          )),Padding(
                            padding: const EdgeInsets.all(4.0).copyWith(top: 0),
                            child: Image.file(File(ProductDetailsController.to.captureImage.value),height: 80,width: 80,fit: BoxFit.cover,),
                          )
                          ],);
                        }
                      ),
                    )
                  ],
                ),
              ),
              CustomSizedBox.space12H,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextWidget(tileText: 'Add Written Review'),
                    CustomTextField(
                        borderRadius: 10,
                        hintText: 'Add Written Review',
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
                onPressed: () {},
                marginVertical: 16,
              )
            ],
          ))
        ],
      ),
    );
  }
}
