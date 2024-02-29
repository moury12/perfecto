import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';

import '../../controller/home_api_controller.dart';
import '../../controller/navigation_controller.dart';
import '../../drawer/custom_drawer.dart';
import 'widgets/single_category_product_widget.dart';

class SingleCatergoryWiseScreen extends StatelessWidget {
  static const String routeName = '/singleCategory_Product';
  const SingleCatergoryWiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;

    return WillPopScope(
      onWillPop: () async {
        NavigationController.to.resetFilters();
        return true;
      },
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeTopWidget(isNeedFilter: true),
              Expanded(
                  child: Center(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    CustomSizedBox.space8H,
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 202, mainAxisExtent: 380, crossAxisSpacing: 8, mainAxisSpacing: 12),
                      itemCount: HomeApiController.to.productList.length,
                      itemBuilder: (context, index) {
                        final data = CategoryController.to.categoryWiseITem[index];
                        return SingleCategoryProductWidget(
                          product: HomeApiController.to.productList[index],
                          name: data['name'],
                          rating: data['rating'],
                          img: data['img'],
                          price: data['price'],
                          // buttonText: data['buttonText'],
                          previousPrice: data['previousPrice'],
                          isBestSeller: data['isBestSeller'],
                          isStacked: data['isStacked'],
                          isBuy1Get1: data['isbuy1Get1'],
                          isDiscount: data['isDiscount'],
                          isFavourite: data['isFavourite'],
                          isFeatured: data['isFeatured'],
                          isOnSale: data['isOnSale'],
                          isOutofStock: data['isOutofStock'],
                          isShadeSwatch: data['shade'],
                        );
                      },
                    ),
                    CustomSizedBox.space8H,
                  ],
                ),
              ))
            ],
          );
        }),
      ),
    );
  }
}
