import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class TermsConditionScreen extends StatelessWidget {
  static const String routeName = '/terms_condition';
  const TermsConditionScreen({super.key});

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
                  'Terms & Conditions',
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
            children: [
              Text(
                'Terms & Condition',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              Obx(() {
                return Html(
                  data: findAndRemove(HomeApiController.to.termsConditionInfo.value.document ?? '-'.replaceAll('</br>', ''), '<iframe', '>')
                      .replaceAll('<img', '<img style= "width: 100px" ')
                      .replaceAll('width="240" height="360" ', 'style= "width: 100px; height: 0px" '),
                  style: {
                    'body': Style(
                      margin: Margins.symmetric(horizontal: 0, vertical: 0),
                      fontSize: FontSize(14),
                      // lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    'p': Style(
                      fontSize: FontSize(14),
                      // lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    'span': Style(
                      // margin: Margins.symmetric(horizontal: 10, vertical: 0),
                      // fontSize: FontSize(14),
                      lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  },
                );
              }),
              Text(
                'Privacy Policy',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              Obx(() {
                return Html(
                  data: findAndRemove(HomeApiController.to.privacyPolicyInfo.value.document ?? '-'.replaceAll('</br>', ''), '<iframe', '>')
                      .replaceAll('<img', '<img style= "width: 100px" ')
                      .replaceAll('width="240" height="360" ', 'style= "width: 100px; height: 0px" '),
                  style: {
                    'body': Style(
                      margin: Margins.symmetric(horizontal: 0, vertical: 0),
                      fontSize: FontSize(14),
                      // lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    'p': Style(
                      fontSize: FontSize(14),
                      // lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    'span': Style(
                      // margin: Margins.symmetric(horizontal: 10, vertical: 0),
                      // fontSize: FontSize(14),
                      lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  },
                );
              }),
            ],
          ))
        ],
      ),
    );
  }
}

class DocScreen extends StatelessWidget {
  static const String routeName = '/docs';
  const DocScreen({super.key});

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
                  Get.arguments['title'],
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
            children: [
              Html(
                data: findAndRemove(Get.arguments['doc'] ?? '-'.replaceAll('</br>', ''), '<iframe', '>')
                    .replaceAll('<img', '<img style= "width: 100px" ')
                    .replaceAll('width="240" height="360" ', 'style= "width: 100px; height: 0px" '),
                style: {
                  'body': Style(
                    margin: Margins.symmetric(horizontal: 0, vertical: 0),
                    fontSize: FontSize(14),
                    // lineHeight: LineHeight.number(1),
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  'p': Style(
                    fontSize: FontSize(14),
                    // lineHeight: LineHeight.number(1),
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  'span': Style(
                    // margin: Margins.symmetric(horizontal: 10, vertical: 0),
                    // fontSize: FontSize(14),
                    lineHeight: LineHeight.number(1),
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
