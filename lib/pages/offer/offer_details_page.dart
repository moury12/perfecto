import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/category/widgets/single_category_product_widget.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../constants/assets_constants.dart';

class OfferDetailsScreen extends StatelessWidget {
  static const String routeName = '/offer_details';
  const OfferDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomNetworkImage(
                      networkImagePath: HomeApiController.to.offerDetails.value.bannerMobile ?? '',
                      errorImagePath: AssetsConstant.banner2,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      borderRadius: 10,
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      scrollDirection: Axis.horizontal,
                      itemCount: HomeApiController.to.offerDetails.value.data!.length,
                      itemBuilder: (context, index) {
                        final data = HomeApiController.to.offerDetails.value.data![index];
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.circleBackground))),
                              height: 100,
                              width: 100,
                              child: CustomNetworkImage(
                                networkImagePath: data.image ?? '',
                                errorImagePath: AssetsConstant.foregrond2,
                                height: 60,
                                fit: BoxFit.cover,
                                width: 60,
                              ),
                            ),
                            Text(
                              data.name ?? '',
                              style: AppTheme.textStyleSemiBoldBlack10,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              ...List.generate(HomeApiController.to.offerDetails.value.data!.length, (index) {
                final cat = HomeApiController.to.offerDetails.value.data![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TitleTextWidget(tileText: cat.name ?? ''),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // await HomeApiController.to.productListWithCategoryCall({
                            //   'category': [category.id!].toString(),
                            // });
                            Get.toNamed(SingleCatergoryWiseScreen.routeName);
                          },
                          child: GestureDetector(
                            onTap: () {
                              // await HomeApiController.to.productListWithCategoryCall({
                              //   'category': [category.id!].toString(),
                              // });
                              Get.toNamed(SingleCatergoryWiseScreen.routeName);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 380, crossAxisSpacing: 12, mainAxisSpacing: 12),
                      itemCount: cat.products!.data!.length,
                      itemBuilder: (context, index) {
                        final data = CategoryController.to.categoryWiseITem[index];
                        final product = cat.products!.data![index].product!;
                        return SingleCategoryProductWidget(
                          product: product,
                          name: data['name'],
                          rating: data['rating'],
                          img: data['img'],
                          price: data['price'],
                          buttonText: data['buttonText'],
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
                          onTap: () {
                            print(data['isFavourite']);
                            data['isFavourite'] = !data['isFavourite'];
                            CategoryController.to.categoryWiseITem[index] = data;
                          },
                        );
                      },
                    )
                  ],
                );
              })
            ],
          ))
        ],
      ),
    );
  }
}
