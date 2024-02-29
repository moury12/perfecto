import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
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
      drawer: CustomDrawer(),
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
                            color: Color(0xffF9F9F9),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                              child: Column(
                                children: [
                                  CustomSizedBox.space8H,
                                  Row(
                                    children: [
                                      Text(
                                        'Select a Size',
                                        style: AppTheme.textStyleBoldBlack14,
                                      ),
                                      Container(
                                        height: 15,
                                        width: 1,
                                        color: Colors.grey,
                                        margin: EdgeInsets.symmetric(horizontal: 8),
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
                          Divider(
                            thickness: 1.5,
                            color: Color(0xffECECEC),
                            height: 0,
                            indent: 0,
                          ),
                          CustomSizedBox.space20H,
                          SizedBox(
                            height: 42,
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              scrollDirection: Axis.horizontal,
                              itemCount: ProductDetailsController.to.product.value.productSizes!.length,
                              itemBuilder: (context, index) {
                                final data = ProductDetailsController.to.product.value.productSizes![index];
                                return GestureDetector(
                                  onTap: () {
                                    ProductDetailsController.to.selectedVariation.value = data.sizeId!;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ProductDetailsController.to.selectedVariation.value == data.sizeId ? AppColors.kPrimaryColor : Colors.transparent,
                                        border: Border.all(color: AppColors.kPrimaryColor, width: 1.5),
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: Text(
                                      data.size?.name ?? '180ml',
                                      textAlign: TextAlign.center,
                                      style: ProductDetailsController.to.selectedVariation.value == data.sizeId
                                          ? AppTheme.textStyleSemiBoldWhite14
                                          : AppTheme.textStyleSemiBoldFadeBlack14,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            color: Color(0xffF9F9F9),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                              child: Column(
                                children: [
                                  CustomSizedBox.space8H,
                                  Row(
                                    children: [
                                      Text(
                                        'Select a Shade',
                                        style: AppTheme.textStyleBoldBlack14,
                                      ),
                                      Container(
                                        height: 15,
                                        width: 1,
                                        color: Colors.grey,
                                        margin: EdgeInsets.symmetric(horizontal: 8),
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
                          Divider(
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
                                              CustomNetworkImage(
                                                networkImagePath: shade.shade!.image!,
                                                errorImagePath: AssetsConstant.lipstickShade,
                                                height: 48,
                                                width: 48,
                                                borderRadius: 4,
                                              ),
                                              shade.shadeId == ProductDetailsController.to.selectedVariation.value
                                                  ? const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    )
                                                  : const SizedBox.shrink()
                                            ],
                                          ),
                                        );
                                      }),
                                    ))
                                .toList(),
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

  Widget buildwidget(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 230, mainAxisExtent: 42, mainAxisSpacing: 16),
          shrinkWrap: true,
          primary: false,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomNetworkImage(
                      networkImagePath: '',
                      borderRadius: 5,
                      height: 52,
                      width: 52,
                      errorImagePath: AssetsConstant.lipstickShade,
                      fit: BoxFit.fitHeight,
                    ),
                    index == 0
                        ? Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                          )
                        : index == 9
                            ? Icon(
                                CupertinoIcons.multiply,
                                color: Colors.white,
                              )
                            : SizedBox.shrink()
                  ],
                ),
                CustomSizedBox.space8W,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nude Shade Color',
                      style: AppTheme.textStyleNormalBlack14,
                    ),
                    index == 9
                        ? Text(
                            'Out of Stock',
                            style: AppTheme.textStyleNormalRed12,
                          )
                        : SizedBox.shrink(),
                  ],
                )
              ],
            );
          },
        );

      case 1:
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 230, mainAxisExtent: 42, mainAxisSpacing: 16),
          shrinkWrap: true,
          primary: false,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomNetworkImage(
                      networkImagePath: '',
                      borderRadius: 5,
                      height: 42,
                      width: 42,
                      errorImagePath: AssetsConstant.lipstickShade,
                      fit: BoxFit.fitHeight,
                    ),
                    index == 0
                        ? Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                          )
                        : index == 9
                            ? Icon(
                                CupertinoIcons.multiply,
                                color: Colors.white,
                              )
                            : SizedBox.shrink()
                  ],
                ),
                CustomSizedBox.space8W,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nude Shade Color',
                      style: AppTheme.textStyleNormalBlack14,
                    ),
                    index == 9
                        ? Text(
                            'Out of Stock',
                            style: AppTheme.textStyleNormalRed12,
                          )
                        : SizedBox.shrink(),
                  ],
                )
              ],
            );
          },
        );

      default:
        return Center(
          child: Text(
            'Unknown Tab',
            style: TextStyle(fontSize: 10),
          ),
        );
    }
  }
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
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
      child: Column(
        children: [
          CustomSizedBox.space8H,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              children: [
                Text(
                  isSelectSize ? '180ml' : 'Nude Shade Color',
                  style: AppTheme.textStyleBoldFadeBlack14,
                ),
                const Spacer(),
                RichText(
                    text: const TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                  TextSpan(text: '৳ 550  ', style: AppTheme.textStyleBoldBlack20, children: [
                    TextSpan(
                      text: '৳550',
                      style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: ' | ',
                      style: AppTheme.textStyleNormalFadeBlack14,
                    ),
                    TextSpan(
                      text: '(-25% Off)',
                      style: TextStyle(color: Color(0xff02792A), fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ]),
                ])),
              ],
            ),
          ),
          FittedBox(
            child: Row(
              children: [
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      ProductDetailsController.to.isFavourite.value = !ProductDetailsController.to.isFavourite.value;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      margin: EdgeInsets.only(left: 8),
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
          )
        ],
      ),
    );
  }
}
