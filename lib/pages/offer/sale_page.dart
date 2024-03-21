import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/category/widgets/single_category_product_widget.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/offer/controller/offer_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';

class SaleScreen extends StatelessWidget {
  static const String routeName = '/sale';
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: CustomDrawer(),
        body: Column(
          children: [
            HomeTopWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: GridItemWidget(
                  /*data: HomeController.to.megadealsITem,*/ model: Get.arguments,
                  size: size, /*img: AssetsConstant.superOfferBackground*/
                ),
              ) /*ListView(
                padding: EdgeInsets.zero,
                children: [
                  GridItemForSegmentsWidget(
                    size: size,
                    img: AssetsConstant.skinCareBackground,
                    data: OfferController.to.categoryWiseITem,
                  ),
                  // CustomSizedBox.space16H,
                  // GridItemWidget(size: size, img: AssetsConstant.skinCareBackground, data:  OfferController.to.megadealsITem,),
                  // CustomSizedBox.space16H,
                ],
              )*/
              ,
            )
          ],
        ));
  }
}
