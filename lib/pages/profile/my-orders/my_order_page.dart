import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/my-orders/widgets/order_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MyOrdersScreen extends StatelessWidget {
  static const String routeName = '/my_order';
  const MyOrdersScreen({super.key});

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
                const Text(
                  'My Orders',
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
                await UserController.to.getOrderListCall();
              },
              child: Obx(() {
                return UserController.to.orderList.isEmpty
                    ? const Center(
                        child: Text('No Orders Found'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemBuilder: (context, index) => OrderWidget(order: UserController.to.orderList[index]),
                        itemCount: UserController.to.orderList.length,
                      );
              }),
            ),
          )
        ],
      ),
    );
  }
}
