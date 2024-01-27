import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeTopWidget(),
        Expanded(
          child: Obx(
            () => ListView(
              padding: EdgeInsets.zero,
              children: [
                ...List.generate(
                  HomeApiController.to.categoryList.length,
                  (index) => Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsConstant.blueCircleBackground4),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          HomeApiController.to.categoryList[index].name!,
                          style: TextStyle(color: AppColors.kDarkPrimaryColor, fontSize: 27, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.circleBackground4))),
                          child: CustomNetworkImage(
                            height: 80,
                            width: 80,
                            fit: BoxFit.contain,
                            networkImagePath: HomeApiController.to.categoryList[index].image!,
                            errorImagePath: AssetsConstant.foregrond3,
                            borderRadius: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                HomeApiController.to.categoryList.isNotEmpty && HomeApiController.to.categoryList.length > 2 ? const GreetingCardWidget() : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        Obx(() => HomeApiController.to.categoryList.length <= 2 ? const GreetingCardWidget() : SizedBox.shrink()),
      ],
    );
  }
}
