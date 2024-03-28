import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/shared/loading.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:perfecto/utils.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        children: [
          HomeTopWidget(
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
                Text(
                  'Notifications',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space4W,
              ],
            ),
            isSearchInclude: false,
          ),
          Expanded(
            child: Obx(
              () {
                return RefreshIndicator(
                  onRefresh: () async {
                    await UserController.to.getNotificationListCall(initialCall: true);
                  },
                  child: ListView(
                    controller: UserController.to.notificationScrollController,
                    padding: EdgeInsets.zero,
                    children: [
                      UserController.to.notificationStatus.value == LoadingStatus.loading
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    );
                                  }),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: UserController.to.notificationList.length,
                              itemBuilder: (context, index) {
                                final notification = UserController.to.notificationList[index];
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          surfaceTintColor: Colors.white,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          contentPadding: const EdgeInsets.all(16),
                                          insetPadding: const EdgeInsets.all(16),
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(90),
                                                child: Container(
                                                  padding: EdgeInsets.all(18),
                                                  color: AppColors.kAccentColor,
                                                  child: Image.asset(
                                                    AssetsConstant.notifications,
                                                    height: 40,
                                                    width: 44,
                                                  ),
                                                ),
                                              ),
                                              CustomSizedBox.space16H,
                                              Text(
                                                notification.title ?? '',
                                                style: AppTheme.textStyleSemiBoldBlack18,
                                              ),
                                              CustomSizedBox.space16H,
                                              Text(
                                                notification.description ?? '',
                                                textAlign: TextAlign.center,
                                              ),
                                              CustomSizedBox.space32H,
                                              CustomButton(
                                                marginHorizontal: 0,
                                                marginVertical: 0,
                                                label: 'Okay',
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                    margin: EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0 ? Color(0xffEEFAFF) : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        width: .5,
                                        color: Color(0xffE2E8F0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.asset(
                                              AssetsConstant.notifications,
                                              height: 53,
                                            ),
                                            Positioned(
                                                top: 4,
                                                right: 6,
                                                child: Icon(
                                                  Icons.circle,
                                                  color: AppColors.kDarkPrimaryColor,
                                                  size: 12,
                                                ))
                                          ],
                                        ),
                                        CustomSizedBox.space8W,
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    notification.title ?? '',
                                                    style: AppTheme.textStyleSemiBoldBlack14,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  )),
                                                  CustomSizedBox.space12W,
                                                  Text(
                                                    DateFormat('dd MMM yyyy').format(DateTime.parse(notification.createdAt ?? '')).toString(),
                                                    style: AppTheme.textStyleNormalBlack10,
                                                  )
                                                ],
                                              ),
                                              Text(notification.description ?? '', style: AppTheme.textStyleNormalBlack10, maxLines: 2, overflow: TextOverflow.ellipsis),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
          (UserController.to.notificationStatus.value == LoadingStatus.loadingMore) ? const PerfectoLoading() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
