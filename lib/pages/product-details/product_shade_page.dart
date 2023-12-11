import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ProductShadeScreen extends StatelessWidget {
  static const String routeName = '/product_shade_details';

  const ProductShadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 360,
                  child: PageView.builder(
                    padEnds: false,
                    scrollDirection: Axis.horizontal,
                    controller: PageController(),
                    onPageChanged: (value) {
                      ProductDetailsController.to.currentPage.value = value;
                    },
                    itemCount: ProductDetailsController.to.bannerContent.length,
                    itemBuilder: (context, index) {
                      String data =
                          ProductDetailsController.to.bannerContent[index];
                      return CustomNetworkImage(
                        networkImagePath: '',
                        fit: BoxFit.fill,
                        errorImagePath: data,
                        height: double.maxFinite,
                        width: double.infinity,
                        borderRadius: 0,
                      );
                    },
                  ),
                ),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        ProductDetailsController.to.bannerContent.length,
                        (index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              ProductDetailsController.to.currentPage.value ==
                                      index
                                  ? AppColors.kPrimaryColor
                                  : const Color(0xffD9D9D9),
                        ),
                      );
                    }),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Text(
                    'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                    style: AppTheme.textStyleBoldBlack14,
                  ),
                ),
                Container(
                           decoration: BoxDecoration(
                  //This is for background color
                             color: Color(0xffF9F9F9),
                             //This is for bottom border that is needed
                  border: Border(bottom: BorderSide(color: Color(0xffECECEC), width: 1.5)),
                ),
                  child: TabBar(

                      labelColor: AppColors.kBlackColor,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: AppTheme.textStyleBoldBlack14,
                      unselectedLabelStyle: AppTheme.textStyleBoldFadeBlack14,
                      indicatorColor: AppColors.kPrimaryColor,
                      dividerColor: AppColors.kPrimaryColor,
                      automaticIndicatorColorAdjustment: true,
                      labelPadding: EdgeInsets.symmetric(vertical: 6),
                      controller: ProductDetailsController.to.tabController,
                      tabs: ProductDetailsController.to.tabTiles
                          .map((String title) {
                        return Tab(
                          text: title,
                        );
                      }).toList()),
                ),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                      controller: ProductDetailsController.to.tabController,
                      children:
                          List.generate(2, (index) => buildwidget(index))),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 115,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)
            ]),
        child: Column(
          children: [
            CustomSizedBox.space8H,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Row(
                children: [
                  const Text(
                    'Nude Shade Color',
                    style: AppTheme.textStyleBoldFadeBlack14,
                  ),
                  const Spacer(),
                  RichText(
                      text: const TextSpan(
                          text: '',
                          style: AppTheme.textStyleBoldBlack14,
                          children: [
                        TextSpan(
                            text: '৳ 550  ',
                            style: AppTheme.textStyleBoldBlack20,
                            children: [
                              TextSpan(
                                text: '৳550',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: ' | ',
                                style: AppTheme.textStyleNormalFadeBlack14,
                              ),
                              TextSpan(
                                text: '(-25% Off)',
                                style: TextStyle(
                                    color: Color(0xff02792A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
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
                        ProductDetailsController.to.isFavourite.value =
                            !ProductDetailsController.to.isFavourite.value;
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.kPrimaryColor, width: 1),
                            borderRadius: BorderRadius.circular(4)),
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
      ),
    );
  }

  Widget buildwidget(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 230, mainAxisExtent: 42, mainAxisSpacing: 16),
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
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 230, mainAxisExtent: 42, mainAxisSpacing: 16),
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
