import 'package:flutter/material.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName='/category';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTopWidget(),
        Expanded(child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ...List.generate(5, (index) => Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.blueCircleBackground4),fit: BoxFit.fill,),
              ),
              child: Row(children: [Text('MakeUp',style: TextStyle(color: AppColors.kDarkPrimaryColor,fontSize: 27,fontWeight: FontWeight.w700)), Spacer(),Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.circleBackground4))),child: CustomNetworkImage(networkImagePath: '',errorImagePath:AssetsConstant.foregrond3 ,borderRadius: 0,),)
                ],),
            )),
            GreetingCardWidget(),
            SizedBox(height: 62,)
          ],
        ))
      ],
    );
  }
}
