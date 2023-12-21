import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/constant.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/product_discription_page.dart';
import 'package:perfecto/pages/product-details/product_shade_page.dart';
import 'package:perfecto/pages/product-details/review/review_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/productDetails';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: CustomDrawer(),
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 360,
                  child: PageView.builder(
                    padEnds: false,
                    scrollDirection: Axis.horizontal,
                    controller: PageController(),
                    onPageChanged: (value) {
                      ProductDetailsController.to.currentPage.value = value;
                    },
                    itemCount: ProductDetailsController.to.bannerContent.length,
                    itemBuilder: (context, index) {
                      String data =
                          ProductDetailsController.to.bannerContent[index];
                      return CustomNetworkImage(
                        networkImagePath: '',
                        fit: BoxFit.fill,
                        errorImagePath: data,
                        height: double.maxFinite,
                        width: double.infinity,
                        borderRadius: 0,
                      );
                    },
                  ),
                ),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        ProductDetailsController.to.bannerContent.length,
                        (index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              ProductDetailsController.to.currentPage.value ==
                                      index
                                  ? AppColors.kPrimaryColor
                                  : const Color(0xffD9D9D9),
                        ),
                      );
                    }),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Text(
                    'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                    style: AppTheme.textStyleBoldBlack14,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: RichText(
                      text: const TextSpan(
                          text: '',
                          style: AppTheme.textStyleBoldBlack14,
                          children: [
                        TextSpan(
                          text: 'Lakme',
                          style: AppTheme.textStyleMediumBlack14,
                        ),
                        TextSpan(
                          text: ' | ',
                          style: AppTheme.textStyleNormalFadeBlack14,
                        ),
                        TextSpan(
                          text: '3.4ml',
                          style: AppTheme.textStyleMediumBlack14,
                        ),
                      ])),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return index == 4
                              ? const Icon(
                                  Icons.star_border_rounded,
                                  color: AppColors.kOfferButtonColor,
                                  size: 15,
                                )
                              : const Icon(
                                  Icons.star_rate_rounded,
                                  color: AppColors.kOfferButtonColor,
                                  size: 15,
                                );
                        },
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '4.3/5',
                            style: AppTheme.textStyleSemiBoldBlack14),
                        const TextSpan(
                          text: ' | ',
                          style: AppTheme.textStyleNormalFadeBlack14,
                        ),
                        const TextSpan(
                            text: '(2225)',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                      ]))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Row(
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: '',
                              style: AppTheme.textStyleBoldBlack14,
                              children: [
                            TextSpan(
                                text: '৳ 550  ',
                                style: AppTheme.textStyleBoldBlack20,
                                children: [
                                  TextSpan(
                                    text: '৳550',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: ' | ',
                                    style: AppTheme.textStyleNormalFadeBlack14,
                                  ),
                                  TextSpan(
                                    text: '(-25% Off)',
                                    style: TextStyle(
                                        color: Color(0xff02792A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ])),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          ProductDetailsController.to.isAvaiableShade.value =
                              !ProductDetailsController
                                  .to.isAvaiableShade.value;
                        },
                        child: Icon(
                          Icons.share,
                          color: Colors.black.withOpacity(.4),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                Obx(() {
                  return Column(
                    children: ProductDetailsController.to.isAvaiableShade.value
                        ? [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 6),
                              child: Row(
                                children: [
                                  const Text(
                                    'Nude Shade Color',
                                    style: AppTheme.textStyleBoldFadeBlack14,
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(ProductShadeScreen.routeName);
                                    },
                                    child: Row(
                                      children: [
                                        const Text(
                                          'All Shades (32)',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.kPrimaryColor),
                                        ),
                                        Image.asset(
                                          'assets/arrow_right.png',
                                          height: 14,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 66,
                              child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomNetworkImage(
                                        networkImagePath: '',
                                        errorImagePath:
                                            AssetsConstant.lipstickShade,
                                        height: 48,
                                        width: 48,
                                        borderRadius: 4,
                                      ),
                                      index == 0
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            )
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                ),
                                itemCount: 12,
                              ),
                            ),
                          ]
                        : [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 6),
                              child: Row(
                                children: [
                                  const Text(
                                    'Selected Size - ',
                                    style: AppTheme.textStyleBoldFadeBlack14,
                                  ),
                                  const Text(
                                    '180ml',
                                    style: AppTheme.textStyleBoldBlack14,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: SizedBox(
                                height: 42,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 23,
                                  itemBuilder: (context, index) => Container(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? AppColors.kPrimaryColor
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: AppColors.kPrimaryColor,
                                            width: 1.5),
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      '180ml',
                                      textAlign: TextAlign.center,
                                      style: index == 0
                                          ? AppTheme.textStyleSemiBoldWhite14
                                          : AppTheme
                                              .textStyleSemiBoldFadeBlack14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CustomSizedBox.space8H
                          ],
                  );
                }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.kAccentColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          width: MediaQuery.of(context).size.width / 2.2,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsConstant.authenticIcon,
                                height: 24,
                              ),
                              CustomSizedBox.space8W,
                              const Text(
                                '100% Authentic',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        CustomSizedBox.space4W,
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: AppColors.kAccentColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsConstant.returnIcon,
                                height: 24,
                              ),
                              CustomSizedBox.space8W,
                              const Text(
                                'Easy Return Policy',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const TitleTextWidget(
                  tileText: 'Product Description',
                ),
                const Divider(
                  color: Color(0xffECECEC),
                  thickness: 1.5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffECECEC), width: 1.5)),
                  ),
                  child: TabBar(
                      isScrollable: true,
                      labelColor: AppColors.kBlackColor,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: AppTheme.textStyleBoldBlack14,
                      unselectedLabelStyle: AppTheme.textStyleBoldFadeBlack14,
                      indicatorColor: AppColors.kPrimaryColor,
                      dividerColor: AppColors.kPrimaryColor,
                      labelPadding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                      controller: ProductDetailsController.to.tabController2,
                      tabs: ProductDetailsController.to.tabTiles2
                          .map((String title) {
                        return Tab(
                          text: title,
                        );
                      }).toList()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .4,
                  child: TabBarView(
                      controller: ProductDetailsController.to.tabController2,
                      children: List.generate(
                          ProductDetailsController.to.tabTiles2.length,
                          (index) => buildwidget(index, context))),
                ),
                Divider(thickness: 1.5, color: Color(0xffECECEC)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(ProductDescriptionScreen.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Read More',
                            style: AppTheme.textStyleSemiBoldPrimary14,
                          ),
                          CustomSizedBox.space8W,
                          Icon(
                            CupertinoIcons.chevron_down,
                            color: AppColors.kPrimaryColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(thickness: 8, color: Color(0xffECECEC)),
                TitleTextWidget(tileText: 'Ratings & Reviews'),
                Divider(thickness: 1.5, color: Color(0xffECECEC)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.kAccentColor,
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsConstant.reviewTop,
                        height: 24,
                      ),
                      CustomSizedBox.space16W,
                      Flexible(
                        child: Text(
                          'Perfecto is committed to showing genuine and verified reviews.',
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                CustomSizedBox.space12H,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        '4.3/5',
                        style: AppTheme.textStyleSemiBoldBlack32,
                      ),
                      CustomSizedBox.space8W,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overall Ratings',
                            style: AppTheme.textStyleSemiBoldBlack12,
                          ),
                          Text(
                            '234 verified ratings',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Text(
                          'Write Review',
                          style: AppTheme.textStyleBoldBlack14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SizedBox(
                    height: 86,
                    child: ListView.builder(
                      itemCount: 12,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => Container(
                        height: 72,
                        width: 72,
                        margin: EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 16),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xffCECECE), width: 1),
                            borderRadius: BorderRadius.circular(2),
                            image: DecorationImage(
                                image: AssetImage(
                                  AssetsConstant.megaDeals2,
                                ),
                                fit: BoxFit.cover)),
                      ),
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
                              CustomSizedBox.space4W,
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(ReviewScreen.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    child: Padding(
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
                  ),
                ),
                CustomSizedBox.space12H,
                PrimaryAcceantListViewItemWidget(
                  title: 'Customers also Viewed',
                )
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

  Widget buildwidget(int tabIndex, BuildContext context) {
    switch (tabIndex) {
      case 0:
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(AssetsConstant.banner2),
                          fit: BoxFit.fitWidth)),
                ),
                Positioned(
                    bottom: MediaQuery.of(context).size.width > 600 ? 28 : 16,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(
                                /*MediaQuery.of(context).size.width>600?20:*/ 10)),
                        child: Image.asset(
                          AssetsConstant.shade,
                          color: Color(0xffBABABA).withOpacity(.8),
                        ))),
              ],
            ));
      case 1:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
            style: AppTheme.textStyleSemiBoldBlack14,
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
            style: AppTheme.textStyleSemiBoldBlack14,
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Ethylhexyl Palmitate, Sorbeth-30 Tetraoleate, Caprylic/Capric Triglyceride, Polyethylene, Lavandula Angustifolia (Lavender) Oil, Helianthus Annuus (Sunflower) Seed Oil, Eucalyptus Globulus Leaf Oil, Caprylyl Glycol, Ethylhexylglycerin, Anthemis Nobilis Flower Oil, Avena Sativa (Oat) Kernel Oil, Butyrospermum Parkii (Shea) Butter, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oenothera Biennis (Evening Primrose) Oil, Persea Gratissima (Avocado) Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Water, 1,2-Hexanediol, Centella Asiatica Extract, Centella Asiatica Leaf Extract, Centella Asiatica Root Extract, Pinus Pinaster Bark Extract, Asiaticoside, Asiatic Acid, Madecassoside, Madecassic Acid',
            style: AppTheme.textStyleSemiBoldBlack14,
          ),
        );

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
