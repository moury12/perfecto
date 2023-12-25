import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/pages/offer/sale_page.dart';
import 'package:perfecto/pages/outlets/oulet_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import 'widgets/mega_deals_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;
    globalLogger.d(MediaQuery.of(context).size);
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTopWidget(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                  height: 200,
                  child: Obx(() => PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: controller.pageController.value,
                        onPageChanged: (value) {
                          controller.currentPage.value = value;
                        },
                        itemCount: controller.bannerContent.length,
                        itemBuilder: (context, index) {
                          controller.currentPage.value = index;
                          String data = controller.bannerContent[index];
                          return GestureDetector(
                            onTap: () => Get.toNamed(OfferScreen.routeName),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Image.network('',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                        data,
                                        fit: BoxFit.cover,
                                      )),
                            ),
                          );
                        },
                      ))),
              CustomSizedBox.space8H,
              GridView.builder(
                physics: const ScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  mainAxisExtent: 90,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.categoryItem.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = controller.categoryItem[index];
                  return index == 7
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed(data['route']);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Image.asset(
                                  data['img'],
                                  height: 42,
                                ),
                                CustomSizedBox.space8H,
                                Text(
                                  data['name'],
                                  style: AppTheme.textStyleNormalBlack10,
                                )
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (data['route'] == OutletScreen.routeName) {
                              globalLogger
                                  .d(data['route'] == OutletScreen.routeName);
                              NavigationController.to.changeTabIndex(5);
                              NavigationController.to.update();
                            }
                            Get.toNamed(data['route']);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Image.asset(
                                  data['img'],
                                  height: 42,
                                ),
                                CustomSizedBox.space8H,
                                Text(
                                  data['name'],
                                  style: AppTheme.textStyleNormalWhite10,
                                )
                              ],
                            ),
                          ));
                },
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.25),
                              blurRadius: 4)
                        ]),
                    child: CustomNetworkImage(
                      networkImagePath: '',
                      errorImagePath: AssetsConstant.slider1,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      borderRadius: 10,
                    ),
                  )),
              const TitleTextWidget(tileText: 'Deals You Cannot Miss'),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                primary: false,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 167,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(SaleScreen.routeName),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.16), blurRadius: 8)
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              AssetsConstant.gridItem,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              CustomSizedBox.space8H,
              const TitleTextWidget(tileText: 'Top Brands & Offers'),
              ...List.generate(5, (index) => const TopBrandsOfferListWidget()),
              const TitleTextWidget(tileText: 'Mega Deals'),
              GridItemWidget(
                size: size,
                img: AssetsConstant.megaDealsBackground,
                data: HomeController.to.megadealsITem,
              ),
              const TitleTextWidget(tileText: 'Clearance Sale'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  margin: EdgeInsets.all(4),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Color(0xffCAC6BF), blurRadius: 8),
                      ]),
                  child: Center(
                    child: CustomNetworkImage(
                      networkImagePath: "",
                      errorImagePath: AssetsConstant.banner,
                      borderRadius: 10,
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const TitleTextWidget(tileText: 'Super Offer'),
              GridItemWidget(
                  data: HomeController.to.megadealsITem,
                  size: size,
                  img: AssetsConstant.superOfferBackground),
              const TitleTextWidget(tileText: 'Segments You Can’t Miss'),
              const SegmentGridWidget(),
              CustomSizedBox.space16H,
              BestSellerListViewBuilder(),
              const TitleTextWidget(tileText: 'Segments You Can’t Miss'),
              SegmentGridWidget(
                  blueBackground: AssetsConstant.blueBackground,
                  img: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image:
                                AssetImage(AssetsConstant.blueCircleBackground),
                            fit: BoxFit.contain)),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: CustomNetworkImage(
                        networkImagePath: '',
                        borderRadius: 360,
                        errorImagePath: AssetsConstant.superOfferForeground,
                        border: NetworkImageBorder.Circle,
                        fit: BoxFit.cover,
                        height: 104,
                      ),
                    ),
                  ),
                  widgetinBlueShade: Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            'HAIR FALL',
                            style: AppTheme.textStyleBoldWhite16,
                          ),
                          Text(
                            'Treatement',
                            style: AppTheme.textStyleNormalWhite10,
                          )
                        ],
                      ))),
              TitleTextWidget(tileText: 'Perfecto Tips & Tricks'),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                primary: false,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 100,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.kPrimaryColor, width: 2.5),
                        image: DecorationImage(
                            image: AssetImage(AssetsConstant.slider1),
                            fit: BoxFit.fill)),
                    child: Image.asset(
                      AssetsConstant.playButton,
                      height: 22,
                      width: 22,
                    ),
                  );
                },
              ),
              TitleTextWidget(tileText: 'Just For You'),
              GridItemWidget(
                  data: HomeController.to.megadealsITem,
                  size: size,
                  img: AssetsConstant.justForUBackground),
              PrimaryAcceantListViewItemWidget(),
              GreetingCardWidget(),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
      ],
    );
  }
}



