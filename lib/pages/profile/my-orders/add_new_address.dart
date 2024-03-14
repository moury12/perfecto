import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../models/address_model.dart';

class AddNewAddressScreen extends StatelessWidget {
  static const String routeName = '/add_address';
  const AddNewAddressScreen({
    super.key,
    /* this.addressModel*/
  });

  // final AddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AddressController());
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
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CheckoutWidget(
                title: 'Add New Address',
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
                                    child: controller.cityStatus.isLoading ? SizedBox(height: 20, width: 20, child: const CircularProgressIndicator()) : const SizedBox.shrink()),
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
                                    child: controller.zoneStatus.isLoading ? SizedBox(height: 20, width: 20, child: const CircularProgressIndicator()) : const SizedBox.shrink()),
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
                                    child: controller.areaStatus.isLoading ? SizedBox(height: 20, width: 20, child: const CircularProgressIndicator()) : const SizedBox.shrink()),
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
                                  AddressController.to.sameAddress.value = !AddressController.to.sameAddress.value;
                                },
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: AddressController.to.sameAddress.value ? AppColors.kPrimaryColor : Colors.white,
                                      border: Border.all(width: 0.5, color: AddressController.to.sameAddress.value ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                                  alignment: Alignment.center,
                                  child: AddressController.to.sameAddress.value
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
                              'Set as default shipping address',
                              style: AppTheme.textStyleMediumBlack12,
                            )
                          ],
                        ),
                      ),
                      CustomButton(
                        label: 'Save',
                        onPressed: () {
                          if (AddressController.to.nameController.text.length >= 3 &&
                              AddressController.to.nameController.text.isNotEmpty &&
                              AddressController.to.phoneController.text.length >= 11 &&
                              AddressController.to.phoneController.text.isNotEmpty &&
                              AddressController.to.addressController.text.isNotEmpty &&
                              AddressController.to.addressController.text.length >= 3 &&
                              AddressController.to.nameController.text.isNotEmpty &&
                              AddressController.to.selectedArea.value.isNotEmpty &&
                              AddressController.to.selectedCity.value.isNotEmpty) {
                            if (AddressController.to.isAddNew.value) {
                              AddressController.to.addAddressRequest(
                                  AddressController.to.nameController.text,
                                  AddressController.to.phoneController.text,
                                  AddressController.to.emailController.text,
                                  AddressController.to.selectedCity.value,
                                  AddressController.to.cityList.firstWhere((element) => element.cityId == AddressController.to.selectedCity.value).cityName!,
                                  AddressController.to.selectedZone.value,
                                  AddressController.to.zoneList.firstWhere((element) => element.zoneId == AddressController.to.selectedZone.value).zoneName!,
                                  AddressController.to.selectedArea.value,
                                  AddressController.to.areaList.firstWhere((element) => element.areaId == AddressController.to.selectedArea.value).areaName!,
                                  AddressController.to.addressController.text,
                                  AddressController.to.sameAddress.value ? '1' : '0');
                              globalLogger.d('Add new Address');
                            } else {
                              AddressController.to.updateAddressRequest(
                                  name: AddressController.to.nameController.text,
                                  phone: AddressController.to.phoneController.text,
                                  email: AddressController.to.emailController.text,
                                  cityId: AddressController.to.selectedArea.value,
                                  cityName: AddressController.to.cityList.firstWhere((element) => element.cityId == AddressController.to.selectedCity.value).cityName!,
                                  zoneId: AddressController.to.selectedZone.value,
                                  zoneName: AddressController.to.zoneList.firstWhere((element) => element.zoneId == AddressController.to.selectedZone.value).zoneName!,
                                  areaId: AddressController.to.selectedArea.value,
                                  areaName: AddressController.to.areaList.firstWhere((element) => element.areaId == AddressController.to.selectedArea.value).areaName!,
                                  address: AddressController.to.addressController.text,
                                  status: AddressController.to.sameAddress.value ? '1' : '0',
                                  addressId: AddressController.to.address.value.id!);
                            }
                          } else {
                            if (AddressController.to.addressController.text.isEmpty) {
                              AddressController.to.errorAddress.value = 'Enter An address';
                            }
                            if (AddressController.to.addressController.text.length < 3) {
                              AddressController.to.errorAddress.value = 'Enter minimum 3 character of your !';
                            }
                            if (AddressController.to.nameController.text.isEmpty) {
                              AddressController.to.errorName.value = 'Enter A name';
                            }
                            if (AddressController.to.nameController.text.length < 3) {
                              AddressController.to.errorName.value = 'Enter minimum 3 character of your name!';
                            }
                            if (AddressController.to.phoneController.text.isEmpty) {
                              AddressController.to.errorPhone.value = 'Enter A phone number';
                            }
                            if (AddressController.to.phoneController.text.length < 11) {
                              AddressController.to.errorPhone.value = 'Enter a valid phone number!';
                            }
                            if (AddressController.to.selectedCity.value.isEmpty) {
                              showSnackBar(msg: 'Please select a City');
                            }
                            if (AddressController.to.selectedZone.value.isEmpty) {
                              showSnackBar(msg: 'Please select a Zone');
                            }
                            if (AddressController.to.selectedArea.value.isEmpty) {
                              showSnackBar(msg: 'Please select an Area');
                            }
                          }
                        },
                        marginVertical: 12,
                      ),
                    ],
                  );
                }),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
