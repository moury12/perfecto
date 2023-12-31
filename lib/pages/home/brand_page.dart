import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});
static const String routeName='/brand';
  @override
  Widget build(BuildContext context) {
    List<String> alphabets =HomeController.to.generateAlphabets();
    return Scaffold(backgroundColor: AppColors.kBackgroundColor,
      drawer: CustomDrawer(),
      body:Column(children: [
      HomeTopWidget(),
      Expanded(child: Stack(alignment: Alignment.bottomRight,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              TitleTextWidget(tileText: 'Popular Brands'),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {

                  return
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(SingleCatergoryWiseScreen.routeName);
                      },
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),color: Color(0xffF2F4F5)),
                          child: CustomNetworkImage(networkImagePath: '',errorImagePath: AssetsConstant.brandLogo,height: 45,fit: BoxFit.contain,)),
                    )
                  ;
                },
                itemCount: 9,
              ),
              TitleTextWidget(tileText: 'All Brands'),
          ...List.generate(HomeController.to.brands.length, (index) {
            final data =HomeController.to.brands[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text(data['id'],style: AppTheme.textStyleNormalFadeBlack12,),
               ...List.generate(data['product'].length, (subIndex) {
           final subData = data['product'][subIndex];
           return GestureDetector(
             onTap: () {
               Get.toNamed(SingleCatergoryWiseScreen.routeName);
             },
             child: Container(width: double.infinity,
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical:4.0),
                 child: Text(subData,style: AppTheme.textStyleMediumBlack14,),
               ),
             ),
           );
               }),CustomSizedBox.space12H,
                Divider(color: AppColors.kborderColor,height: 1,)
              ],
            ),
          );})
            ],),
          Container(width: 30,height:600,alignment: Alignment.bottomRight,
            margin:EdgeInsets.symmetric(horizontal: 16),decoration: BoxDecoration(color: Color(0xffF2F4F5),borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
              itemBuilder: (context, index) {
              final alphabet=alphabets[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(alphabet,textAlign: TextAlign.center,style: AppTheme.textStyleNormalBlack10,),
              );
            },
            itemCount: alphabets.length,),
          )
        ],
      ))
    ],),);
  }
}
