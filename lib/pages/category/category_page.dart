import 'package:flutter/material.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
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
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ...List.generate(
                5,
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
                          const Text('MakeUp', style: TextStyle(color: AppColors.kDarkPrimaryColor, fontSize: 27, fontWeight: FontWeight.w700)),
                          const Spacer(),
                          Container(
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.circleBackground4))),
                            child: const CustomNetworkImage(
                              networkImagePath: '',
                              errorImagePath: AssetsConstant.foregrond3,
                              borderRadius: 0,
                            ),
                          )
                        ],
                      ),
                    )),
            const GreetingCardWidget(),

          ],
        ))
      ],
    );
  }
}
