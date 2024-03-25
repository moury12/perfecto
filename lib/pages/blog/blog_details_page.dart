import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class BlogDetailsScreen extends StatelessWidget {
  static const String routeName = '/blog_details';
  const BlogDetailsScreen({super.key});

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
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomNetworkImage(
                networkImagePath: '${HomeApiController.to.singleBlog.value.image}',
                errorImagePath: 'assets/blog.png',
                border: NetworkImageBorder.Rectangle,
                fit: BoxFit.fitWidth,
                width: double.infinity,
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range_rounded,
                          color: Colors.black54,
                          size: 15,
                        ),
                        CustomSizedBox.space4W,
                        Obx(() {
                          return Text(
                            HomeApiController.to.singleBlog.value.createdAt != null && HomeApiController.to.singleBlog.value.createdAt!.isNotEmpty
                                ? (DateFormat.yMMMd().format(DateTime.parse(HomeApiController.to.singleBlog.value.createdAt ?? '-')).toString())
                                : '-',
                            style: AppTheme.textStyleNormalFadeBlack12,
                          );
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_3_outlined,
                          color: Colors.black54,
                          size: 15,
                        ),
                        CustomSizedBox.space4W,
                        RichText(
                          text: const TextSpan(
                              text: 'Posted by: ', style: AppTheme.textStyleNormalBlack12, children: [TextSpan(text: 'Perfecto', style: AppTheme.textStyleSemiBoldBlack12)]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  height: 5,
                  color: AppColors.kborderColor,
                  thickness: 1,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8).copyWith(bottom: 0),
                  child: Text(
                    HomeApiController.to.singleBlog.value.title ?? '',
                    style: AppTheme.textStyleSemiBoldBlack14,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Html(
                  data: findAndRemove((HomeApiController.to.singleBlog.value.description ?? '').replaceAll('<br>', '').replaceAll('</br>', ''), '<iframe', '>')
                      .replaceAll('<img', '<img style= "width: 100px" ')
                      .replaceAll('width="240" height="360" ', 'style= "width: 100px; height: 0px" '),
                  style: {
                    'body': Style(
                      margin: Margins.symmetric(horizontal: 0, vertical: 0),
                      fontSize: FontSize(10),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    'p': Style(
                      fontSize: FontSize(10),
                      // lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    'span': Style(
                      // margin: Margins.symmetric(horizontal: 10, vertical: 0),
                      // fontSize: FontSize(14),
                      lineHeight: LineHeight.number(1),
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  },
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
