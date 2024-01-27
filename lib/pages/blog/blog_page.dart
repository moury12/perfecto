import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/pages/blog/blog_details_page.dart';
import 'package:perfecto/pages/blog/widget/blog_widget.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class BlogScreen extends StatelessWidget {
  static const String routeName = '/blog';
  const BlogScreen({super.key});

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
                  'Beauty Advice',
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
                      HomeApiController.to.blogListCall();
                    },
                    child:  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                                itemCount: HomeApiController.to.blogList.length,
                                itemBuilder: (context, index) {
                        final blog=HomeApiController.to.blogList[index];
                    return GestureDetector(
                      onTap: () async{

                         HomeApiController.to.singleBlogListCall(blog.id);
                        Get.toNamed(BlogDetailsScreen.routeName);
                      },
                        child: SingleBlogWidget(blogModel: blog,));
                                },
                              ),
                  );
                }
              ))
        ],
      ),
    );
  }
}

