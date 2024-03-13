import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/pages/product-details/product_discription_page.dart';
import 'package:perfecto/pages/product-details/product_image_preview.dart';
import 'package:perfecto/pages/product-details/product_shade_page.dart';
import 'package:perfecto/pages/product-details/review/review_page.dart';
import 'package:perfecto/pages/product-details/review/widget/comment_widget.dart';
import 'package:perfecto/pages/product-details/review/write_review_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:collection/collection.dart';

class ComboDetailsScreen extends StatelessWidget {
  static const String routeName = '/comboDetails';
  const ComboDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Obx(() {
                  return SizedBox(
                    height: 360,
                    child: PageView.builder(
                      padEnds: false,
                      scrollDirection: Axis.horizontal,
                      controller: PageController(),
                      onPageChanged: (value) {
                        ProductDetailsController.to.currentPage.value = value;
                      },
                      itemCount: jsonDecode(ProductDetailsController.to.comboDetails.value.images!).isEmpty
                          ? 1
                          : jsonDecode(ProductDetailsController.to.comboDetails.value.images!).length,
                      itemBuilder: (context, index) {
                        String data = jsonDecode(ProductDetailsController.to.comboDetails.value.images!).isEmpty
                            ? ProductDetailsController.to.comboDetails.value.image!
                            : jsonDecode(ProductDetailsController.to.comboDetails.value.images!)[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(ProductImagePreview.routeName);
                          },
                          child: CustomNetworkImage(
                            networkImagePath: data,
                            fit: BoxFit.fill,
                            errorImagePath: data,
                            height: double.maxFinite,
                            width: double.infinity,
                            borderRadius: 0,
                          ),
                        );
                      },
                    ),
                  );
                }),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(jsonDecode(ProductDetailsController.to.comboDetails.value.images!).length, (index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ProductDetailsController.to.currentPage.value == index ? AppColors.kPrimaryColor : const Color(0xffD9D9D9),
                        ),
                      );
                    }),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Obx(() {
                    return Text(
                      ProductDetailsController.to.comboDetails.value.name ?? 'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                      style: AppTheme.textStyleBoldBlack20.copyWith(fontFamily: 'InriaSans'),
                    );
                  }),
                ),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          '৳ ${ProductDetailsController.to.comboDetails.value.discountedPrice}  ',
                          style: AppTheme.textStyleBoldBlack20,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            ProductDetailsController.to.isAvaiableShade.value = !ProductDetailsController.to.isAvaiableShade.value;
                          },
                          child: Icon(
                            Icons.share,
                            color: Colors.black.withOpacity(.4),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  // decoration: BoxDecoration(
                  //     color: AppColors.kAccentColor,
                  //     borderRadius: BorderRadius.circular(4),
                  //     border: Border.all(color: AppColors.kAccentColor, width: 1.5),
                  //     boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
                  child: Obx(() {
                    final combo = ProductDetailsController.to.comboDetails.value;
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        final product = combo.comboProductDetails![index];
                        return ListTile(
                          onTap: () async {
                            await ProductDetailsController.to.getProductDetails(product.product!.id!);
                            Get.toNamed(ProductDetailsScreen.routeName);
                          },
                          leading: Text((index + 1).toString()),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (product.product?.name ?? ''),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomSizedBox.space8H,
                              Text(
                                'Select ${product.comboProductInfos!.first.shade != null ? 'Shade' : 'Size'}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff252728),
                                ),
                              ),
                              CustomSizedBox.space4H,
                              product.comboProductInfos!.first.shade != null
                                  ? Wrap(
                                      children: product.comboProductInfos!
                                          .map(
                                            (e) => GestureDetector(
                                              onTap: () {
                                                product.variantId = e.shadeId;
                                                ProductDetailsController.to.comboDetails.refresh();
                                              },
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(right: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(color: Colors.white, width: 2),
                                                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 0)],
                                                    ),
                                                    child: CustomNetworkImage(
                                                      networkImagePath: e.shade!.image!,
                                                      height: 40,
                                                      width: 40,
                                                      borderRadius: 5,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  product.variantId == e.shadeId
                                                      ? const Icon(
                                                          Icons.check,
                                                          color: Colors.white,
                                                        )
                                                      : const SizedBox.shrink()
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    )
                                  : Wrap(
                                      children: product.comboProductInfos!
                                          .map((e) => GestureDetector(
                                                onTap: () {
                                                  product.variantId = e.sizeId;
                                                  ProductDetailsController.to.comboDetails.refresh();
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.symmetric(horizontal: 6),
                                                  width: 60,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: product.variantId == e.sizeId ? AppColors.kPrimaryColor : Colors.transparent,
                                                    border: Border.all(color: AppColors.kPrimaryColor, width: 1.5),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                  child: Text(
                                                    e.size!.name!,
                                                    textAlign: TextAlign.center,
                                                    style: product.variantId == e.sizeId ? AppTheme.textStyleSemiBoldWhite14 : AppTheme.textStyleSemiBoldFadeBlack14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                            ],
                          ),
                        );
                      },
                      itemCount: combo.comboProductDetails!.length,
                    );
                  }),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: AppColors.kAccentColor),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          width: MediaQuery.of(context).size.width / 2.2,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsConstant.authenticIcon,
                                height: 24,
                              ),
                              CustomSizedBox.space8W,
                              const Text(
                                '100% Authentic',
                                style: TextStyle(color: Colors.black54, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        CustomSizedBox.space4W,
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(color: AppColors.kAccentColor),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsConstant.returnIcon,
                                height: 24,
                              ),
                              CustomSizedBox.space8W,
                              const Text(
                                'Easy Return Policy',
                                style: TextStyle(color: Colors.black54, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
        child: CustomButton(
          label: 'Add To Bag',
          marginHorizontal: 16,
          marginVertical: 20,
          height: 50,
          prefixImage: AssetsConstant.cartIcon,
          prefixImageColor: Colors.white,
          prefixImageHeight: 20,
          primary: AppColors.kPrimaryColor,
          width: MediaQuery.of(context).size.width / 1.3,
          onPressed: () {
            final data = {
              'quantity': '1',
              'combo_product_id': ProductDetailsController.to.comboDetails.value.id!,
              'combo_info': jsonEncode(ProductDetailsController.to.comboDetails.value.comboProductDetails!
                  .map((e) => {
                        "product_id": e.productId!,
                        if (e.product!.variationType == 'size') "size_id": e.variantId,
                        if (e.product!.variationType == 'size') "shade_id": null,
                        if (e.product!.variationType == 'shade') "shade_id": e.variantId,
                        if (e.product!.variationType == 'shade') "size_id": null
                      })
                  .toList()),
            };
            globalLogger.d(data);

            UserController.to.addToCart(data);
          },
        ),
      ),
    );
  }
}
