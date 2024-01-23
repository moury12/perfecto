import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/dropdown/custom_dropdown.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../models/address_model.dart';

class AddNewAddressScreen extends StatelessWidget {
  static const String routeName = '/add_address';
  const AddNewAddressScreen({super.key, this.addressModel});

  final AddressModel? addressModel;
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
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CheckoutWidget(
                title: 'Add New Address',
                widget: Column(
                  children: [
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter your full name',
                      labelText: 'Full Name',
                      isRequired: true,
                      focusColor: Colors.black,
                      errorMessage: controller.errorName.value!.isEmpty ? null : controller.errorName.value,
                      controller: controller.nameController,
                      onChanged: (value) {
                        if (value.isNotEmpty && value.length >= 3) {
                          controller.errorName.value = '';
                        } else {
                          if (value.isEmpty) {
                            controller.errorName.value = 'Enter a name';
                          } else if (value.length < 3) {
                            controller.errorName.value = 'Enter minimum 3 character of your name!';
                          }
                        }
                      },
                      onSubmitted: (p0) {
                        if (controller.nameController.text.isEmpty) {
                          controller.errorName.value = 'Enter A name';
                        } else if (controller.nameController.text.length < 3) {
                          controller.errorName.value = 'Enter minimum 3 character of your name!';
                        }
                      },
                    ),
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter phone number',
                      labelText: 'Phone',
                      isRequired: true,
                      focusColor: Colors.black,
                      errorMessage: controller.errorPhone.value!.isEmpty ? null : controller.errorPhone.value,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        if (value.isNotEmpty && value.isPhoneNumber) {
                          controller.errorPhone.value = '';
                        } else {
                          if (value.isEmpty) {
                            controller.errorPhone.value = 'Enter a phone number';
                          } else if (value.length < 3) {
                            controller.errorPhone.value = 'Enter a valid phone number!';
                          }
                        }
                      },
                      onSubmitted: (p0) {
                        if (controller.phoneController.text.isEmpty) {
                          controller.errorPhone.value = 'Enter A phone number';
                        } else if (!controller.phoneController.text.isPhoneNumber) {
                          controller.errorPhone.value = 'Enter a valid phone number!';
                        }
                      },
                      controller: controller.phoneController,
                    ),
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter your email',
                      labelText: 'Email (Optional)',
                      focusColor: Colors.black,
                      // errorMessage: controller.errorEmail.value!.isEmpty?null:controller.errorEmail.value,
                      // focusNode: controller.emailFocusNode,
                      // onChanged: (value) {
                      //   if (value.isNotEmpty && value.isEmail) {
                      //     controller.errorEmail.value = '';
                      //   } else {
                      //     if (value.isEmpty) {
                      //       controller.errorEmail.value =
                      //       'Enter a email address';
                      //     } else if (!value.isEmail) {
                      //       controller.errorEmail.value =
                      //       'Enter a valid email address!';
                      //     }
                      //   }
                      // },
                      // onSubmitted: (p0) {
                      //   if (controller.emailController.text.isEmpty) {
                      //     controller.errorEmail.value =
                      //     'Enter an email address';
                      //   } else if (!controller.emailController.text.isEmail) {
                      //     controller.errorEmail.value =
                      //     'Enter a valid email address!';
                      //   } else {
                      //     controller.emailFocusNode.unfocus();
                      //   }
                      // },
                      controller: controller.emailController,
                    ),
                    Obx(() {
                      return TitleDropdown(
                        dwItems: controller.districtList,
                        dwValue: controller.selectedDistrict.value!.isEmpty ? null : controller.selectedDistrict.value,
                        type: DropdownListType.object,
                        onChange: (v) async {
                          if (controller.selectedDistrict.value != v) {
                            controller.selectedArea.value = '';
                            controller.selectedDistrict.value = v;
                            await controller.getAreaData(v);
                          }
                          globalLogger.d(controller.selectedDistrict.value);
                        },
                        fillColor: AppColors.kborderColor,
                        hintText: 'Select your district',
                        valueKey: 'id',
                        viewKey: 'name',
                        title: 'District / State',
                        rightIconBgColor: Colors.transparent,
                      );
                    }),
                    Obx(() {
                      // final _areas = controller.areaList.isNotEmpty ? controller.areaList : [];
                      return TitleDropdown(
                        dwItems: controller.areaList,
                        dwValue: controller.selectedArea.value!.isEmpty ? null : controller.selectedArea.value,
                        type: DropdownListType.object,
                        onChange: (v) {
                          controller.selectedArea.value = v;
                        },
                        fillColor: AppColors.kborderColor,
                        hintText: 'Select your city name',
                        valueKey: 'id',
                        viewKey: 'name',
                        title: 'City',
                        rightIconBgColor: Colors.transparent,
                      );
                    }),
                    CustomTextField(
                      marginVertical: 6,
                      hintText: 'Enter your Address',
                      labelText: 'Address',
                      isRequired: true,
                      focusColor: Colors.black,
                      errorMessage: controller.errorAddress.value!.isEmpty ? null : controller.errorAddress.value,
                      controller: controller.addressController,
                      onChanged: (value) {
                        if (value.isNotEmpty && value.length >= 3) {
                          controller.errorAddress.value = '';
                        } else {
                          if (value.isEmpty) {
                            controller.errorAddress.value = 'Enter a name';
                          } else if (value.length < 3) {
                            controller.errorAddress.value = 'Enter minimum 3 character of your name!';
                          }
                        }
                      },
                      onSubmitted: (p0) {
                        if (controller.addressController.text.isEmpty) {
                          controller.errorAddress.value = 'Enter An address';
                        } else if (controller.addressController.text.length < 3) {
                          controller.errorAddress.value = 'Enter minimum 3 character of your Address!';
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
                                controller.sameAddress.value = !controller.sameAddress.value;
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: controller.sameAddress.value ? AppColors.kPrimaryColor : Colors.white,
                                    border: Border.all(width: 0.5, color: controller.sameAddress.value ? AppColors.kDarkPrimaryColor : Colors.black.withOpacity(.25))),
                                alignment: Alignment.center,
                                child: controller.sameAddress.value
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
                        if (controller.nameController.text.length >= 3 &&
                            controller.nameController.text.isNotEmpty &&
                            controller.phoneController.text.isPhoneNumber &&
                            controller.phoneController.text.isNotEmpty &&
                            controller.addressController.text.length >= 3 &&
                            controller.nameController.text.isNotEmpty &&
                            controller.selectedArea.value!.isNotEmpty &&
                            controller.selectedDistrict.value!.isNotEmpty) {
                        } else {
                          if (controller.addressController.text.isEmpty) {
                            controller.error.value = 'Enter An address';
                          }
                          if (controller.addressController.text.length < 3) {
                            controller.error.value = 'Enter minimum 3 character of your !';
                          }
                          if (controller.nameController.text.isEmpty) {
                            controller.errorName.value = 'Enter A name';
                          }
                          if (controller.nameController.text.length < 3) {
                            controller.errorName.value = 'Enter minimum 3 character of your name!';
                          }
                          if (controller.phoneController.text.isEmpty) {
                            controller.errorPhone.value = 'Enter A phone number';
                          }
                          if (!controller.phoneController.text.isPhoneNumber) {
                            controller.errorPhone.value = 'Enter a valid phone number!';
                          }
                          if (controller.selectedDistrict.value!.isEmpty) {
                            showSnackBar(msg: 'Please select a District');
                          }
                          if (controller.selectedArea.value!.isEmpty) {
                            showSnackBar(msg: 'Please select an Area');
                          }
                        }
                      },
                      marginVertical: 12,
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
