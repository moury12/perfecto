import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/pages/my-cart/cart_page.dart';
import 'package:perfecto/pages/points/my_points_page.dart';
import 'package:perfecto/pages/search/search_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:perfecto/utils.dart';

import '../../../controller/navigation_controller.dart';

class HomeTopWidget extends StatelessWidget {
  final bool isSearchInclude;
  final bool isSearchpage;
  final Widget? title;
  final TextEditingController? controller;
  const HomeTopWidget(
      {super.key,
      this.controller,
      this.isSearchInclude = true,
      this.title,
      this.isSearchpage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08))]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                title == null
                    ? GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Image.asset(
                          AssetsConstant.drawerIcon,
                          height: 22,
                        ),
                      )
                    : SizedBox.shrink(),
                CustomSizedBox.space8W,
                title ?? Image.asset(AssetsConstant.perfectoLogo, height: 18),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(MyPointsScreen.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: AppColors.kAccentColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetsConstant.pointsIcon,
                          height: 12,
                        ),
                        CustomSizedBox.space4W,
                        RichText(
                            text: const TextSpan(text: '', children: [
                          TextSpan(
                              text: '0', style: AppTheme.textStyleBoldBlack12),
                          TextSpan(
                              text: ' Points',
                              style: AppTheme.textStyleNormalBlack12)
                        ])),
                      ],
                    ),
                  ),
                ),
                CustomSizedBox.space16W,
                InkWell(
                  borderRadius: BorderRadius.circular(360),
                  onTap: () {
                    Get.toNamed(CartScreen.routeName);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          AssetsConstant.cartIcon,
                          height: 20,
                        ),
                        Positioned(
                          top: 0,
                          right: 2,
                          child: Container(
                            padding: EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.kDarkPrimaryColor),
                            child:
                                Text('12', style: AppTheme.textStyleBoldWhite8),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          isSearchpage
              ? Obx(() {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(SearchScreen.routeName);
                        },
                        child: CustomTextField(
                          height: 42,
                          suffixIcon: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/cross.png',
                                height: 18,
                              ),
                            ),
                            onTap: () {
                              NavigationController.to.searchController.value
                                  .clear();
                            },
                          ),
                          isEnable: isSearchpage ? true : false,
                          controller: controller ??
                              NavigationController.to.searchController.value,
                          hintText: 'Search for products...',
                          focusColor: AppColors.kPrimaryColor,
                          enableBorderColor: AppColors.kPrimaryColor,
                          onSubmitted: (p0) {
                            NavigationController.to.openSearchResult.value =
                                true;
                          },
                          // onChanged: (value) {
                          //   Get.toNamed(SearchScreen.routeName,arguments: 'searched');
                          // },
                          prefixWidget: Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          ),
                          marginVertical: 8,
                          marginBottom: NavigationController
                                  .to.searchController.value.text.isNotEmpty
                              ? 0
                              : 16,
                        ),
                      ),
                      NavigationController
                              .to.searchController.value.text.isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(.10),
                                        blurRadius: 10)
                                  ]),
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  ...List.generate(
                                      4,
                                      (index) => Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.search_rounded,
                                                    color: Colors.black45,
                                                    size: 15,
                                                  ),
                                                  CustomSizedBox.space8W,
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8.0),
                                                    child: Text(
                                                      'Lakme Absolute Lipstick',
                                                      style: AppTheme
                                                          .textStyleMediumBlack14,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black45,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color: Color(0xffECECEC),
                                              )
                                            ],
                                          ))
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      NavigationController
                              .to.searchController.value.text.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Color(0xffEEFAFF)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AssetsConstant.filter,
                                            height: 16,
                                          ),
                                          CustomSizedBox.space8W,
                                          Text(
                                            'FILTER',
                                            style:
                                                AppTheme.textStyleBoldPrimary12,
                                          )
                                        ],
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    onTap: () {
                                      _showBottomSheetFilter(context);
                                    },
                                  ),
                                  GestureDetector(

                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      width:
                                          MediaQuery.of(context).size.width / 2.2,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Color(0xffEEFAFF)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AssetsConstant.sort,
                                            height: 16,
                                          ),
                                          CustomSizedBox.space8W,
                                          Text(
                                            'SORT',
                                            style:
                                                AppTheme.textStyleBoldPrimary12,
                                          )
                                        ],
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    onTap: () {
                                      _showBottomSheetSort(context);
                                    },
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  );
                })
              : SizedBox.shrink(),
          isSearchInclude
              ? GestureDetector(
                  onTap: () {
                    Get.toNamed(SearchScreen.routeName);
                  },
                  child: CustomTextField(
                    height: 42,
                    isEnable: isSearchpage ? true : false,
                    controller: controller ??
                        NavigationController.to.searchController.value,
                    hintText: 'Search for products...',
                    focusColor: AppColors.kPrimaryColor,
                    enableBorderColor: AppColors.kPrimaryColor,
                    onSubmitted: (p0) {
                      if (p0.isNotEmpty) {
                        NavigationController.to.openSearchResult.value = true;
                      }
                      ;
                    },
                    // onChanged: (value) {
                    //   Get.toNamed(SearchScreen.routeName,arguments: 'searched');
                    // },
                    prefixWidget: Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                    ),
                    marginVertical: 8,
                    marginBottom: NavigationController
                            .to.searchController!.value.text.isNotEmpty
                        ? 0
                        : 16,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  void _showBottomSheetFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Stack(alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0).copyWith(bottom: 12),
                    child: Row(
                      children: [
                        Text(
                          'Popular Brands',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(onTap: () {
                          Navigator.pop(context);
                        },
                          child: Icon(
                            CupertinoIcons.multiply,
                            color: Colors.black54,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xffECECEC),
                    thickness: 1.5,
                    height: 1.5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        color: AppColors.klightAccentColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(
                                1,
                                (index) => Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          NavigationController.to.checked2.value=!NavigationController.to.checked2.value;
                                        },
                                        child: Container( width: MediaQuery.of(context).size.width / 2.5,
                                            decoration: BoxDecoration(
                                                color: NavigationController
                                                        .to.checked2.value
                                                    ? AppColors.kAccentColor
                                                    : Colors.transparent,
                                                border: Border(
                                                    right: BorderSide(
                                                        color: NavigationController
                                                                .to.checked2.value
                                                            ? AppColors.kPrimaryColor
                                                            : Colors.transparent,
                                                        width: 2))),
                                            padding: EdgeInsets.all(16),
                                            child: Flexible(
                                              child: Text(
                                                'Brands' ,
                                                style: AppTheme
                                                    .textStyleMediumCustomBlack12,
                                              ),
                                            )),
                                      );
                                    }))
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ...List.generate(
                           1,
                            (index) => Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        NavigationController.to.checked.value =
                                            !NavigationController.to.checked.value;
                                      },
                                      child: CustomCheckboxWidget()),
                                  CustomSizedBox.space12W,
                                  Text(
                                    'Pressed Powder (3134)',
                                    style: AppTheme.textStyleMediumCustomBlack12,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 80,)
                ],
              ),
            ),
            Container(decoration: BoxDecoration(
                 color:Colors.white,borderRadius: BorderRadius.vertical(top: Radius.circular(15)
            )),padding: EdgeInsets.all(16),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              CustomButton(marginVertical: 0, marginHorizontal: 0,onPressed: () {

              },
                primary: Colors.transparent,
                borderColor: Colors.grey, isBorder: true,borderWidth: 1,boxShadowColor: Colors.transparent,elevation: 0,
                label: 'Reset',labelColor: Colors.grey,width: MediaQuery.of(context).size.width/2.25,),CustomButton(marginVertical: 0, marginHorizontal: 0,onPressed: () {

              },
               boxShadowColor: Colors.transparent,
                label: 'Apply',width: MediaQuery.of(context).size.width/2.25,)
            ],),)
          ],
        );
      },
    );
  }
  void _showBottomSheetSort(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(onTap: () {
                      Navigator.pop(context);
                    },
                      child: Icon(
                        CupertinoIcons.multiply,
                        color: Colors.black54,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1.5,
                height: 1.5,
              ),

                  ...List.generate(
                   3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(12.0).copyWith(bottom: 0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(

                            children: [
                              GestureDetector(
                                  onTap: () {
                                    NavigationController.to.checked.value =
                                        !NavigationController.to.checked.value;
                                  },
                                  child: Obx(() {
                                    return Container(
                                      height: 18,
                                      width: 18,
                                      margin: EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                          shape:BoxShape.circle ,
                                          color: NavigationController.to.checked.value
                                              ? AppColors.kPrimaryColor
                                              : Color(0xffE7E7E7),
                                          border: Border.all(width: 0.5, color: AppColors.kPrimaryColor)),
                                      alignment: Alignment.center,
                                      child: NavigationController.to.checked.value
                                          ? Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                          : SizedBox.shrink(),
                                    );
                                  })),
                              CustomSizedBox.space12W,
                              Text(
                                'Relevance',
                                style: AppTheme.textStyleMediumCustomBlack12,
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          Divider(color: Color(0xffF3F3F3),thickness: 1,height: 1,)
                        ],
                      ),
                    ),
                  ),
CustomSizedBox.space16H
            ],
          ),
        );
      },
    );
  }
}

class CustomCheckboxWidget extends StatelessWidget {
  final bool radioButton;
  const CustomCheckboxWidget({
    super.key,  this.radioButton =false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          shape:radioButton?BoxShape.circle:BoxShape.rectangle ,
            borderRadius:radioButton?BorderRadius.zero:BorderRadius.circular(2),
            color: NavigationController.to.checked.value
                ? AppColors.kPrimaryColor
                : Color(0xffE7E7E7),
            border: Border.all(width: 0.5, color: AppColors.kPrimaryColor)),
        alignment: Alignment.center,
        child: NavigationController.to.checked.value
            ? Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 15,
              )
            : SizedBox.shrink(),
      );
    });
  }
}

class PrimaryAcceantListViewItemWidget extends StatelessWidget {
  final String? title;
  const PrimaryAcceantListViewItemWidget({
    super.key,
    this.title,
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
              TitleTextWidget(tileText: title ?? 'Personal Care'),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.kPrimaryColor,
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
                return const BestSellerListWidget(
                  isBestSeller: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
