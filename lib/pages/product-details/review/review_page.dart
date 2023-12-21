import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/review/widget/comment_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ReviewScreen extends StatelessWidget {
  static const String routeName = '/review';
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: CustomDrawer(),
      body: Column(
        children: [
          const HomeTopWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Divider(thickness: 1.5, color: Color(0xffECECEC),height: 1,
                  indent: 0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                  child: Column(
                    children: [
                      CustomSizedBox.space8H,
                      Row(
                        children: [
                          Text(
                            'Ratings & Reviews',
                            style: AppTheme.textStyleBoldBlack16,
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(4)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Text(
                              'Write Review',
                              style: AppTheme.textStyleBoldBlack14,
                            ),
                          ),
                        ],
                      ),
                      CustomSizedBox.space8H,
                    ],
                  ),
                ),

                Divider(thickness: 1.5, color: Color(0xffECECEC),height: 0,
                  indent: 0,),

                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Lakme Absolute Skin Dew Color Sensational Ultimattes Satin Lipstick',
                            style: AppTheme.textStyleNormalBlack14,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '4.3/5',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                            Text(
                              '234 verified ratings',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Color(0xffECECEC).withOpacity(.4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TitleTextWidget(tileText: 'Refine Reviews By'),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Reset Filter',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 42,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          scrollDirection: Axis.horizontal,
                          itemCount: 23,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(horizontal:  4),
                            alignment: Alignment.center,
                          decoration: BoxDecoration(

                              border:
                              Border.all(color:index==0? AppColors.kPrimaryColor:Colors.grey.withOpacity(.5), width: 1.5),
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(

                            'Verified Buyers',
                            textAlign: TextAlign.center,
                            style:index==0? AppTheme.textStyleSemiBoldPrimary14:AppTheme.textStyleSemiBoldFadeBlack14,
                          ),
                        ),),
                      ),
                      CustomSizedBox.space16H,
                    ],
                  ),
                ),
    ...List.generate(10, (index) =>CommentWidget(index: index,),),
                CustomSizedBox.space12H,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12)
            ]),
        child: FittedBox(
          child: Row(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    ProductDetailsController.to.isFavourite.value =
                        !ProductDetailsController.to.isFavourite.value;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.kPrimaryColor, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: ProductDetailsController.to.isFavourite.value
                        ? Image.asset(
                            AssetsConstant.favIconFill,
                            height: 24,
                          )
                        : Image.asset(
                            AssetsConstant.favIcon,
                            height: 26,
                          ),
                  ),
                );
              }),
              CustomSizedBox.space4W,
              CustomButton(
                label: 'Add To Bag',
                marginHorizontal: 8,
                marginVertical: 4,
                height: 50,
                prefixImage: AssetsConstant.cartIcon,
                prefixImageColor: Colors.white,
                prefixImageHeight: 20,
                primary: AppColors.kPrimaryColor,
                width: MediaQuery.of(context).size.width / 1.3,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


