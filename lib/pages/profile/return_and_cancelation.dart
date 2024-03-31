import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/my-orders/return_process.dart';
import 'package:perfecto/pages/profile/my-orders/widgets/order_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../controller/user_controller.dart';

class ReturnAndCancelScreen extends StatelessWidget {
  static const String routeName = '/return_cancel';
  const ReturnAndCancelScreen({super.key});

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
                  'Returns & Cancel',
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
                await UserController.to.getCancelOrderListCall();
              },
              child: UserController.to.cancelOrderList.isEmpty
                  ? const Center(
                      child: Text('No Cancel Orders Found'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) => OrderWidget(order: UserController.to.cancelOrderList[index]),
                      itemCount: UserController.to.cancelOrderList.length,
                    ),
            ),
          ),
          // Expanded(
          //     child: ListView.builder(
          //   padding: EdgeInsets.symmetric(vertical: 8 ),
          //   itemBuilder: (context, index) => OrderWidget(
          //     status: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 16.0, vertical: 8),
          //           child: Row(
          //             children: [
          //               Text(
          //                 'Status',
          //                 style: AppTheme.textStyleSemiBoldFadeBlack14,
          //               ),
          //               Spacer(),
          //               Text(
          //                 index % 2 == 0 ? 'Return Started' : 'Cancellation',
          //                 style: AppTheme.textStyleSemiBoldBlack14,
          //               )
          //             ],
          //           ),
          //         ),
          //         index % 2 == 0
          //             ? Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                     horizontal: 16.0, vertical: 6),
          //                 child: Row(
          //                   children: [
          //                     Text(
          //                       'Estimated Delivery',
          //                       style: AppTheme.textStyleSemiBoldFadeBlack14,
          //                     ),
          //                     Spacer(),
          //                     Text(
          //                       '04 Nov, 2023',
          //                       style: AppTheme.textStyleSemiBoldBlack14,
          //                     )
          //                   ],
          //                 ),
          //               )
          //             : SizedBox.shrink(),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 16.0, vertical: 6),
          //           child: Row(
          //             children: [
          //               Text(
          //                 'Total Amount',
          //                 style: AppTheme.textStyleSemiBoldFadeBlack14,
          //               ),
          //               Spacer(),
          //               Text(
          //                 '৳ 1450.00',
          //                 style: AppTheme.textStyleSemiBoldBlack14,
          //               )
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //     tagForReturnCancel: true,
          //     tagBackgroundColor: index % 2==0 ?AppColors.klightAccentColor:Color(0xffFEE8E8) ,
          //     tagTitle:index % 2==0 ?null:'Canceled' ,
          //     function: () {
          //       index % 2 == 0
          //           ? Get.toNamed(
          //               ReturnProcess.routeName,
          //             )
          //           : Get.toNamed(ReturnProcess.routeName, arguments: 'cancel');
          //     },
          //   ),
          //   itemCount: 5,
          // ))
        ],
      ),
    );
  }
}
