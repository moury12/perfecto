import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/offer/controller/offer_controller.dart';
import 'package:perfecto/pages/outlets/outlet_details_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../constants/color_constants.dart';
import '../../controller/navigation_controller.dart';
import '../../drawer/custom_drawer.dart';

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
          drawer: CustomDrawer(),
          body: Column(
            children: [
              const HomeTopWidget(
                isSearchInclude: false,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.mapView), fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Obx(() {
                        return CustomTextField(
                          height: 42,
                          fillColor: Colors.white,
                          controller: OfferController.to.outletController.value,
                          /*controller:controller==null?HomeController.to.searchController: controller!.searchController,*/
                          hintText: 'Search for outlet...',
                          focusColor: AppColors.kPrimaryColor,
                          enableBorderColor: AppColors.kPrimaryColor,
                          prefixWidget: Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          ),
                          onChanged: (value) {
                            OfferController.to.outletController.value.text = value;
                            OfferController.to.update();
                          },
                          marginVertical: 12,
                          marginHorizontal: 16,
                        );
                      }),
                      Obx(() {
                        final outletList = (OfferController.to.outletController.value.text.isEmpty
                            ? HomeApiController.to.outletList
                            : HomeApiController.to.outletList
                                .where((element) => element.name!.toLowerCase().contains(OfferController.to.outletController.value.text.toLowerCase()))
                                .toList());
                        globalLogger.d(outletList.length);
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(
                                  outletList.length,
                                  (index) {
                                    final outlet = outletList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(OutletDetailsScreen.routeName, arguments: outlet);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Container(
                                          color: Colors.white,
                                          clipBehavior: Clip.none,
                                          child: Column(
                                            children: [
                                              CustomSizedBox.space4H,
                                              Row(
                                                children: [
                                                  CustomNetworkImage(
                                                    networkImagePath: outlet.logo ?? '',
                                                    errorImagePath: AssetsConstant.slider2,
                                                    height: 42,
                                                    width: 42,
                                                    borderRadius: 10,
                                                  ),
                                                  CustomSizedBox.space8W,
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        outlet.name ?? 'Mirpur Outlet',
                                                        style: AppTheme.textStyleMediumBlack12,
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            AssetsConstant.phone,
                                                            height: 16,
                                                          ),
                                                          CustomSizedBox.space8W,
                                                          Text(
                                                            outlet.mobile ?? '+88018996514',
                                                            style: AppTheme.textStyleNormalFadeBlack10,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              CustomSizedBox.space4H,
                                              index == HomeApiController.to.outletList.length - 1
                                                  ? CustomSizedBox.space4H
                                                  : const Divider(
                                                      thickness: 0.3,
                                                      color: Colors.black54,
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
