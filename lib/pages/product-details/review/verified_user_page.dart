import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/product_shade_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class VerifiedUserScreen extends StatelessWidget {
  static const String routeName = '/verified_user';
  const VerifiedUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        children: [
          HomeTopWidget(
            isSearchInclude: false,
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomNetworkImage(
                    networkImagePath: '',
                    fit: BoxFit.fill,
                    errorImagePath: AssetsConstant.megaDeals1,
                    width: double.infinity,
                    height: 400,
                    borderRadius: 0,
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(.7),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                              child: Row(children: [
                                Text(
                                  '5',
                                  style: AppTheme.textStyleBoldWhite12,
                                ),
                                CustomSizedBox.space4W,
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.white,
                                  size: 16,
                                )
                              ]),
                            ),
                            Spacer(),
                            Text(
                              '20 July 2023',
                              style: AppTheme.textStyleNormalWhite12,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              Container(
                  color: Colors.black.withOpacity(.7),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '“Velvet in bullet.....”',
                        style: AppTheme.textStyleBoldWhite14,
                      ),
                      CustomSizedBox.space4H,
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                          style: AppTheme.textStyleNormalWhite12,
                        ),
                        TextSpan(
                          text: '...Read More',
                          style: AppTheme.textStyleSemiBoldWhite14,
                          onEnter: (event) {},
                        )
                      ])),
                      CustomSizedBox.space20H,
                      Row(
                        children: [
                          Text(
                            'Vinod Kumar',
                            style: AppTheme.textStyleBoldWhite14,
                          ),
                          Spacer(),
                          Text(
                            '6762 people found this helpful',
                            style: AppTheme.textStyleNormalWhite10,
                          )
                        ],
                      ),
                      CustomSizedBox.space4H,
                      Row(
                        children: [
                          Image.asset(
                            AssetsConstant.verified,
                            height: 14,
                          ),
                          CustomSizedBox.space4W,
                          Text(
                            'Verified Buyers',
                            style: AppTheme.textStyleNormalWhite10,
                          )
                        ],
                      ),
                      CustomSizedBox.space32H
                    ],
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
