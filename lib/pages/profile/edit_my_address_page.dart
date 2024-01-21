import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/dropdown/custom_dropdown.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/address_model.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class EditAddressScreen extends StatelessWidget {
  final AddressModel? addressModel;
  static const String routeName ='/edit_address';
  const EditAddressScreen({super.key, this.addressModel});

  @override
  Widget build(BuildContext context) {
    UserController.to.nameEditAddressController.text = addressModel?.name ?? '-';
    UserController.to.phoneEditAddressController.text = addressModel?.phone ?? '-';
    UserController.to.emailEditAddressController.text = addressModel?.email ?? '-';
    UserController.to.addressEditAddressController.text = addressModel?.address ?? '-';
    // UserController.to.selectedArea.value=addressModel!.cityName;
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
                    controller: UserController.to.nameEditAddressController,
                  ),
                  CustomTextField(
                    controller: UserController.to.phoneEditAddressController,
                    marginVertical: 6,
                    hintText: 'Enter phone number',
                    labelText: 'Phone',
                    isRequired: true,
                    focusColor: Colors.black,
                  ),
                  CustomTextField(
                    controller: UserController.to.emailEditAddressController,
                    marginVertical: 6,
                    hintText: 'Enter your email',
                    labelText: 'Email (Optional)',
                    focusColor: Colors.black,
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
                    controller: UserController.to.addressEditAddressController,
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
                                  color: addressModel!.status=='1'
                                      ? AppColors.kPrimaryColor
                                      : Colors.white,
                                  border: Border.all(
                                      width: 0.5,
                                      color: addressModel!.status=='1'
                                          ? AppColors.kDarkPrimaryColor
                                          : Colors.black.withOpacity(.25))),
                              alignment: Alignment.center,
                              child: addressModel!.status=='1'
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

                  },marginVertical: 12,),
                ],
              ),
            ),

          ],))
      ],),
    );
  }
}