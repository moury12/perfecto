import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/edit_my_address_page.dart';
import 'package:perfecto/pages/profile/my-orders/add_new_address.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MyAddressScreen extends GetView<AddressController> {
  static const String routeName = '/my_addresses';
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic controller = Get.put(AddressController());
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
                  'My Addresses',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space4W,
              ],
            ),
            isSearchInclude: false,
          ),
          CustomSizedBox.space12H,
          Expanded(child: Obx(() {
            return RefreshIndicator(
                onRefresh: () async {
                  controller.getAddressCall(Get.previousRoute == CheckoutScreen.routeName);
                },
                child: controller.addressList.isEmpty
                    ? const Center(child: Text('There is no address'))
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.addressList.length,
                        itemBuilder: (context, index) {
                          final address = controller.addressList[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(border: Border.all(color: AppColors.kborderColor, width: .5), color: Colors.white, borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Address',
                                        style: AppTheme.textStyleSemiBoldBlack16,
                                      ),
                                      const Spacer(),
                                      CustomButton(
                                        marginVertical: 0,
                                        marginHorizontal: 0,
                                        onPressed: () {
                                          final controller = Get.put(AddressController());
                                          controller.editAddress(address);
                                          controller.getZoneAreaData(address.cityId, 'zone');
                                          controller.getZoneAreaData(address.zoneId, 'area');
                                          Get.to(const AddNewAddressScreen());
                                        },
                                        primary: Colors.white,
                                        borderColor: Colors.grey,
                                        isBorder: true,
                                        borderWidth: 1,
                                        boxShadowColor: Colors.transparent,
                                        elevation: 0,
                                        prefixImage: AssetsConstant.edit,
                                        prefixImageHeight: 18,
                                        height: 40,
                                        label: 'Edit',
                                        labelColor: Colors.black,
                                        width: 78,
                                      ),
                                      CustomSizedBox.space8W,
                                      CustomButton(
                                        marginVertical: 0,
                                        marginHorizontal: 0,
                                        onPressed: () {
                                          controller.deleteAddress(address.id);
                                        },
                                        primary: Colors.white,
                                        borderColor: Colors.grey,
                                        isBorder: true,
                                        borderWidth: 1,
                                        boxShadowColor: Colors.transparent,
                                        elevation: 0,
                                        prefixImage: AssetsConstant.deleteIcon,
                                        prefixImageHeight: 18,
                                        height: 40,
                                        label: '',
                                        labelColor: Colors.black,
                                        width: 50,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: AppColors.kborderColor,
                                  thickness: 2,
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                  child: Text(
                                    address.name ?? '-',
                                    textAlign: TextAlign.left,
                                    style: AppTheme.textStyleBoldBlack16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/call_my.png',
                                        height: 20,
                                      ),
                                      CustomSizedBox.space16W,
                                      Text(
                                        address.phone ?? '-',
                                        textAlign: TextAlign.left,
                                        style: AppTheme.textStyleBoldBlack14,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AssetsConstant.email,
                                        height: 20,
                                      ),
                                      CustomSizedBox.space16W,
                                      Text(
                                        address.email ?? '-',
                                        textAlign: TextAlign.left,
                                        style: AppTheme.textStyleBoldBlack14,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AssetsConstant.locationAddress,
                                        height: 20,
                                      ),
                                      CustomSizedBox.space16W,
                                      Flexible(
                                        child: Text(
                                          '${address.areaName ?? ''}, ${address.zoneName ?? ''}, ${address.cityName ?? ''}',
                                          textAlign: TextAlign.left,
                                          style: AppTheme.textStyleBoldBlack14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                  child: Divider(
                                    color: AppColors.kborderColor,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (address.status == '1') {
                                            showSnackBar(msg: 'Please Check Another Address to Set as Default');
                                          } else {
                                            controller.updateAddressRequest(
                                              name: address.name,
                                              phone: address.phone,
                                              email: address.email,
                                              cityId: address.cityId,
                                              cityName: address.cityName,
                                              zoneId: address.zoneId,
                                              zoneName: address.zoneName,
                                              areaId: address.areaId,
                                              areaName: address.areaName,
                                              address: address.address,
                                              status: '1',
                                              addressId: address.id!,
                                              fromEdit: false,
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2),
                                              color: address.status == '1' ? AppColors.kPrimaryColor : Colors.white,
                                              border: Border.all(width: 0.5, color: address.status == '1' ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                                          alignment: Alignment.center,
                                          child: address.status == '1'
                                              ? const Icon(
                                                  Icons.check_rounded,
                                                  color: Colors.white,
                                                  size: 15,
                                                )
                                              : const SizedBox.shrink(),
                                        ),
                                      ),
                                      CustomSizedBox.space12W,
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Set as default shipping address',
                                          style: AppTheme.textStyleNormalBlack12,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ));
          }))
        ],
      ),
      bottomNavigationBar: CustomButton(
        label: 'Add New Address',
        marginHorizontal: 16,
        onPressed: () {
          final controller = Get.put(AddressController());
          controller.clearAddress();
          Get.toNamed(AddNewAddressScreen.routeName);
        },
        marginVertical: 16,
      ),
    );
  }
}
