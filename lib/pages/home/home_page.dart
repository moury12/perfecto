import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import 'widgets/mega_deals_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;
    globalLogger.d(MediaQuery.of(context).size);
    Size size = MediaQuery.of(context).size;
     return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopWidget(controller: controller),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    child: Image.network('',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              mainAxisExtent: 90,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              ),
                      itemCount: controller.categoryItem.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data =
                            controller.categoryItem[index];
                        return index == 7
                                ? GestureDetector(
                          onTap: (){
                            Get.toNamed(data['route']);},
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                                            style:
                                                AppTheme.textStyleNormalBlack10,
                                          )
                                        ],
                                      ),
                                    ),
                                )
                                : GestureDetector(
                            onTap: (){
                              Get.toNamed(data['route']);},
                            child:Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                          style:
                                              AppTheme.textStyleNormalWhite10,
                                        )
                                      ],
                                    ),
                                  ));

                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: ClipRRect(
                        clipBehavior: Clip.none,
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          AssetsConstant.slider1,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const TileTextWidget(tileText: 'Deals You Cannot Miss'),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      primary: false,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 167,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(SingleCatergoryWiseScreen.routeName),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.16),
                                  blurRadius: 8)
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
                    const TileTextWidget(tileText: 'Top Brands & Offers'),
                    ...List.generate(
                        5, (index) => const TopBrandsOfferListWidget()),
                    const TileTextWidget(tileText: 'Mega Deals'),
                    GridItemWidget(
                      size: size,
                      img: AssetsConstant.megaDealsBackground,
                    ),
                    const TileTextWidget(tileText: 'Clearance Sale'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CustomNetworkImage(
                            networkImagePath: '',
                            errorImagePath: AssetsConstant.banner,
                            borderRadius: 10,
                            width: Get.width,
                            height: null,
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    const TileTextWidget(tileText: 'Super Offer'),
                    GridItemWidget(
                        size: size, img: AssetsConstant.superOfferBackground),
                    const TileTextWidget(tileText: 'Segments You Can’t Miss'),
                    const SegmentGridWidget(),
                    CustomSizedBox.space16H,
                    Container(
                      color: const Color(0xffEAF9FF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TileTextWidget(tileText: 'Bestseller'),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 350,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const BestSellerListWidget();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const TileTextWidget(tileText: 'Segments You Can’t Miss'),
                    const SegmentGridWidget(
                        blueBackground: AssetsConstant.blueCircleBackground,
                        img: ClipOval(
                          child: CustomNetworkImage(
                            networkImagePath: '',
                            borderRadius: 0,
                            errorImagePath: AssetsConstant.superOfferForeground,
                            height: 104,
                            width: 104,
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
                    TileTextWidget(tileText: 'Perfecto Tips & Tricks'),
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
                                  fit: BoxFit.fitWidth)),
                          child: Image.asset(
                            AssetsConstant.playButton,
                            height: 22,
                            width: 22,
                          ),
                        );
                      },
                    ),
                    TileTextWidget(tileText: 'Just For You'),
                    GridItemWidget(
                        size: size, img: AssetsConstant.justForUBackground),
                    Container(
                      color: const Color(0xffEAF9FF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TileTextWidget(tileText: 'Personal Care'),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 350,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const BestSellerListWidget(
                                  isBestSeller: false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(AssetsConstant.bottomGrettings),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'With vast experience in the cosmetics industry, who sourcing cosmetics, skincare and hair care on a global level. We deliver the highest quality products of world renowned at the most affordable prices. We believe that everyone – no matter their sex, ethnicity, age, budget or location – should be thrilled by Perfecto.',
                            style: AppTheme.textStyleMediumBlack12,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 12,color: Colors.black.withOpacity(.08))],
                color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                navWidget( title: 'Home',icon: AssetsConstant.navIcon1,isSelected:true),
                navWidget( title: 'Category',icon: AssetsConstant.navIcon2,isSelected:false),
                navWidget( title: 'Chat',icon: AssetsConstant.navIcon3,isSelected:false,isChat: true),
                navWidget( title: 'Account',icon: AssetsConstant.navIcon4,isSelected:false),
              ],),
            ),
          ),
        ],
      ),
    );
  }
}

class navWidget extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String title;
final bool isChat;
  const navWidget({
    super.key,  this.isSelected=false, required this.icon, required this.title,  this.isChat=false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color:isSelected? Color(0xffF0F4F5):Colors.transparent),
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
      child: Row(children: [Image.asset(icon,color:isSelected?AppColors.kPrimaryColor: Colors.black,height: 16,width: 16,),CustomSizedBox.space4W,Row(
        children: [
          Text(title,style: AppTheme.textStyleSemiBoldBlack10,),isChat?Text('(0)',style: TextStyle(color: AppColors.kPrimaryColor,fontSize: 10, fontWeight: FontWeight.w600),):SizedBox.shrink(),
        ],
      )],),);
  }
}
