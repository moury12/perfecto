import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
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
    return Scaffold(
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
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)]),
        child: FittedBox(
          child: Row(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    ProductDetailsController.to.isFavourite.value = !ProductDetailsController.to.isFavourite.value;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(border: Border.all(color: AppColors.kPrimaryColor, width: 1), borderRadius: BorderRadius.circular(4)),
                    child: ProductDetailsController.to.isFavourite.value
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
              CustomButton(
                label: 'Add To Bag',
                marginHorizontal: 8,
                marginVertical: 4,
                height: 50,
                prefixImage: AssetsConstant.cartIcon,
                prefixImageColor: Colors.white,
                prefixImageHeight: 20,
                primary: AppColors.kPrimaryColor,
                width: MediaQuery.of(context).size.width / 1.3,
                onPressed: () {},
              ),
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
