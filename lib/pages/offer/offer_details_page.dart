import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/category/widgets/single_category_product_widget.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/combo_details_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../constants/assets_constants.dart';
import '../product-details/product_details_controller.dart';
import '../product-details/product_details_page.dart';

class OfferDetailsScreen extends StatelessWidget {
  static const String routeName = '/offer_details';
  const OfferDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomNetworkImage(
                          networkImagePath: HomeApiController.to.offerDetails.value.bannerMobile ?? '',
                          errorImagePath: AssetsConstant.banner2,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          borderRadius: 10,
                        ),
                      ),
                      if (HomeApiController.to.offerDetails.value.data != null && HomeApiController.to.offerDetails.value.offerTypeId != '2')
                        HomeApiController.to.offerDetails.value.data!.isNotEmpty
                            ? SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: HomeApiController.to.offerDetails.value.data!.length,
                                  itemBuilder: (context, index) {
                                    final data = HomeApiController.to.offerDetails.value.data![index];
                                    return GestureDetector(
                                      onTap: () async {
                                        await HomeApiController.to.offerDetailsCatCall(HomeApiController.to.offerDetails.value.id!, data.id!);
                                        Get.toNamed(SingleCatergoryWiseScreen.routeName);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(horizontal: 4),
                                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.circleBackground))),
                                            height: 100,
                                            width: 100,
                                            child: CustomNetworkImage(
                                              networkImagePath: data.image ?? '',
                                              errorImagePath: AssetsConstant.foregrond2,
                                              height: 60,
                                              fit: BoxFit.cover,
                                              width: 60,
                                            ),
                                          ),
                                          Text(
                                            data.name ?? '',
                                            style: AppTheme.textStyleSemiBoldBlack10,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox.shrink(),
                    ],
                  ),
                  if (HomeApiController.to.offerDetails.value.data != null && HomeApiController.to.offerDetails.value.offerTypeId != '2')
                    ...List.generate(HomeApiController.to.offerDetails.value.data!.length, (index) {
                      final cat = HomeApiController.to.offerDetails.value.data![index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TitleTextWidget(tileText: cat.name ?? ''),
                              const Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  await HomeApiController.to.offerDetailsCatCall(HomeApiController.to.offerDetails.value.id!, cat.id!);
                                  Get.toNamed(SingleCatergoryWiseScreen.routeName);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 380, crossAxisSpacing: 12, mainAxisSpacing: 12),
                            itemCount: cat.products!.data!.length,
                            itemBuilder: (context, index) {
                              // final data = CategoryController.to.categoryWiseITem[index];
                              final product = cat.products!.data![index];
                              return SingleCategoryProductWidget(
                                product: product,
                                // name: data['name'],
                                // rating: data['rating'],
                                // img: data['img'],
                                // price: data['price'],
                                // // buttonText: data['buttonText'],
                                // previousPrice: data['previousPrice'],
                                // isBestSeller: data['isBestSeller'],
                                // isStacked: data['isStacked'],
                                // isBuy1Get1: data['isbuy1Get1'],
                                // isDiscount: data['isDiscount'],
                                // isFavourite: data['isFavourite'],
                                // isFeatured: data['isFeatured'],
                                // isOnSale: data['isOnSale'],
                                // isOutofStock: data['isOutofStock'],
                                // isShadeSwatch: data['shade'],
                              );
                            },
                          )
                        ],
                      );
                    }),
                  if (HomeApiController.to.offerDetails.value.offerTypeId == '2')
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 300,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        final product = HomeApiController.to.comboList[index];
                        return GestureDetector(
                          onTap: () async {
                            Get.put<ProductDetailsController>(
                              ProductDetailsController(),
                            );
                            await ProductDetailsController.to.getComboDetails(product.comboProductId ?? '30');
                            // ProductDetailsController.to.getReviewImages(product?.id ?? '30');
                            Get.toNamed(ComboDetailsScreen.routeName);
                          },
                          child: Stack(
                            children: [
                              Container(
                                // width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kDarkPrimaryColor.withOpacity(.10),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    CustomNetworkImage(networkImagePath: product.comboProducts?.image ?? '', height: 168, width: 200, fit: BoxFit.fill, borderRadius: 10),

                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   child:
                                    //
                                    //
                                    //
                                    //   Image.network(
                                    //     product?.image ?? '',
                                    //     errorBuilder: (context, error, stackTrace) {
                                    //       return Image.asset(img, fit: BoxFit.fill, height: 168, width: 200);
                                    //     },
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              product.comboProducts?.name ?? '-',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'InriaSans',
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Text(
                                            '৳ ${product.comboProducts?.discountedPrice}',
                                            style: AppTheme.textStyleBoldBlack14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                top: 0,
                                left: 0,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffD4F3FF),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(9), bottomRight: Radius.circular(4)),
                                      ),
                                      child: const Text(
                                        'Combo',
                                        style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // isStacked
                              //     ? isBestSeller
                              //         ? Container(
                              //             padding: const EdgeInsets.all(4),
                              //             decoration: const BoxDecoration(
                              //               color: Color(0xffD4F3FF),
                              //               borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(4)),
                              //             ),
                              //             child: const Text(
                              //               'Bestseller',
                              //               style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                              //             ),
                              //           )
                              //         : Row(
                              //             children: [
                              //               Container(
                              //                 padding: const EdgeInsets.all(4),
                              //                 decoration: const BoxDecoration(
                              //                   color: Color(0xffECDDFF),
                              //                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(4)),
                              //                 ),
                              //                 child: const Text(
                              //                   'Offer',
                              //                   style: TextStyle(color: Color(0xff8513DF), fontSize: 10),
                              //                 ),
                              //               ),
                              //               isFeatured
                              //                   ? Container(
                              //                       padding: const EdgeInsets.all(4),
                              //                       /* margin: EdgeInsets.only(left: 4),*/
                              //                       decoration: const BoxDecoration(
                              //                         color: Color(0xffDDDCFF),
                              //                         borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
                              //                       ),
                              //                       child: const Text(
                              //                         'Featured',
                              //                         style: TextStyle(color: Color(0xff1713DF), fontSize: 10),
                              //                       ),
                              //                     )
                              //                   : const SizedBox.shrink()
                              //             ],
                              //           )
                              //     : const SizedBox.shrink()
                            ],
                          ),
                        );
                      },
                      itemCount: HomeApiController.to.comboList.length,
                    ),
                  if (HomeApiController.to.offerDetails.value.data == null ||
                      (HomeApiController.to.offerDetails.value.data != null &&
                          HomeApiController.to.offerDetails.value.data!.isEmpty &&
                          HomeApiController.to.offerDetails.value.offerTypeId != '2'))
                    const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text('There is no product'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
