import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/outlets/outlet_details_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../constants/color_constants.dart';
import '../../controller/navigation_controller.dart';

class OutletScreen extends StatelessWidget {
  static const String routeName = '/outlet';
  const OutletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigationController.to.changeTabIndex(0);
        NavigationController.to.update();
        return true;
      },
      child: PageWithNavigation(
        scaffoldChild: Scaffold(
          body: Column(
            children: [
              const HomeTopWidget(
                isSearchInclude: false,
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.mapView), fit: BoxFit.fill)),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const CustomTextField(
                      height: 42,
                      fillColor: Colors.white,
                      /*controller:controller==null?HomeController.to.searchController: controller!.searchController,*/
                      hintText: 'Search for products...',
                      focusColor: AppColors.kPrimaryColor,
                      enableBorderColor: AppColors.kPrimaryColor,
                      prefixWidget: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      marginVertical: 12,
                      marginHorizontal: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          ...List.generate(
                              8,
                              (index) => GestureDetector(
                                    onTap: () {
                                      Get.toNamed(OutletDetailsScreen.routeName);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        children: [
                                          CustomSizedBox.space8H,
                                          Row(
                                            children: [
                                              const CustomNetworkImage(
                                                networkImagePath: '',
                                                errorImagePath: AssetsConstant.slider2,
                                                height: 52,
                                                width: 52,
                                                borderRadius: 10,
                                              ),
                                              CustomSizedBox.space8W,
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Mirpur Outlet',
                                                    style: AppTheme.textStyleNormalBlack16,
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        AssetsConstant.phone,
                                                        height: 16,
                                                      ),
                                                      const Text(
                                                        '+88018996514',
                                                        style: AppTheme.textStyleNormalFadeBlack12,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          CustomSizedBox.space8H,
                                          index == 7
                                              ? CustomSizedBox.space8H
                                              : const Divider(
                                                  thickness: 0.3,
                                                  color: Colors.black54,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
