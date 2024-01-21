import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/address_model.dart';
import 'package:perfecto/models/user_model.dart';
import 'package:perfecto/services/user_service.dart';

import '../utils.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  UserModel get getUserInfo => userInfo.value;
  Rx<UserModel> userInfo = UserModel().obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameEditAddressController = TextEditingController();
  TextEditingController emailEditAddressController = TextEditingController();
  TextEditingController phoneEditAddressController = TextEditingController();
  TextEditingController addressEditAddressController = TextEditingController();
  Rx<String?> errorName = ''.obs;
  Rx<String?> errorEmail = ''.obs;
  Rx<String?> errorPhone = ''.obs;
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  Rx<File> pickedImage = File('').obs;
  Rx<String?> selectedDistrict = ''.obs;
  Rx<String?> selectedArea = ''.obs;
  RxList<DistrictModel> districtList = <DistrictModel>[].obs;
  RxList<CityModel> areaList = <CityModel>[].obs;
  RxList<AddressModel> addressList = <AddressModel>[].obs;
  @override
  void onReady() async {
    await getUserInfoCall();
    await getAreaData();
    await getAddressCall();
    nameController.text = getUserInfo.name ?? '-';
    emailController.text = userInfo.value.email ?? '-';
    phoneController.text = userInfo.value.phone ?? '';
    super.onReady();
  }

  @override
  void onClose() async {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onReady();
  }

  Future<void> getUserInfoCall() async {
    userInfo.value = await UserService.userProfileCall();
  }

  Future<void> getAddressCall() async {
    addressList.value = await UserService.userAddressCall();
  }

  Future<bool> updateUser(
      String name, String email, String phone, File avatar) async {
    final isUpdated = await UserService.updateProfile({
      "name": name,
      "email": email,
      "phone": phone,
      "avatar": avatar,
    });
    if (isUpdated) {
      Get.back();
      showSnackBar(msg: 'Profile Updated Successfully');
      await getUserInfoCall();
    }
    return isUpdated;
  }

  Future<void> getAreaData() async {
    final data = await UserService.getAreaData();
    districtList.value = data[DataType.district]! as List<DistrictModel>;
    areaList.value = data[DataType.area]! as List<CityModel>;
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }
}
