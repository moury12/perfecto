import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/pages/offer/offer_details_page.dart';
import 'package:perfecto/pages/offer/offer_page_v1.dart';
import 'package:perfecto/pages/offer/offer_page_v1.dart';

class OfferScreenNew extends StatelessWidget {
  static const String routeName = '/offer_new';

  const OfferScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ...List.generate(
                HomeApiController.to.offerList.length,
                (index) => GestureDetector(
                  onTap: () async {
                    await HomeApiController.to.offerDetailsCall(HomeApiController.to.offerList[index].id!);
                    Get.toNamed(OfferDetailsScreen.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage(AssetsConstant.banner2),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    child: CustomNetworkImage(
                      networkImagePath: HomeApiController.to.offerList[index].bannerMobile ?? '',
                      errorImagePath: AssetsConstant.banner2,
                      fit: BoxFit.fill,
                      height: 150,
                      borderRadius: 10,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              // const GreetingCardWidget(),
            ],
          ))
        ],
      ),
      backgroundColor: AppColors.kBackgroundColor,
      drawer: CustomDrawer(),
    );
  }
}
