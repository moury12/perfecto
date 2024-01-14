import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class SingleBlogWidget extends StatelessWidget {
  const SingleBlogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          CustomNetworkImage(
            networkImagePath: '',
            errorImagePath: 'assets/blog.png',
            border: NetworkImageBorder.Rectangle,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'jun 16, 2023',
                  style: AppTheme.textStyleMediumBlack12,
                ),
                CustomSizedBox.space16H,
                Text(
                  'Perfume de toilette, scented, or perfumes?',
                  style: AppTheme.textStyleSemiBoldBlack14,
                ),
                CustomSizedBox.space8H,
                Text(
                  'Use makeup devoid of toxins to nourish your skin. With the irresistible offers of cosmetics free of toxins for your skin.',
                  style: AppTheme.textStyleMediumBlack10,
                ),
                Divider(
                  height: 35,
                  color: AppColors.kborderColor,
                  thickness: 1,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Posted by ',
                      style: AppTheme.textStyleNormalBlack12,
                      children: [
                        TextSpan(
                            text: 'Perfecto',
                            style: AppTheme.textStyleSemiBoldBlack12)
                      ]),
                ),
                CustomSizedBox.space12H
              ],
            ),
          )
        ],
      ),
    );
  }
}
