import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_details_page.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MyPointsScreen extends StatelessWidget {
  static const String routeName = '/points';
  const MyPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        children: [
          HomeTopWidget(
            isWalletPage: false,
            title: Row(
              children: [
                GestureDetector(
                  child: Image.asset(
                    AssetsConstant.backRoute,
                    height: 20,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                CustomSizedBox.space8W,
                const Text(
                  'My Wallet',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space4W,
              ],
            ),
            isSearchInclude: false,
          ),
          Expanded(
              child: RefreshIndicator(
            onRefresh: () async {
              await UserController.to.getRewardListCall();
            },
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsConstant.pointsBanner), fit: BoxFit.fill, alignment: Alignment.topCenter)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomSizedBox.space12H,
                      CustomSizedBox.space12H,
                      const Text(
                        'Your Redeemable Points',
                        style: AppTheme.textStyleSemiBoldWhite14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Image.asset(
                          AssetsConstant.pointsIcon,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${UserController.to.getUserInfo.rewardPoints} Points',
                        style: AppTheme.textStyleBoldWhite16,
                      ),
                      CustomSizedBox.space12H,
                      CustomSizedBox.space12H,
                    ],
                  ),
                ),
                CustomSizedBox.space12H,
                OutlinedCustomContainer(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How to Earn Perfecto Reward Points',
                        style: AppTheme.textStyleSemiBoldBlack16,
                      ),
                      CustomSizedBox.space12H,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.klightAccentColor,
                            border: const Border(left: BorderSide(color: AppColors.kPrimaryColor, width: 4))),
                        padding: const EdgeInsets.all(16),
                        child: RichText(
                          text: TextSpan(text: 'More you buy, the more you earn: ', style: AppTheme.textStyleSemiBoldBlack12, children: [
                            TextSpan(
                                text:
                                    'Earn ${HomeApiController.to.rewardPointInfo.value.rewardPoint} point for every ${HomeApiController.to.rewardPointInfo.value.amount} taka purchases.',
                                style: AppTheme.textStyleNormalBlack12)
                          ]),
                        ),
                      ),
                      CustomSizedBox.space12H,
                    ],
                  ),
                ),
                OutlinedCustomContainer(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How to Redeem Perfecto Reward Point?',
                        style: AppTheme.textStyleSemiBoldBlack16,
                      ),
                      CustomSizedBox.space12H,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.klightAccentColor,
                            border: const Border(left: BorderSide(color: AppColors.kPrimaryColor, width: 4))),
                        padding: const EdgeInsets.all(16),
                        child: RichText(
                          text: const TextSpan(text: '', style: AppTheme.textStyleSemiBoldBlack12, children: [
                            TextSpan(
                                text: 'While buying products from Perfecto, you can use your available reward points by applying at checkout. ',
                                style: AppTheme.textStyleNormalBlack12)
                          ]),
                        ),
                      ),
                      CustomSizedBox.space12H,
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, border: Border.all(color: AppColors.kborderColor, width: 0.5), borderRadius: BorderRadius.circular(6)),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Reward Points History',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        color: AppColors.kborderColor,
                        height: 2,
                      ),
                      CustomSizedBox.space12H,
                      ...List.generate(
                          UserController.to.rewardList.length,
                          (index) => GestureDetector(
                                onTap: () async {
                                  await UserController.to.getOrderDetailsCall(UserController.to.rewardList[index].order!.id!);
                                  Get.toNamed(MyOrderDetailsScreen.routeName);
                                },
                                child: OutlinedCustomContainer(
                                  widget: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            DateFormat('dd MMM, yyyy, hh:mm a').format(
                                              DateTime.parse(UserController.to.rewardList[index].createdAt!),
                                            ), //  '24 Nov, 2023, 03:23 PM',
                                            style: AppTheme.textStyleSemiBoldBlack12,
                                          ),
                                          const Spacer(),
                                          Text(
                                            '#${UserController.to.rewardList[index].order!.orderNo!}',
                                            style: AppTheme.textStyleNormalFadeBlack14,
                                          )
                                        ],
                                      ),
                                      CustomSizedBox.space12H,
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: UserController.to.rewardList[index].order!.status == '5' ? 'Cancel:' : 'Purchase:',
                                                style: AppTheme.textStyleNormalBlack12,
                                                children: [
                                                  TextSpan(text: ' ৳ ${UserController.to.rewardList[index].order!.grandTotal!}', style: AppTheme.textStyleSemiBoldBlack12)
                                                ]),
                                          ),
                                          const Spacer(),
                                          Image.asset(
                                            AssetsConstant.pointsIcon,
                                            color: Colors.red,
                                            height: 16,
                                          ),
                                          CustomSizedBox.space8W,
                                          Text(
                                            UserController.to.rewardList[index].usingPoint!,
                                            style: const TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w600),
                                          ),
                                          CustomSizedBox.space8W,
                                          Image.asset(
                                            AssetsConstant.pointsIcon,
                                            color: AppColors.kPrimaryColor,
                                            height: 16,
                                          ),
                                          CustomSizedBox.space8W,
                                          Text(
                                            '+${UserController.to.rewardList[index].addedPoint!}',
                                            style: const TextStyle(color: AppColors.kPrimaryColor, fontSize: 14, fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                      CustomSizedBox.space12H
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class OutlinedCustomContainer extends StatelessWidget {
  final Widget widget;
  final double? padding;
  const OutlinedCustomContainer({
    super.key,
    required this.widget,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: AppColors.kborderColor, width: 0.5), borderRadius: BorderRadius.circular(6)),
      padding: EdgeInsets.all(padding ?? 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: widget,
    );
  }
}
