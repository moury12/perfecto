import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/order_model.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/combo_details_page.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_details_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:collection/collection.dart';

import '../../../../controller/home_api_controller.dart';

class OrderWidget extends StatelessWidget {
  final Widget? status;
  final Function()? onPressed;
  final bool tagForReturnCancel;
  final String? tagTitle;
  final Color? tagBackgroundColor;
  final OrderModel order;
  const OrderWidget({
    super.key,
    this.status,
    this.onPressed,
    this.tagForReturnCancel = false,
    this.tagTitle,
    this.tagBackgroundColor,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor, width: 0.5), color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Order Number',
                  style: AppTheme.textStyleSemiBoldFadeDarkBlack14,
                ),
                const Spacer(),
                Text(
                  '#${order.orderNo}',
                  style: AppTheme.textStyleSemiBoldBlack16,
                )
              ],
            ),
          ),
          const Divider(
            color: AppColors.kborderColor,
            thickness: 2,
            height: 2,
          ),
          CustomSizedBox.space12H,
          status ??
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          'Payment Methode',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        const Spacer(),
                        Text(
                          order.paymentMethod!.toLowerCase() == 'cod'
                              ? 'Cash on Delivery'
                              : order.paymentMethod!.toLowerCase() == 'ssl'
                                  ? 'Online Payment'
                                  : 'N/A',
                          style: AppTheme.textStyleSemiBoldBlack14,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          'Payment Status',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: order.paymentStatus!.toLowerCase() == 'success'
                                ? AppColors.kPrimaryColor.withOpacity(.1)
                                : order.paymentStatus!.toLowerCase() == 'failed'
                                    ? AppColors.kRedColor.withOpacity(.1)
                                    : AppColors.kOfferButtonColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            order.paymentStatus ?? 'Pending',
                            style: AppTheme.textStyleSemiBoldBlack14.copyWith(
                                color: order.paymentStatus!.toLowerCase() == 'success'
                                    ? AppColors.kPrimaryColor
                                    : order.paymentStatus!.toLowerCase() == 'failed'
                                        ? AppColors.kRedColor
                                        : AppColors.kOfferButtonColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          'Status',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        const Spacer(),
                        Text(
                          UserController.to.processesMap[order.status] ?? 'Pending',
                          style: AppTheme.textStyleSemiBoldBlack14,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          order.status == '4'
                              ? 'Delivered'
                              : order.status == '5'
                                  ? 'Cancelled'
                                  : 'Estimated Delivery',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        const Spacer(),
                        Text(
                          order.status == '4' || order.status == '5'
                              ? DateFormat('dd MMM, yyyy').format(DateTime.parse(order.updatedAt!))
                              : DateFormat('dd MMM, yyyy').format(DateTime.parse(order.createdAt!).add(const Duration(days: 2))),
                          style: AppTheme.textStyleSemiBoldBlack14,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          'Total Amount',
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                        ),
                        const Spacer(),
                        Text(
                          '৳ ${order.grandTotal!.toDouble().toStringAsFixed(2)}',
                          style: AppTheme.textStyleSemiBoldBlack14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
          CustomSizedBox.space12H,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomDividerWidget(),
          ),
          CustomSizedBox.space8H,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ...List.generate(
                    order.orderDetails!.length,
                    (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductDetailsWidget(
                          orderDetails: order.orderDetails![index],
                          index: index,
                          tagForReturnCancel: tagForReturnCancel,
                          tagBackgroundColor: tagBackgroundColor,
                          text: tagTitle,
                        ))),
                CustomSizedBox.space12H
              ],
            ),
          ),
          const Divider(
            color: AppColors.kborderColor,
            thickness: 2,
            height: 2,
          ),
          CustomButton(
            label: 'See Details',
            labelColor: Colors.white,
            marginVertical: 16,
            marginHorizontal: 16,
            onPressed: onPressed ??
                () async {
                  await UserController.to.getOrderDetailsCall(order.id!);
                  Get.toNamed(MyOrderDetailsScreen.routeName);
                },
          )
        ],
      ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  final int? index;
  final bool isDivider;
  final Color? tagBackgroundColor;
  final bool needCheckbox;
  final bool tagForReturnCancel;
  final String? text;
  final List<OrderDetails> orderDetails;
  const ProductDetailsWidget({
    super.key,
    this.index,
    this.isDivider = true,
    this.needCheckbox = false,
    this.tagForReturnCancel = false,
    this.text,
    this.tagBackgroundColor,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        globalLogger.d(orderDetails.first.toJson());
        if (orderDetails.first.combo == null)
          await HomeApiController.to.productDetailsCall(orderDetails.first.productId!);
        else {
          await ProductDetailsController.to.getComboDetails(orderDetails.first.combo!.id!);
          Get.toNamed(ComboDetailsScreen.routeName);
        }
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              needCheckbox
                  ? Obx(() {
                      return GestureDetector(
                        onTap: () async {
                          ProfileController.to.checked[index!] = !ProfileController.to.checked[index!];
                        },
                        child: Container(
                          height: 18,
                          width: 18,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: ProfileController.to.checked[index!] ? AppColors.kPrimaryColor : Colors.white,
                              border: Border.all(width: 0.5, color: ProfileController.to.checked[index!] ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                          alignment: Alignment.center,
                          child: ProfileController.to.checked[index!]
                              ? const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 15,
                                )
                              : const SizedBox.shrink(),
                        ),
                      );
                    })
                  : const SizedBox.shrink(),
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColors.kborderColor, width: .5)),
                  child: CustomNetworkImage(
                    networkImagePath: orderDetails.first.productImage ?? '',
                    errorImagePath: AssetsConstant.megaDeals2,
                    height: 100,
                    width: 90,
                    borderRadius: 4,
                    fit: BoxFit.contain,
                  )),
              CustomSizedBox.space12W,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            orderDetails.first.comboId!.isNotEmpty ? orderDetails.first.combo!.name ?? '' : orderDetails.first.productName ?? '',
                            style: AppTheme.textStyleMediumBlack14,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (orderDetails.first.buyGetId!.isNotEmpty || orderDetails.first.comboId!.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: orderDetails.first.buyGetId!.isNotEmpty ? const Color(0xfff25c9b).withOpacity(.1) : AppColors.kDarkPrimaryColor.withOpacity(.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              orderDetails.first.buyGetId!.isNotEmpty ? '(Buy Get)' : '(Combo)',
                              style: TextStyle(
                                color: orderDetails.first.buyGetId!.isNotEmpty ? const Color(0xfff25c9b) : AppColors.kDarkPrimaryColor,
                                fontSize: 12,
                              ),
                            ),
                          )
                      ],
                    ),
                    CustomSizedBox.space4H,
                    if (orderDetails.first.comboId!.isNotEmpty)
                      ...orderDetails
                          .map(
                            (e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.productName ?? '',
                                  style: AppTheme.textStyleMediumBlack14,
                                  textAlign: TextAlign.left,
                                ),
                                CustomSizedBox.space4H,
                                RichText(
                                  text: TextSpan(text: e.size!.isNotEmpty ? 'Size: ' : 'Shade: ', style: AppTheme.textStyleNormalBlack14, children: [
                                    TextSpan(
                                      text: e.size!.isNotEmpty ? e.size ?? '' : e.shade ?? '',
                                      style: AppTheme.textStyleBoldBlack14,
                                    )
                                  ]),
                                ),
                                CustomSizedBox.space4H,
                              ],
                            ),
                          )
                          .toList(),
                    if (orderDetails.first.comboId!.isEmpty) ...[
                      Row(
                        children: [
                          /// check:// Brand data is not available in the response

                          // RichText(
                          //   text: const TextSpan(text: 'Brand: ', style: AppTheme.textStyleNormalBlack14, children: [
                          //     TextSpan(
                          //       text: 'Lakme',
                          //       style: AppTheme.textStyleBoldBlack14,
                          //     )
                          //   ]),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: Container(
                          //     color: Colors.black.withOpacity(.2),
                          //     height: 15,
                          //     width: 1,
                          //   ),
                          // ),
                          RichText(
                            text: TextSpan(text: orderDetails.first.size!.isNotEmpty ? 'Size: ' : 'Shade: ', style: AppTheme.textStyleNormalBlack14, children: [
                              TextSpan(
                                text: orderDetails.first.size!.isNotEmpty ? orderDetails.first.size ?? '' : orderDetails.first.shade ?? '',
                                style: AppTheme.textStyleBoldBlack14,
                              )
                            ]),
                          ),
                        ],
                      ),
                      CustomSizedBox.space8H,
                    ],
                    if (orderDetails.first.buyGetId!.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // color: AppColors.kOfferButtonColor.withOpacity(.1),
                          border: Border.all(color: AppColors.kOfferButtonColor, width: .1),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    orderDetails.last.productName ?? '',
                                    style: AppTheme.textStyleMediumBlack14,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            CustomSizedBox.space4H,
                            RichText(
                              text: TextSpan(text: orderDetails.last.size!.isNotEmpty ? 'Size: ' : 'Shade: ', style: AppTheme.textStyleNormalBlack14, children: [
                                TextSpan(
                                  text: orderDetails.last.size!.isNotEmpty ? orderDetails.last.size ?? '' : orderDetails.last.shade ?? '',
                                  style: AppTheme.textStyleBoldBlack14,
                                )
                              ]),
                            ),
                            CustomSizedBox.space4H,
                          ],
                        ),
                      ),
                    CustomSizedBox.space4H,
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(text: 'Qty: ', style: AppTheme.textStyleNormalBlack14, children: [
                            TextSpan(
                              text: orderDetails.first.quantity ?? '1',
                              style: AppTheme.textStyleBoldBlack14,
                            )
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            color: Colors.black.withOpacity(.2),
                            height: 15,
                            width: 1,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Amount: ',
                            style: AppTheme.textStyleNormalBlack14,
                            children: [
                              TextSpan(
                                text:
                                    '৳${orderDetails.first.comboId!.isNotEmpty ? orderDetails.map((e) => e.discountedPrice!.toDouble()).toList().sum.toStringAsFixed(2) : orderDetails.first.discountedPrice!.toDouble().toStringAsFixed(2)}',
                                style: AppTheme.textStyleBoldBlack14,
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        tagForReturnCancel
                            ? Container(
                                decoration: BoxDecoration(color: tagBackgroundColor, borderRadius: BorderRadius.circular(4)),
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                child: Text(
                                  text ?? 'Returned',
                                  style: AppTheme.textStyleMediumBlack10,
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                    CustomSizedBox.space12H,
                  ],
                ),
              ),
            ],
          ),
          !isDivider ? const SizedBox.shrink() : CustomSizedBox.space12H,
          !isDivider
              ? const SizedBox.shrink()
              : const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.kborderColor,
                ),
        ],
      ),
    );
  }
}

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.kborderColor,
    );
  }
}
