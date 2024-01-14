import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';


class RefundCancelationScreen extends StatelessWidget {
  static const String routeName='/return_cancel';
  const RefundCancelationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.kBackgroundColor,
      body: Column(children: [
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
                'Return & Refund Policy',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              CustomSizedBox.space4W,

            ],
          ),
          isSearchInclude: false,
        ),
        Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Text(
                  'Cancellations Policy',
                  style: AppTheme.textStyleSemiBoldBlack18,
                  textAlign: TextAlign.center,
                ),
                CustomSizedBox.space20H,
                Text(
                  '24-hour cancellation policy',
                  style: AppTheme.textStyleMediumBlack14,
                ),
                CustomSizedBox.space8H,
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Tincidunt in et nullam lorem sagittis. Tellus pharetra dignissim enim vehicula urna quam. Eu posuere dui elit odio. Vestibulum tincidunt nisl sagittis at volutpat varius pulvinar commodo. Aliquam ut a nibh senectus mollis ac venenatis tellus. Mauris mi in ultrices ut pharetra aliquam. Orci proin ',
                  style: AppTheme.textStyleNormalBlack10,
                )
              ],
            ))
      ],),
    );
  }
}
