import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/address_model.dart';
import 'package:perfecto/services/user_service.dart';

class AddressController extends GetxController {
  final _districtStatus = Rx<RxStatus>(RxStatus.empty());
  final _areaStatus = Rx<RxStatus>(RxStatus.empty());
  final _cityList = <CityModel>[].obs;
  final _zoneList = <ZoneModel>[].obs;
  final _areaList = <AreaModel>[].obs;
  final _districtList = <DistrictModel>[].obs;
  final _addressList = <AddressModel>[].obs;
  final selectedCity = ''.obs;
  final selectedArea = ''.obs;
  final sameAddress = false.obs;
  final address = AddressModel().obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Rx<String?> errorName = ''.obs;
  Rx<String?> errorEmail = ''.obs;
  Rx<String?> errorPhone = ''.obs;
  Rx<String?> errorAddress = ''.obs;
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();

  RxStatus get districtStatus => _districtStatus.value;
  RxStatus get areaStatus => _areaStatus.value;
  RxList<CityModel> get cityList => _cityList;
  RxList<ZoneModel> get zoneList => _zoneList;
  RxList<AreaModel> get areaList => _areaList;
  RxList<DistrictModel> get districtList => _districtList;
  RxList<AddressModel> get addressList => _addressList;
  RxBool isAddNew = false.obs;
  @override
  void onInit() {
    super.onInit();
    getAddressCall();
    getCityData();
  }

  editAddress(AddressModel addressModel) {
    address.value = addressModel;
    nameController.text = addressModel.name ?? '-';
    emailController.text = addressModel.email ?? '-';
    phoneController.text = addressModel.phone ?? '';
    addressController.text = addressModel.address ?? '';
    selectedCity.value = addressModel.districtId ?? '';
    selectedArea.value = addressModel.cityId ?? '';
    sameAddress.value = addressModel.status == '1' ? true : false;
    //TODO: //
    // getAreaData(selectedCity.value);
  }

  clearAddress() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    selectedCity.value = '';
    selectedArea.value = '';
    sameAddress.value = false;
    isAddNew.value = true;
  }

  Future<void> getAddressCall() async {
    _addressList.value = await UserService.userAddressCall();
  }

  Future<void> getCityData() async {
    _cityList.value = await UserService.getCityData();
    cityList.refresh();
    update();
  }

  Future<void> getZoneAreaData(String id, String type) async {
    _areaList.clear();

    final areas = await UserService.getAreaData(id, type);
    if (type == 'zone') {
      _zoneList.assignAll(areas as List<ZoneModel>);
    } else {
      _areaList.assignAll(areas as List<AreaModel>);
    }
    update();
  }

  Future<bool> deleteAddress(String addressId) async {
    final isDeleted = await UserService.deleteAddress(addressId);
    if (isDeleted) {
      showSnackBar(
        msg: 'Address Deleted successfully.',
      );

      getAddressCall();
    }
    return isDeleted;
  }

  Future<bool> addAddressRequest(String name, String phone, String email, String districtId, String cityId, String address, String status) async {
    final isCreated = await UserService.addNewAddress({
      "name": name,
      "phone": phone,
      "email": email,
      "district_id": districtId,
      "city_id": cityId,
      "address": address,
      "status": status,
    });
    if (isCreated) {
      showSnackBar(
        msg: 'Address Added successfully.',
      );
      Get.back();
      getAddressCall();
      // afterLogin(isCreated);
    }
    return isCreated;
  }

  Future<bool> updateAddressRequest(
      {String? name, String? phone, String? email, String? districtId, String? cityId, String? address, String? status, String? addressId, bool fromEdit = true}) async {
    final isCreated = await UserService.updateAddress({
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (districtId != null) "district_id": districtId,
      if (cityId != null) "city_id": cityId,
      if (address != null) "address": address,
      if (status != null) "status": status,
      if (email != null) "email": email,
    }, addressId!);
    if (isCreated) {
      if (fromEdit) {
        showSnackBar(
          msg: 'Address Updated successfully.',
        );
        Get.back();
      } else {
        showSnackBar(
          msg: 'Default Address Set successfully.',
        );
      }
      getAddressCall();
      // afterLogin(isCreated);
    }
    return isCreated;
  }
}
