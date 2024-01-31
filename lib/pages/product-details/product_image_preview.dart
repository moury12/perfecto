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
                  networkImagePath: '',
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
                  'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                  style: AppTheme.textStyleBoldBlack14,
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ProductDetailsController.to.displayUrl.value = ProductDetailsController.to.images[index];
                    },
                    child: Obx(() {
                      return Stack(
                        children: [
                          CustomNetworkImage(
                            networkImagePath: '',
                            borderRadius: 0,
                            errorImagePath: ProductDetailsController.to.images.value[index],
                            height: 120,
                            fit: BoxFit.fitHeight,
                          ),
                          ProductDetailsController.to.displayUrl.value != ProductDetailsController.to.images[index]
                              ? Positioned.fill(
                                  child: Container(
                                  color: Colors.white.withOpacity(.6),
                                ))
                              : SizedBox.shrink()
                        ],
                      );
                    }),
                  ),
                  itemCount: ProductDetailsController.to.images.value.length,
                ),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomCalculationTotalWidget(
        isSelectSize: false,
      ),
    );
  }
}
