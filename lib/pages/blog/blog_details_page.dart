
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class BlogDetailsScreen extends StatelessWidget {
  static const String routeName ='/blog_details';
  const BlogDetailsScreen({super.key});

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
                'My Orders',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              CustomSizedBox.space4W,

            ],
          ),
          isSearchInclude: false,
        ),
        Expanded(child: ListView(padding: EdgeInsets.zero,

          children: [
            CustomNetworkImage(

              networkImagePath: '',
              errorImagePath: 'assets/blog.png',
              border: NetworkImageBorder.Rectangle,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [Icon(Icons.date_range_rounded,color:Colors.black54,size: 15,),
                    CustomSizedBox.space4W,
                    Text(
                    'jun 16, 2023',
                    style: AppTheme.textStyleNormalFadeBlack12,
                  ),],), Row(children: [Icon(Icons.person_3_outlined,color:Colors.black54,size: 15,),
                    CustomSizedBox.space4W,
                        RichText(
              text: TextSpan(
                  text: 'Posted by: ',
                  style: AppTheme.textStyleNormalBlack12,
                  children: [
                    TextSpan(
                        text: 'Perfecto',
                        style: AppTheme.textStyleSemiBoldBlack12)
                  ]),
                        ),],),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                height: 5,
                color: AppColors.kborderColor,
                thickness: 1,
              ),
            ), Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
              child:Text('Perfume has an 8,000-year antiquity that began in ancient Mesopotamia and Egypt. The perfumes of those eras were extremely potent, yet they were primarily employed for religious events rather than cosmetics, which set them against modern fragrances. Despite the fact that Cleopatra owned her own perfume factory and left behind a recipe for a 16-ingredient scent known as "life," Its hard to describe it as a scent in the contemporary sense because its more of an oil and herb combo. The maximum amount of aromatic material allowed in modern fragrances was 30%; the remaining amount was an alcoholic solution. Dont be upset, though. If you dont need to make such grandiose appearances as the Egyptian queen did when he smells',style: AppTheme.textStyleMediumFadeBlack10,)
            ),
          ],))
      ],),
    );
  }
}
