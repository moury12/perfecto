import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../controller/navigation_controller.dart';

class HomeTopWidget extends StatelessWidget {
  final bool isSearchInclude;
  final TextEditingController? controller;
  const HomeTopWidget({super.key, this.controller, this.isSearchInclude = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08))]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  AssetsConstant.drawerIcon,
                  height: 22,
                ),
                CustomSizedBox.space8W,
                Image.asset(AssetsConstant.perfectoLogo, height: 18),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: AppColors.kAccentColor, borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsConstant.pointsIcon,
                        height: 12,
                      ),
                      CustomSizedBox.space4W,
                      RichText(
                          text: const TextSpan(
                              text: '', children: [TextSpan(text: '0', style: AppTheme.textStyleBoldBlack12), TextSpan(text: ' Points', style: AppTheme.textStyleNormalBlack12)])),
                    ],
                  ),
                ),
                CustomSizedBox.space16W,
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AssetsConstant.cartIcon,
                      height: 20,
                    ),
                    Positioned(
                      top: 0,
                      right: -8,
                      child: Container(
                        padding: EdgeInsets.all(2.5),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.kDarkPrimaryColor),
                        child: Text('12', style: AppTheme.textStyleBoldWhite8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          isSearchInclude
              ? CustomTextField(
                  height: 42,
                  controller: controller ?? NavigationController.to.searchController!,
                  hintText: 'Search for products...',
                  focusColor: AppColors.kPrimaryColor,
                  enableBorderColor: AppColors.kPrimaryColor,
                  prefixWidget: Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  marginVertical: 8,
                  marginBottom: 16,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
class PrimaryAcceantListViewItemWidget extends StatelessWidget {
  final String? title;
  const PrimaryAcceantListViewItemWidget({
    super.key, this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffEAF9FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               TitleTextWidget(tileText:title?? 'Personal Care'),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
    );
  }
}
