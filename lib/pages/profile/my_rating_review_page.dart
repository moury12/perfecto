import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/product-details/review/widget/comment_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/shared/loading.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:perfecto/utils.dart';

class MyRatingReviewScreen extends StatelessWidget {
  static const String routeName = '/my_rating';
  const MyRatingReviewScreen({super.key});

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
                  'My Ratings & Reviews',
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
                await UserController.to.getReviewListCall();
              },
              child: ListView.builder(
                controller: UserController.to.scrollController,
                padding: EdgeInsets.zero,
                itemCount: UserController.to.reviewList.length,
                itemBuilder: (context, index) {
                  final review = UserController.to.reviewList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index != 0
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(
                                thickness: 1.5,
                              ),
                            )
                          : const SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.kborderColor,
                                  width: .5,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: CustomNetworkImage(
                                networkImagePath: review.productInfo?.image ?? '-',
                                errorImagePath: AssetsConstant.megaDeals2,
                                borderRadius: 4,
                                height: 80,
                                width: 80,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            CustomSizedBox.space8W,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review.productInfo?.name ?? '-',
                                    style: AppTheme.textStyleMediumBlack14,
                                  ),
                                  // CustomSizedBox.space4H,
                                  // Text(
                                  //   '৳550',
                                  //   style: AppTheme.textStyleBoldBlack14,
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: List.generate(5, (index) {
                            //     return Obx(() {
                            //       return GestureDetector(
                            //         onTap: () {
                            //           // Set the rating when a star is tapped
                            //
                            //           ProfileController.to.rating.value = index + 1;
                            //         },
                            //         child: Icon(
                            //           index < ProfileController.to.rating.value ? Icons.star_rate_rounded : Icons.star_border_rounded,
                            //           color: const Color(0xffFFAC0A),
                            //         ),
                            //       );
                            //     });
                            //   }),
                            // ),
                            RatingWidget(
                                rating: 5,
                                showRatingValue: false,
                                fontSize: 12,
                                ratingTextPosition: RatingTextPosition.right,
                                textColor: Colors.black.withOpacity(.8),
                                ratingIconSize: 14,
                                ratingColor: AppColors.kOfferButtonColor,
                                outOf: 5),
                            CustomSizedBox.space4W,
                            Text(
                              '${review.star}/5',
                              style: AppTheme.textStyleSemiBoldBlack14,
                            ),
                            const Spacer(),
                            const Text(
                              '20 July 2023',
                              style: AppTheme.textStyleNormalFadeBlack12,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSizedBox.space8H,
                            Text(
                              '“${review.title}”',
                              style: AppTheme.textStyleBoldBlack14,
                            ),
                            CustomSizedBox.space4H,
                            // Obx(() {
                            //   return RichText(
                            //       text: TextSpan(children: [
                            //     const TextSpan(
                            //       text: 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                            //       style: AppTheme.textStyleNormalFadeBlack14,
                            //     ),
                            //     ProductDetailsController.to.readMore.value
                            //         ? TextSpan(
                            //             text: 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                            //             style: AppTheme.textStyleNormalFadeBlack14,
                            //             children: [
                            //                 TextSpan(
                            //                   text: ' Read Less',
                            //                   style: AppTheme.textStyleSemiBoldBlack14,
                            //                   recognizer: TapGestureRecognizer()
                            //                     ..onTap = () {
                            //                       ProductDetailsController.to.readMore.value = !ProductDetailsController.to.readMore.value;
                            //                     },
                            //                 )
                            //               ])
                            //         : TextSpan(
                            //             text: '...Read More',
                            //             style: AppTheme.textStyleSemiBoldBlack14,
                            //             recognizer: TapGestureRecognizer()
                            //               ..onTap = () {
                            //                 ProductDetailsController.to.readMore.value = !ProductDetailsController.to.readMore.value;
                            //               },
                            //           )
                            //   ]));
                            // }),
                            Obx(() {
                              return Text(
                                review.comment ?? 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu',
                                style: AppTheme.textStyleNormalFadeBlack14,
                                maxLines: UserController.to.reviewList.firstWhere((element) => element.id == review.id).readMore! ? 100 : 1,
                                overflow: TextOverflow.ellipsis,
                              );
                            }),
                            Obx(
                              () => !(UserController.to.reviewList.firstWhere((element) => element.id == review.id).readMore!) &&
                                      countLinesWithoutNewline(
                                              review.comment ?? 'It feels light and weightless and has a matte finish This one with Avocado oil and hyalu', context) >
                                          1
                                  ? GestureDetector(
                                      onTap: () {
                                        globalLogger.d('Read more');
                                        // reviews!.readMore = !reviews!.readMore!;

                                        UserController.to.reviewList.firstWhere((element) => element.id == review.id).readMore = true;
                                        UserController.to.reviewList.refresh();
                                      },
                                      child: Text(
                                        ' Read more',
                                        style: AppTheme.textStyleSemiBoldBlack14,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            Wrap(
                              children: [
                                ...List.generate(
                                  review.productReviewImages!.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                                    child: CustomNetworkImage(
                                        isPreviewPageNeed: true,
                                        imagePathList: review.productReviewImages!.map((e) => getImageUrl(e.image!)).toList(),
                                        networkImagePath: review.productReviewImages![index].image!,
                                        errorImagePath: AssetsConstant.megaDeals2,
                                        borderRadius: 4,
                                        height: 48,
                                        width: 48,
                                        fit: BoxFit.fitWidth),
                                  ),

                                  //     Container(
                                  //   height: 48,
                                  //   width: 48,
                                  //   margin: const EdgeInsets.symmetric(vertical: 8).copyWith(right: 4),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(2),
                                  //       image: const DecorationImage(
                                  //           image: AssetImage(
                                  //             AssetsConstant.megaDeals3,
                                  //           ),
                                  //           fit: BoxFit.cover)),
                                  // ),
                                ),
                              ],
                            ),
                            Obx(() {
                              return GestureDetector(
                                onTap: () async {
                                  await HomeApiController.to.productDetailsCall(review.productId!);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: ProductDetailsController.to.isHelpfull.value ? AppColors.kPrimaryColor : null,
                                      border: Border.all(color: AppColors.kPrimaryColor, width: 1),
                                      borderRadius: BorderRadius.circular(4)),
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  child: Text(
                                    'View Product',
                                    style: ProductDetailsController.to.isHelpfull.value ? AppTheme.textStyleSemiBoldWhite14 : AppTheme.textStyleSemiBoldPrimary14,
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      CustomSizedBox.space12H,
                    ],
                  );
                },
              ),
            ),
          ),
          (UserController.to.reviewStatus.value == LoadingStatus.loadingMore) ? const PerfectoLoading() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
