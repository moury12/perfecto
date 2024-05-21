import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/auth/login_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/offer/offer_details_page.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/product_discription_page.dart';
import 'package:perfecto/pages/product-details/product_image_preview.dart';
import 'package:perfecto/pages/product-details/product_shade_page.dart';
import 'package:perfecto/pages/product-details/review/review_page.dart';
import 'package:perfecto/pages/product-details/review/widget/comment_widget.dart';
import 'package:perfecto/pages/product-details/review/write_review_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:collection/collection.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/cart_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/productDetails';
  const ProductDetailsScreen({super.key});

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
                Obx(() {
                  return SizedBox(
                    height: 360,
                    child: PageView.builder(
                      padEnds: false,
                      scrollDirection: Axis.horizontal,
                      controller: PageController(),
                      onPageChanged: (value) {
                        ProductDetailsController.to.currentPage.value = value;
                      },
                      itemCount: ProductDetailsController.to.product.value.variationType == 'shade'
                          ? ProductDetailsController.to.product.value.productShades!
                              .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                              .productShadeImages!
                              .length
                          : ProductDetailsController.to.product.value.productSizes!
                              .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                              .productSizeImages!
                              .length,
                      itemBuilder: (context, index) {
                        String data = ProductDetailsController.to.product.value.variationType == 'shade'
                            ? ProductDetailsController.to.product.value.productShades!
                                .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                .productShadeImages![index]
                                .productShadeImage!
                            : ProductDetailsController.to.product.value.productSizes!
                                .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                .productSizeImages![index]
                                .productSizeImage!;
                        return GestureDetector(
                          onTap: () {
                            ProductDetailsController.to.selectedImageForPage.value = index;
                            Get.toNamed(
                              ProductImagePreview.routeName,
                            );
                          },
                          child: CustomNetworkImage(
                            networkImagePath: data,
                            fit: BoxFit.fill,
                            errorImagePath: data,
                            height: double.maxFinite,
                            width: double.infinity,
                            borderRadius: 0,
                          ),
                        );
                      },
                    ),
                  );
                }),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        ProductDetailsController.to.product.value.variationType == 'shade'
                            ? ProductDetailsController.to.product.value.productShades!
                                .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                .productShadeImages!
                                .length
                            : ProductDetailsController.to.product.value.productSizes!
                                .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                .productSizeImages!
                                .length, (index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ProductDetailsController.to.currentPage.value == index ? AppColors.kPrimaryColor : const Color(0xffD9D9D9),
                        ),
                      );
                    }),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Obx(() {
                    return Text(
                      ProductDetailsController.to.product.value.name ?? '-',
                      style: AppTheme.textStyleBoldBlack20.copyWith(fontFamily: 'InriaSans'),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Obx(() {
                    return RichText(
                        text: TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                      TextSpan(
                        text: ProductDetailsController.to.product.value.brand?.name ?? '-',
                        style: AppTheme.textStyleMediumBlack14,
                      ),
                      if (ProductDetailsController.to.product.value.variationType != 'shade') ...[
                        const TextSpan(
                          text: ' | ',
                          style: AppTheme.textStyleNormalFadeBlack14,
                        ),
                        TextSpan(
                          text: ProductDetailsController.to.product.value.productSizes!
                              .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                              .size!
                              .name!,
                          style: AppTheme.textStyleMediumBlack14,
                        ),
                      ]
                    ]));
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ...List.generate(
                      //   5,
                      //   (index) {
                      //     return index == 4
                      //         ? const Icon(
                      //             Icons.star_border_rounded,
                      //             color: AppColors.kOfferButtonColor,
                      //             size: 15,
                      //           )
                      //         : const Icon(
                      //             Icons.star_rate_rounded,
                      //             color: AppColors.kOfferButtonColor,
                      //             size: 15,
                      //           );
                      //   },
                      // ),
                      RatingWidget(
                          rating: double.tryParse(ProductDetailsController.to.product.value.reviewsAvgStar!) ?? 0,
                          showRatingValue: false,
                          fontSize: 12,
                          ratingTextPosition: RatingTextPosition.right,
                          textColor: Colors.black.withOpacity(.8),
                          ratingIconSize: 14,
                          ratingColor: AppColors.kOfferButtonColor,
                          outOf: 5),
                      // Text('4.3/5', style: AppTheme.textStyleSemiBoldBlack14),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: ' ${double.tryParse(ProductDetailsController.to.product.value.reviewsAvgStar!) ?? 0}/5', style: AppTheme.textStyleSemiBoldBlack14),
                        const TextSpan(
                          text: ' | ',
                          style: AppTheme.textStyleNormalFadeBlack14,
                        ),
                        TextSpan(
                            text: '(${ProductDetailsController.to.product.value.reviewsCount!})',
                            style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 14)),
                      ]))
                    ],
                  ),
                ),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                    child: Row(
                      children: [
                        RichText(
                            text: TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                          TextSpan(
                              text: '৳ ${ProductDetailsController.to.getPrice()}  ',
                              style: AppTheme.textStyleBoldBlack20,
                              children: ProductDetailsController.to.discountPercent() == 0
                                  ? []
                                  : [
                                      TextSpan(
                                        text: '৳${ProductDetailsController.to.getActualPrice()}',
                                        style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal),
                                      ),
                                      const TextSpan(
                                        text: ' | ',
                                        style: AppTheme.textStyleNormalFadeBlack14,
                                      ),
                                      TextSpan(
                                        text: '(-${ProductDetailsController.to.discountPercent().toStringAsFixed(1)}% Off)',
                                        style: const TextStyle(color: Color(0xff02792A), fontSize: 14, fontWeight: FontWeight.bold),
                                      )
                                    ]),
                        ])),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // ProductDetailsController.to.isAvaiableShade.value = !ProductDetailsController.to.isAvaiableShade.value;
                            Share.share(
                                'Check out this product on Perfecto\nName - ${ProductDetailsController.to.product.value.name}${ProductDetailsController.to.product.value.brand != null ? '\n Brand - ${ProductDetailsController.to.product.value.brand?.name ?? ' - '}' : ''}\n${ProductDetailsController.to.product.value.variationType == 'shade' ? 'Shade - ' + (ProductDetailsController.to.product.value.productShades!.firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value).shade!.name!) : 'Size - ' + (ProductDetailsController.to.product.value.productSizes!.firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value).size!.name!)}\n৳ ${ProductDetailsController.to.getPrice()}\nhttps://ecom-perfecto.vercel.app/product-details/${ProductDetailsController.to.product.value.id}');
                          },
                          child: Icon(
                            Icons.share,
                            color: Colors.black.withOpacity(.4),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                Obx(() {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // decoration: BoxDecoration(
                    //     color: AppColors.kAccentColor,
                    //     borderRadius: BorderRadius.circular(4),
                    //     border: Border.all(color: AppColors.kAccentColor, width: 1.5),
                    //     boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (ProductDetailsController.to.product.value.variationType == 'shade')
                          Wrap(
                            children: ProductDetailsController.to.product.value.productShades!
                                .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                .offers!
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ).copyWith(right: 8),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await HomeApiController.to.offerDetailsCall(e.productDetails!.offer!.id!);
                                        Get.toNamed(OfferDetailsScreen.routeName);
                                      },
                                      child: Text(
                                        e.productDetails!.offer?.title1 ?? '-',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue,
                                            decoration: TextDecoration.underline,
                                            decorationColor: Colors.blue,
                                            height: 1.3,
                                            decorationThickness: 1,
                                            decorationStyle: TextDecorationStyle.solid),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        else
                          Wrap(
                            children: ProductDetailsController.to.product.value.productSizes!
                                .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                .offers!
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ).copyWith(right: 8),
                                    child: Text(
                                      e.productDetails!.offer!.offerTypeId == '3' ? e.productDetails!.offer!.name! : e.productDetails!.offer!.title1!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          height: 1.3,
                                          decorationThickness: 1,
                                          decorationStyle: TextDecorationStyle.solid),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                      ],
                    ),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                Obx(() {
                  return Column(
                    children: ProductDetailsController.to.product.value.variationType == 'shade'
                        ? [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                              child: Row(
                                children: [
                                  Text(
                                    ProductDetailsController.to.product.value.productShades!
                                        .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                        .shade!
                                        .name!,
                                    style: AppTheme.textStyleBoldFadeBlack14,
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(ProductShadeScreen.routeName);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'All Shades (${ProductDetailsController.to.product.value.allShadesCount!})',
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.kPrimaryColor),
                                        ),
                                        Image.asset(
                                          'assets/arrow_right.png',
                                          height: 14,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 66,
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final shade = ProductDetailsController.to.product.value.productShades![index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          ProductDetailsController.to.selectedVariation.value = shade.shadeId!;
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: shade.shadeId == ProductDetailsController.to.selectedVariation.value ? Colors.white : Colors.transparent,
                                                border: Border.all(
                                                    color: shade.shadeId == ProductDetailsController.to.selectedVariation.value ? Colors.white : Colors.transparent, width: 1.5),
                                                borderRadius: BorderRadius.circular(5),
                                                boxShadow: shade.shadeId == ProductDetailsController.to.selectedVariation.value
                                                    ? [
                                                        BoxShadow(
                                                          color: Colors.black38,
                                                          blurRadius: 5,
                                                        )
                                                      ]
                                                    : [],
                                              ),
                                              child: CustomNetworkImage(
                                                networkImagePath: shade.shade!.image!,
                                                errorImagePath: AssetsConstant.lipstickShade,
                                                height: 48,
                                                width: 48,
                                                borderRadius: 4,
                                              ),
                                            ),
                                            shade.shadeId == ProductDetailsController.to.selectedVariation.value && shade.stock!.toInt() != 0
                                                ? const Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                  )
                                                : const SizedBox.shrink(),
                                            shade.stock!.toInt() == 0
                                                ? Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        'Out of Stock',
                                                        style: AppTheme.textStyleNormalRed12.copyWith(fontSize: 8, color: Colors.white),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox.shrink()
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                                itemCount: ProductDetailsController.to.product.value.productShades!.length,
                              ),
                            ),
                            // Obx(
                            //   () => RichText(
                            //     text: TextSpan(
                            //       text: "Available stock: ",
                            //       style: AppTheme.textStyleNormalBlack14,
                            //       children: [
                            //         TextSpan(
                            //           text: ProductDetailsController.to.product.value.productShades!
                            //               .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                            //               .stock
                            //               .toString(),
                            //           style: AppTheme.textStyleBoldBlack14,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ]
                        : [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                              child: Row(
                                children: [
                                  const Text(
                                    'Selected Size - ',
                                    style: AppTheme.textStyleBoldFadeBlack14,
                                  ),
                                  Text(
                                    ProductDetailsController.to.product.value.productSizes!
                                        .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                        .size!
                                        .name!,
                                    style: AppTheme.textStyleBoldBlack14,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: SizedBox(
                                height: 42,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ProductDetailsController.to.product.value.productSizes!.length,
                                  itemBuilder: (context, index) {
                                    final size = ProductDetailsController.to.product.value.productSizes![index];
                                    return Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          // if (size.stock!.toInt() != 0) {
                                          ProductDetailsController.to.selectedVariation.value = size.sizeId!;
                                          // } else {
                                          //   showSnackBar(msg: 'Out of Stock');
                                          // }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 6),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: size.sizeId == ProductDetailsController.to.selectedVariation.value
                                                ? size.stock!.toInt() == 0
                                                    ? const Color(0xff021f5e)
                                                    : AppColors.kPrimaryColor
                                                : size.stock!.toInt() == 0
                                                    ? const Color(0xff021f5e)
                                                    : Colors.transparent,
                                            border: Border.all(
                                                color: size.sizeId == ProductDetailsController.to.selectedVariation.value
                                                    ? AppColors.kPrimaryColor
                                                    : size.stock!.toInt() == 0
                                                        ? const Color(0xff021f5e)
                                                        : AppColors.kPrimaryColor,
                                                width: 1.5),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          child: Text(
                                            size.size!.name!,
                                            textAlign: TextAlign.center,
                                            style: size.sizeId == ProductDetailsController.to.selectedVariation.value
                                                ? AppTheme.textStyleSemiBoldWhite14
                                                : AppTheme.textStyleSemiBoldFadeBlack14.copyWith(
                                                    color: size.stock!.toInt() == 0 ? Colors.white : Colors.black54,
                                                  ),
                                          ),
                                        ),
                                      );
                                    });
                                    // return Container(
                                    //   margin: const EdgeInsets.symmetric(horizontal: 6),
                                    //   alignment: Alignment.center,
                                    //   decoration: BoxDecoration(
                                    //       color: index == 0 ? AppColors.kPrimaryColor : Colors.transparent,
                                    //       border: Border.all(color: AppColors.kPrimaryColor, width: 1.5),
                                    //       borderRadius: BorderRadius.circular(4)),
                                    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    //   child: Text(
                                    //     '180ml',
                                    //     textAlign: TextAlign.center,
                                    //     style: index == 0 ? AppTheme.textStyleSemiBoldWhite14 : AppTheme.textStyleSemiBoldFadeBlack14,
                                    //   ),
                                    // );
                                  },
                                ),
                              ),
                            ),
                            // CustomSizedBox.space8H,
                            // Obx(
                            //   () => RichText(
                            //     text: TextSpan(
                            //       text: "Available stock: ",
                            //       style: AppTheme.textStyleNormalBlack14,
                            //       children: [
                            //         TextSpan(
                            //           text: ProductDetailsController.to.product.value.productSizes!
                            //               .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                            //               .stock
                            //               .toString(),
                            //           style: AppTheme.textStyleBoldBlack14,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // CustomSizedBox.space8H
                          ],
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: AppColors.kAccentColor),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          width: MediaQuery.of(context).size.width / 2.2,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsConstant.authenticIcon,
                                height: 24,
                              ),
                              CustomSizedBox.space8W,
                              const Text(
                                '100% Authentic',
                                style: TextStyle(color: Colors.black54, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        CustomSizedBox.space4W,
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(color: AppColors.kAccentColor),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsConstant.returnIcon,
                                height: 24,
                              ),
                              CustomSizedBox.space8W,
                              const Text(
                                'Easy Return Policy',
                                style: TextStyle(color: Colors.black54, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const TitleTextWidget(
                  tileText: 'Product Description',
                ),
                const Divider(
                  color: Color(0xffECECEC),
                  thickness: 1.5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xffECECEC), width: 1.5)),
                  ),
                  child: TabBar(
                      isScrollable: true,
                      padding: EdgeInsets.zero,
                      labelColor: AppColors.kBlackColor,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: AppTheme.textStyleBoldBlack14,
                      unselectedLabelStyle: AppTheme.textStyleBoldFadeBlack14,
                      indicatorColor: AppColors.kPrimaryColor,
                      dividerColor: AppColors.kPrimaryColor,
                      labelPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      controller: ProductDetailsController.to.tabController2,
                      tabs: ProductDetailsController.to.tabTiles2.map((String title) {
                        return Tab(
                          text: title,
                        );
                      }).toList()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .4,
                  child: TabBarView(
                      controller: ProductDetailsController.to.tabController2,
                      children: List.generate(ProductDetailsController.to.tabTiles2.length, (index) => buildwidget(index, context))),
                ),
                const Divider(thickness: 1.5, color: Color(0xffECECEC)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(ProductDescriptionScreen.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Read More',
                            style: AppTheme.textStyleSemiBoldPrimary14,
                          ),
                          CustomSizedBox.space8W,
                          Icon(
                            CupertinoIcons.chevron_down,
                            color: AppColors.kPrimaryColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 8, color: Color(0xffECECEC)),
                const TitleTextWidget(tileText: 'Ratings & Reviews'),
                const Divider(thickness: 1.5, color: Color(0xffECECEC)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppColors.kAccentColor, borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsConstant.reviewTop,
                        height: 24,
                      ),
                      CustomSizedBox.space16W,
                      const Flexible(
                        child: Text(
                          'Perfecto is committed to showing genuine and verified reviews.',
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                CustomSizedBox.space12H,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        '${(double.tryParse(ProductDetailsController.to.product.value.reviewsAvgStar!) ?? 0).toStringAsFixed(2)}/5',
                        style: AppTheme.textStyleSemiBoldBlack32,
                      ),
                      CustomSizedBox.space8W,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Overall Ratings',
                            style: AppTheme.textStyleSemiBoldBlack12,
                          ),
                          Text(
                            '${int.tryParse(ProductDetailsController.to.product.value.reviewsCount!) ?? 0} verified ratings',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black54),
                          )
                        ],
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
                ),
                Obx(
                  () => ProductDetailsController.to.reviewImages.isNotEmpty
                      ? GestureDetector(
                          onTap: () async {
                            ProductDetailsController.to.reviewFilterList.firstWhere((element) => element['key'] == 'with_image')['is_selected'] = true;
                            ProductDetailsController.to.reviewFilterList.refresh();
                            ProductDetailsController.to.update();
                            await ProductDetailsController.to.getAllReviews(addition: {'with_image': '1'});

                            Get.toNamed(ReviewScreen.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: SizedBox(
                              height: 86,
                              child: ListView.builder(
                                // itemCount: ProductDetailsController.to.product.value.reviews!.map((e) => e.productReviewImages!.length).toList().sum,
                                itemCount: ProductDetailsController.to.reviewImages.length > 4 ? 4 : ProductDetailsController.to.reviewImages.length,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final reviewImage = ProductDetailsController.to.reviewImages[index];
                                  // ProductDetailsController.to.product.value.reviews!.map((e) => e.productReviewImages!).reduce((value, element) => value + element)[index];
                                  return Stack(
                                    children: [
                                      Container(
                                        height: 72,
                                        width: 72,
                                        margin: const EdgeInsets.symmetric(vertical: 8).copyWith(left: 16),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xffCECECE), width: 1),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        child: CustomNetworkImage(
                                          networkImagePath: reviewImage.image!,
                                          fit: BoxFit.cover,
                                          errorImagePath: AssetsConstant.megaDeals2,
                                          borderRadius: 2,
                                        ),
                                      ),
                                      if (ProductDetailsController.to.reviewImages.length > 4 && 3 == index)
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          left: 0,
                                          bottom: 0,
                                          child: Container(
                                            height: 72,
                                            width: 72,
                                            margin: const EdgeInsets.symmetric(vertical: 8).copyWith(left: 16),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: const Color(0xffCECECE), width: 1),
                                              borderRadius: BorderRadius.circular(2),
                                              color: Colors.black.withOpacity(.4),
                                              // image: const DecorationImage(
                                              //     image: AssetImage(
                                              //       AssetsConstant.megaDeals2,
                                              //     ),
                                              //     fit: BoxFit.cover),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '+${ProductDetailsController.to.reviewImages.length - 4}',
                                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                const TitleTextWidget(tileText: 'Most Useful Review'),
                ...List.generate(
                  ProductDetailsController.to.product.value.reviews!.length,
                  (index) => CommentWidget(
                    index: 1,
                    readMore: false,
                    reviews: ProductDetailsController.to.product.value.reviews![index],
                    fromProductDetails: true,
                  ),
                ),
                CustomSizedBox.space12H,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    ProductDetailsController.to.reviewFilterList.firstWhere((element) => element['key'] == 'with_image')['is_selected'] = false;
                    ProductDetailsController.to.reviewFilterList.refresh();
                    ProductDetailsController.to.update();
                    await ProductDetailsController.to.getAllReviews();
                    Get.toNamed(ReviewScreen.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Read All Reviews',
                            style: AppTheme.textStyleSemiBoldPrimary14,
                          ),
                          Icon(
                            CupertinoIcons.right_chevron,
                            color: AppColors.kPrimaryColor,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CustomSizedBox.space12H,
                PrimaryAcceantListViewItemWidget(
                  productList: ProductDetailsController.to.productList,
                  title: 'Customers also Viewed',
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
        child: Row(
          children: [
            CustomSizedBox.space8W,
            Obx(() {
              return GestureDetector(
                onTap: () async {
                  if (AuthController.to.isLoggedIn.value) {
                    await UserController.to.addToWish(ProductDetailsController.to.product.value.id!);
                  } else {
                    Get.toNamed(LoginScreen.routeName);
                  }
                },
                child: Container(
                  height: 46,
                  width: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(border: Border.all(color: AppColors.kPrimaryColor, width: 1), borderRadius: BorderRadius.circular(4)),
                  child: AuthController.to.isLoggedIn.value && UserController.to.wishList.any((element) => element.productId == ProductDetailsController.to.product.value.id)
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
            Expanded(
              child: Obx(() {
                final cartModel = AuthController.to.isLoggedIn.value ? UserController.to.checkCart() : true;

                return (cartModel == null || cartModel == true)
                    ? CustomButton(
                        label: (ProductDetailsController.to.product.value.variationType == 'size'
                                ? ProductDetailsController.to.product.value.productSizes!
                                        .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                        .stock ==
                                    '0'
                                : ProductDetailsController.to.product.value.productShades!
                                        .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                        .stock ==
                                    '0')
                            ? 'Request for Stock'
                            : 'Add To Bag',
                        marginHorizontal: 8,
                        elevation: 0,
                        marginVertical: 4,
                        height: 46,
                        isBorder: false,
                        prefixImage: (ProductDetailsController.to.product.value.variationType == 'size'
                                ? ProductDetailsController.to.product.value.productSizes!
                                        .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                        .stock ==
                                    '0'
                                : ProductDetailsController.to.product.value.productShades!
                                        .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                        .stock ==
                                    '0')
                            ? AssetsConstant.stockIcon
                            : AssetsConstant.cartIcon,
                        prefixImageColor: Colors.white,
                        prefixImageHeight: 20,
                        primary: HomeController.to.generalSettings.value.buyStatus == '1' ? AppColors.kPrimaryColor : AppColors.kDarkPrimaryColor,
                        width: MediaQuery.of(context).size.width / 1.3,
                        onPressed: () {
                          if (AuthController.to.isLoggedIn.value) {
                            if (HomeController.to.generalSettings.value.buyStatus == '0') {
                              showSnackBar(msg: "Our Buy option is disabled. Please try again later.");
                            } else {
                              if (ProductDetailsController.to.product.value.variationType == 'size'
                                  ? ProductDetailsController.to.product.value.productSizes!
                                          .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                          .stock ==
                                      '0'
                                  : ProductDetailsController.to.product.value.productShades!
                                          .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                          .stock ==
                                      '0') {
                                final data = {
                                  "product_id": ProductDetailsController.to.product.value.id!,
                                  if (ProductDetailsController.to.product.value.variationType == 'size') "size_id": ProductDetailsController.to.selectedVariation.value,
                                  if (ProductDetailsController.to.product.value.variationType == 'shade') "shade_id": ProductDetailsController.to.selectedVariation.value,
                                };
                                globalLogger.d(data);

                                UserController.to.stockRequest(data);
                              } else {
                                final data = {
                                  "product_id": ProductDetailsController.to.product.value.id!,
                                  if (ProductDetailsController.to.product.value.variationType == 'size') "size_id": ProductDetailsController.to.selectedVariation.value,
                                  if (ProductDetailsController.to.product.value.variationType == 'shade') "shade_id": ProductDetailsController.to.selectedVariation.value,
                                  "quantity": '1',
                                };
                                globalLogger.d(data);

                                UserController.to.addToCart(data);
                              }
                            }
                          } else {
                            Get.toNamed(LoginScreen.routeName);
                          }
                        },
                      )
                    : Container(
                        height: 46,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.kPrimaryColor,
                              width: 1,
                            ),
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(4)),
                        // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (int.parse((cartModel).quantity!) >
                                    (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) : */ 1)) {
                                  final dynamic body = {
                                    // 'product_id': (cartModel as CartModel)!.productId!,
                                    'quantity': (int.parse((cartModel).quantity!) -
                                            (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) :*/ 1))
                                        .toString(),
                                  };
                                  globalLogger.d(body, error: 'body');
                                  UserController.to.updateCart(body, (cartModel).id ?? '');
                                } else {
                                  // UserController.to.removeFromCart((cartModel as CartModel)?.id ?? '');
                                  showSnackBar(msg: 'One Quantity is minimum');
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  Icons.remove,
                                  color: int.parse((cartModel as CartModel).quantity!) ==
                                          (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) :*/ 1)
                                      ? AppColors.kAccentColor
                                      : Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: .5,
                              color: AppColors.kPrimaryColor,
                              // margin: const EdgeInsets.symmetric(horizontal: 8),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${(cartModel).quantity} Added',
                                  style: AppTheme.textStyleMediumWhite14,
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: .5,
                              color: AppColors.kPrimaryColor,
                              // margin: const EdgeInsets.symmetric(horizontal: 8),
                            ),
                            GestureDetector(
                              onTap: () {
                                final dynamic body = {
                                  // 'product_id': (cartModel as CartModel)!.productId!,
                                  'quantity': (int.parse((cartModel).quantity!) +
                                          (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) : */ 1))
                                      .toString(),
                                };
                                globalLogger.d(body, error: 'body');
                                UserController.to.updateCart(body, (cartModel).id ?? '');
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              }),
            ),
            CustomSizedBox.space8W,
          ],
        ),
      ),
    );
  }
}

Widget buildwidget(int tabIndex, BuildContext context) {
  switch (tabIndex) {
    case 0:
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          alignment: Get.currentRoute == ProductDescriptionScreen.routeName ? Alignment.topLeft : Alignment.bottomCenter,
          children: [
            // Container(
            //   width: double.infinity,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: const DecorationImage(image: AssetImage(AssetsConstant.banner2), fit: BoxFit.fitWidth)),
            // ),
            Html(
              data: findAndRemove(findAndRemove(ProductDetailsController.to.product.value.description!, 'margin', ';'), 'line-height', ';'),
              style: {
                'body': Style(
                  margin: Margins.symmetric(horizontal: 0, vertical: 0),
                  fontSize: FontSize(14),
                  lineHeight: LineHeight.number(.9),
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: /*showMore ? 5000 :*/ 5, /*textAlign: TextAlign.justify*/
                ),
              },
            ),
            if (Get.currentRoute != ProductDescriptionScreen.routeName)
              Container(
                width: double.infinity,
                height: 9,
                decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.white, blurRadius: 60, spreadRadius: 50)]),
              ),
          ],
        ),
        /*Positioned(
                    bottom: MediaQuery.of(context).size.width > 600 ? 28 : 16,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(
                                */ /*MediaQuery.of(context).size.width>600?20:*/ /* 10)),
                        child: Image.asset(
                          AssetsConstant.shade,
                          color: const Color(0xffBABABA).withOpacity(.8),
                        ))),*/
      );
    case 1:
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Html(
          data: findAndRemove(findAndRemove(ProductDetailsController.to.product.value.ingredientDescription!, 'margin', ';'), 'line-height', ';'),
          style: {
            'body': Style(
              margin: Margins.symmetric(horizontal: 0, vertical: 0),
              fontSize: FontSize(14),
              lineHeight: LineHeight.number(.9),
              textOverflow: TextOverflow.ellipsis,
              maxLines: /*showMore ? 5000 :*/ 5, /*textAlign: TextAlign.justify*/
            ),
          },
        ),
        /* Text(
            'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
            style: AppTheme.textStyleSemiBoldBlack14,
          ),*/
      );
    case 2:
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Html(
          data: findAndRemove(findAndRemove(ProductDetailsController.to.product.value.howToUse!, 'margin', ';'), 'line-height', ';'),
          style: {
            'body': Style(
              margin: Margins.symmetric(horizontal: 0, vertical: 0),
              fontSize: FontSize(14),
              lineHeight: LineHeight.number(.9),
              textOverflow: TextOverflow.ellipsis,
              maxLines: /*showMore ? 5000 :*/ 5, /*textAlign: TextAlign.justify*/
            ),
          },
        ),

        /* Text(
            'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
            style: AppTheme.textStyleSemiBoldBlack14,
          ),*/
      );
    case 3:
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Html(
          data: findAndRemove(findAndRemove(ProductDetailsController.to.product.value.faq!, 'margin', ';'), 'line-height', ';'),
          style: {
            'body': Style(
              margin: Margins.symmetric(horizontal: 0, vertical: 0),
              fontSize: FontSize(14),
              lineHeight: LineHeight.number(.9),
              textOverflow: TextOverflow.ellipsis,
              maxLines: /*showMore ? 5000 :*/ 5, /*textAlign: TextAlign.justify*/
            ),
          },
        ), /*Text(
            'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
            style: AppTheme.textStyleSemiBoldBlack14,
          ),*/
      );

    default:
      return const Center(
        child: Text(
          'Unknown Tab',
          style: TextStyle(fontSize: 10),
        ),
      );
  }
}
