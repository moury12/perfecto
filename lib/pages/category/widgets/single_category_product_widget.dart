import 'package:flutter/material.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../constants/assets_constants.dart';
import '../../../constants/color_constants.dart';

class SingleCategoryProductWidget extends StatelessWidget {
  final bool isBestSeller;
  final String name;
  final String rating;
  final String img;
  final String price;
  final String buttonText;
  final String previousPrice;
  final bool isStacked;
  final bool isBuy1Get1;
  final bool isDiscount;
  final bool isFavourite;
  final bool isFeatured;
  final bool isOutofStock;
  final bool isOnSale;
  final Function() onTap;
  const SingleCategoryProductWidget({
    super.key,
    this.isBestSeller = true,
    required this.name,
    required this.rating,
    required this.img,
    required this.price,
    required this.buttonText,
    required this.previousPrice,
    this.isStacked = false,
    this.isBuy1Get1 = true,
    this.isDiscount = true,
    this.isFavourite = false,
    this.isOutofStock = false,
    this.isOnSale = false,
    this.isFeatured = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: AppColors.kDarkPrimaryColor.withOpacity(.10),
                    blurRadius: 8)
              ]),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(img,
                        fit: BoxFit.fill, height: 168, width: 200);
                  },
                ),
              ),
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xffFFF2D9),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                    ),
                    child:
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.kOfferButtonColor,
                          size: 15,
                        ),
                        RichText(
                            text: TextSpan(
                                text: '',
                                style: AppTheme.textStyleBoldBlack14,
                                children: [
                                  TextSpan(
                                    text: '4.4',
                                    style: AppTheme.textStyleBoldBlack10,
                                  ),
                                  TextSpan(
                                    text: ' | ',
                                    style: AppTheme.textStyleNormalFadeBlack12,
                                  ),
                                  TextSpan(
                                    text: rating,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                      ],
                    )),
    Spacer(),Padding(
      padding: const EdgeInsets.only(right:6.0),
      child: Row(
                    children: [
                      Image.asset(AssetsConstant.lipstickShade,height: 13,),
                      CustomSizedBox.space4W,
                      Text('+30 shades',style: TextStyle(color: Colors.black54,fontSize: 10,fontWeight: FontWeight.normal),)
                    ],
                  ),
    ),
              ],),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: AppTheme.textStyleBoldBlack12,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                '30ml',
                style: AppTheme.textStyleNormalBlack12,
              ),
              CustomSizedBox.space4H,
              isOnSale
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: isBuy1Get1
                                  ? AppColors.kOfferButtonColor
                                  : AppColors.kFreeDeliveryButtonColor,
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(
                              isBuy1Get1 ? 'Buy 1 Get 1' : 'Free Delivery',
                              style: AppTheme.textStyleBoldWhite10)),
                    )
                  : SizedBox(height: 27,),
              RichText(
                  text: TextSpan(
                      text: '',
                      style: AppTheme.textStyleBoldBlack14,
                      children: [
                    TextSpan(
                        text: '৳ 550  ',
                        style: AppTheme.textStyleBoldBlack14,
                        children: isDiscount
                            ? [
                                TextSpan(
                                  text: '৳550',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black54,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: ' | ',
                                  style: AppTheme.textStyleNormalBlack12,
                                ),
                                TextSpan(
                                  text: '(-25% Off)',
                                  style: const TextStyle(
                                      color: Color(0xff02792A),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ]
                            : []),
                  ])),
              FittedBox(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.kPrimaryColor, width: .5),
                            borderRadius: BorderRadius.circular(4)),
                        height: 38,
                        child:isFavourite? Image.asset(AssetsConstant.favIconFill,height: 16,) :Image.asset(AssetsConstant.favIcon,height: 16,),
                      ),
                    ),
                    CustomButton(
                      label: buttonText,
                      marginHorizontal: 8,
                      marginVertical: 4,
                      height: 39,
                      primary: isOutofStock
                          ? AppColors.kDarkPrimaryColor
                          : AppColors.kPrimaryColor,
                      width: 140,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        isStacked
            ? isBestSeller
                ? Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xffD4F3FF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(4)),
                    ),
                    child: const Text(
                      'Bestseller',
                      style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                    ),
                  )
                : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xffECDDFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(4)),
                        ),
                        child: const Text(
                          'Offer',
                          style:
                              TextStyle(color: Color(0xff8513DF), fontSize: 10),
                        ),
                      ),
                      isFeatured
                          ? Container(
                              padding: const EdgeInsets.all(4),
                              /* margin: EdgeInsets.only(left: 4),*/
                              decoration: const BoxDecoration(
                                color: Color(0xffDDDCFF),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    bottomRight: Radius.circular(4)),
                              ),
                              child: const Text(
                                'Featured',
                                style: TextStyle(
                                    color: Color(0xff1713DF), fontSize: 10),
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  )
            : SizedBox.shrink()
      ],
    );
  }
}
