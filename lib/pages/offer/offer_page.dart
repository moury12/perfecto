import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
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
    return Scaffold(body:  Column(
      children: [
        const HomeTopWidget(),
        Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ...List.generate(
                    5,
                        (index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(OfferDetailsScreen.routeName);
                          },
                          child: Container(
                                                width: double.infinity,height: 150,
                                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetsConstant.banner2),
                            fit: BoxFit.fill,
                          ),
                                                ),

                                              ),
                        )),
                // const GreetingCardWidget(),

              ],
            ))
      ],
    ),backgroundColor: AppColors.kBackgroundColor,drawer: CustomDrawer(),);
  }
}
