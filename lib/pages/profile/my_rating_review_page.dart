import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
class MyRatingReviewScreen extends StatelessWidget {
  static const String routeName ='/my_rating';
  const MyRatingReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.kBackgroundColor,
      body: Column(children: [
        HomeTopWidget(
          title: Row(
            children: [
              GestureDetector(
                child: Image.asset(
                  AssetsConstant.backRoute,
                  height: 20,
                ),
                onTap: () {
                  Get.back();
                },
              ),
              CustomSizedBox.space8W,
              Text(
                'My Ratings & Reviews',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              CustomSizedBox.space4W,

            ],
          ),
          isSearchInclude: false,
        ),
        Expanded(child: ListView.builder(padding: EdgeInsets.zero,
         itemBuilder: (context, index) {
           return  Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               index!=0 ? const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.0),
                 child: Divider(
                   thickness: 1.5,
                 ),
               ):SizedBox.shrink(),
               Padding(
                 padding: const EdgeInsets.symmetric(
                     horizontal: 16.0, vertical: 12),
                 child: Row(
                   children: [
                     Container(

                       child: CustomNetworkImage(
                         networkImagePath: '',
                         errorImagePath: AssetsConstant.megaDeals2,
                         borderRadius: 4,
                         height: 80,
                         width: 80,
                         fit: BoxFit.fitWidth,
                       ),decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor,width: .5,),borderRadius: BorderRadius.circular(4)),
                     ),
                     CustomSizedBox.space8W,
                     Flexible(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Lakme Absolute Skin Dew Satin Color Sensational Ultimatt...',
                             style: AppTheme.textStyleMediumBlack14,
                           ),
                           CustomSizedBox.space4H,


                               Text(
                                 '৳550',
                                 style: AppTheme.textStyleBoldBlack14,
                               )

                         ],
                       ),
                     ),


                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                 child: Row(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: List.generate(5, (index) {
                         return Obx(
                       () {
                             return GestureDetector(
                               onTap: () {
                                 // Set the rating when a star is tapped

                                   ProfileController.to.rating.value = index + 1;

                               },
                               child: Icon(
                                 index <ProfileController.to.rating.value ? Icons.star_rate_rounded : Icons.star_border_rounded,
                                 color: Color(0xffFFAC0A),
                               ),
                             );
                           }
                         );
                       }),
                     ),CustomSizedBox.space4W,Text('4.3/5',style: AppTheme.textStyleSemiBoldBlack14,),
                     Spacer(),
                     Text(
                       '20 July 2023',
                       style: AppTheme.textStyleNormalFadeBlack12,
                     )
                   ],
                 ),
               ),
               // Padding(
               //   padding:
               //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
               //   child: Row(
               //     children: [
               //       Container(
               //         decoration: BoxDecoration(
               //           color: AppColors.kPrimaryColor,
               //           borderRadius: BorderRadius.circular(2),
               //         ),
               //         padding:
               //         EdgeInsets.symmetric(vertical: 3, horizontal: 4),
               //         child: Row(children: [
               //           Text(
               //             '5',
               //             style: AppTheme.textStyleBoldWhite12,
               //           ),
               //           CustomSizedBox.space4W,
               //           Icon(
               //             Icons.star_rate_rounded,
               //             color: Colors.white,
               //             size: 16,
               //           )
               //         ]),
               //       ),
               //       CustomSizedBox.space8W,
               //       Container(
               //         color: Colors.black.withOpacity(.4),
               //         height: 20,
               //         width: .5,
               //       ),
               //       CustomSizedBox.space8W,
               //       CustomNetworkImage(
               //         networkImagePath: '',
               //         errorImagePath: AssetsConstant.lipstickShade,
               //         borderRadius: 2,
               //         height: 21,
               //         width: 21,
               //       ),
               //       CustomSizedBox.space8W,
               //       Text(
               //         'Nude Shade Color',
               //         style: AppTheme.textStyleNormalFadeBlack14,
               //       )
               //     ],
               //   ),
               // ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     CustomSizedBox.space8H,
                     Text(
                       '“Velvet in bullet.....”',
                       style: AppTheme.textStyleBoldBlack14,
                     ),
                     CustomSizedBox.space4H,
                     RichText(
                         text: TextSpan(children: [
                           TextSpan(
                             text:
                             'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                             style: AppTheme.textStyleNormalFadeBlack14,
                           ),
                           TextSpan(
                             text: '...Read More',
                             style: AppTheme.textStyleSemiBoldBlack14,
                             onEnter: (event) {},
                           )
                         ])),
                     Wrap(
                       children: [
                         ...List.generate(
                           5,
                               (index) => Container(
                             height: 48,
                             width: 48,
                             margin: EdgeInsets.symmetric(vertical: 8)
                                 .copyWith(right: 4),
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(2),
                                 image: DecorationImage(
                                     image: AssetImage(
                                       AssetsConstant.megaDeals3,
                                     ),
                                     fit: BoxFit.cover)),
                           ),
                         ),
                       ],
                     ),
                     Obx(
                             () {
                           return GestureDetector(
                             onTap: () {
                               ProductDetailsController.to.isHelpfull.value=!ProductDetailsController.to.isHelpfull.value;
                             },
                             child: Container(
                               decoration: BoxDecoration(
                                   color:  ProductDetailsController.to.isHelpfull.value?AppColors.kPrimaryColor:null,
                                   border: Border.all(
                                       color: AppColors.kPrimaryColor, width: 1),
                                   borderRadius: BorderRadius.circular(4)),
                               padding: EdgeInsets.symmetric(
                                   horizontal: 20, vertical: 12),
                               child: Text(
                                 'View Product',
                                 style: ProductDetailsController.to.isHelpfull.value?
                                 AppTheme.textStyleSemiBoldWhite14:AppTheme.textStyleSemiBoldPrimary14,
                               ),
                             ),
                           );
                         }
                     )
                   ],
                 ),
               ),
               CustomSizedBox.space12H,

             ],
           );
         },
            itemCount: 10,
         ))
      ],),
    );
  }
}
