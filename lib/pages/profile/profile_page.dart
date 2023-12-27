import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/points/my_points_page.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_page.dart';
import 'package:perfecto/pages/profile/my_address_page.dart';
import 'package:perfecto/pages/profile/my_profile_page.dart';
import 'package:perfecto/pages/profile/my_rating_review_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTopWidget(
          isSearchInclude: false,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AssetsConstant.profileBackground,
                        ),
                        alignment: Alignment.topCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSizedBox.space24H,
                    CustomNetworkImage(
                      networkImagePath: '',
                      errorImagePath: 'assets/dummy_profile.png',
                      backgroundColor: Colors.white,
                    ),
                    CustomSizedBox.space8H,
                    Text(
                      'User 1234',
                      style: AppTheme.textStyleBoldWhite14,
                    ),
                    CustomSizedBox.space4H,
                    Text(
                      '0187565656565',
                      style: AppTheme.textStyleSemiBoldWhite12,
                    ),
                    CustomSizedBox.space4H,
                    Container(
                      padding: const EdgeInsets.all(4),
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffD4F3FF),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsConstant.pointsIcon,
                            height: 12,
                          ),
                          CustomSizedBox.space4W,
                          RichText(
                              text: const TextSpan(text: '', children: [
                            TextSpan(
                                text: '0',
                                style: AppTheme.textStyleBoldBlack12),
                            TextSpan(
                                text: ' Points',
                                style: AppTheme.textStyleNormalBlack12)
                          ])),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Color(0xffE4EDF0), blurRadius: 12)
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          ProfileItemWidget(
                            function: () {
                              Get.toNamed(MyProfileScreen.routeName);
                            },
                            image: 'assets/user_icon.png',
                            title: 'My Profile',
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            function: () {
                              Get.toNamed(MyPointsScreen.routeName);
                            },
                            image: AssetsConstant.wallet,
                            title: 'My Wallet',
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            function: () {
                              Get.toNamed(MyOrdersScreen.routeName);
                            },
                            image: AssetsConstant.ordersIcon,
                            title: 'My Orders',
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            function: () {},
                            image: AssetsConstant.returnCancel,
                            title: 'Returns & Cancel',
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            function: () {
                              Get.toNamed(MyRatingReviewScreen.routeName);
                            },
                            image: AssetsConstant.ratingReview,
                            title: 'My Ratings & Reviews',
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            function: () {},
                            image: AssetsConstant.notification,
                            title: 'Notifications',
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            function: () {
                              Get.toNamed(MyAddressScreen.routeName);
                            },
                            image: AssetsConstant.myAddress,
                            title: 'My Addresses',
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            function: () {},
                            image: AssetsConstant.logout,
                            title: 'Logout',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ProfileItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final Function() function;
  const ProfileItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 26,
            ),
            CustomSizedBox.space8W,
            Text(
              title,
              style: AppTheme.textStyleMediumBlack16,
            )
          ],
        ),
      ),
    );
  }
}
