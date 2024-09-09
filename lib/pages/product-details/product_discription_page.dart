import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/cart_model.dart';
import 'package:perfecto/pages/auth/login_page.dart';
import 'package:perfecto/pages/child_nav_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../home/widgets/mega_deals_widget.dart';

class ProductDescriptionScreen extends StatelessWidget {
  static const String routeName = '/product_description';
  const ProductDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChildNavScreen(
      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: AppColors.kBackgroundColor,
        body: Column(
          children: [
            const HomeTopWidget(),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xffECECEC), width: 1.5)),
              ),
              child: TabBar(
                  isScrollable: true,
                  labelColor: AppColors.kBlackColor,
                  unselectedLabelColor: Colors.black54,
                  labelStyle: AppTheme.textStyleBoldBlack14,
                  unselectedLabelStyle: AppTheme.textStyleBoldFadeBlack14,
                  indicatorColor: AppColors.kPrimaryColor,
                  dividerColor: AppColors.kborderColor,
                  labelPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  controller: ProductDetailsController.to.tabController2,
                  tabs: ProductDetailsController.to.tabTiles2.map((String title) {
                    return Tab(
                      text: title,
                    );
                  }).toList()),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: TabBarView(
                        controller: ProductDetailsController.to.tabController2,
                        children: List.generate(ProductDetailsController.to.tabTiles2.length, (index) {
                          return buildwidget(index, context);
                        })),
                  ),
                  Divider(thickness: 1.5, color: Color(0xffECECEC)),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 95,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
          child: Row(
            children: [
              CustomSizedBox.space8W,
              Obx(() {
                return GestureDetector(
                  onTap: () async {
                    if (AuthController.to.isLoggedIn.value) {
                      await UserController.to.addToWish(ProductDetailsController.to.product.value.id!);
                    } else {
                      Get.toNamed(LoginScreen.routeName);
                    }
                  },
                  child: Container(
                    height: 46,
                    width: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(border: Border.all(color: AppColors.kPrimaryColor, width: 1), borderRadius: BorderRadius.circular(4)),
                    child: AuthController.to.isLoggedIn.value && UserController.to.wishList.any((element) => element.productId == ProductDetailsController.to.product.value.id)
                        ? Image.asset(
                            AssetsConstant.favIconFill,
                            height: 24,
                          )
                        : Image.asset(
                            AssetsConstant.favIcon,
                            height: 26,
                          ),
                  ),
                );
              }),
              CustomSizedBox.space4W,
              Expanded(
                child: Obx(() {
                  final cartModel = AuthController.to.isLoggedIn.value ? UserController.to.checkCart() : true;

                  return (cartModel == null || cartModel == true)
                      ? CustomButton(
                          label: (ProductDetailsController.to.product.value.variationType == 'size'
                                  ? ProductDetailsController.to.product.value.productSizes!
                                          .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                          .stock ==
                                      '0'
                                  : ProductDetailsController.to.product.value.productShades!
                                          .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                          .stock ==
                                      '0')
                              ? 'Request for Stock'
                              : 'Add To Bag',
                          marginHorizontal: 8,
                          elevation: 0,
                          marginVertical: 4,
                          height: 46,
                          isBorder: false,
                          prefixImage: (ProductDetailsController.to.product.value.variationType == 'size'
                                  ? ProductDetailsController.to.product.value.productSizes!
                                          .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                          .stock ==
                                      '0'
                                  : ProductDetailsController.to.product.value.productShades!
                                          .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                          .stock ==
                                      '0')
                              ? AssetsConstant.stockIcon
                              : AssetsConstant.cartIcon,
                          prefixImageColor: Colors.white,
                          prefixImageHeight: 20,
                          primary: HomeController.to.generalSettings.value.buyStatus == '1' ? AppColors.kPrimaryColor : AppColors.kDarkPrimaryColor,
                          width: MediaQuery.of(context).size.width / 1.3,
                          onPressed: () {
                            if (AuthController.to.isLoggedIn.value) {
                              if (HomeController.to.generalSettings.value.buyStatus == '0') {
                                showSnackBar(msg: HomeController.to.generalSettings.value.buyStatusNote ?? "Our Buy option is disabled. Please try again later.");
                              } else {
                                if (ProductDetailsController.to.product.value.variationType == 'size'
                                    ? ProductDetailsController.to.product.value.productSizes!
                                            .firstWhere((element) => element.sizeId == ProductDetailsController.to.selectedVariation.value)
                                            .stock ==
                                        '0'
                                    : ProductDetailsController.to.product.value.productShades!
                                            .firstWhere((element) => element.shadeId == ProductDetailsController.to.selectedVariation.value)
                                            .stock ==
                                        '0') {
                                  final data = {
                                    "product_id": ProductDetailsController.to.product.value.id!,
                                    if (ProductDetailsController.to.product.value.variationType == 'size') "size_id": ProductDetailsController.to.selectedVariation.value,
                                    if (ProductDetailsController.to.product.value.variationType == 'shade') "shade_id": ProductDetailsController.to.selectedVariation.value,
                                  };
                                  globalLogger.d(data);

                                  UserController.to.stockRequest(data);
                                } else {
                                  final data = {
                                    "product_id": ProductDetailsController.to.product.value.id!,
                                    if (ProductDetailsController.to.product.value.variationType == 'size') "size_id": ProductDetailsController.to.selectedVariation.value,
                                    if (ProductDetailsController.to.product.value.variationType == 'shade') "shade_id": ProductDetailsController.to.selectedVariation.value,
                                    "quantity": '1',
                                  };
                                  globalLogger.d(data);

                                  UserController.to.addToCart(data);
                                }
                              }
                            } else {
                              Get.toNamed(LoginScreen.routeName);
                            }
                          },
                        )
                      : Container(
                          height: 46,
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.kPrimaryColor,
                                width: 1,
                              ),
                              color: AppColors.kPrimaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (int.parse((cartModel).quantity!) >
                                      (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) : */ 1)) {
                                    final dynamic body = {
                                      // 'product_id': (cartModel as CartModel)!.productId!,
                                      'quantity': (int.parse((cartModel).quantity!) -
                                              (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) :*/ 1))
                                          .toString(),
                                    };
                                    globalLogger.d(body);
                                    UserController.to.updateCart(body, (cartModel).id ?? '');
                                  } else {
                                    // UserController.to.removeFromCart((cartModel as CartModel)?.id ?? '');
                                    showSnackBar(msg: 'One Quantity is minimum');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.remove,
                                    color: int.parse((cartModel as CartModel).quantity!) ==
                                            (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) :*/ 1)
                                        ? AppColors.kAccentColor
                                        : Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: .5,
                                color: AppColors.kPrimaryColor,
                                // margin: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '${(cartModel).quantity} Added',
                                    style: AppTheme.textStyleMediumWhite14,
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: .5,
                                color: AppColors.kPrimaryColor,
                                // margin: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              GestureDetector(
                                onTap: () {
                                  final dynamic body = {
                                    // 'product_id': (cartModel as CartModel)!.productId!,
                                    'quantity': (int.parse((cartModel).quantity!) +
                                            (/*(cartModel as CartModel)?.buyGetInfo != null ? (int.parse((cartModel as CartModel)!.buyGetInfo!.buyQuantity!)) : */ 1))
                                        .toString(),
                                  };
                                  globalLogger.d(body);
                                  UserController.to.updateCart(body, (cartModel).id ?? '');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                }),
              ),
              CustomSizedBox.space8W,
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildwidget(int tabIndex, BuildContext context) {
  //   switch (tabIndex) {
  //     case 0:
  //       return Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 16.0),
  //           child: SingleChildScrollView(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 CustomSizedBox.space12H,
  //                 Column(
  //                   children: List.generate(
  //                       5,
  //                       (index) => CustomNetworkImage(
  //                             networkImagePath: '',
  //                             borderRadius: 0,
  //                             errorImagePath: 'assets/discription.png',
  //                             width: double.infinity,
  //                             height: 200,
  //                           )),
  //                 ),
  //                 CustomSizedBox.space12H,
  //                 Text(
  //                   'Lorem ipsum dolor sit amet consectetur. Elementum neque est bibendum quis. Sed vitae curabitur elementum felis urna sed sed diam. Arcu tempor ullamcorper viverra morbi venenatis amet donec in maecenas. Lorem ipsum dolor sit amet consectetur. Elementum neque est bibendum quis. Sed vitae curabitur elementum felis urna sed sed diam. Arcu tempor ullamcorper viverra morbi venenatis amet donec in maecenas.',
  //                   style: AppTheme.textStyleNormalBlack14,
  //                 ),
  //                 CustomSizedBox.space12H,
  //                 Text(
  //                   'Expiry Date: 15 May 2025',
  //                   style: AppTheme.textStyleBoldBlack14,
  //                 ),
  //                 CustomSizedBox.space12H,
  //                 Text(
  //                   'Country of Origin: India',
  //                   style: AppTheme.textStyleBoldBlack14,
  //                 ),
  //                 CustomSizedBox.space12H,
  //                 CustomSizedBox.space12H,
  //                 Text(
  //                   'Manufacturer: Hindustan Unilever Ltd.',
  //                   style: AppTheme.textStyleBoldBlack14,
  //                 ),
  //                 CustomSizedBox.space12H,
  //                 Text(
  //                   'Address: Unit Ii - Haridwar',
  //                   style: AppTheme.textStyleBoldBlack14,
  //                 ),
  //                 CustomSizedBox.space12H,
  //               ],
  //             ),
  //           ));
  //     case 1:
  //       return Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Text(
  //           'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
  //           style: AppTheme.textStyleSemiBoldBlack14,
  //         ),
  //       );
  //     case 2:
  //       return Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Text(
  //           'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
  //           style: AppTheme.textStyleSemiBoldBlack14,
  //         ),
  //       );
  //     case 3:
  //       return Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Text(
  //           'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
  //           style: AppTheme.textStyleSemiBoldBlack14,
  //         ),
  //       );
  //
  //     default:
  //       return Center(
  //         child: Text(
  //           'Unknown Tab',
  //           style: TextStyle(fontSize: 10),
  //         ),
  //       );
  //   }
  // }
}
