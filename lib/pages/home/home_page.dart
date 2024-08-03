import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_videoplayer/widgets/video-player-widget/video_player_widget.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/models/home_model.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/shimmer_list_home.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/pages/offer/offer_details_page.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/pages/offer/offer_page_v1.dart';
import 'package:perfecto/pages/offer/sale_page.dart';
import 'package:perfecto/pages/outlets/oulet_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../utils.dart';
import 'widgets/mega_deals_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  //switch home widget
  static Widget switchHomeWidget(HomeModel model, BuildContext context) {
    final controller = HomeController.to;

    Size size = MediaQuery.of(context).size;
    switch (model.id!) {
      case '1':
        return model.sectionData!.isNotEmpty
            ? SizedBox(
                height: 200,
                child: Obx(
                  () {
                    HomeController.to.startBannerAutoScroll(model.sectionData!.map((e) => e.offers!.bannerMobile!).toList());
                    return PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: controller.pageController.value,
                      onPageChanged: (value) {
                        controller.currentPage.value = value;
                      },
                      itemCount: model.sectionData!.length,
                      itemBuilder: (context, index) {
                        controller.currentPage.value = index;
                        final data = model.sectionData![index];
                        return GestureDetector(
                          onTap: () async {
                            await HomeApiController.to.offerDetailsCall(data.offerId!);
                            Get.toNamed(OfferDetailsScreen.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: CustomNetworkImage(
                              networkImagePath: data.image!,
                              errorImagePath: AssetsConstant.slider1,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              height: 200,
                              borderRadius: 0,
                            ),

                            /*Image.network('',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                                  data,
                                  fit: BoxFit.cover,
                                )),*/
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            : const SizedBox.shrink();
      case 'cat':
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Obx(() {
              final catList = HomeApiController.to.categoryList.where((p0) => p0.showOnHeader == '1').toList()..sort((a, b) => a.position!.compareTo(b.position!));
              globalLogger.d(catList.map((e) => e.name).toList());
              return Wrap(
                children: catList
                        .map((cat) => GestureDetector(
                            onTap: () async {
                              HomeApiController.to.productListWithCategoryCall({
                                'category': [cat.id!].toString(),
                              });
                              NavigationController.to.resetFilters();
                              HomeApiController.to.categoryList.firstWhere((element) => element.id == cat.id).isChecked = true;
                              NavigationController.to.addAttribute.addAll({
                                'category': [cat.id!].toString(),
                              });
                              Get.toNamed(SingleCategoryWiseScreen.routeName);
                            },
                            child: Tooltip(
                              message: cat.name!,
                              child: Container(
                                height: 92,
                                width: size.height > size.width ? size.width * .21 : size.height * .21,
                                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomNetworkImage(
                                      networkImagePath: cat.icon ?? '',
                                      height: 38,
                                      width: 38,
                                      errorImagePath: AssetsConstant.firstCategory1,
                                      border: NetworkImageBorder.Rectangle,
                                    ),
                                    CustomSizedBox.space4H,
                                    Text(
                                      cat.name!,
                                      style: AppTheme.textStyleNormalWhite10,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            )))
                        .toList() +
                    [
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(OutletScreen.routeName);
                          },
                          child: Container(
                            // height: 90,
                            // width: size.height > size.width ? size.width * .21 : size.height * .21,

                            height: 92,
                            width: size.height > size.width ? size.width * .21 : size.height * .21,
                            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetsConstant.firstCategory4,
                                  height: 38,
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
                        onTap: () async {
                          await HomeApiController.to.offerListCall();
                          Get.toNamed(OfferScreenNew.routeName);
                        },
                        child: Container(
                          // height: 90,
                          // width: size.height > size.width ? size.width * .21 : size.height * .21,

                          height: 92,
                          width: size.height > size.width ? size.width * .21 : size.height * .21,
                          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: AppColors.kPrimaryColor, borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsConstant.firstCategory8,
                                height: 38,
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
        );
      case '4':
        return model.sectionData!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Deals You Cannot Miss'),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    primary: false,
                    physics: const ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 167, crossAxisSpacing: 12, mainAxisSpacing: 12),
                    itemCount: model.sectionData!.length,
                    itemBuilder: (context, index) {
                      final data = model.sectionData![index];
                      return GestureDetector(
                        onTap: () async {
                          await HomeApiController.to.offerDetailsCall(data.offerId!);
                          Get.toNamed(OfferDetailsScreen.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(.16), blurRadius: 8)]),
                          child: CustomNetworkImage(
                            networkImagePath: data.image!,
                            errorImagePath: AssetsConstant.gridItem,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            height: 200,
                            borderRadius: 10,
                          ),
                          //     ClipRRect(
                          //   borderRadius: BorderRadius.circular(10),
                          //   child: Image.network(
                          //     '',
                          //     errorBuilder: (context, error, stackTrace) {
                          //       return Image.asset(
                          //         AssetsConstant.gridItem,
                          //         fit: BoxFit.cover,
                          //       );
                          //     },
                          //   ),
                          // ),
                        ),
                      );
                    },
                  ),
                  CustomSizedBox.space8H,
                ],
              )
            : const SizedBox.shrink();
      case '3':
        return model.sectionData!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Top Brands & Offers'),
                  ...List.generate(
                    model.sectionData!.length,
                    (index) => GestureDetector(
                      onTap: () async {
                        await HomeApiController.to.offerDetailsCall(model.sectionData![index].offerId!);
                        Get.toNamed(OfferDetailsScreen.routeName);
                      },
                      child: TopBrandsOfferListWidget(
                        sectionData: model.sectionData![index],
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      case '6':
        return model.productList!.isNotEmpty ? BestSellerListViewBuilder(model: model) : const SizedBox.shrink();
      case '16':
        return model.productList!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Mega Deals'),
                  GridItemWidget(
                    model: model,
                    size: size,
                    // img: AssetsConstant.megaDealsBackground,
                    // data: HomeController.to.megadealsITem,
                  ),
                ],
              )
            : const SizedBox.shrink();
      case '10':
        return model.sectionData!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Clearance Sale'),
                  GestureDetector(
                    onTap: () async {
                      await HomeApiController.to.offerDetailsCall(model.sectionData!.first.offerId!);
                      Get.toNamed(OfferDetailsScreen.routeName);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: const [
                        BoxShadow(color: Color(0xffCAC6BF), blurRadius: 8),
                      ]),
                      child: Center(
                        child: CustomNetworkImage(
                          networkImagePath: model.sectionData!.first.image!,
                          errorImagePath: AssetsConstant.banner,
                          borderRadius: 10,
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      case '13':
        return model.productList!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Super Offer'),
                  GridItemWidget(
                    /*data: HomeController.to.megadealsITem,*/ model: model,
                    size: size, /*img: AssetsConstant.superOfferBackground*/
                  ),
                ],
              )
            : const SizedBox.shrink();
      case '12':
        return model.sectionData!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Segments You Can’t Miss'),
                  SegmentGridWidget(model: model),
                  CustomSizedBox.space16H,
                ],
              )
            : const SizedBox.shrink();
      case '14':
        return model.sectionData!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Shop By Concern'),
                  SegmentGridWidget(
                    model: model,
                    blueBackground: AssetsConstant.blueBackground,
                    // img: Container(
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10), image: const DecorationImage(image: AssetImage(AssetsConstant.blueCircleBackground), fit: BoxFit.contain)),
                    //   child: const Padding(
                    //     padding: EdgeInsets.all(28.0),
                    //     child: CustomNetworkImage(
                    //       networkImagePath: '',
                    //       borderRadius: 360,
                    //       errorImagePath: AssetsConstant.superOfferForeground,
                    //       border: NetworkImageBorder.Circle,
                    //       fit: BoxFit.cover,
                    //       height: 104,
                    //     ),
                    //   ),
                    // ),
                    // widgetinBlueShade: const Positioned(
                    //     bottom: 8,
                    //     left: 0,
                    //     right: 0,
                    //     child: Column(
                    //       children: [
                    //         Text(
                    //           'HAIR FALL',
                    //           style: AppTheme.textStyleBoldWhite16,
                    //         ),
                    //         Text(
                    //           'Treatement',
                    //           style: AppTheme.textStyleNormalWhite10,
                    //         )
                    //       ],
                    //     )),
                  ),
                ],
              )
            : const SizedBox.shrink();
      case '11':
        return model.sectionData!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(tileText: model.mobileTitle ?? 'Perfecto Tips & Tricks'),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    primary: false,
                    physics: const ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 100, crossAxisSpacing: 8, mainAxisSpacing: 8),
                    itemCount: model.sectionData?.length ?? 8,
                    itemBuilder: (context, index) {
                      final data = model.sectionData![index];
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
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: Get.width * .9,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: VideoPlayerWidgetV2(
                                                videoList: [data.link ?? 'https://www.youtube.com/watch?v=gJLVTKhTnog'],
                                                width: Get.width * .8,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white10,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.kPrimaryColor, width: 2.5), /* image: const DecorationImage(image: AssetImage(AssetsConstant.slider1), fit: BoxFit.fill)*/
                          ),
                          child: Stack(
                            children: [
                              CustomNetworkImage(
                                networkImagePath: data.image!,
                                errorImagePath: AssetsConstant.slider1,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                height: 200,
                                borderRadius: 5,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(AssetsConstant.playButton, height: 22, width: 22),
                              ),
                            ],
                          ),

                          // Image.asset(
                          //   AssetsConstant.playButton,
                          //   height: 22,
                          //   width: 22,
                          // ),
                        ),
                      );
                    },
                  ),
                ],
              )
            : const SizedBox.shrink();
      case '17':
        return model.productList!.isNotEmpty
            ? PrimaryAcceantListViewItemWidget(
                productList: model.productList,
              )
            : const SizedBox.shrink();
      case '19':
        return GreetingCardWidget(
          model: model,
        );
      default:
        return const Text('No Data Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final controller = HomeController.to;
    // globalLogger.d(MediaQuery.of(context).size);
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeTopWidget(),
        Expanded(
          child: Obx(() {
            return RefreshIndicator(
              onRefresh: () async {
                await HomeController.to.getHomeCall();
              },
              child: HomeController.to.homeLoadingStatus.value == LoadingStatus.loading
                  ? const ShimmerListHome()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: HomeController.to.homeData.length,
                      itemBuilder: (context, index) {
                        // globalLogger.d(controller.homeData[index].id);
                        return switchHomeWidget(
                          HomeController.to.homeData[index],
                          context,
                        );
                      }),
            );
          }),
        ),
      ],
    );
  }
}
