import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class AddNewAddressScreen extends StatelessWidget {
  static const String routeName ='/add_address';
  const AddNewAddressScreen({super.key});

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
                'My Addresses',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              CustomSizedBox.space4W,

            ],
          ),
          isSearchInclude: false,
        ),CustomSizedBox.space12H,
        Expanded(child: ListView(padding: EdgeInsets.zero,
          children: [
            CheckoutWidget( title: 'Add New Address',
              widget: Column(
                children: [
                  CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter your full name',
                    labelText: 'Full Name',
                    isRequired: true,
                    focusColor: Colors.black,
                    errorMessage: UserController.to.errorAddNewName.value!.isEmpty?null:UserController.to.errorAddNewName.value,
                    controller: UserController.to.nameAddNewAddressController,
                    onChanged: (value) {
                      if (value.isNotEmpty && value.length >= 3) {
                        UserController.to.errorAddNewName.value = '';
                      } else {
                        if (value.isEmpty) {
                          UserController.to.errorAddNewName.value = 'Enter a name';
                        } else if (value.length < 3) {
                          UserController.to.errorAddNewName.value =
                          'Enter minimum 3 character of your name!';
                        }
                      }
                    },
                    onSubmitted: (p0) {
                      if (UserController.to.nameAddNewAddressController.text.isEmpty) {
                        UserController.to.errorAddNewName.value = 'Enter A name';
                      } else if (UserController.to.nameAddNewAddressController.text.length <
                          3) {
                        UserController.to.errorAddNewName.value =
                        'Enter minimum 3 character of your name!';
                      }
                    },
                  ),
                  CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter phone number',
                    labelText: 'Phone',
                    isRequired: true,
                    focusColor: Colors.black,
                    errorMessage: UserController.to.errorAddNewPhone.value!.isEmpty?null:UserController.to.errorAddNewPhone.value,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      if (value.isNotEmpty && value.isPhoneNumber) {
                        UserController.to.errorAddNewPhone.value = '';
                      } else {
                        if (value.isEmpty) {
                          UserController.to.errorAddNewPhone.value =
                          'Enter a phone number';
                        } else if (value.length < 3) {
                          UserController.to.errorAddNewPhone.value =
                          'Enter a valid phone number!';
                        }
                      }
                    },
                    onSubmitted: (p0) {
                      if (UserController.to.phoneAddNewAddressController.text.isEmpty) {
                        UserController.to.errorAddNewPhone.value = 'Enter A phone number';
                      } else if (!UserController.to.phoneAddNewAddressController.text.isPhoneNumber) {
                        UserController.to.errorAddNewPhone.value =
                        'Enter a valid phone number!';
                      }
                    },
                    controller: UserController.to.phoneAddNewAddressController,
                  ),
                  CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter your email',
                    labelText: 'Email (Optional)',
                    focusColor: Colors.black,
                    // errorMessage: UserController.to.errorAddNewEmail.value!.isEmpty?null:UserController.to.errorAddNewEmail.value,
                    // focusNode: UserController.to.emailFocusNode,
                    // onChanged: (value) {
                    //   if (value.isNotEmpty && value.isEmail) {
                    //     UserController.to.errorAddNewEmail.value = '';
                    //   } else {
                    //     if (value.isEmpty) {
                    //       UserController.to.errorAddNewEmail.value =
                    //       'Enter a email address';
                    //     } else if (!value.isEmail) {
                    //       UserController.to.errorAddNewEmail.value =
                    //       'Enter a valid email address!';
                    //     }
                    //   }
                    // },
                    // onSubmitted: (p0) {
                    //   if (UserController.to.emailAddNewAddressController.text.isEmpty) {
                    //     UserController.to.errorAddNewEmail.value =
                    //     'Enter an email address';
                    //   } else if (!UserController.to.emailAddNewAddressController.text.isEmail) {
                    //     UserController.to.errorAddNewEmail.value =
                    //     'Enter a valid email address!';
                    //   } else {
                    //     UserController.to.emailFocusNode.unfocus();
                    //   }
                    // },
                    controller: UserController.to.emailAddNewAddressController,
                  ),
                  Obx(
                          () {
                        return TitleDropdown(dwItems: UserController.to.districtList,
                          dwValue: UserController.to.selectedDistrict.value!.isEmpty?null:UserController.to.selectedDistrict.value,
                          type: DropdownListType.object,
                          onChange: (v){
                            UserController.to.selectedDistrict.value=v;
                          },
                          fillColor: AppColors.kborderColor,
                          hintText:'Select your district' ,
                          valueKey: 'id',viewKey: 'name',
                          title:'District / State' ,
                          rightIconBgColor: Colors.transparent,

                        );
                      }
                  ),Obx(
                          () {
                        return TitleDropdown(dwItems: UserController.to.areaList,
                          dwValue: UserController.to.selectedArea.value!.isEmpty?null:UserController.to.selectedArea.value,
                          type: DropdownListType.object,
                          onChange: (v){
                            UserController.to.selectedArea.value=v;
                          },
                          fillColor: AppColors.kborderColor,
                          hintText:'Select your city name' ,
                          valueKey: 'id',viewKey: 'name',
                          title:'City' ,
                          rightIconBgColor: Colors.transparent,

                        );
                      }
                  ),
                  CustomTextField(
                    marginVertical: 6,
                    hintText: 'Enter your Address',
                    labelText: 'Address',
                    isRequired: true,
                    focusColor: Colors.black,
                    errorMessage: UserController.to.errorAddNewAddress.value!.isEmpty?null:UserController.to.errorAddNewAddress.value,
                    controller: UserController.to.addressAddNewAddressController,
                    onChanged: (value) {
                      if (value.isNotEmpty && value.length >= 3) {
                        UserController.to.errorAddNewAddress.value = '';
                      } else {
                        if (value.isEmpty) {
                          UserController.to.errorAddNewAddress.value = 'Enter a name';
                        } else if (value.length < 3) {
                          UserController.to.errorAddNewAddress.value =
                          'Enter minimum 3 character of your name!';
                        }
                      }
                    },
                    onSubmitted: (p0) {
                      if (UserController.to.addressAddNewAddressController.text.isEmpty) {
                        UserController.to.errorAddNewAddress.value = 'Enter A name';
                      } else if (UserController.to.addressAddNewAddressController.text.length <
                          3) {
                        UserController.to.errorAddNewAddress.value =
                        'Enter minimum 3 character of your Address!';
                      }
                    },
                  ),
                  CustomSizedBox.space8H,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0)
                        .copyWith(bottom: 16),
                    child: Row(
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              ProfileController.to.sameAddress.value =
                              !ProfileController.to.sameAddress.value;
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: ProfileController.to.sameAddress.value
                                      ? AppColors.kPrimaryColor
                                      : Colors.white,
                                  border: Border.all(
                                      width: 0.5,
                                      color: ProfileController
                                          .to.sameAddress.value
                                          ? AppColors.kDarkPrimaryColor
                                          : Colors.black.withOpacity(.25))),
                              alignment: Alignment.center,
                              child: ProfileController.to.sameAddress.value
                                  ? Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 15,
                              )
                                  : SizedBox.shrink(),
                            ),
                          );
                        }),
                        CustomSizedBox.space8W,
                        Text(
                          'Set as default shipping address',
                          style: AppTheme.textStyleMediumBlack12,
                        )
                      ],
                    ),
                  ), CustomButton(label: 'Save',onPressed: () {
// if()
                  },marginVertical: 12,),
                ],
              ),
            ),

          ],))
      ],),
    );
  }
}