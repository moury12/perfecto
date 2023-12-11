import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName ='/productDetails';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
            children: [
              const HomeTopWidget(),
              Expanded(
                child: ListView(padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 360,
                      child: PageView.builder(
padEnds: false,
                        scrollDirection: Axis.horizontal,
                        controller:PageController(),
                        onPageChanged: (value) {

                          ProductDetailsController.to.currentPage.value = value;
                        },
                        itemCount:  ProductDetailsController.to.bannerContent.length,
                        itemBuilder: (context, index) {

                         String data =  ProductDetailsController.to.bannerContent[index];
                          return CustomNetworkImage(
                            networkImagePath: '',

                            fit: BoxFit.fill,
                            errorImagePath:data,
                            height: double.maxFinite,
                            width: double.infinity,
                            borderRadius: 0,
                          );
                        },
                      ),
                    ),
                    Obx(
                            () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate( ProductDetailsController.to.bannerContent.length, (index) {
                              return Container(
                                margin: const EdgeInsets.all(4),
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:  ProductDetailsController.to.currentPage.value == index
                                      ? AppColors.kPrimaryColor
                                      :const Color(0xffD9D9D9),
                                ),
                              );
                            }),
                          );
                        }
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                      child: Text('Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',style: AppTheme.textStyleBoldBlack14,),),
                    TabBar(
                        labelColor: AppColors.kPrimaryColor,

                        indicatorColor: AppColors.kPrimaryColor,
                        dividerColor: AppColors.kPrimaryColor,
                        controller:  ProductDetailsController.to.tabController,
                        tabs: ProductDetailsController.to.tabTiles.map((String title) {
                          return Tab(
                            text: title,
                          );
                        }).toList()),
                    SizedBox(
                      height: 300,
                      child: TabBarView(
                          controller: ProductDetailsController.to.tabController,
                          children:List.generate(2, (index) => buildwidget(index))),
                    ),
                    CustomSizedBox.space12H,
                  ],
                ),
              ),

            ],
          )

    );
  }
  Widget buildwidget(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return
    GridView.builder(
padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 230,mainAxisExtent: 42,mainAxisSpacing: 16),
    shrinkWrap: true,
    primary: false,
    itemCount: 10,
    itemBuilder: (context, index) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       Stack(alignment: Alignment.center,
         children: [
           CustomNetworkImage(networkImagePath: '',borderRadius: 5,height: 42,width:42,
             errorImagePath: AssetsConstant.lipstickShade,fit: BoxFit.fitHeight,),
          index==0? Icon(Icons.check_rounded,color: Colors.white,):index==9?Icon(CupertinoIcons.multiply,color: Colors.white,):SizedBox.shrink()
         ],
       ),CustomSizedBox.space8W,
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nude Shade Color',style: AppTheme.textStyleNormalBlack14,),
            index==9?  Text('Out of Stock',style: AppTheme.textStyleNormalRed12,):SizedBox.shrink(),
            ],
          )
      ],);
    },);

      case 1:
        return
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 230,mainAxisExtent: 42,mainAxisSpacing: 16),
            shrinkWrap: true,
            primary: false,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center,
                    children: [
                      CustomNetworkImage(networkImagePath: '',borderRadius: 5,height: 42,width:42,
                        errorImagePath: AssetsConstant.lipstickShade,fit: BoxFit.fitHeight,),
                      index==0? Icon(Icons.check_rounded,color: Colors.white,):index==9?Icon(CupertinoIcons.multiply,color: Colors.white,):SizedBox.shrink()
                    ],
                  ),CustomSizedBox.space8W,
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nude Shade Color',style: AppTheme.textStyleNormalBlack14,),
                      index==9?  Text('Out of Stock',style: AppTheme.textStyleNormalRed12,):SizedBox.shrink(),
                    ],
                  )
                ],);
            },);

      default:
        return Center(
          child: Text(
            'Unknown Tab',
            style: TextStyle(fontSize: 10),
          ),
        );
    }
  }


}
