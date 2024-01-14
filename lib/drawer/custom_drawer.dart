import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/drawer_controller.dart';
import 'package:perfecto/pages/auth/return_cancelation_page.dart';
import 'package:perfecto/pages/auth/terms_condition_page.dart';
import 'package:perfecto/pages/blog/blog_page.dart';
import 'package:perfecto/pages/home/brand_page.dart';
import 'package:perfecto/pages/my-cart/wish_list_page.dart';
import 'package:perfecto/pages/profile/return_and_cancelation.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          CustomSizedBox.space12H,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              children: [
                Image.asset(
                  AssetsConstant.perfectoLogo,
                  height: 18,
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(360),
                  onTap: () {
                    Get.toNamed(WishListScreen.routeName);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          AssetsConstant.favIcon,
                          height: 25,
                          color: Colors.black,
                        ),
                        Positioned(
                          top: -2,
                          right: 0,
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
                ),
                CustomSizedBox.space8W,
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    CupertinoIcons.multiply,
                    size: 28,
                  ),
                )
              ],
            ),
          ),
          const CustomDividerWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(WishListScreen.routeName);
                        },
                        child: SaleTextWidget()),
                    SaleTextWidget(text: 'Puja Sale', color: Color(0xffD90068)),
                    SaleTextWidget(
                        text: 'Buy 1 Get 1', color: Color(0xff9747FF)),
                    SaleTextWidget(
                        text: 'Clearance Sale', color: Color(0xff129CED)),
                    CustomSizedBox.space12H,
                    CustomDividerWidget(),
                    CustomSizedBox.space8H,
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(BrandScreen.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: SaleTextWidget(
                          text: 'Brands',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CustomSizedBox.space8H,
                    CustomDividerWidget(),
                    CustomSizedBox.space8H,
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(BlogScreen.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: SaleTextWidget(
                          text: 'Beauty Advice',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CustomSizedBox.space8H,
                    CustomDividerWidget(),
                    CustomSizedBox.space8H,
                    SaleTextWidget(
                      text: 'Category',
                      color: Colors.black,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                      child: Column(
                        children: [
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Makeup',
                          ),
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Skin',
                          ),
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Hair',
                          ),
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Appliances',
                          ),
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Personal Care',
                          ),
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Natural',
                          ),
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Mom & Wellness',
                          ),
                          DrawerMenuItemWidget(
                            onTap: () {
                              CustomDrawerController.to.isExpanded.value =
                                  !CustomDrawerController.to.isExpanded.value;
                            },
                            title: 'Men',
                          ),
                        ],
                      ),
                    ),
                    CustomSizedBox.space8H,
                    CustomDividerWidget(),
                    CustomSizedBox.space8H,
                    GestureDetector(
                    onTap: () {
                      Get.toNamed(TermsConditionScreen.routeName);
                    },                      child: SaleTextWidget(
                        text: 'Terms & Conditions',
                        color: Colors.black,
                      ),
                    ),
                    CustomSizedBox.space8H,
                    CustomDividerWidget(),
                    CustomSizedBox.space8H,
                    GestureDetector( onTap: () {
                      Get.toNamed(RefundCancelationScreen.routeName);
                    },
                      child: SaleTextWidget(
                        text: 'Return & Refund Policy',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DrawerMenuItemWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const DrawerMenuItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: AppTheme.textStyleMediumFadeBlack16,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(.7),
                    size: 25,
                  )
                ],
              ),
            ),
            CustomDrawerController.to.isExpanded.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(CustomDrawerController.to.subCategory.length, (index) {
                        final text =
                            CustomDrawerController.to.subCategory[index];
                        return Container(
                          width: double.infinity,
                          /*decoration: BoxDecoration(
                              color: index == 1 ? AppColors.kAccentColor : null,
                              border: Border(
                                  left: BorderSide(
                                      width: 1,
                                      color: index == 1
                                          ? AppColors.kPrimaryColor
                                          : Colors.transparent)))*/
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(

                                  child: Text(
                                    text,
                                    style: AppTheme.textStyleMediumFadeBlack16,
                                  ),
                                  onTap: () {
                                    CustomDrawerController.to.isExpanded2.value=!CustomDrawerController.to.isExpanded2.value;
                                  },
                                ),
                                CustomDrawerController.to.isExpanded2.value
                                    ?  Column(children: [...List.generate(CustomDrawerController.to.childCategory.length, (index) {
                                final text =
                                CustomDrawerController.to.childCategory[index];
                                return Container(
                                  width: double.infinity,

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      text,
                                      style: AppTheme.textStyleMediumFadeBlack16,
                                    ),
                                  ),
                                );
                              })],):SizedBox.shrink()
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      );
    });
  }
}

class SaleTextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  const SaleTextWidget({
    super.key,
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text ?? 'Anniversary Sale',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: color ?? const Color(0xff3734E2)),
      ),
    );
  }
}

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.5,
      height: 0,
      color: Color(0xffECECEC),
    );
  }
}
