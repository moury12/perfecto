import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/models/cart_model.dart';
import 'package:perfecto/pages/auth/login_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ProductShadeScreen extends StatelessWidget {
  final bool isSelectSize;
  static const String routeName = '/product_shade_details';

  const ProductShadeScreen({super.key, this.isSelectSize = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
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
                            // Get.toNamed(ProductImagePreview.routeName);
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
                      ProductDetailsController.to.product.value.name ?? 'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                      style: AppTheme.textStyleBoldBlack20.copyWith(fontFamily: 'InriaSans'),
                    );
                  }),
                ),
                isSelectSize
                    ? Column(
                        children: [
                          Container(
                            color: const Color(0xffF9F9F9),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                              child: Column(
                                children: [
                                  CustomSizedBox.space8H,
                                  Row(
                                    children: [
                                      const Text(
                                        'Select a Size',
                                        style: AppTheme.textStyleBoldBlack14,
                                      ),
                                      Container(
                                        height: 15,
                                        width: 1,
                                        color: Colors.grey,
                                        margin: const EdgeInsets.symmetric(horizontal: 8),
                                      ),
                                      Text(
                                        '${ProductDetailsController.to.product.value.productSizes!.length} varients',
                                        style: AppTheme.textStyleSemiBoldFadeBlack14,
                                      )
                                    ],
                                  ),
                                  CustomSizedBox.space8H,
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: Color(0xffECECEC),
                            height: 0,
                            indent: 0,
                          ),
                          CustomSizedBox.space20H,
                          SizedBox(
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
                              },
                            ),
                          ),
                          CustomSizedBox.space8H,
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: "Available stock: ",
                                style: AppTheme.textStyleNormalBlack14,
                                children: [
                                  TextSpan(
                                    text: ProductDetailsController.to.product.value.productSizes!
                                        .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                        .stock
                                        .toString(),
                                    style: AppTheme.textStyleBoldBlack14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            color: const Color(0xffF9F9F9),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                              child: Column(
                                children: [
                                  CustomSizedBox.space8H,
                                  Row(
                                    children: [
                                      const Text(
                                        'Select a Shade',
                                        style: AppTheme.textStyleBoldBlack14,
                                      ),
                                      Container(
                                        height: 15,
                                        width: 1,
                                        color: Colors.grey,
                                        margin: const EdgeInsets.symmetric(horizontal: 8),
                                      ),
                                      Text(
                                        '${ProductDetailsController.to.product.value.productShades!.length} varients',
                                        style: AppTheme.textStyleSemiBoldFadeBlack14,
                                      )
                                    ],
                                  ),
                                  CustomSizedBox.space8H,
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: Color(0xffECECEC),
                            height: 0,
                            indent: 0,
                          ),
                          CustomSizedBox.space20H,
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: ProductDetailsController.to.product.value.productShades!
                                .map((shade) => Padding(
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
                                    ))
                                .toList(),
                          ),

                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: "Available stock: ",
                                style: AppTheme.textStyleNormalBlack14,
                                children: [
                                  TextSpan(
                                    text: ProductDetailsController.to.product.value.productShades!
                                        .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                        .stock
                                        .toString(),
                                    style: AppTheme.textStyleBoldBlack14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 100,
                          //   child: ListView.builder(
                          //     padding: const EdgeInsets.symmetric(horizontal: 8),
                          //     scrollDirection: Axis.horizontal,
                          //     itemBuilder: (context, index) {
                          //       final shade = ProductDetailsController.to.product.value.productShades![index];
                          //       return Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Obx(() {
                          //           return GestureDetector(
                          //             onTap: () {
                          //               ProductDetailsController.to.selectedVariation.value = shade.shadeId!;
                          //             },
                          //             child: Stack(
                          //               alignment: Alignment.center,
                          //               children: [
                          //                 CustomNetworkImage(
                          //                   networkImagePath: shade.shade!.image!,
                          //                   errorImagePath: AssetsConstant.lipstickShade,
                          //                   height: 48,
                          //                   width: 48,
                          //                   borderRadius: 4,
                          //                 ),
                          //                 shade.shadeId == ProductDetailsController.to.selectedVariation.value
                          //                     ? const Icon(
                          //                         Icons.check,
                          //                         color: Colors.white,
                          //                       )
                          //                     : const SizedBox.shrink()
                          //               ],
                          //             ),
                          //           );
                          //         }),
                          //       );
                          //     },
                          //     itemCount: ProductDetailsController.to.product.value.productShades!.length,
                          //   ),
                          // )

                          // Container(
                          //   decoration: BoxDecoration(
                          //     //This is for background color
                          //     color: Color(0xffF9F9F9),
                          //     //This is for bottom border that is needed
                          //     border: Border(bottom: BorderSide(color: Color(0xffECECEC), width: 1.5)),
                          //   ),
                          //   child:
                          //
                          //   TabBar(
                          //       labelColor: AppColors.kBlackColor,
                          //       unselectedLabelColor: Colors.black54,
                          //       labelStyle: AppTheme.textStyleBoldBlack14,
                          //       unselectedLabelStyle: AppTheme.textStyleBoldFadeBlack14,
                          //       indicatorColor: AppColors.kPrimaryColor,
                          //       dividerColor: AppColors.kPrimaryColor,
                          //       automaticIndicatorColorAdjustment: true,
                          //       labelPadding: EdgeInsets.symmetric(vertical: 6),
                          //       controller: ProductDetailsController.to.tabController,
                          //       tabs: ProductDetailsController.to.tabTiles.map((String title) {
                          //         return Tab(
                          //           text: title,
                          //         );
                          //       }).toList()),
                          // ),
                          // SizedBox(
                          //   height: 300,
                          //   child: TabBarView(controller: ProductDetailsController.to.tabController, children: List.generate(2, (index) => buildwidget(index))),
                          // ),
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomCalculationTotalWidget(isSelectSize: isSelectSize),
    );
  }

  // Widget buildwidget(int tabIndex) {
  //   switch (tabIndex) {
  //     case 0:
  //       return GridView.builder(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 230, mainAxisExtent: 42, mainAxisSpacing: 16),
  //         shrinkWrap: true,
  //         primary: false,
  //         itemCount: 10,
  //         itemBuilder: (context, index) {
  //           return Row(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Stack(
  //                 alignment: Alignment.center,
  //                 children: [
  //                   const CustomNetworkImage(
  //                     networkImagePath: '',
  //                     borderRadius: 5,
  //                     height: 52,
  //                     width: 52,
  //                     errorImagePath: AssetsConstant.lipstickShade,
  //                     fit: BoxFit.fitHeight,
  //                   ),
  //                   index == 0
  //                       ? const Icon(
  //                           Icons.check_rounded,
  //                           color: Colors.white,
  //                         )
  //                       : index == 9
  //                           ? const Icon(
  //                               CupertinoIcons.multiply,
  //                               color: Colors.white,
  //                             )
  //                           : const SizedBox.shrink()
  //                 ],
  //               ),
  //               CustomSizedBox.space8W,
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   const Text(
  //                     'Nude Shade Color',
  //                     style: AppTheme.textStyleNormalBlack14,
  //                   ),
  //                   index == 9
  //                       ? const Text(
  //                           'Out of Stock',
  //                           style: AppTheme.textStyleNormalRed12,
  //                         )
  //                       : const SizedBox.shrink(),
  //                 ],
  //               )
  //             ],
  //           );
  //         },
  //       );
  //
  //     case 1:
  //       return GridView.builder(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 230, mainAxisExtent: 42, mainAxisSpacing: 16),
  //         shrinkWrap: true,
  //         primary: false,
  //         itemCount: 10,
  //         itemBuilder: (context, index) {
  //           return Row(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Stack(
  //                 alignment: Alignment.center,
  //                 children: [
  //                   const CustomNetworkImage(
  //                     networkImagePath: '',
  //                     borderRadius: 5,
  //                     height: 42,
  //                     width: 42,
  //                     errorImagePath: AssetsConstant.lipstickShade,
  //                     fit: BoxFit.fitHeight,
  //                   ),
  //                   index == 0
  //                       ? const Icon(
  //                           Icons.check_rounded,
  //                           color: Colors.white,
  //                         )
  //                       : index == 9
  //                           ? const Icon(
  //                               CupertinoIcons.multiply,
  //                               color: Colors.white,
  //                             )
  //                           : const SizedBox.shrink()
  //                 ],
  //               ),
  //               CustomSizedBox.space8W,
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const Text(
  //                     'Nude Shade Color',
  //                     style: AppTheme.textStyleNormalBlack14,
  //                   ),
  //                   index == 9
  //                       ? const Text(
  //                           'Out of Stock',
  //                           style: AppTheme.textStyleNormalRed12,
  //                         )
  //                       : const SizedBox.shrink(),
  //                 ],
  //               )
  //             ],
  //           );
  //         },
  //       );
  //
  //     default:
  //       return const Center(
  //         child: Text(
  //           'Unknown Tab',
  //           style: TextStyle(fontSize: 10),
  //         ),
  //       );
  //   }
  // }
}

class BottomCalculationTotalWidget extends StatelessWidget {
  const BottomCalculationTotalWidget({
    super.key,
    required this.isSelectSize,
  });

  final bool isSelectSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
      child: Column(
        children: [
          CustomSizedBox.space8H,
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Row(
                children: [
                  Text(
                    isSelectSize
                        ? ProductDetailsController.to.product.value.productSizes!
                            .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                            .size!
                            .name!
                        : ProductDetailsController.to.product.value.productShades!
                            .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                            .shade!
                            .name!,
                    style: AppTheme.textStyleBoldFadeBlack14,
                  ),
                  const Spacer(),
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
                ],
              ),
            );
          }),
          // Container(
          //   width: double.infinity,
          //   height: 1,
          //   color: Colors.black.withOpacity(.1),
          // ),
          Row(
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
                    height: 44,
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
                          primary: AppColors.kPrimaryColor,
                          width: MediaQuery.of(context).size.width / 1.3,
                          onPressed: () {
                            if (AuthController.to.isLoggedIn.value) {
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
                            } else {
                              Get.toNamed(LoginScreen.routeName);
                            }
                          },
                        )
                      : Container(
                          height: 44,
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: AppColors.kPrimaryColor,
                              //   width: 1,
                              // ),
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
        ],
      ),
    );
  }
}
