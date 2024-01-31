import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class SingleBlogWidget extends StatelessWidget {
  final BlogModel blogModel;
  const SingleBlogWidget({
    super.key,
    required this.blogModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          CustomNetworkImage(
            networkImagePath: blogModel.image!,
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
                  DateFormat.yMMMd().format(DateTime.parse(blogModel.createdAt ?? '-')),
                  style: AppTheme.textStyleMediumBlack12,
                ),
                Html(
                  data: findAndRemove(blogModel.description!.replaceAll('</iframe>', '').replaceAll('<br>', '').replaceAll('</br>', ''), '<iframe', '>')
                      .replaceAll('<img', '<img style= "width: 100px" ')
                      .replaceAll('width="240" height="360" ', 'style= "width: 100px; height: 0px" '),
                  style: {
                    'body': Style(
                      margin: Margins.symmetric(horizontal: 0, vertical: 0),
                      fontSize: FontSize(10),
                      maxLines: 4,
                      textOverflow: TextOverflow.ellipsis,
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
                // Text(
                //   blogModel.description??'-',
                //   style: AppTheme.textStyleMediumBlack10,
                // ),
                const Divider(
                  height: 35,
                  color: AppColors.kborderColor,
                  thickness: 1,
                ),
                RichText(
                  text:
                      const TextSpan(text: 'Posted by ', style: AppTheme.textStyleNormalBlack12, children: [TextSpan(text: 'Perfecto', style: AppTheme.textStyleSemiBoldBlack12)]),
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
