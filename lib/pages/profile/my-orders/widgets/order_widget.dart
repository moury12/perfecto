import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_details_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
class OrderWidget extends StatelessWidget {
  final Widget? status;
  final Function()? function;
  final bool tagForReturnCancel;
  final String? tagTitle;final Color? tagBackgroundColor;
  const OrderWidget({
    super.key, this.status,  this.function,  this.tagForReturnCancel=false, this.tagTitle, this.tagBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor,width: 0.5),
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Order Number',
                  style: AppTheme.textStyleSemiBoldFadeDarkBlack14,
                ),
                Spacer(),
                Text('#65675',style: AppTheme.textStyleSemiBoldBlack16,)
              ],
            ),
          ),
          Divider(
            color: AppColors.kborderColor,
            thickness: 2,
            height: 2,
          ),
          CustomSizedBox.space12H,
      status?? Column(
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
             child: Row(
               children: [
                 Text(
                   'Status',
                   style: AppTheme.textStyleSemiBoldFadeBlack14,
                 ),
                 Spacer(),
                 Text('Shipped',style: AppTheme.textStyleSemiBoldBlack14,)
               ],
             ),
           ),Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
             child: Row(
               children: [
                 Text(
                   'Estimated Delivery',
                   style: AppTheme.textStyleSemiBoldFadeBlack14,
                 ),
                 Spacer(),
                 Text('04 Nov, 2023',style: AppTheme.textStyleSemiBoldBlack14,)
               ],
             ),
           ),Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
             child: Row(
               children: [
                 Text(
                   'Total Amount',
                   style: AppTheme.textStyleSemiBoldFadeBlack14,
                 ),
                 Spacer(),
                 Text('৳ 1450.00',style: AppTheme.textStyleSemiBoldBlack14,)
               ],
             ),
           ),
         ],
       ),
          CustomSizedBox.space12H,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomDividerWidget(),
          ),
          CustomSizedBox.space8H,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [

                ...List.generate(
                    3,
                        (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductDetailsWidget(index: index,tagForReturnCancel: tagForReturnCancel,tagBackgroundColor:tagBackgroundColor ,text: tagTitle,)
                    )),
                CustomSizedBox.space12H
              ],
            ),
          ),
          Divider(
            color: AppColors.kborderColor,
            thickness: 2,
            height: 2,
          ),
          CustomButton(label: 'See Details', labelColor: Colors.white,marginVertical: 16,marginHorizontal: 16,onPressed:function?? () {
Get.toNamed(MyOrderDetailsScreen.routeName);
          },)
        ],
      ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  final int? index;
  final bool isDivider;
  final Color? tagBackgroundColor;
  final bool needCheckbox;
  final bool tagForReturnCancel;
  final String? text;
  const ProductDetailsWidget({
    super.key,  this.index, this.isDivider=true,  this.needCheckbox=false,this.tagForReturnCancel=false, this.text, this.tagBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.min,
          children: [ needCheckbox? Obx(
             () {
              return GestureDetector(
                    onTap: () {
                      ProfileController.to.checked[index!] =
                          !ProfileController.to.checked[index!];
                    },
                    child: Container(
                      height: 18,
                      width: 18,margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: ProfileController.to.checked[index!]
                              ? AppColors.kPrimaryColor
                              : Colors.white,
                          border: Border.all(
                              width: 0.5,
                              color: ProfileController
                                  .to.checked[index!]
                                  ? AppColors.kDarkPrimaryColor
                                  : Colors.black.withOpacity(.25))),
                      alignment: Alignment.center,
                      child: ProfileController.to.checked[index!]
                          ? Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 15,
                      )
                          : SizedBox.shrink(),
                    ),
                  );
            }
          ):SizedBox.shrink(),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: AppColors.kborderColor,width: .5)),
                child: CustomNetworkImage(networkImagePath: '',errorImagePath: AssetsConstant.megaDeals2,height: 100,width:90,borderRadius: 4, fit: BoxFit.contain,)),CustomSizedBox.space12W,
            Flexible(
              child: Column(mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Li...',
                    style: AppTheme.textStyleMediumBlack14,textAlign: TextAlign.left,
                  ),
                  CustomSizedBox.space4H,Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Brand: ',
                            style: AppTheme
                                .textStyleNormalBlack14,
                            children: [
                              TextSpan(
                                text: 'Lakme',
                                style: AppTheme
                                    .textStyleBoldBlack14,
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0),
                        child: Container(
                          color: Colors.black.withOpacity(.2),
                          height: 15,
                          width: 1,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Size: ',
                            style: AppTheme
                                .textStyleNormalBlack14,
                            children: [
                              TextSpan(
                                text: '3.4ml',
                                style: AppTheme
                                    .textStyleBoldBlack14,
                              )
                            ]),
                      ),

                    ],
                  ),
                  CustomSizedBox.space8H,
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Qty: ',
                            style: AppTheme
                                .textStyleNormalBlack14,
                            children: [
                              TextSpan(
                                text: '1',
                                style: AppTheme
                                    .textStyleBoldBlack14,
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0),
                        child: Container(
                          color: Colors.black.withOpacity(.2),
                          height: 15,
                          width: 1,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Amount: ',
                            style: AppTheme
                                .textStyleNormalBlack14,
                            children: [
                              TextSpan(
                                text: '৳550',
                                style: AppTheme
                                    .textStyleBoldBlack14,
                              )
                            ]),
                      ),
Spacer(),tagForReturnCancel?Container(decoration: BoxDecoration(color: tagBackgroundColor,borderRadius: BorderRadius.circular(4)),padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),child: Text(text??'Returned',style: AppTheme.textStyleMediumBlack10,),):SizedBox.shrink()
                    ],
                  ),
                  CustomSizedBox.space12H,

                ],
              ),
            ),
          ],),
        index==(3-1)||!isDivider?SizedBox.shrink():  CustomSizedBox.space12H,
        index==(3-1)||!isDivider?SizedBox.shrink():   Divider(height: 1,thickness: 1,color: AppColors.kborderColor,),

      ],
    );
  }
}

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1,thickness: 1,color: AppColors.kborderColor,);
  }
}