import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../offer/sale_page.dart';

class TopBrandsOfferListWidget extends StatelessWidget {
  const TopBrandsOfferListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: AppColors.kDarkPrimaryColor.withOpacity(.12), blurRadius: 12)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            '',
            errorBuilder: (context, error, stackTrace) => Image.asset(AssetsConstant.verticalBannner),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(bottom: 4),
            child: Text(
              'Upto 35% Off',
              style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(top: 0),
            child: Text(
              'Additional 10% off on ৳1299+',
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerListWidget extends StatelessWidget {
  final bool isBestSeller;
  const BestSellerListWidget({
    super.key,
    this.isBestSeller = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 16),
      child: Stack(
        children: [
          Container(
            width: 180,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: AppColors.kDarkPrimaryColor.withOpacity(.10), blurRadius: 8)]),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '',
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(AssetsConstant.megaDeals1, fit: BoxFit.fitWidth, height: 168, width: 180);
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xffFFF2D9),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.kOfferButtonColor,
                                size: 15,
                              ),
                              RichText(
                                  text: TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                                TextSpan(
                                  text: '4.4',
                                  style: AppTheme.textStyleBoldBlack10,
                                ),
                                TextSpan(
                                  text: ' | ',
                                  style: AppTheme.textStyleNormalFadeBlack12,
                                ),
                                TextSpan(
                                  text: '(255)',
                                  style: const TextStyle(color: Colors.black54, fontSize: 8, fontWeight: FontWeight.bold),
                                )
                              ])),
                            ],
                          )),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Maybelline New York Superstay Vinyl Ink',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                            decoration:
                                BoxDecoration(color: /*isBuy1Get1? AppColors.kOfferButtonColor:*/ AppColors.kFreeDeliveryButtonColor, borderRadius: BorderRadius.circular(2)),
                            child: Text(/*isBuy1Get1?'Buy 1 Get 1':*/ 'Free Delivery', style: AppTheme.textStyleBoldWhite10)),
                      ),
                      RichText(
                          text: TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                        TextSpan(
                          text: '৳ 550  ',
                          style: AppTheme.textStyleBoldBlack14,
                        ),
                        TextSpan(
                          text: '৳550',
                          style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: ' | ',
                          style: AppTheme.textStyleNormalBlack12,
                        ),
                        TextSpan(
                          text: '(-25% Off)',
                          style: const TextStyle(color: Color(0xff02792A), fontSize: 10, fontWeight: FontWeight.bold),
                        )
                      ])),
                    ],
                  ),
                ),
                CustomButton(
                  label: 'ADD TO BAG',
                  marginHorizontal: 16,
                  marginVertical: 8,
                  height: 39,
                  onPressed: () {},
                )
              ],
            ),
          ),
          isBestSeller
              ? Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xffD4F3FF),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
                  ),
                  child: const Text(
                    'Bestseller',
                    style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

class BestSellerListViewBuilder extends StatelessWidget {
  const BestSellerListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffEAF9FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const TitleTextWidget(tileText: 'Bestseller'),
              Spacer(),
              InkWell(
                onTap: () {
                  // await HomeApiController.to.productListWithCategoryCall({
                  //   'category': [category.id!].toString(),
                  // });
                  Get.toNamed(SingleCatergoryWiseScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const BestSellerListWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}

class SegmentGridWidget extends StatelessWidget {
  final String? blueBackground;
  final Widget? img;
  final String? networkImg;
  final Widget? widgetinBlueShade;
  const SegmentGridWidget({
    super.key,
    this.blueBackground,
    this.img,
    this.widgetinBlueShade,
    this.networkImg,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 200, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemCount: 8,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // await HomeApiController.to.productListWithCategoryCall({
            //   'category': [category.id!].toString(),
            // });
            Get.toNamed(SingleCatergoryWiseScreen.routeName);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), image: DecorationImage(image: AssetImage(blueBackground ?? AssetsConstant.blueBackground), fit: BoxFit.fitWidth)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                img ??
                    Image.network(networkImg ?? '', errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AssetsConstant.megaDealsForeground,
                        fit: BoxFit.fitHeight,
                        height: 180,
                        alignment: Alignment.center,
                      );
                    }, alignment: Alignment.center),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/blue_background1.png',
                    )),
                widgetinBlueShade ??
                    Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Text(
                          'Lipstick',
                          style: AppTheme.textStyleBoldWhite20,
                          textAlign: TextAlign.center,
                        ))
              ],
            ),
          ),
        );
      },
    );
  }
}

class GreetingCardWidget extends StatelessWidget {
  const GreetingCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.bottomGrettings), fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSizedBox.space8H,
          Image.asset(
            'assets/Enhance_Your_Beauty_With_ Perfecto.png',
            height: 46,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'With vast experience in the cosmetics industry, who sourcing cosmetics, skincare and hair care on a global level. We deliver the highest quality products of world renowned at the most affordable prices. We believe that everyone – no matter their sex, ethnicity, age, budget or location – should be thrilled by Perfecto.',
              style: AppTheme.textStyleMediumBlack12,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
