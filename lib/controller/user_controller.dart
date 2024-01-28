import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/user_model.dart';
import 'package:perfecto/services/user_service.dart';

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
  TextEditingController nameAddNewAddressController = TextEditingController();
  TextEditingController emailAddNewAddressController = TextEditingController();
  TextEditingController phoneAddNewAddressController = TextEditingController();
  TextEditingController addressAddNewAddressController =
      TextEditingController();
  Rx<String?> errorName = ''.obs;
  Rx<String?> errorEmail = ''.obs;
  Rx<String?> errorPhone = ''.obs;
  Rx<String?> errorAddNewName = ''.obs;
  Rx<String?> errorAddNewEmail = ''.obs;
  Rx<String?> errorAddNewPhone = ''.obs;
  Rx<String?> errorAddNewAddress = ''.obs;
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  RxString pickedImagePath = ''.obs;
  RxString image = ''.obs;
  RxList<WishListModel> wishList = <WishListModel>[].obs;
  RxList<ReviewListModel> reviewList = <ReviewListModel>[].obs;
  @override
  Future<void> onInit() async {
    await getUserInfoCall();
    await getReviewListCall();
    await getWishListCall();
    super.onInit();
  }

  editController(UserModel userModel) {
    nameController.text = userModel.name ?? '';
    emailController.text = userModel.email ?? '';
    phoneController.text = userModel.phone ?? '';
    image.value = userModel.avatar ?? '';
  }

  @override
  void onClose() async {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nameAddNewAddressController.dispose();
    emailAddNewAddressController.dispose();
    phoneAddNewAddressController.dispose();
    addressAddNewAddressController.dispose();
    super.onReady();
  }

  Future<bool> addWishListRequest(String productId) async {
    final isCreated =
        await UserService.addNewAddress({'product_id': productId});
    if (isCreated) {
      showSnackBar(
        msg: 'Product save at wish List',
      );
      Get.back();
      getWishListCall();
      // afterLogin(isCreated);
    }
    return isCreated;
  }

  Future<bool> addReviewRequest(
    String productId,
    String orderId,
    String title,
    String comment,
    String star,
    List<String> images,
  ) async {
    final isCreated = await UserService.addNewAddress({
      'product_id': productId,
      'order_id': orderId,
      'title': title,
      'comment': comment,
      'star': star,
      'images': images
    });
    if (isCreated) {
      showSnackBar(
        msg: 'your review is added',
      );
      Get.back();
      getReviewListCall();
      // afterLogin(isCreated);
    }
    return isCreated;
  }

  Future<void> getWishListCall() async {
    wishList.value = await UserService.userWishListCall();
  }

  Future<void> getReviewListCall() async {
    reviewList.value = await UserService.userReviewListCall();
  }

  Future<void> getUserInfoCall() async {
    userInfo.value = await UserService.userProfileCall();
    update();
  }

  Future<bool> updateUser(String name, String email, String phone) async {
    final List<Map<String, dynamic>> imageList = [];
    if (UserController.to.pickedImagePath.value.isNotEmpty) {
      imageList.add({
        "key": "avatar",
        "value": UserController.to.pickedImagePath.value,
      });
    }

    final isUpdated = await UserService.updateProfile({
      "name": name,
      "email": email,
      "phone": phone,
    }, imageList);
    if (isUpdated) {
      Get.back();
      pickedImagePath.value = '';
      showSnackBar(msg: 'Profile Updated Successfully');
      await getUserInfoCall();
    }
    return isUpdated;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImagePath.value = pickedFile.path;
    }
  }

  Future<void> editPassword(
    String oldPassword,
    String password,
    String cPassword,
  ) async {
    bool isVerified = await UserService.editPassword({
      "old_password": oldPassword,
      "new_password": password,
      "c_password": cPassword,
    });
    if (isVerified) {
      Get.back();
    }
  }
}
