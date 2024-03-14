import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/my-cart/cart_controller.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';
import 'package:perfecto/pages/profile/my_address_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';
import 'package:perfecto/utils.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  const CheckoutScreen({super.key});

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
                  'Checkout',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
              ],
            ),
            isSearchInclude: false,
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomSizedBox.space8H,
              CheckoutWidget(
                action: Obx(() => AddressController.to.addressList.length > 1
                    ? GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(color: AppColors.kPrimaryColor, borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            'Change form address book',
                            style: AppTheme.textStyleMediumFadeBlack16,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(MyAddressScreen.routeName);
                        },
                      )
                    : const SizedBox.shrink()),
                widget: Obx(() {
                  return Column(
                    children: [
                      CustomTextField(
                        marginVertical: 6,
                        hintText: 'Enter your full name',
                        labelText: 'Full Name',
                        isRequired: true,
                        focusColor: Colors.black,
                        errorMessage: AddressController.to.errorName.value!.isEmpty ? null : AddressController.to.errorName.value,
                        controller: AddressController.to.nameController,
                        onChanged: (value) {
                          if (value.isNotEmpty && value.length >= 3) {
                            AddressController.to.errorName.value = '';
                          } else {
                            if (value.isEmpty) {
                              AddressController.to.errorName.value = 'Enter a name';
                            } else if (value.length < 3) {
                              AddressController.to.errorName.value = 'Enter minimum 3 character of your name!';
                            }
                          }
                        },
                        onSubmitted: (p0) {
                          if (AddressController.to.nameController.text.isEmpty) {
                            AddressController.to.errorName.value = 'Enter A name';
                          } else if (AddressController.to.nameController.text.length < 3) {
                            AddressController.to.errorName.value = 'Enter minimum 3 character of your name!';
                          }
                        },
                      ),
                      CustomTextField(
                        marginVertical: 6,
                        hintText: 'Enter phone number',
                        labelText: 'Phone',
                        isRequired: true,
                        focusColor: Colors.black,
                        errorMessage: AddressController.to.errorPhone.value!.isEmpty ? null : AddressController.to.errorPhone.value,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          if (value.isNotEmpty && value.isPhoneNumber) {
                            AddressController.to.errorPhone.value = '';
                          } else {
                            if (value.isEmpty) {
                              AddressController.to.errorPhone.value = 'Enter a phone number';
                            } else if (value.length < 3) {
                              AddressController.to.errorPhone.value = 'Enter a valid phone number!';
                            }
                          }
                        },
                        onSubmitted: (p0) {
                          if (AddressController.to.phoneController.text.isEmpty) {
                            AddressController.to.errorPhone.value = 'Enter A phone number';
                          } else if (!AddressController.to.phoneController.text.isPhoneNumber) {
                            AddressController.to.errorPhone.value = 'Enter a valid phone number!';
                          }
                        },
                        controller: AddressController.to.phoneController,
                      ),
                      CustomTextField(
                        marginVertical: 6,
                        hintText: 'Enter your email',
                        labelText: 'Email (Optional)',
                        focusColor: Colors.black,
                        controller: AddressController.to.emailController,
                      ),
                      GetBuilder(builder: (AddressController controller) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                TitleDropdown(
                                  dwItems: controller.cityList,
                                  dwValue: controller.selectedCity.value.isEmpty ? null : controller.selectedCity.value,
                                  type: DropdownListType.object,
                                  onChange: (v) async {
                                    if (controller.selectedCity.value != v) {
                                      controller.selectedZone.value = '';
                                      controller.selectedArea.value = '';
                                      controller.selectedCity.value = v;
                                      controller.update();
                                      //TODO://
                                      await controller.getZoneAreaData(v, 'zone');

                                      controller.update();
                                    }
                                    globalLogger.d(controller.selectedCity.value);
                                  },
                                  fillColor: AppColors.kborderColor,
                                  hintText: 'Select your city name',
                                  valueKey: 'city_id',
                                  viewKey: 'city_name',
                                  title: 'City',
                                  rightIconBgColor: Colors.transparent,
                                ),
                                Positioned(
                                    top: 10,
                                    right: 16,
                                    child: controller.cityStatus.isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()) : const SizedBox.shrink()),
                              ],
                            ),
                            Stack(
                              children: [
                                TitleDropdown(
                                  dwItems: controller.zoneList,
                                  dwValue: controller.selectedZone.value.isEmpty || controller.zoneStatus.isLoading ? null : controller.selectedZone.value,
                                  type: DropdownListType.object,
                                  onChange: (v) async {
                                    if (controller.selectedZone.value != v) {
                                      controller.selectedArea.value = '';
                                      controller.selectedZone.value = v;
                                      controller.update();
                                      //TODO://
                                      await controller.getZoneAreaData(v, 'area');
                                      controller.update();
                                    }
                                    globalLogger.d(controller.selectedCity.value);
                                  },
                                  fillColor: AppColors.kborderColor,
                                  hintText: 'Select your zone name',
                                  valueKey: 'zone_id',
                                  viewKey: 'zone_name',
                                  title: 'Zone',
                                  rightIconBgColor: Colors.transparent,
                                ),
                                Positioned(
                                    top: 10,
                                    right: 16,
                                    child: controller.zoneStatus.isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()) : const SizedBox.shrink()),
                              ],
                            ),
                            Stack(
                              children: [
                                TitleDropdown(
                                  dwItems: controller.areaList,
                                  dwValue: controller.selectedArea.value.isEmpty || controller.areaStatus.isLoading ? null : controller.selectedArea.value,
                                  type: DropdownListType.object,
                                  onChange: (v) {
                                    controller.selectedArea.value = v;
                                    controller.update();
                                  },
                                  fillColor: AppColors.kborderColor,
                                  hintText: 'Select your zone name',
                                  valueKey: 'area_id',
                                  viewKey: 'area_name',
                                  title: 'Area',
                                  rightIconBgColor: Colors.transparent,
                                ),
                                Positioned(
                                    top: 10,
                                    right: 16,
                                    child: controller.areaStatus.isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()) : const SizedBox.shrink()),
                              ],
                            ),
                          ],
                        );
                      }),
                      // Obx(() {
                      //   // final _areas = AddressController.to.areaList.isNotEmpty ? AddressController.to.areaList : [];
                      //   return TitleDropdown(
                      //     dwItems: AddressController.to.zoneList,
                      //     dwValue: AddressController.to.selectedZone.value.isEmpty ? null : AddressController.to.selectedZone.value,
                      //     type: DropdownListType.object,
                      //     onChange: (v) {
                      //       AddressController.to.selectedZone.value = v;
                      //     },
                      //     fillColor: AppColors.kborderColor,
                      //     hintText: 'Select your zone name',
                      //     valueKey: 'zone_id',
                      //     viewKey: 'zone_name',
                      //     title: 'Zone',
                      //     rightIconBgColor: Colors.transparent,
                      //   );
                      // }),
                      CustomTextField(
                        marginVertical: 6,
                        hintText: 'Enter your Address',
                        labelText: 'Address',
                        isRequired: true,
                        focusColor: Colors.black,
                        errorMessage: AddressController.to.errorAddress.value!.isEmpty ? null : AddressController.to.errorAddress.value,
                        controller: AddressController.to.addressController,
                        onChanged: (value) {
                          if (value.isNotEmpty && value.length >= 3) {
                            AddressController.to.errorAddress.value = '';
                          } else {
                            if (value.isEmpty) {
                              AddressController.to.errorAddress.value = 'Enter a name';
                            } else if (value.length < 3) {
                              AddressController.to.errorAddress.value = 'Enter minimum 3 character of your name!';
                            }
                          }
                        },
                        onSubmitted: (p0) {
                          if (AddressController.to.addressController.text.isEmpty) {
                            AddressController.to.errorAddress.value = 'Enter An address';
                          } else if (AddressController.to.addressController.text.length < 3) {
                            AddressController.to.errorAddress.value = 'Enter minimum 3 character of your Address!';
                          }
                        },
                      ),
                      CustomSizedBox.space8H,

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 16),
                        child: Row(
                          children: [
                            Obx(() {
                              return GestureDetector(
                                onTap: () {
                                  CheckOutController.to.checked.value = !CheckOutController.to.checked.value;
                                },
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: CheckOutController.to.checked.value ? AppColors.kPrimaryColor : Colors.white,
                                      border: Border.all(width: 0.5, color: CheckOutController.to.checked.value ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                                  alignment: Alignment.center,
                                  child: CheckOutController.to.checked.value
                                      ? const Icon(
                                          Icons.check_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              );
                            }),
                            CustomSizedBox.space8W,
                            const Text(
                              'Save this information for next time',
                              style: AppTheme.textStyleMediumBlack12,
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
              ),
              CustomSizedBox.space8H,
              CheckoutWidget(
                widget: Column(
                  children: [
                    CustomSizedBox.space8H,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        final cityName = AddressController.to.cityList.firstWhere((element) => element.cityId == AddressController.to.selectedCity.value).cityName!.toLowerCase();
                        return Row(
                          children: [
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: cityName == 'dhaka' ? AppColors.kPrimaryColor : Colors.white,
                                  border: Border.all(width: 1, color: cityName == 'dhaka' ? AppColors.kPrimaryColor : Colors.black)),
                              alignment: Alignment.center,
                              child: cityName == 'dhaka'
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            CustomSizedBox.space12W,
                            Text(
                              'Inside Dhaka (Delivery charge: ৳ 60)',
                              style: cityName == 'dhaka' ? AppTheme.textStyleSemiBoldBlack14 : AppTheme.textStyleNormalBlack14,
                            )
                          ],
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        final cityName = AddressController.to.cityList.firstWhere((element) => element.cityId == AddressController.to.selectedCity.value).cityName!.toLowerCase();
                        return Row(
                          children: [
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: cityName != 'dhaka' ? AppColors.kPrimaryColor : Colors.white,
                                  border: Border.all(width: 1, color: cityName != 'dhaka' ? AppColors.kPrimaryColor : Colors.black)),
                              alignment: Alignment.center,
                              child: cityName != 'dhaka'
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            CustomSizedBox.space12W,
                            Text(
                              'Outside Dhaka (Delivery charge: ৳ 100)',
                              style: cityName != 'dhaka' ? AppTheme.textStyleSemiBoldBlack14 : AppTheme.textStyleNormalBlack14,
                            )
                          ],
                        );
                      }),
                    ),
                    CustomSizedBox.space12H
                  ],
                ),
                title: 'Choose Shipping Method',
              ),
              CustomSizedBox.space8H,
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                  child: const CustomTextField(
                    labelText: 'Order Notes (Optional)',
                    hintText: 'Enter order notes',
                    marginHorizontal: 16,
                    focusColor: Colors.black,
                    marginVertical: 12,
                  )),
              CustomSizedBox.space8H,
              CheckoutWidget(
                widget: Column(
                  children: [
                    CustomSizedBox.space8H,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                CheckOutController.to.paymentType.value = PaymentType.ssl;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CheckOutController.to.paymentType.value == PaymentType.ssl ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 1, color: CheckOutController.to.paymentType.value == PaymentType.ssl ? AppColors.kPrimaryColor : Colors.black)),
                                alignment: Alignment.center,
                                child: CheckOutController.to.paymentType.value == PaymentType.ssl
                                    ? const Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ),
                            CustomSizedBox.space12W,
                            const Flexible(
                              child: Column(
                                children: [
                                  Text(
                                    'Online payment via SslCommerz',
                                    style: AppTheme.textStyleMediumBlack16,
                                  ),
                                  Text(
                                    'The largest payment gateway aggregator in Bangladesh and a pioneer in the FinTech industry since 2010',
                                    style: AppTheme.textStyleNormalBlack10,
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Obx(() {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                CheckOutController.to.paymentType.value = PaymentType.cod;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CheckOutController.to.paymentType.value == PaymentType.cod ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 1, color: CheckOutController.to.paymentType.value == PaymentType.cod ? AppColors.kPrimaryColor : Colors.black)),
                                alignment: Alignment.center,
                                child: CheckOutController.to.paymentType.value == PaymentType.cod
                                    ? const Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ),
                            CustomSizedBox.space12W,
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash on delivery (COD)',
                                  style: AppTheme.textStyleMediumBlack16,
                                ),
                                Text(
                                  'Pay with cash upon delivery',
                                  style: AppTheme.textStyleNormalBlack10,
                                )
                              ],
                            )
                          ],
                        );
                      }),
                    ),
                    CustomSizedBox.space12H
                  ],
                ),
                title: 'Choose Payment Method',
              ),
              CustomSizedBox.space8H,
              CheckoutWidget(
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ...List.generate(
                          UserController.to.cartList.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      UserController.to.cartList[index].product?.name ??
                                          UserController.to.cartList[index].buyGetInfo?.productForBuy?.name ??
                                          UserController.to.cartList[index].comboProduct?.name ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.textStyleMediumBlack14,
                                    ),
                                    CustomSizedBox.space8H,
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(text: 'Qty: ', style: AppTheme.textStyleNormalBlack14, children: [
                                            TextSpan(
                                              text: UserController.to.cartList[index].quantity ?? '1',
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
                                          text: const TextSpan(text: 'Size: ', style: AppTheme.textStyleNormalBlack14, children: [
                                            TextSpan(
                                              text: '3.4ml',
                                              style: AppTheme.textStyleBoldBlack14,
                                            )
                                          ]),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          '৳ 1,450',
                                          style: AppTheme.textStyleBoldBlack14,
                                        )
                                      ],
                                    ),
                                    CustomSizedBox.space12H,
                                    const Divider(
                                      color: AppColors.kborderColor,
                                      thickness: 2,
                                      height: 2,
                                    ),
                                  ],
                                ),
                              )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                        child: Row(
                          children: [
                            Text(
                              'Items Subtotal',
                              style: AppTheme.textStyleMediumBlack14,
                            ),
                            Spacer(),
                            Text(
                              '৳ 1,450',
                              style: AppTheme.textStyleMediumBlack14,
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                        child: Row(
                          children: [
                            Text(
                              'Shipping Fee',
                              style: AppTheme.textStyleMediumBlack14,
                            ),
                            Spacer(),
                            Text(
                              '৳ 1,450',
                              style: AppTheme.textStyleMediumBlack14,
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: AppColors.kborderColor,
                          thickness: 2,
                          height: 2,
                        ),
                      ),
                      CustomSizedBox.space8H,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                        child: Row(
                          children: [
                            Text(
                              'Grand Total',
                              style: AppTheme.textStyleSemiBoldBlack16,
                            ),
                            Spacer(),
                            Text(
                              '৳ 1,450',
                              style: AppTheme.textStyleSemiBoldBlack16,
                            )
                          ],
                        ),
                      ),
                      CustomSizedBox.space8H,
                    ],
                  ),
                ),
                title: 'Your Order Summary',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  children: [
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          CheckOutController.to.checked.value = !CheckOutController.to.checked.value;
                        },
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: CheckOutController.to.checked.value ? AppColors.kPrimaryColor : Colors.white,
                              border: Border.all(width: 0.5, color: CheckOutController.to.checked.value ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                          alignment: Alignment.center,
                          child: CheckOutController.to.checked.value
                              ? const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 15,
                                )
                              : const SizedBox.shrink(),
                        ),
                      );
                    }),
                    CustomSizedBox.space8W,
                    RichText(
                      text: const TextSpan(text: 'I’ve read and accept the ', style: AppTheme.textStyleNormalBlack12, children: [
                        TextSpan(
                          text: 'T&Cs ',
                          style: AppTheme.textStyleBoldBlack12,
                        ),
                        TextSpan(
                          text: 'and ',
                          style: AppTheme.textStyleNormalBlack12,
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTheme.textStyleBoldBlack12,
                        ),
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 4)]),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Grand total',
                  style: AppTheme.textStyleMediumBlack12,
                ),
                Text(
                  '৳ 1,450',
                  style: AppTheme.textStyleBoldBlack20,
                )
              ],
            ),
            CustomButton(
              primary: AppColors.kPrimaryColor,
              marginHorizontal: 0,
              marginVertical: 0,
              width: 200,
              height: 50,
              onPressed: () {
                // CartController.to.isbagEmpty.value=true;
                Get.toNamed(CheckoutScreen.routeName);
              },
              label: 'Place Order',
            )
          ],
        ),
      ),
    );
  }
}

class CheckoutWidget extends StatelessWidget {
  final String? title;
  final Widget widget;
  final Widget? action;
  const CheckoutWidget({
    super.key,
    this.title,
    required this.widget,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? 'Shipping Information',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                action ?? const SizedBox.shrink()
              ],
            ),
          ),
          const Divider(
            color: AppColors.kborderColor,
            thickness: 2,
            height: 2,
          ),
          widget
        ],
      ),
    );
  }
}
