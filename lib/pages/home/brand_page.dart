import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});
  static const String routeName = '/brand';
  @override
  Widget build(BuildContext context) {
    List<String> alphabets = HomeController.to.generateAlphabets();
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      drawer: const CustomDrawer(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTopWidget(),
          const TitleTextWidget(tileText: 'Popular Brands'),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 100,
            ),
            itemBuilder: (context, index) {
              final popularBrand = HomeApiController.to.brandList
                  .where((p0) => p0.isPopular == '1')
                  .toList();
              final brand = popularBrand[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(SingleCatergoryWiseScreen.routeName);
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color(0xffF2F4F5)),
                    child: CustomNetworkImage(
                      networkImagePath: brand.image ?? '',
                      errorImagePath: AssetsConstant.brandLogo,
                      // height: 45,
                      borderRadius: 0,
                      fit: BoxFit.cover,
                    )),
              );
            },
            itemCount: HomeApiController.to.brandList
                .where((p0) => p0.isPopular == '1')
                .length,
          ),
          CustomSizedBox.space8H,
          const TitleTextWidget(tileText: 'All Brands'),
          Expanded(
            child: AzListView(
              data: HomeApiController.to.brandList,
              itemCount: HomeApiController.to.brandList.length,
              itemBuilder: (context, index) {
                final subData = HomeApiController.to.brandList[index];
                return Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 16),
                    child: Text(
                      subData.name ?? '',
                      style: AppTheme.textStyleMediumBlack14,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
