import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_videoplayer/widgets/video-player-widget/video_player_widget.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/pages/offer/offer_details_page.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/pages/offer/offer_page_v1.dart';
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
    // globalLogger.d(MediaQuery.of(context).size);
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeTopWidget(),
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
                            onTap: () => Get.toNamed(OfferDetailsScreen.routeName),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Image.network('',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                        data,
                                        fit: BoxFit.cover,
                                      )),
                            ),
                          );
                        },
                      ))),
              CustomSizedBox.space8H,
              // Row(
              //   children: [
              // Expanded(
              //   child: GridView.builder(
              //     physics: const ScrollPhysics(),
              //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(right: 8),
              //     shrinkWrap: true,
              //     primary: false,
              //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //       maxCrossAxisExtent: 100,
              //       mainAxisExtent: 90,
              //
              //       // childAspectRatio: 1,
              //       crossAxisSpacing: 8,
              //       mainAxisSpacing: 8,
              //     ),
              //     itemCount: HomeApiController.to.categoryList.length,
              //     itemBuilder: (context, index) {
              //       final cat = HomeApiController.to.categoryList[index];
              //       return GestureDetector(
              //           onTap: () {
              //             Get.toNamed(SingleCatergoryWiseScreen.routeName);
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
              //             padding: const EdgeInsets.all(12),
              //             child: Column(
              //               children: [
              //                 Image.asset(
              //                   AssetsConstant.firstCategory1,
              //                   height: 42,
              //                 ),
              //                 CustomSizedBox.space8H,
              //                 Text(
              //                   cat.name!,
              //                   style: AppTheme.textStyleNormalWhite10,
              //                 )
              //               ],
              //             ),
              //           ));
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Obx(() {
                  return Wrap(
                    children: HomeApiController.to.categoryList
                            .map((cat) => GestureDetector(
                                onTap: () async {
                                  await HomeApiController.to.productListWithCategoryCall({
                                    'category': [cat.id!].toString(),
                                  });
                                  Get.toNamed(SingleCatergoryWiseScreen.routeName);
                                },
                                child: Container(
                                  height: 92,
                                  width: size.height > size.width ? size.width * .21 : size.height * .21,
                                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      CustomNetworkImage(
                                        networkImagePath: cat.icon ?? '',
                                        height: 43,
                                        width: 42,
                                        errorImagePath: AssetsConstant.firstCategory1,
                                        border: NetworkImageBorder.Rectangle,
                                      ),
                                      CustomSizedBox.space8H,
                                      Text(
                                        cat.name!,
                                        style: AppTheme.textStyleNormalWhite10,
                                      )
                                    ],
                                  ),
                                )))
                            .toList() +
                        [
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(OutletScreen.routeName);
                              },
                              child: Container(
                                height: 90,
                                width: size.height > size.width ? size.width * .21 : size.height * .21,
                                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      AssetsConstant.firstCategory4,
                                      height: 42,
                                    ),
                                    CustomSizedBox.space8H,
                                    const Text(
                                      'Outlet',
                                      style: AppTheme.textStyleNormalWhite10,
                                    )
                                  ],
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(OfferScreenNew.routeName);
                            },
                            child: Container(
                              height: 90,
                              width: size.height > size.width ? size.width * .21 : size.height * .21,
                              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: AppColors.kPrimaryColor, borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Image.asset(
                                    AssetsConstant.firstCategory8,
                                    height: 42,
                                  ),
                                  CustomSizedBox.space8H,
                                  const Text(
                                    "Offer",
                                    style: AppTheme.textStyleNormalBlack10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                  );
                }),
              ),
              //   ],
              // ),
              // GridView.builder(
              //   physics: const ScrollPhysics(),
              //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              //   shrinkWrap: true,
              //   primary: false,
              //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //     maxCrossAxisExtent: 100,
              //     mainAxisExtent: 90,
              //     crossAxisSpacing: 8,
              //     mainAxisSpacing: 8,
              //   ),
              //   itemCount: controller.categoryItem.length,
              //   itemBuilder: (context, index) {
              //     Map<String, dynamic> data = controller.categoryItem[index];
              //     return index == 7
              //         ? GestureDetector(
              //             onTap: () {
              //               Get.toNamed(OfferScreenNew.routeName);
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(color: AppColors.kPrimaryColor, borderRadius: BorderRadius.circular(10)),
              //               padding: const EdgeInsets.all(12),
              //               child: Column(
              //                 children: [
              //                   Image.asset(
              //                     data['img'],
              //                     height: 42,
              //                   ),
              //                   CustomSizedBox.space8H,
              //                   Text(
              //                     data['name'],
              //                     style: AppTheme.textStyleNormalBlack10,
              //                   )
              //                 ],
              //               ),
              //             ),
              //           )
              //         : GestureDetector(
              //             onTap: () {
              //               if (data['route'] == OutletScreen.routeName) {
              //                 NavigationController.to.changeTabIndex(5);
              //                 NavigationController.to.update();
              //               }
              //               Get.toNamed(data['route']);
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
              //               padding: const EdgeInsets.all(12),
              //               child: Column(
              //                 children: [
              //                   Image.asset(
              //                     data['img'],
              //                     height: 42,
              //                   ),
              //                   CustomSizedBox.space8H,
              //                   Text(
              //                     data['name'],
              //                     style: AppTheme.textStyleNormalWhite10,
              //                   )
              //                 ],
              //               ),
              //             ));
              //   },
              // ),
              /*       Padding(
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
                  )),*/
              const TitleTextWidget(tileText: 'Deals You Cannot Miss'),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                primary: false,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 167, crossAxisSpacing: 12, mainAxisSpacing: 12),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(OfferDetailsScreen.routeName),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(.16), blurRadius: 8)]),
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
              ...List.generate(
                  5,
                  (index) => GestureDetector(
                      onTap: () {
                        Get.toNamed(OfferDetailsScreen.routeName);
                      },
                      child: const TopBrandsOfferListWidget())),
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
                  margin: const EdgeInsets.all(4),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
                    const BoxShadow(color: Color(0xffCAC6BF), blurRadius: 8),
                  ]),
                  child: const Center(
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
              GridItemWidget(data: HomeController.to.megadealsITem, size: size, img: AssetsConstant.superOfferBackground),
              const TitleTextWidget(tileText: 'Segments You Can’t Miss'),
              const SegmentGridWidget(),
              CustomSizedBox.space16H,
              const BestSellerListViewBuilder(),
              const TitleTextWidget(tileText: 'Shop By Concern'),
              SegmentGridWidget(
                  blueBackground: AssetsConstant.blueBackground,
                  img: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), image: const DecorationImage(image: AssetImage(AssetsConstant.blueCircleBackground), fit: BoxFit.contain)),
                    child: const Padding(
                      padding: EdgeInsets.all(28.0),
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
                  widgetinBlueShade: const Positioned(
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
              const TitleTextWidget(tileText: 'Perfecto Tips & Tricks'),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                primary: false,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 100, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          children: [
                            /*Container(
                                width: Get.width,
                                height: 200,
                                color: Colors.white,
                                child: Center(
                                  child: Text('Check'),*--*
                                ))*/
                            SizedBox(
                              width: Get.width * .9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: VideoPlayerWidgetV2(
                                        videoList: ['https://www.youtube.com/watch?v=gJLVTKhTnog'],
                                        width: Get.width * .8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.kPrimaryColor, width: 2.5),
                          image: const DecorationImage(image: AssetImage(AssetsConstant.slider1), fit: BoxFit.fill)),
                      child: Image.asset(
                        AssetsConstant.playButton,
                        height: 22,
                        width: 22,
                      ),
                    ),
                  );
                },
              ),
              /* TitleTextWidget(tileText: 'Just For You'),
              GridItemWidget(
                  data: HomeController.to.megadealsITem,
                  size: size,
                  img: AssetsConstant.justForUBackground),*/
              const PrimaryAcceantListViewItemWidget(),
              const GreetingCardWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
