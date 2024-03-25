import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import '../../theme/theme_data.dart';
import '../home/widgets/home_top_widget.dart';

class OutletDetailsScreen extends StatelessWidget {
  static const String routeName = '/outletDetails';
  const OutletDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OutletModel outlet = Get.arguments;
    return PageWithNavigation(
      scaffoldChild: Scaffold(
        drawer: CustomDrawer(),
        body: Container(
          // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(getImageUrl(outlet.mapImage!)), fit: BoxFit.cover)),
          child: Stack(
            children: [
              CustomNetworkImage(
                networkImagePath: outlet.mapImage ?? '',
                errorImagePath: AssetsConstant.mapView,
                height: Get.height,
                width: Get.width,
                borderRadius: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HomeTopWidget(
                    isSearchInclude: false,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(.12))]),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomNetworkImage(
                                      networkImagePath: outlet.logo ?? '',
                                      errorImagePath: AssetsConstant.slider2,
                                      height: 52,
                                      width: 52,
                                      borderRadius: 10,
                                    ),
                                    CustomSizedBox.space8W,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          outlet.name ?? 'Mirpur Outlet',
                                          style: AppTheme.textStyleMediumBlack14,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
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
                                            CustomSizedBox.space4W,
                                            Text(
                                              outlet.mobile ?? '+88018996514',
                                              style: AppTheme.textStyleNormalFadeBlack12,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                CustomSizedBox.space8H,
                                const Divider(
                                  thickness: 0.3,
                                  color: Colors.black54,
                                ),
                                Text(
                                  'Address',
                                  style: AppTheme.textStyleSemiBoldBlack14,
                                ),
                                CustomSizedBox.space8H,
                                Text(
                                  outlet.address ?? '#Shop #GB , Ground Floor , 38,sonargaon Janapath sector - 11 , uttara< Dhaka (opposite of Zamzam Tower)',
                                  style: AppTheme.textStyleNormalBlack12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        label: 'Call',
                                        marginHorizontal: 0,
                                        marginVertical: 12,
                                        // width: MediaQuery.of(context).size.width*.42,
                                        prefixImage: AssetsConstant.phoneFill,
                                        prefixImageHeight: 16,

                                        onPressed: () {
                                          HomeApiController.to.makePhoneCall(outlet.mobile ?? '');
                                        },
                                      ),
                                    ),
                                    CustomSizedBox.space12W,
                                    Expanded(
                                      child: CustomButton(
                                        label: 'Get Location',
                                        marginHorizontal: 0,
                                        marginVertical: 12,
                                        // width: MediaQuery.of(context).size.width*.42,
                                        prefixImage: AssetsConstant.location,
                                        prefixImageHeight: 16,
                                        onPressed: () {
                                          HomeApiController.to.openMap(double.parse(outlet.latitude ?? '37.422'), double.parse(outlet.longitude ?? '-122.084'));
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
