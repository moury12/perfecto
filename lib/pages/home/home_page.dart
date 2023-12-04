import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import 'widgets/mega_deals_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    globalLogger.d(MediaQuery.of(context).size);
  Size  size =MediaQuery.of(context).size;
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

             TileTextWidget(tileText:'Deals You Cannot Miss' ),

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
             TileTextWidget(tileText:'Top Brands & Offers' ),

             ...List.generate(5, (index) => TopBrandsOfferListWidget()),
             TileTextWidget(tileText:'Mega Deals' ),
             GridItemWidget(size: size,img: AssetsConstant.megaDealsBackground,),
             TileTextWidget(tileText:'Clearance Sale' ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: CustomNetworkImage(networkImagePath: '',errorImagePath: AssetsConstant.banner,borderRadius: 10,
width: Get.width,
                height: null,
                fit: BoxFit.fitWidth,)),
          ),
TileTextWidget(tileText: 'Super Offer'),
GridItemWidget(size: size, img: AssetsConstant.superOfferBackground),
             TileTextWidget(tileText: 'Segments You Can’t Miss'),
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
               itemCount: 8,
               itemBuilder: (context, index) {
                 return Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),

                   image: DecorationImage(image: AssetImage(AssetsConstant.blueBackground),fit: BoxFit.fitWidth)),
                   child:
                   Stack(
                     children: [
                       Image.network('',errorBuilder: (context, error, stackTrace) {
                         return Image.asset(AssetsConstant.megaDealsForeground,fit: BoxFit.fitHeight,);
                       },),
                       Positioned(bottom: 0,
                           left: 0,
                           right: 0,
                           child: Image.asset('assets/blue_background1.png',)),
                   Positioned(bottom: 10,
                     left: 0,
                     right: 0,
                     child: Text('Lipstick',style: AppTheme.textStyleBoldWhite20,textAlign: TextAlign.center,))
                     ],
                   ),

                 );
               },
             ),
CustomSizedBox.space16H,
Container(color: Color(0xffEAF9FF),
  child:   Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [TileTextWidget(tileText: 'Bestseller'),
  
    SizedBox(height: 346,
      child:   ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16,bottom: 16),
            child: Stack(
              children: [
                Container(
                  width:180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color:AppColors.kDarkPrimaryColor.withOpacity(.10),blurRadius: 8)]),
                  child:
                  Column(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(10),
                        child:  Image.network('',errorBuilder: (context, error, stackTrace) {
                          return Image.asset(AssetsConstant.megaDeals1,fit: BoxFit.fitWidth,height: 168,);
                        },),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text('Maybelline New York Superstay Vinyl Ink',style: AppTheme.textStyleBoldBlack12,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                      ),
                      Text('30ml',style:AppTheme.textStyleNormalBlack12,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Container(padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                            decoration: BoxDecoration(color:/*isBuy1Get1? AppColors.kOfferButtonColor:*/AppColors.kFreeDeliveryButtonColor, borderRadius: BorderRadius.circular(2)),
                            child: Text(/*isBuy1Get1?'Buy 1 Get 1':*/'Free Delivery',style: AppTheme.textStyleBoldWhite10)),
                      ),

                      RichText(text: TextSpan(text: '',style: AppTheme.textStyleBoldBlack14, children: [
                        TextSpan(text: '৳ 550  ',style: AppTheme.textStyleBoldBlack14,),
                        TextSpan(text: '৳550',style: const TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black54,fontSize: 10, fontWeight: FontWeight.normal),),TextSpan(text: ' | ',style: AppTheme.textStyleNormalBlack12,),TextSpan(text: '(-25% Off)',style: const TextStyle(color: Color(0xff02792A),fontSize: 10, fontWeight: FontWeight.bold),)
                      ])),
                      CustomButton(label: 'ADD TO BAG',marginHorizontal: 16,marginVertical:4,height: 39,)
                    ],
                  ),

                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Color(0xffD4F3FF),borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
                  ),
                  child: const Text('Bestseller', style: TextStyle(color: Color(0xff0094CF),fontSize: 10),),)
              ],
            ),
          );
        },),
    ),],),
),
CustomSizedBox.space32H
           ],),
       )
      ],
    ));
  }
}

class TileTextWidget extends StatelessWidget {
  final String tileText;
  const TileTextWidget({
    super.key, required this.tileText,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Text(tileText,style: AppTheme.textStyleSemiBoldBlack16,),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final String img;
  const GridItemWidget({
    super.key,
    required this.size, required this.img,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img,),fit: BoxFit.fitWidth,alignment: Alignment.topCenter)),
           child: Column(
    children: [
      CustomSizedBox.space8H,
    SizedBox(height:MediaQuery.of(context).size.width>800?size.height/1.5:size.height/7.5,),
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          mainAxisExtent: 250

      ),itemBuilder: (context, index)
      {
        Map<String, dynamic> data=HomeController.to.megadealsITem[index];
               return Padding(
                 padding:  EdgeInsets.all(MediaQuery.of(context).size.width>800?8:4.0),
                 child: MegaDealsWidget(
                     name: data['name'],
                    isBestSeller:data['isBestSeller'] ,
                     isBuy1Get1:data['isbuy1Get1'] ,
                     isStacked: data['isStacked'],
                     rate: data['rating'],
                     price: data['price'],
                     previousPrice: data['previousPrice'], img: data['img'],),
               );
             },
        itemCount: 6,
      )
    ],
           ),
    );
  }
}


