import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/review/widget/comment_widget.dart';
import 'package:perfecto/pages/product-details/review/write_review_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../controller/auth_controller.dart';

class ReviewScreen extends StatelessWidget {
  static const String routeName = '/review';
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Divider(
                  thickness: 1.5,
                  color: Color(0xffECECEC),
                  height: 1,
                  indent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Column(
                    children: [
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          const Text(
                            'Ratings & Reviews',
                            style: AppTheme.textStyleBoldBlack16,
                          ),
                          const Spacer(),
                          if (AuthController.to.isLoggedIn.value && ProductDetailsController.to.product.value.reviewEligible == 'true')
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(WriteReviewScreen.routeName);
                              },
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), borderRadius: BorderRadius.circular(4)),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                child: const Text(
                                  'Write Review',
                                  style: AppTheme.textStyleBoldBlack14,
                                ),
                              ),
                            ),
                        ],
                      ),
                      CustomSizedBox.space8H,
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1.5,
                  color: Color(0xffECECEC),
                  height: 0,
                  indent: 0,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            ProductDetailsController.to.product.value.name ?? 'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                            style: AppTheme.textStyleNormalBlack14,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '${double.tryParse(ProductDetailsController.to.product.value.reviewsAvgStar!) ?? 0}/5',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                            Text(
                              '${ProductDetailsController.to.allReviews.length} verified ratings',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black54),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xffECECEC).withOpacity(.4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const TitleTextWidget(tileText: 'Refine Reviews By'),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              ProductDetailsController.to.reviewFilterList.forEach((element) {
                                element['is_selected'] = false;
                              });
                              ProductDetailsController.to.reviewFilterList.refresh();
                              ProductDetailsController.to.getAllReviews();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Reset Filter',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Obx(() {
                        return SizedBox(
                          height: 42,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            itemCount: ProductDetailsController.to.reviewFilterList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                if (index > 0) {
                                  globalLogger.d('Not First Element');
                                  for (var element in ProductDetailsController.to.reviewFilterList) {
                                    if (!(ProductDetailsController.to.reviewFilterList[0]['title'] == element['title'])) {
                                      if (ProductDetailsController.to.reviewFilterList[index]['title'] == element['title']) {
                                        globalLogger.d(element['title'], error: 'Not First Element');
                                        element['is_selected'] = !element['is_selected'];
                                      } else {
                                        globalLogger.d(element['title'], error: 'Not First Element');
                                        element['is_selected'] = false;
                                      }
                                    }
                                  }
                                } else {
                                  globalLogger.d('First Element');
                                  ProductDetailsController.to.reviewFilterList[index]['is_selected'] =
                                      !(ProductDetailsController.to.reviewFilterList[index]['is_selected'] as bool);
                                }
                                ProductDetailsController.to.reviewFilterList.refresh();

                                final data = {
                                  'with_image': ProductDetailsController.to.reviewFilterList[0]['is_selected'] ? '1' : '0',
                                };
                                for (int i = 1; i < ProductDetailsController.to.reviewFilterList.length; i++) {
                                  if (ProductDetailsController.to.reviewFilterList[i]['is_selected']) {
                                    data['rating'] = ProductDetailsController.to.reviewFilterList[i]['key'];
                                  }
                                }

                                ProductDetailsController.to.getAllReviews(addition: data);

                                globalLogger.d(data, error: 'Filter Data');
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ProductDetailsController.to.reviewFilterList[index]['is_selected'] ? AppColors.kPrimaryColor : Colors.grey.withOpacity(.5),
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Text(
                                  ProductDetailsController.to.reviewFilterList[index]['title'].toString(),
                                  textAlign: TextAlign.center,
                                  style: ProductDetailsController.to.reviewFilterList[index]['is_selected']
                                      ? AppTheme.textStyleSemiBoldPrimary14
                                      : AppTheme.textStyleSemiBoldFadeBlack14,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      CustomSizedBox.space16H,
                    ],
                  ),
                ),

                Obx(() {
                  return ListView.builder(
                    itemCount: ProductDetailsController.to.allReviews.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return CommentWidget(
                        reviews: ProductDetailsController.to.allReviews[index],
                        index: index,
                        readMore: ProductDetailsController.to.readMore.value,
                        function: () {
                          ProductDetailsController.to.readMore.value = !ProductDetailsController.to.readMore.value;
                        },
                      );
                    },
                  );
                }),

                // ...List.generate(
                //   10,
                //   (index) =>  CommentWidget(
                //       index: index,
                //       readMore: ProductDetailsController.to.readMore.value,
                //       function: () {
                //         ProductDetailsController.to.readMore.value = !ProductDetailsController.to.readMore.value;
                //       },
                //     ),
                // ),
                CustomSizedBox.space12H,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
        child: FittedBox(
          child: Row(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    ProductDetailsController.to.isFavourite.value = !ProductDetailsController.to.isFavourite.value;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(border: Border.all(color: AppColors.kPrimaryColor, width: 1), borderRadius: BorderRadius.circular(4)),
                    child: ProductDetailsController.to.isFavourite.value
                        ? Image.asset(
                            AssetsConstant.favIconFill,
                            height: 24,
                          )
                        : Image.asset(
                            AssetsConstant.favIcon,
                            height: 26,
                          ),
                  ),
                );
              }),
              CustomSizedBox.space4W,
              CustomButton(
                label: 'Add To Bag',
                marginHorizontal: 8,
                marginVertical: 4,
                height: 50,
                prefixImage: AssetsConstant.cartIcon,
                prefixImageColor: Colors.white,
                prefixImageHeight: 20,
                primary: AppColors.kPrimaryColor,
                width: MediaQuery.of(context).size.width / 1.3,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
