import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/address_model.dart';
import 'package:perfecto/services/user_service.dart';

class AddressController extends GetxController {
  final _districtStatus = Rx<RxStatus>(RxStatus.empty());
  final _areaStatus = Rx<RxStatus>(RxStatus.empty());
  final _areaList = <CityModel>[].obs;
  final _districtList = <DistrictModel>[].obs;
  final _addressList = <AddressModel>[].obs;
  final selectedDistrict = ''.obs;
  final selectedArea = ''.obs;
  final sameAddress = false.obs;

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
  List<CityModel> get areaList => _areaList.value;
  RxList<DistrictModel> get districtList => _districtList;
  RxList<AddressModel> get addressList => _addressList;

  @override
  void onInit() {
    super.onInit();
    getAddressCall();
    getDistrictData();
  }

  editAddress(AddressModel addressModel) {
    nameController.text = addressModel.name ?? '-';
    emailController.text = addressModel.email ?? '-';
    phoneController.text = addressModel.phone ?? '';
    addressController.text = addressModel.address ?? '';
    selectedDistrict.value = addressModel.districtId ?? '';
    selectedArea.value = addressModel.cityId ?? '';
    // sameAddress.value = addressModel.isDefault ?? false;
  }

  Future<void> getAddressCall() async {
    _addressList.value = await UserService.userAddressCall();
  }

  Future<void> getDistrictData() async {
    _districtList.value = await UserService.getDistrictData();
    districtList.refresh();
    update();
  }

  Future<void> getAreaData(String districtId) async {
    _areaList.clear();
    final areas = await UserService.getAreaData(districtId);
    _areaList.assignAll(areas);
    update();
  }
}
