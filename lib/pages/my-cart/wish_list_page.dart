import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/pages/my-cart/apply_cuppon_reward.dart';
import 'package:perfecto/pages/my-cart/widgets/cart_widget.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../shared/custom_sized_box.dart';
import '../home/widgets/home_top_widget.dart';
import 'cart_controller.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName='/wish_list';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
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
              'My Bag',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
            CustomSizedBox.space4W,
            Text(
              '(3 Items)',
              style: AppTheme.textStyleNormalFadeBlack12,
            )
          ],
        ),
        isSearchInclude: false,
      ),
      !CartController.to.iswishListEmpty.value
          ? Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => CartWidget(iswish: true,),
              itemCount: 3,
            ),

          ],
        ),
      )
          : Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Image.asset(AssetsConstant.emptyWishList, height: 215),
              CustomSizedBox.space20H,
              Text(
                'You haven’t add anything to your wishlist',
                style: AppTheme.textStyleSemiBoldBlack20,
                textAlign: TextAlign.center,
              ),
              CustomSizedBox.space20H,
              Text(
                'Wishlist is empty. You don\'t have any products in the wishlist yet',
                style: AppTheme.textStyleNormalBlack14,
                textAlign: TextAlign.center,
              ),
              CustomButton(
                label: 'Start Shopping',
                marginHorizontal: 0,
                marginVertical: 20,
                onPressed: () {
                  // Your button's onPressed logic here
                },
              ),
              Spacer(),
            ],
          ),
        ),
      )


    ]),);
  }
}
