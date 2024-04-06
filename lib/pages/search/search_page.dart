import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/category/widgets/single_category_product_widget.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/shared/loading.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils.dart';
import '../home/shimmer_list_home.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search_page';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searched = Get.arguments;
    return WillPopScope(
      onWillPop: () async {
        NavigationController.to.searchController.value.clear();
        NavigationController.to.isSearchFieldNotEmpty.value = false;
        NavigationController.to.resetFilters();
        return true;
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF9F9F9),
        drawer: const CustomDrawer(),
        body: Obx(
          () {
            return Column(
              children: [
                const HomeTopWidget(
                  isSearchPage: true,
                ),
                NavigationController.to.isSearchFieldNotEmpty.value
                    ? Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await HomeApiController.to.productListCallWithFilterCall(NavigationController.to.addAttribute);
                          },
                          child: HomeApiController.to.pListStatus.value == LoadingStatus.loading
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: GridView.builder(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 202, mainAxisExtent: 380, crossAxisSpacing: 8, mainAxisSpacing: 12),
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
                                          const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 380, crossAxisSpacing: 12, mainAxisSpacing: 12),
                                      itemCount: HomeApiController.to.productList.length,
                                      itemBuilder: (context, index) {
                                        // final data = CategoryController.to.categoryWiseITem[index];
                                        return SingleCategoryProductWidget(
                                          product: HomeApiController.to.productList[index],
                                        );
                                      },
                                    ),
                        ),
                      )
                    : Expanded(
                        child: Obx(() {
                          return ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              const TitleTextWidget(tileText: 'Trending Searches'),
                              ...List.generate(
                                  HomeApiController.to.trendingSearchList.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          NavigationController.to.searchFocus.value.requestFocus();
                                          NavigationController.to.searchController.value.text = HomeApiController.to.trendingSearchList[index].keyword!;
                                          NavigationController.to.update();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/trending.png',
                                                height: 16,
                                              ),
                                              CustomSizedBox.space8W,
                                              Text(
                                                HomeApiController.to.trendingSearchList[index].keyword!,
                                                style: AppTheme.textStyleNormalBlack14,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                              CustomSizedBox.space16H,
                              HomeController.to.homeData.firstWhere((element) => element.id == '6').productList!.isNotEmpty
                                  ? BestSellerListViewBuilder(
                                      model: HomeController.to.homeData.firstWhere((element) => element.id == '6'),
                                    )
                                  : const SizedBox.shrink()
                              // const BestSellerListViewBuilder()
                            ],
                          );
                        }),
                      ),
                if (NavigationController.to.isSearchFieldNotEmpty.value)
                  Center(
                    child: (HomeApiController.to.pListStatus.value == LoadingStatus.loadingMore) ? const PerfectoLoading() : const SizedBox.shrink(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
