import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              HomeTopWidget(controller: controller),
       Expanded(
         child: ListView(
           padding: EdgeInsets.zero,
           children: [ SizedBox(
             height: 200,
             child:  Obx(() => PageView.builder(
               scrollDirection: Axis.horizontal,
               controller: controller.pageController.value,
               onPageChanged: (value) {

                 controller.currentPage.value = value;

               },
               itemCount: controller.bannerContent.length,
               itemBuilder: (context, index) {
                 controller.currentPage.value = index;
                 String data = controller.bannerContent[index];
                 return Padding(
                   padding: const EdgeInsets.symmetric(
                       vertical: 0),
                   child: Image.network(
                       '',
                       fit: BoxFit.cover,
                       errorBuilder: (context, error, stackTrace) =>
                           Image.asset(data,fit: BoxFit.cover,)

                   ),
                 );
               },
             ))
         ),
           CustomSizedBox.space8H,
           GridView.builder(
             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
             shrinkWrap: true,
             primary: false,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 mainAxisExtent: 90,
                 crossAxisSpacing: 8,
                 mainAxisSpacing: 8,
                 crossAxisCount: 4),
             itemCount:controller. productItem.length,
             itemBuilder: (context, index) {
               Map<String, dynamic> data = controller.productItem[index];
               return controller.productItem.length>7?index==7?Container(
                 decoration: BoxDecoration(
                     color: AppColors.kPrimaryColor, borderRadius: BorderRadius.circular(10)),
                 padding: const EdgeInsets.all(12),
                 child: Column(
                   children: [
                     Image.asset(data['img'],height: 42,),
                     CustomSizedBox.space8H,
                     Text(
                       data['name'],
                       style: AppTheme.textStyleNormalBlack10,
                     )
                   ],
                 ),
               ):Container(
                 decoration: BoxDecoration(
                     color: Colors.black, borderRadius: BorderRadius.circular(10)),
                 padding: const EdgeInsets.all(12),
                 child: Column(
                   children: [
                     Image.asset(data['img'],height: 42,),
                     CustomSizedBox.space8H,
                     Text(
                       data['name'],
                       style: AppTheme.textStyleNormalWhite10,
                     )
                   ],
                 ),
               ):
               Container(
                 decoration: BoxDecoration(
                     color: Colors.black, borderRadius: BorderRadius.circular(10)),
                 padding: const EdgeInsets.all(12),
                 child: Column(
                   children: [
                     Image.asset(data['img'],height: 42,),
                     CustomSizedBox.space8H,
                     Text(
                       data['name'],
                       style: AppTheme.textStyleNormalWhite10,
                     )
                   ],
                 ),
               );
             },
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
             child: ClipRRect(clipBehavior: Clip.none,
               borderRadius: BorderRadius.circular(10),
               child: Image.asset(AssetsConstant.slider1,height: 100,width: double.infinity,
                 fit: BoxFit.cover,),
             ),
           ),

           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
             child: Text('Deals You Cannot Miss',style: AppTheme.textStyleSemiBoldBlack16,),
           ),
           GridView.builder(
             padding: EdgeInsets.symmetric(horizontal: 16),
             shrinkWrap: true,
             primary: false,
             gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
                 mainAxisExtent: 167,
                 crossAxisSpacing: 12,
                 mainAxisSpacing: 12
                 ),
             itemCount: 4,
             itemBuilder: (context, index) {
               return Container(
                 decoration: BoxDecoration(boxShadow: [
                   BoxShadow(color: Colors.black.withOpacity(.16),blurRadius: 8)]),
                 child:
                ClipRRect(borderRadius: BorderRadius.circular(10),
                  child:  Image.network('',errorBuilder: (context, error, stackTrace) {
                      return Image.asset(AssetsConstant.gridItem,fit: BoxFit.cover,);
                    },),
                  ),
                );
             },
           ),
             CustomSizedBox.space8H,
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
               child: Text('Top Brands & Offers',style: AppTheme.textStyleSemiBoldBlack16,),
             ),
             ...List.generate(5, (index) => TopBrandsOfferListWidget()),
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
               child: Text('Mega Deals',style: AppTheme.textStyleSemiBoldBlack16,),
             ),
             Image.asset(AssetsConstant.megaDealsBackground)
           ],),
       )
      ],
    ));
  }
}

