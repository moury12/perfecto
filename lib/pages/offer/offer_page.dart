import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../page_with_navigation.dart';

class OfferScreen extends StatelessWidget {
  static const String routeName = '/offer';

  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithNavigation(
      scaffoldChild: Scaffold(
        body: Column(
          children: [
            HomeTopWidget(
              isSearchInclude: false,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 200, crossAxisSpacing: 16, mainAxisSpacing: 6),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        /* onTap: () => Get.toNamed(SingleCatergoryWiseScreen.routeName),*/
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(AssetsConstant.blueCircleBackground2),
                                  fit: BoxFit.fitHeight,
                                ),
                                boxShadow: [
                                  /* BoxShadow(
                          color: Colors.black.withOpacity(.16),
                          blurRadius: 8)*/
                                ]),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  AssetsConstant.circleBackground2,
                                  fit: BoxFit.contain,
                                  height: 180,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CustomNetworkImage(
                                    networkImagePath: '',
                                    errorImagePath: AssetsConstant.foregrond,
                                    border: NetworkImageBorder.Circle,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                  TileTextWidget(tileText: 'Top Brands'),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 180, crossAxisSpacing: 16, mainAxisSpacing: 16),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        /* onTap: () => Get.toNamed(SingleCatergoryWiseScreen.routeName),*/
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(AssetsConstant.blueCircleBackground3),
                                  fit: BoxFit.fitHeight,
                                ),
                                boxShadow: [
                                  /* BoxShadow(
                          color: Colors.black.withOpacity(.16),
                          blurRadius: 8)*/
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0).copyWith(bottom: 0),
                                  child: Text(
                                    'Skin Care',
                                    style: AppTheme.textStyleBoldWhite12,
                                  ),
                                ),
                                Text(
                                  '38% OFF',
                                  style: AppTheme.textStyleBoldWhite20,
                                ),
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image.asset(
                                      AssetsConstant.circleBackground3,
                                      fit: BoxFit.contain,
                                      height: 125,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16.0),
                                      child: CustomNetworkImage(
                                        networkImagePath: '',
                                        errorImagePath: AssetsConstant.foregrond2,
                                        border: NetworkImageBorder.Circle,
                                        height: 90,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                  TileTextWidget(tileText: 'Top Categories'),
                  ...List.generate(
                      4,
                      (index) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: CustomNetworkImage(
                                  networkImagePath: '',
                                  errorImagePath: AssetsConstant.banner2,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  borderRadius: 10,
                                ),
                              ),
                              SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 13,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 4),
                                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.circleBackground))),
                                          height: 100,
                                          width: 100,
                                          child: CustomNetworkImage(
                                            networkImagePath: '',
                                            errorImagePath: AssetsConstant.foregrond2,
                                            height: 60,
                                            width: 60,
                                          ),
                                        ),
                                        Text(
                                          'Lipstick',
                                          style: AppTheme.textStyleSemiBoldBlack10,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                              CustomSizedBox.space16H,
                            ],
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
