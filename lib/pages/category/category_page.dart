import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/product_attribute_model.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeTopWidget(),
        Expanded(
          child: Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                await HomeApiController.to.categoryListCall();
              },
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  if (HomeApiController.to.categoryListStatus.value == LoadingStatus.loading) ...[
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          itemCount: 4,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(16),
                              ),
                            );
                          }),
                    )
                  ],
                  if (HomeApiController.to.categoryListStatus.value == LoadingStatus.loaded)
                    ...List.generate(
                      HomeApiController.to.categoryList.length,
                      (index) => CategoryCard(
                        category: HomeApiController.to.categoryList[index],
                      ),
                    ),
                  HomeApiController.to.categoryList.isNotEmpty && HomeApiController.to.categoryList.length > 2
                      ? GreetingCardWidget(
                          model: HomeController.to.homeData.firstWhere((element) => element.id == '19'),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
        Obx(() => HomeApiController.to.categoryList.length <= 2
            ? GreetingCardWidget(
                model: HomeController.to.homeData.firstWhere((element) => element.id == '19'),
              )
            : const SizedBox.shrink()),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        HomeApiController.to.productListWithCategoryCall({
          'category': [category.id!].toString(),
        });
        NavigationController.to.resetFilters();
        HomeApiController.to.categoryList.firstWhere((element) => element.id == category.id).isChecked = true;
        NavigationController.to.addAttribute.addAll({
          'category': [category.id!].toString(),
        });

        // NavigationController.to.addAttribute = {
        //   'category': [category.id!].toString(),
        // };
        Get.toNamed(SingleCategoryWiseScreen.routeName);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsConstant.blueCircleBackground4),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            Text(
              category.name!,
              style: const TextStyle(color: AppColors.kDarkPrimaryColor, fontSize: 27, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.circleBackground4))),
              child: CustomNetworkImage(
                height: 80,
                width: 80,
                fit: BoxFit.contain,
                networkImagePath: category.image!,
                errorImagePath: AssetsConstant.foregrond3,
                borderRadius: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
