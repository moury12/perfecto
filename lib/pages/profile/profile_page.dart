import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/points/my_points_page.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_page.dart';
import 'package:perfecto/pages/profile/my_address_page.dart';
import 'package:perfecto/pages/profile/my_profile_page.dart';
import 'package:perfecto/pages/profile/my_rating_review_page.dart';
import 'package:perfecto/pages/profile/notification.dart';
import 'package:perfecto/pages/profile/return_and_cancelation.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeTopWidget(
          isSearchInclude: false,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                clipBehavior: Clip.none,
                decoration: const BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          AssetsConstant.profileBackground,
                        ),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSizedBox.space24H,
                    Obx(() {
                      return CustomNetworkImage(
                        networkImagePath: UserController.to.userInfo.value.avatar ?? '',
                        errorImagePath: 'assets/dummy_profile.png',
                      );
                    }),
                    // CustomNetworkImage(
                    //       networkImagePath: '',
                    //       errorImagePath: 'assets/dummy_profile.png',
                    //     ),
                    CustomSizedBox.space8H,
                    Obx(() {
                      return Text(
                        UserController.to.userInfo.value.name ?? 'Anonymous User',
                        style: AppTheme.textStyleBoldWhite14,
                      );
                    }),
                    CustomSizedBox.space4H,
                    Obx(() {
                      return Text(
                        UserController.to.userInfo.value.phone ?? '-',
                        style: AppTheme.textStyleSemiBoldWhite12,
                      );
                    }),
                    CustomSizedBox.space4H,
                    Container(
                      padding: const EdgeInsets.all(4),
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: const Color(0xffD4F3FF), borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsConstant.pointsIcon,
                            height: 12,
                          ),
                          CustomSizedBox.space4W,
                          RichText(
                              text: TextSpan(text: '', children: [
                            TextSpan(text: UserController.to.getUserInfo.rewardPoints, style: AppTheme.textStyleBoldBlack12),
                            const TextSpan(text: ' Points', style: AppTheme.textStyleNormalBlack12)
                          ])),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: const [BoxShadow(color: Color(0xffE4EDF0), blurRadius: 12)], borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          ProfileItemWidget(
                            onPressed: () {
                              Get.toNamed(MyProfileScreen.routeName);
                            },
                            image: 'assets/user_icon.png',
                            title: 'My Profile',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            onPressed: () {
                              Get.toNamed(MyPointsScreen.routeName);
                            },
                            image: AssetsConstant.wallet,
                            title: 'My Point',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            onPressed: () {
                              Get.toNamed(MyOrdersScreen.routeName);
                            },
                            image: AssetsConstant.ordersIcon,
                            title: 'My Orders',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            onPressed: () async {
                              await UserController.to.getCancelOrderListCall();
                              Get.toNamed(ReturnAndCancelScreen.routeName);
                            },
                            image: AssetsConstant.returnCancel,
                            title: 'Returns & Cancel',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            onPressed: () async {
                              await UserController.to.getReviewListCall();
                              Get.toNamed(MyRatingReviewScreen.routeName);
                            },
                            image: AssetsConstant.ratingReview,
                            title: 'My Ratings & Reviews',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            onPressed: () {
                              UserController.to.getNotificationListCall();
                              Get.toNamed(NotificationScreen.routeName);
                            },
                            image: AssetsConstant.notification,
                            title: 'Notifications',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            onPressed: () {
                              Get.toNamed(MyAddressScreen.routeName);
                            },
                            image: AssetsConstant.myAddress,
                            title: 'My Addresses',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.kborderColor,
                            height: 1,
                          ),
                          ProfileItemWidget(
                            onPressed: () {
                              // Get.toNamed(LoginScreen.routeName);
                              AuthController.to.logout();
                            },
                            image: AssetsConstant.logout,
                            title: 'Logout',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
  final Function() onPressed;
  const ProfileItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
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
      ),
    );
  }
}
