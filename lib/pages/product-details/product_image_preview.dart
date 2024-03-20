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

class ProductImagePreview extends StatelessWidget {
  static const String routeName = '/product_img_preview';
  const ProductImagePreview({super.key});

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
              Obx(() {
                return CustomNetworkImage(
                  networkImagePath: ProductDetailsController.to.product.value.variationType == 'shade'
                      ? ProductDetailsController.to.product.value.productShades!
                          .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                          .productShadeImages![ProductDetailsController.to.selectedImageForPage.value]
                          .productShadeImage!
                      : ProductDetailsController.to.product.value.productSizes!
                          .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                          .productSizeImages![ProductDetailsController.to.selectedImageForPage.value]
                          .productSizeImage!,
                  fit: BoxFit.fill,
                  errorImagePath: ProductDetailsController.to.displayUrl.value.isEmpty ? AssetsConstant.megaDeals1 : ProductDetailsController.to.displayUrl.value,
                  width: double.infinity,
                  height: 400,
                  borderRadius: 0,
                );
              }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Text(
                  ProductDetailsController.to.product.value.name ?? '-',
                  style: AppTheme.textStyleBoldBlack14,
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductDetailsController.to.product.value.variationType == 'shade'
                      ? ProductDetailsController.to.product.value.productShades!
                          .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                          .productShadeImages!
                          .length
                      : ProductDetailsController.to.product.value.productSizes!
                          .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                          .productSizeImages!
                          .length,
                  itemBuilder: (context, index) {
                    final data = ProductDetailsController.to.product.value.variationType == 'shade'
                        ? ProductDetailsController.to.product.value.productShades!
                            .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                            .productShadeImages![index]
                            .productShadeImage!
                        : ProductDetailsController.to.product.value.productSizes!
                            .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                            .productSizeImages![index]
                            .productSizeImage!;
                    return GestureDetector(
                      onTap: () {
                        // ProductDetailsController.to.displayUrl.value = ProductDetailsController.to.images[index];
                        ProductDetailsController.to.selectedImageForPage.value = index;
                      },
                      child: Stack(
                        children: [
                          CustomNetworkImage(
                            networkImagePath: data,
                            borderRadius: 0,
                            errorImagePath: AssetsConstant.megaDeals1,
                            height: 120,
                            fit: BoxFit.fitHeight,
                          ),
                          Obx(
                            () => index != ProductDetailsController.to.selectedImageForPage.value
                                ? Positioned.fill(
                                    child: Container(
                                    color: Colors.white.withOpacity(.6),
                                  ))
                                : SizedBox.shrink(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomCalculationTotalWidget(
        isSelectSize: ProductDetailsController.to.product.value.variationType == 'size',
      ),
    );
  }
}
