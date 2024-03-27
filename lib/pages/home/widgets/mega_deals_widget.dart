import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/list_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/models/home_model.dart';
import 'package:perfecto/models/product_model.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/category/widgets/single_category_product_widget.dart';
import 'package:perfecto/pages/home/home_page.dart';
import 'package:perfecto/pages/offer/sale_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/pages/product-details/combo_details_page.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import 'dart:ui' as sz;

class MegaDealsWidget extends StatelessWidget {
  // final String name;

  // final String img;

  final ProductModel? product;
  // final int rate;
  // final String price;
  // final String previousPrice;
  // final bool isStacked;
  // final bool isBestSeller;
  // final bool isBuy1Get1;
  const MegaDealsWidget({
    super.key,
    // required this.name,
    // required this.rate,
    // required this.price,
    // required this.previousPrice,
    // this.isStacked = false,
    // this.isBestSeller = false,
    // this.isBuy1Get1 = true,
    // required this.img,
    this.product,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.put(ProductDetailsController());
        if (product!.variationType!.isNotEmpty) {
          await HomeApiController.to.productDetailsCall(product!.id!);
        } else {
          await ProductDetailsController.to.getComboDetails(product?.id ?? '30');
          Get.toNamed(ComboDetailsScreen.routeName);
        }
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: AppColors.kDarkPrimaryColor.withOpacity(.10), blurRadius: 8)]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomNetworkImage(
                    networkImagePath: product?.image ?? '-', height: 109, width: double.infinity, fit: BoxFit.fill, errorImagePath: AssetsConstant.megaDeals1, borderRadius: 10),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Image.network(
                //     '',
                //     errorBuilder: (context, error, stackTrace) {
                //       return Image.asset(
                //         img,
                //         fit: BoxFit.fitWidth,
                //         height: 109,
                //       );
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product?.name ?? '-',
                    style: AppTheme.textStyleBoldBlack12.copyWith(fontFamily: 'InriaSans', fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                product!.variationType!.isNotEmpty &&
                        flatten(product!.variationType == 'shade' ? product!.productShades!.map((e) => e.offers!).toList() : product!.productSizes!.map((e) => e.offers!).toList())
                            .where((element) => element.productDetails?.offer?.offerTypeId == '3')
                            .isNotEmpty
                    ? Wrap(
                        children: flatten(
                                product!.variationType == 'shade' ? product!.productShades!.map((e) => e.offers!).toList() : product!.productSizes!.map((e) => e.offers!).toList())
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      if (product!.variationType!.isNotEmpty)
                        RatingWidget(
                          rating: double.tryParse(product?.reviewsAvgStar ?? '0') ?? 0,
                          showRatingValue: false,
                          starHalfIcon: Icons.star_half_rounded,
                          starFillIcon: Icons.star_rate_rounded,
                          starEmptyIcon: Icons.star_border_rounded,
                          emptyColor: AppColors.kOfferButtonColor,
                        ),

                      if (product!.variationType!.isNotEmpty)
                        Text('(${product?.reviewsCount ?? '0'})', style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 10))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: RichText(
                      text: TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                    TextSpan(
                      text:
                          '৳ ${product!.variationType!.isNotEmpty ? product?.variationType == 'shade' ? (product?.productShades?[0].discountedPrice ?? '550') : (product?.productSizes?[0].discountedPrice ?? '550') : product!.comboPrice ?? '0'}  ',
                      style: AppTheme.textStyleBoldBlack14,
                    ),
                    if (product!.variationType!.isNotEmpty)
                      TextSpan(
                        text: '৳${product?.variationType == 'shade' ? (product?.productShades?[0].shadePrice ?? '550') : (product?.productSizes?[0].sizePrice ?? '55'
                            '0')}',
                        style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.normal),
                      )
                  ])),
                )
              ],
            ),
          ),
          ((product!.variationType!.isNotEmpty &&
                      flatten(product!.variationType == 'shade' ? product!.productShades!.map((e) => e.offers!).toList() : product!.productSizes!.map((e) => e.offers!).toList())
                          .isNotEmpty) ||
                  (product?.bestSale ?? '0') == '1')
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: Row(
                    children: [
                      if ((product?.bestSale ?? '0') == '1')
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xffD4F3FF),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(9), bottomRight: Radius.circular(4)),
                          ),
                          child: const Text(
                            'Bestseller',
                            style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                          ),
                        ),
                      if (product!.variationType!.isNotEmpty &&
                          flatten(product!.variationType == 'shade'
                                  ? product!.productShades!.map((e) => e.offers!).toList()
                                  : product!.productSizes!.map((e) => e.offers!).toList())
                              .isNotEmpty)
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: (product?.bestSale ?? '0') == '1' ? 1 : 0),
                          decoration: BoxDecoration(
                            color: const Color(0xffECDDFF),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular((product?.bestSale ?? '0') == '1' ? 4 : 10), bottomRight: const Radius.circular(4)),
                          ),
                          child: const Text(
                            'Offer',
                            style: TextStyle(color: Color(0xff8513DF), fontSize: 10),
                          ),
                        ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),

          if (product!.variationType!.isEmpty)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xffD4F3FF),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(9), bottomRight: Radius.circular(4)),
                ),
                child: const Text(
                  'COMBO',
                  style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                ),
              ),
            )
          // isStacked
          //     ? isBestSeller
          //         ? Container(
          //             padding: const EdgeInsets.all(4),
          //             decoration: const BoxDecoration(
          //               color: Color(0xffD4F3FF),
          //               borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          //             ),
          //             child: const Text(
          //               'Bestseller',
          //               style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
          //             ),
          //           )
          //         : Container(
          //             padding: const EdgeInsets.all(4),
          //             decoration: const BoxDecoration(
          //               color: Color(0xffECDDFF),
          //               borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          //             ),
          //             child: const Text(
          //               'Offer',
          //               style: TextStyle(color: Color(0xff8513DF), fontSize: 10),
          //             ),
          //           )
          //     : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  final String tileText;
  const TitleTextWidget({
    super.key,
    required this.tileText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Text(
        tileText,
        style: AppTheme.textStyleSemiBoldBlack16,
      ),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  // final String img;
  final Widget? widget;
  // final int? gridItem;
  final double? maxCrossAxisExtent;
  // final List<Map<String, dynamic>> data; // Change this line
  final sz.Size size;
  final HomeModel? model;
  const GridItemWidget({
    Key? key, // Fix the super.key syntax
    required this.size,
    // required this.img,
    this.widget,
    // this.gridItem,
    this.maxCrossAxisExtent,
    // required this.data,
    this.model, // Change this line
  }) : super(key: key); // Fix the super.key syntax

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        globalLogger.d('model: ${Get.currentRoute}');
        Get.toNamed(SaleScreen.routeName, arguments: model);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: /*model!.banner!.isNotEmpty
                ? */
                NetworkImage(
              getImageUrl(model?.banner ?? ''),
            )
            /*:
                AssetImage(img)*/
            ,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            CustomSizedBox.space8H,
            SizedBox(
              height: MediaQuery.of(context).size.width > 800 ? size.height / 1.5 : size.height / 7.5,
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: maxCrossAxisExtent ?? 150,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                // Map<String, dynamic> dataItem = data[index];
                final product = model?.productList?[index];
                return widget ??
                    Padding(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width > 800 ? 8 : 0.0,
                      ),
                      child: MegaDealsWidget(
                        product: product,
                      ),
                    );
              },
              itemCount: Get.currentRoute == MainHomeScreen.routeName
                  ? model!.productList!.length > 6
                      ? 3
                      : model?.productList?.length
                  : model?.productList?.length,
            ),
          ],
        ),
      ),
    );
  }
}

class GridItemForSegmentsWidget extends StatelessWidget {
  final String img;
  final Widget? widget;
  final int? gridItem;
  final double? maxCrossAxisExtent;
  final RxList<dynamic> data; // Change this line
  const GridItemForSegmentsWidget({
    Key? key, // Fix the super.key syntax
    required this.size,
    required this.img,
    this.widget,
    this.gridItem,
    this.maxCrossAxisExtent,
    required this.data, // Change this line
  }) : super(key: key); // Fix the super.key syntax

  final sz.Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          CustomSizedBox.space8H,
          SizedBox(
            height: MediaQuery.of(context).size.width > 800 ? size.height / 1.5 : size.height / 7.5,
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCrossAxisExtent ?? 200,
              mainAxisExtent: 380,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              Map<String, dynamic> dataItem = data[index];
              return widget ??
                  Padding(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width > 800 ? 8 : 4.0,
                      ),
                      child: SingleCategoryProductWidget(
                          // name: dataItem['name'],
                          // rating: dataItem['rating'],
                          // img: dataItem['img'],
                          // price: dataItem['price'],
                          // buttonText: dataItem['buttonText'],
                          // previousPrice: dataItem['previousPrice'],
                          // isBestSeller: dataItem['isBestSeller'],
                          // isStacked: dataItem['isStacked'],
                          // isBuy1Get1: dataItem['isbuy1Get1'],
                          // isDiscount: dataItem['isDiscount'],
                          // isFavourite: dataItem['isFavourite'],
                          // isFeatured: dataItem['isFeatured'],
                          // isOnSale: dataItem['isOnSale'],
                          // isOutofStock: dataItem['isOutofStock'],
                          ));
            },
            itemCount: gridItem ?? data.length,
          ),
        ],
      ),
    );
  }
}
