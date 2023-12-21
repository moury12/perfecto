import 'package:flutter/material.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import '../../theme/theme_data.dart';
import '../home/widgets/home_top_widget.dart';

class OutletDetailsScreen extends StatelessWidget {
  static const String routeName = '/outletDetails';
  const OutletDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithNavigation(
      scaffoldChild: Scaffold(drawer: CustomDrawer(),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsConstant.mapView),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HomeTopWidget(
                isSearchInclude: false,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  color: Colors.black.withOpacity(.12))
                            ]),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                          style:
                                              AppTheme.textStyleNormalFadeBlack12,
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
                            const Text(
                              '#Shop #GB , Ground Floor , 38,sonargaon Janapath sector - 11 , uttara< Dhaka (opposite of Zamzam Tower)',
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

                                    onPressed: () {},
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
                                    onPressed: () {},
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
        ),
      ),
    );
  }
}
