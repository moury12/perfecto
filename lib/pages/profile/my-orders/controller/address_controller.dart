import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/address_model.dart';
import 'package:perfecto/services/user_service.dart';

class AddressController extends GetxController {
  static AddressController get to => Get.find();
  final _districtStatus = Rx<RxStatus>(RxStatus.empty());
  final _areaStatus = Rx<RxStatus>(RxStatus.empty());
  final _zoneStatus = Rx<RxStatus>(RxStatus.empty());
  final _cityStatus = Rx<RxStatus>(RxStatus.empty());
  final _cityList = <CityModel>[].obs;
  final _zoneList = <ZoneModel>[].obs;
  final _areaList = <AreaModel>[].obs;
  final _districtList = <DistrictModel>[].obs;
  final _addressList = <AddressModel>[].obs;
  final selectedCity = ''.obs;
  final selectedArea = ''.obs;
  final selectedZone = ''.obs;
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
  RxStatus get zoneStatus => _zoneStatus.value;
  RxStatus get cityStatus => _cityStatus.value;
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
    selectedCity.value = addressModel.cityId ?? '';
    selectedArea.value = addressModel.areaId ?? '';
    selectedZone.value = addressModel.zoneId ?? '';
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
    try {
      _cityStatus.value = RxStatus.loading();
      _cityList.value = await UserService.getCityData();
    } finally {
      _cityStatus.value = RxStatus.success();
    }
    cityList.refresh();
    update();
  }

  Future<void> getZoneAreaData(String id, String type) async {
    try {
      if (type == 'zone') {
        _zoneStatus.value = RxStatus.loading();
      } else {
        _areaStatus.value = RxStatus.loading();
      }
      final areas = await UserService.getAreaData(id, type);
      if (type == 'zone') {
        _zoneList.value = areas as List<ZoneModel>;
        // zoneList.refresh();
        update();
      } else {
        _areaList.value = areas as List<AreaModel>;
      }
    } finally {
      if (type == 'zone') {
        _zoneStatus.value = RxStatus.success();
      } else {
        _areaStatus.value = RxStatus.success();
      }

      update();
    }
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

  Future<bool> addAddressRequest(String name, String phone, String email, String cityId, String cityName, String zoneId, String zoneName, String areaId, String areaName,
      String address, String status) async {
    final isCreated = await UserService.addNewAddress({
      "name": name,
      "phone": phone,
      "email": email,
      "city_id": cityId,
      "city_name": cityName,
      "zone_id": zoneId,
      "zone_name": zoneName,
      "area_id": areaId,
      "area_name": areaName,
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
      {String? name,
      String? phone,
      String? email,
      String? cityId,
      String? cityName,
      String? zoneId,
      String? zoneName,
      String? areaId,
      String? areaName,
      String? address,
      String? status,
      String? addressId,
      bool fromEdit = true}) async {
    final isCreated = await UserService.updateAddress({
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (cityId != null) "city_id": cityId,
      if (cityName != null) "city_name": cityName,
      if (zoneId != null) "zone_id": zoneId,
      if (zoneName != null) "zone_name": zoneName,
      if (areaId != null) "area_id": areaId,
      if (areaName != null) "area_name": areaName,
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
