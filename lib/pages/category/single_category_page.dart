import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/shimmer_list_home.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/shared/loading.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/home_api_controller.dart';
import '../../controller/navigation_controller.dart';
import '../../drawer/custom_drawer.dart';
import '../../utils.dart';
import 'widgets/single_category_product_widget.dart';

class SingleCategoryWiseScreen extends StatelessWidget {
  static const String routeName = '/singleCategory_Product';
  const SingleCategoryWiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;

    return WillPopScope(
      onWillPop: () async {
        NavigationController.to.resetFilters();
        NavigationController.to.addAttribute = {};
        return true;
      },
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HomeTopWidget(isNeedFilter: true),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await HomeApiController.to.productListCallWithFilterCall(NavigationController.to.addAttribute, initialCall: true);
                    },
                    child: HomeApiController.to.pListStatus.value == LoadingStatus.loading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: GridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              shrinkWrap: true,
                              primary: false,
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 202, mainAxisExtent: 380, crossAxisSpacing: 8, mainAxisSpacing: 12),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                // final data = CategoryController.to.categoryWiseITem[index];
                                return const ShimmerWidget();
                              },
                            ),
                          )
                        : HomeApiController.to.productList.isEmpty
                            ? const Center(
                                child: Text('There is no product available.'),
                              )
                            : GridView.builder(
                                controller: HomeApiController.to.scrollController,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                shrinkWrap: true,
                                primary: false,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 202, mainAxisExtent: 380, crossAxisSpacing: 8, mainAxisSpacing: 12),
                                itemCount: HomeApiController.to.productList.length,
                                itemBuilder: (context, index) {
                                  // final data = CategoryController.to.categoryWiseITem[index];
                                  return SingleCategoryProductWidget(
                                    product: HomeApiController.to.productList[index],
                                  );
                                },
                              ),
                  ),
                ),
                // Text(HomeApiController.to.pListStatus.errorMessage.toString()),
                (HomeApiController.to.pListStatus.value == LoadingStatus.loadingMore) ? const PerfectoLoading() : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}
