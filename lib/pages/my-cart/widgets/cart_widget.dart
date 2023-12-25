import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class CartWidget extends StatelessWidget {
  final bool iswish;
  const CartWidget({
    super.key,  this.iswish=false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0xffCECECE), width: 0.2)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCECECE), width: 0.2),
                    borderRadius: BorderRadius.circular(4)),
                child: CustomNetworkImage(
                  networkImagePath: '',
                  errorImagePath: AssetsConstant.megaDeals2,
                  borderRadius: 4,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fitHeight,
                ),
              ),
              CustomSizedBox.space12W,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lakme Absolute Skin Dew Satin Color Sensational Ultimatt...',
                      style: AppTheme.textStyleMediumBlack14,
                    ),
                    CustomSizedBox.space8H,
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Brand:',
                              style: AppTheme.textStyleNormalFadeBlack12),
                          TextSpan(
                              text: ' Lakme',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12))
                        ])),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          height: 12,
                          width: 1,
                          color: Color(0xffCECECE),
                        ),
                        Text('Size: 3.4ml',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12))
                      ],
                    ),
                    CustomSizedBox.space4H,
                    Row(
                      children: [
                        CustomNetworkImage(
                          networkImagePath: '',
                          errorImagePath: AssetsConstant.lipstickShade,
                          height: 16,
                          borderRadius: 2,
                          width: 16,
                        ),
                        CustomSizedBox.space4W,
                        Text(
                          'Nude Shade Color',
                          style: AppTheme.textStyleMediumBlack12,
                        )
                      ],
                    ),
                    CustomSizedBox.space8H,
                  ],
                ),
              ),
              Image.asset(AssetsConstant.deleteIcon,height: 16,)
            ],
          ),
          Divider(
            color: Color(0xffECECEC),
            thickness: 1,
          ),
          CustomSizedBox.space8H,
          iswish?Row(
            children: [
              Row(
                children: [
                  Text(
                    '৳550',
                    style: AppTheme.textStyleSemiBoldBlack16,
                  ),CustomSizedBox.space4W,
                  Text(
                    '৳550',
                    style: TextStyle(color: Colors.black45,fontSize: 14,decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
Spacer(),
            CustomButton(label: 'Move to Cart',width: 150,marginVertical: 0,marginHorizontal: 0,onPressed: () {

            },)
            ],
          ):    Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.kPrimaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.minus,
                      color: AppColors.kPrimaryColor,
                      size: 25,
                    ),
                    Container(
                      height: 20,
                      width: .5,
                      color: AppColors.kPrimaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Text(
                      '0',
                      style: AppTheme.textStyleMediumBlack16,
                    ),
                    Container(
                      height: 20,
                      width: .5,
                      color: AppColors.kPrimaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Icon(
                      Icons.add,
                      color: AppColors.kPrimaryColor,
                      size: 25,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '৳550',
                    style: AppTheme.textStyleSemiBoldBlack16,
                  ),CustomSizedBox.space4W,
                  Text(
                    '৳550',
                    style: TextStyle(color: Colors.black45,fontSize: 14,decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CouponsWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final bool isRewardPoint;
  const CouponsWidget({
    super.key,
    this.img,
    this.title,
    this.isRewardPoint = false,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.24), blurRadius: 2)
          ]),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(
          img??  AssetsConstant.cuppon,
            height: 32,
          ),
          CustomSizedBox.space12W,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                   title?? 'Coupons',
                    style: AppTheme.textStyleMediumBlack12,
                  ),
                isRewardPoint?  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset(AssetsConstant.infoIcon,height: 12,),
                  ):SizedBox.shrink()
                ],
              ),
              CustomSizedBox.space4H,
              Text(
               subtitle?? 'Apply now and save extra!',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kDarkPrimaryColor),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
