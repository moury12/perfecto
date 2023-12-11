import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ReviewScreen extends StatelessWidget {
  static const String routeName = '/review';
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Divider(thickness: 1.5, color: Color(0xffECECEC)),
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          // Text(
                          //   '4.3/5',
                          //   style: AppTheme.textStyleSemiBoldBlack32,
                          // ),
                          // CustomSizedBox.space8W,
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       'Overall Ratings',
                          //       style: AppTheme.textStyleSemiBoldBlack12,
                          //     ),
                          //     Text(
                          //       '234 verified ratings',
                          //       style: TextStyle(
                          //           fontSize: 12,
                          //           fontWeight: FontWeight.normal,
                          //           color: Colors.black54),
                          //     )
                          //   ],
                          // ),
                          Text(
                            'Ratings & Reviews',
                            style: AppTheme.textStyleBoldBlack16,
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(4)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Text(
                              'Write Review',
                              style: AppTheme.textStyleBoldBlack14,
                            ),
                          ),
                        ],
                      ),
                      CustomSizedBox.space8H,
                      Divider(thickness: 1.5, color: Color(0xffECECEC)),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                            style: AppTheme.textStyleNormalBlack14,
                          ),
                        ),
                  CustomSizedBox.space8W,
                  Column(
                    children: [Text(
                        '4.3/5',
                        style: AppTheme.textStyleSemiBoldBlack14,
                      ),
                      Text(
                              '234 verified ratings',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                    ],
                  )
                      ],
                    ),
                  ),
                ),
                TitleTextWidget(tileText: 'Most Useful Review'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Row(
                    children: [
                      CustomNetworkImage(
                        networkImagePath: '',
                        errorImagePath: AssetsConstant.profile,
                        borderRadius: 360,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      CustomSizedBox.space8W,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vinod Kumar',
                            style: AppTheme.textStyleBoldBlack14,
                          ),
                          CustomSizedBox.space4H,
                          Row(
                            children: [
                              Image.asset(
                                AssetsConstant.verified,
                                height: 14,
                              ),
                              Text(
                                'Verified Buyers',
                                style: AppTheme.textStyleNormalFadeBlack10,
                              )
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        '20 July 2023',
                        style: AppTheme.textStyleNormalFadeBlack12,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                        child: Row(children: [
                          Text(
                            '5',
                            style: AppTheme.textStyleBoldWhite12,
                          ),
                          CustomSizedBox.space4W,
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.white,
                            size: 16,
                          )
                        ]),
                      ),
                      CustomSizedBox.space8W,
                      Container(
                        color: Colors.black.withOpacity(.4),
                        height: 20,
                        width: .5,
                      ),
                      CustomSizedBox.space8W,
                      CustomNetworkImage(
                        networkImagePath: '',
                        errorImagePath: AssetsConstant.lipstickShade,
                        borderRadius: 2,
                        height: 21,
                        width: 21,
                      ),
                      CustomSizedBox.space8W,
                      Text(
                        'Nude Shade Color',
                        style: AppTheme.textStyleNormalFadeBlack14,
                      )
                    ],
                  ),
                ),
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
                                  .copyWith(right: 8),
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
                      Text(
                        '12 people found this helpful',
                        style: AppTheme.textStyleNormalFadeBlack14,
                      )
                    ],
                  ),
                ),
                CustomSizedBox.space12H,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Read All Reviews',
                        style: AppTheme.textStyleSemiBoldPrimary14,
                      ),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: AppColors.kPrimaryColor,
                        size: 15,
                      )
                    ],
                  ),
                ),
                CustomSizedBox.space12H,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)
            ]),
        child: FittedBox(
          child: Row(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    ProductDetailsController.to.isFavourite.value =
                        !ProductDetailsController.to.isFavourite.value;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.kPrimaryColor, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: ProductDetailsController.to.isFavourite.value
                        ? Image.asset(
                            AssetsConstant.favIconFill,
                            height: 24,
                          )
                        : Image.asset(
                            AssetsConstant.favIcon,
                            height: 26,
                          ),
                  ),
                );
              }),
              CustomSizedBox.space4W,
              CustomButton(
                label: 'Add To Bag',
                marginHorizontal: 8,
                marginVertical: 4,
                height: 50,
                prefixImage: AssetsConstant.cartIcon,
                prefixImageColor: Colors.white,
                prefixImageHeight: 20,
                primary: AppColors.kPrimaryColor,
                width: MediaQuery.of(context).size.width / 1.3,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
