import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/utils/list_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/home_model.dart';
import 'package:perfecto/models/product_model.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/pages/product-details/product_shade_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../controller/home_api_controller.dart';
import '../../offer/sale_page.dart';
import '../../product-details/product_details_controller.dart';

class TopBrandsOfferListWidget extends StatelessWidget {
  const TopBrandsOfferListWidget({
    super.key,
    required this.sectionData,
  });
  final SectionData sectionData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: AppColors.kDarkPrimaryColor.withOpacity(.12), blurRadius: 12)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            networkImagePath: sectionData.image!,
            width: double.infinity,
            borderRadius: 10,
            fit: BoxFit.fill,
            errorImagePath: AssetsConstant.verticalBannner,
            borderRadiusOrg: const BorderRadius.vertical(top: Radius.circular(10)),
          ),
          // Image.network(
          //   '',
          //   errorBuilder: (context, error, stackTrace) => Image.asset(AssetsConstant.verticalBannner),
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(bottom: 4),
            child: Text(
              sectionData.offers?.title1 ?? '-',
              style: const TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(top: 0),
            child: Text(
              sectionData.offers?.title2 ?? '-',
              style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerListWidget extends StatelessWidget {
  final bool isBestSeller;
  final ProductModel? product;
  const BestSellerListWidget({
    super.key,
    this.isBestSeller = true,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await HomeApiController.to.productDetailsCall(product!.id!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            Container(
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: AppColors.kDarkPrimaryColor.withOpacity(.10), blurRadius: 8)]),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomNetworkImage(
                          networkImagePath: product?.image ?? '', height: 168, width: 180, errorImagePath: AssetsConstant.megaDeals1, borderRadius: 10, fit: BoxFit.fill),
                      if (HomeApiController.to.checkSingleProduct(product!) && product?.totalStock == '0')
                        Container(
                          height: 168,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Out of Stock'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'InriaSans',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(10),
                      //   child: Image.network(
                      //     '',
                      //     errorBuilder: (context, error, stackTrace) {
                      //       return Image.asset(AssetsConstant.megaDeals1, fit: BoxFit.fitWidth, height: 168, width: 180);
                      //     },
                      //   ),
                      // ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Color(0xffFFF2D9),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: AppColors.kOfferButtonColor,
                                    size: 15,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '',
                                      style: AppTheme.textStyleBoldBlack14,
                                      children: [
                                        TextSpan(
                                          text: double.parse(product?.reviewsAvgStar ?? '4.4').toStringAsFixed(2),
                                          style: AppTheme.textStyleBoldBlack10,
                                        ),
                                        const TextSpan(
                                          text: ' | ',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100, color: Colors.black54),
                                        ),
                                        TextSpan(
                                          text:
                                              "(${int.parse(product?.reviewsCount ?? '0') > 999 ? '${(int.parse(product?.reviewsCount ?? '0') / 1000).toStringAsFixed(1)}k' : product?.reviewsCount ?? 0})",
                                          style: TextStyle(color: Colors.black.withOpacity(.8), fontSize: 8, fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if ((product?.allShadesCount ?? '0') != '0')
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  children: [
                                    CustomNetworkImage(
                                        networkImagePath: product?.productShades?[0].shade?.image ?? '',
                                        height: 13,
                                        width: 13,
                                        errorImagePath: AssetsConstant.lipstickShade,
                                        borderRadius: 2,
                                        fit: BoxFit.fill),
                                    // Image.asset(
                                    //   AssetsConstant.lipstickShade,
                                    //   height: 13,
                                    // ),
                                    CustomSizedBox.space4W,
                                    Text(
                                      '${(int.tryParse(product?.allShadesCount ?? '0') ?? 0) > 30 ? '+${product?.allShadesCount ?? '0'}' : product?.allShadesCount ?? '0'} shades',
                                      style: const TextStyle(color: Colors.black54, fontSize: 10, fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),

                        // Container(
                        //     padding: const EdgeInsets.all(4),
                        //     decoration: const BoxDecoration(
                        //       color: Color(0xffFFF2D9),
                        //       borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         const Icon(
                        //           Icons.star_rate_rounded,
                        //           color: AppColors.kOfferButtonColor,
                        //           size: 15,
                        //         ),
                        //         RichText(
                        //             text: const TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                        //           TextSpan(
                        //             text: '4.4',
                        //             style: AppTheme.textStyleBoldBlack10,
                        //           ),
                        //           TextSpan(
                        //             text: ' | ',
                        //             style: AppTheme.textStyleNormalFadeBlack12,
                        //           ),
                        //           TextSpan(
                        //             text: '(255)',
                        //             style: TextStyle(color: Colors.black54, fontSize: 8, fontWeight: FontWeight.bold),
                        //           )
                        //         ])),
                        //       ],
                        //     )),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product?.name ?? 'Maybelline New York Superstay Vinyl Ink',
                            style: AppTheme.textStyleBoldBlack12.copyWith(fontFamily: 'InriaSans', fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if ((product?.allSizesCount ?? '0') != '0')
                          Text(
                            product?.productSizes?[0].size?.name ?? '30ml',
                            style: AppTheme.textStyleNormalBlack12,
                          ),
                        CustomSizedBox.space4H,
                        flatten(product!.variationType == 'shade' ? product!.productShades!.map((e) => e.offers!).toList() : product!.productSizes!.map((e) => e.offers!).toList())
                                .where((element) => element.productDetails?.offer?.offerTypeId == '3')
                                .isNotEmpty
                            ? Wrap(
                                children: flatten(product!.variationType == 'shade'
                                        ? product!.productShades!.map((e) => e.offers!).toList()
                                        : product!.productSizes!.map((e) => e.offers!).toList())
                                    .where((element) => element.productDetails?.offer?.offerTypeId == '3')
                                    .toList()
                                    .take(2)
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                          child: Container(
                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                              decoration: BoxDecoration(color: AppColors.kOfferButtonColor, borderRadius: BorderRadius.circular(2)),
                                              child: Text(e.productDetails?.offer?.name ?? '-', style: AppTheme.textStyleBoldWhite10)),
                                        ))
                                    .toList(),
                              )
                            : const SizedBox.shrink(),
                        product!.isFreeDelivery == '1'
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                    decoration: BoxDecoration(color: AppColors.kFreeDeliveryButtonColor, borderRadius: BorderRadius.circular(2)),
                                    child: const Text('Free Delivery', style: AppTheme.textStyleBoldWhite10)),
                              )
                            : const SizedBox.shrink(),
                        // RichText(
                        //     text: const TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                        //   TextSpan(
                        //     text: '৳ 550  ',
                        //     style: AppTheme.textStyleBoldBlack14,
                        //   ),
                        //   TextSpan(
                        //     text: '৳550',
                        //     style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.normal),
                        //   ),
                        //   TextSpan(
                        //     text: ' | ',
                        //     style: AppTheme.textStyleNormalBlack12,
                        //   ),
                        //   TextSpan(
                        //     text: '(-25% Off)',
                        //     style: TextStyle(color: Color(0xff02792A), fontSize: 10, fontWeight: FontWeight.bold),
                        //   )
                        // ])),
                        RichText(
                          text: TextSpan(
                            text: '',
                            style: AppTheme.textStyleBoldBlack14,
                            children: [
                              TextSpan(
                                text:
                                    '৳ ${product?.variationType == 'shade' ? (product?.productShades?[0].discountedPrice ?? '550') : (product?.productSizes?[0].discountedPrice ?? '550')}  ',
                                style: AppTheme.textStyleBoldBlack14,
                                children: (double.parse(product?.variationType == 'shade'
                                            ? (product?.productShades?[0].discountPercent ?? '0')
                                            : (product?.productSizes?[0].discountPercent ?? '0')) >
                                        0)
                                    ? [
                                        TextSpan(
                                          text:
                                              '৳${product?.variationType == 'shade' ? (product?.productShades?[0].shadePrice ?? '550') : (product?.productSizes?[0].sizePrice ?? '55'
                                                  '0')}',
                                          style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.normal),
                                        ),
                                        const TextSpan(
                                          text: ' | ',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, color: Colors.black45),
                                        ),
                                        TextSpan(
                                          text:
                                              '(-${double.parse(product?.variationType == 'shade' ? (product?.productShades?[0].discountPercent ?? '0') : (product?.productSizes?[0].discountPercent ?? '0'))}% Off)',
                                          style: const TextStyle(color: Color(0xff02792A), fontSize: 10, fontWeight: FontWeight.w700),
                                        )
                                      ]
                                    : [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    label: product?.totalStock != '0'
                        ? "OUT OF STOCK"
                        : product?.variationType == 'shade'
                            ? 'SELECT SHADE'
                            : 'SELECT SIZE',
                    labelStyle: const TextStyle(color: AppColors.kWhiteColor, fontSize: 12, fontWeight: FontWeight.w700),
                    marginHorizontal: 8,
                    marginVertical: 8,
                    height: 39,
                    primary: HomeController.to.generalSettings.value.buyStatus == '1' ? null : AppColors.kDarkPrimaryColor,
                    onPressed: ((HomeApiController.to.checkSingleProduct(product!) && product?.totalStock == '0'))
                        ? () {
                            if (AuthController.to.isLoggedIn.value) {
                              final data = {
                                "product_id": product!.id!,
                                if (product!.variationType == 'size') "size_id": product!.sizeId![0],
                                if (product!.variationType == 'shade') "shade_id": product!.shadeId![0],
                              };
                              globalLogger.d(data);

                              UserController.to.stockRequest(data);
                            }
                          }
                        : () async {
                            // await HomeApiController.to.productDetailsCall(product!.id!);
                            if (HomeController.to.generalSettings.value.buyStatus == '0') {
                              showSnackBar(msg: HomeController.to.generalSettings.value.buyStatusNote ?? "Our Buy option is disabled. Please try again later.");
                            } else {
                              Get.put(ProductDetailsController());
                              await ProductDetailsController.to.getProductDetails(product!.id!);
                              Get.to(ProductShadeScreen(
                                isSelectSize: product?.variationType == 'shade' ? false : true,
                              ));
                            }
                          },
                  )
                ],
              ),
            ),
            isBestSeller
                ? Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xffD4F3FF),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
                    ),
                    child: const Text(
                      'Bestseller',
                      style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class BestSellerListViewBuilder extends StatelessWidget {
  const BestSellerListViewBuilder({
    super.key,
    this.model,
  });
  final HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffEAF9FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TitleTextWidget(tileText: model?.mobileTitle ?? 'Bestseller'),
              const Spacer(),
              // InkWell(
              //   onTap: () {
              //     // HomeApiController.to.productListWithCategoryCall({
              //     //   'category': [category.id!].toString(),
              //     // });
              //     // Get.toNamed(SingleCategoryWiseScreen.routeName);
              //   },
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.0),
              //     child: Text(
              //       'See All',
              //       style: TextStyle(
              //         fontSize: 12,
              //         color: AppColors.kPrimaryColor,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 380,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 16),
              scrollDirection: Axis.horizontal,
              itemCount: model?.productList?.length ?? 5,
              itemBuilder: (context, index) {
                final product = model?.productList?[index];
                return BestSellerListWidget(
                  product: product,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class SegmentGridWidget extends StatelessWidget {
  final String? blueBackground;
  final Widget? img;
  final String? networkImg;
  final Widget? widgetinBlueShade;
  final HomeModel model;
  const SegmentGridWidget({
    super.key,
    this.blueBackground,
    this.img,
    this.widgetinBlueShade,
    this.networkImg,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 200, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemCount: model.sectionData?.length ?? 8,
      itemBuilder: (context, index) {
        final category = model.sectionData?[index];

        return GestureDetector(
          onTap: () async {
            globalLogger.d(category.toJson());
            if (category.categories != null) {
              HomeApiController.to.categoryList.firstWhere((element) => element.id == category.categories!.id!).isChecked = true;
              HomeApiController.to.categoryList.refresh();
              HomeApiController.to.update();
              NavigationController.to.addAttribute = {
                'category': [category.categories!.id!].toString()
              };
            } else {
              NavigationController.to.attributeList
                  .firstWhere((element) => element.keyName == 'concern')
                  .attributes
                  .firstWhere((element) => element.id == category.concerns!.id!)
                  .filtered = true;
              NavigationController.to.attributeList.refresh();
              NavigationController.to.update();
              NavigationController.to.addAttribute = {
                'concern': [category.concerns!.id!].toString()
              };
            }
            HomeApiController.to.productListWithCategoryCall(NavigationController.to.addAttribute);
            Get.toNamed(SingleCategoryWiseScreen.routeName);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), image: DecorationImage(image: AssetImage(blueBackground ?? AssetsConstant.blueBackground), fit: BoxFit.fitWidth)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // img ??
                CustomNetworkImage(
                  networkImagePath: category?.image ?? '',
                  height: 180,
                  width: 180,
                  errorImagePath: AssetsConstant.megaDealsForeground,
                  borderRadius: 10,
                  fit: BoxFit.fill,
                ),
                // img ??
                //     Image.network(networkImg ?? '', errorBuilder: (context, error, stackTrace) {
                //       return Image.asset(
                //         AssetsConstant.megaDealsForeground,
                //         fit: BoxFit.fitHeight,
                //         height: 180,
                //         alignment: Alignment.center,
                //       );
                //     }, alignment: Alignment.center),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/blue_background1.png',
                    )),
                // widgetinBlueShade ??
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: category!.categories == null
                        ? Column(
                            children: [
                              Text(
                                category.concerns?.name ?? 'Concern',
                                style: AppTheme.textStyleBoldWhite16,
                              ),
                              Text(
                                category.concerns?.name ?? 'Concern',
                                style: AppTheme.textStyleNormalWhite10,
                              )
                            ],
                          )
                        : Text(
                            category.categories?.name ?? 'Category',
                            style: AppTheme.textStyleBoldWhite20,
                            textAlign: TextAlign.center,
                          ))
              ],
            ),
          ),
        );
      },
    );
  }
}

class GreetingCardWidget extends StatelessWidget {
  const GreetingCardWidget({
    super.key,
    required this.model,
  });

  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomNetworkImage(
              networkImagePath: model.banner ?? '', height: 220, width: double.infinity, borderRadius: 0, fit: BoxFit.fill, errorImagePath: AssetsConstant.bottomGrettings),
        ),
        SizedBox(
          width: double.infinity,
          height: 220,
          // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(model.banner ?? '') /* AssetImage(AssetsConstant.bottomGrettings)*/, fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSizedBox.space8H,
              // Image.asset(
              //   'assets/Enhance_Your_Beauty_With_ Perfecto.png',
              //   height: 46,
              // ),
              CustomNetworkImage(
                  networkImagePath: model.sectionData?[0].image ?? '-',
                  height: 46,
                  width: 160,
                  borderRadius: 0,
                  fit: BoxFit.fill,
                  errorImagePath: 'assets/Enhance_Your_Beauty_With_ P'
                      'erfecto.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  model.sectionData?[0].description ??
                      'With vast experience in the cosmetics industry, who sourcing cosmetics, skincare and hair care on a global level. We deliver the highest quality products of world renowned at the most affordable prices. We believe that everyone – no matter their sex, ethnicity, age, budget or location – should be thrilled by Perfecto.',
                  style: AppTheme.textStyleMediumBlack12,
                  textAlign: TextAlign.center,
                ),
              ),
              // CustomNetworkImage(
              //     networkImagePath: model.banner ?? '', height: 50, width: double.infinity, borderRadius: 0, fit: BoxFit.fill, errorImagePath: AssetsConstant.bottomGrettings),
            ],
          ),
        ),
      ],
    );
  }
}
