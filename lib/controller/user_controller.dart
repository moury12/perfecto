import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/models/cart_model.dart';
import 'package:perfecto/models/reward_model.dart';
import 'package:perfecto/models/user_model.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';
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
  TextEditingController addressAddNewAddressController = TextEditingController();
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
  RxList<RewardModel> rewardList = <RewardModel>[].obs;
  RxList<CartModel> cartList = <CartModel>[].obs;
  RxList<ReviewListModel> reviewList = <ReviewListModel>[].obs;
  @override
  Future<void> onInit() async {
    await getUserInfoCall();
    await getCartListCall();
    await getReviewListCall();
    await getWishListCall();

    Get.put<AddressController>(AddressController(), permanent: true);
    getRewardListCall();
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
    final isCreated = await UserService.addNewAddress({'product_id': productId});
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
  ) async {
    final List<Map<String, dynamic>> imageList = [];
    if (ProductDetailsController.to.imageList.isNotEmpty) {
      imageList.add({
        "key": "images",
        "value": ProductDetailsController.to.imageList,
      });
    }
    final isCreated = await UserService.addToReview({
      'product_id': productId,
      'order_id': orderId,
      'title': title,
      'comment': comment,
      'star': star,
    }, imageList);
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

  //rewardList
  Future<void> getRewardListCall() async {
    rewardList.value = await UserService.userRewardListCall();
  }

  Future<void> getCartListCall() async {
    cartList.value = await UserService.userCartListCall();
    HomeApiController.to.changeRewardPointApply();
  }

  //add addToWish
  Future<void> addToWish(String productId) async {
    final isCreated = await UserService.addToWish({'product_id': productId});
    if (isCreated) {
      getWishListCall();
      // afterLogin(isCreated);
    }
  }

  //add addToWish
  Future<void> updateCart(dynamic body, String cartId) async {
    final isCreated = await UserService.updateCart(body, cartId);
    if (isCreated) {
      getCartListCall();

      // afterLogin(isCreated);
    }
  }

  //add addToCart
  Future<void> addToCart(dynamic body) async {
    final isCreated = await UserService.addToCart(body);

    if (isCreated) {
      getCartListCall();
      // afterLogin(isCreated);
    }
  }

  //removeFromCart
  Future<void> removeFromCart(String cartId) async {
    final isCreated = await UserService.removeFromCart(cartId);
    if (isCreated) {
      getCartListCall();
      // afterLogin(isCreated);
    }
  }

  //cart item price calculation
  double cartTotalPrice() {
    double totalPrice = 0;
    // final carts = cartList.where((p0) => p0.comboProduct != null).toList();
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].product != null || cartList[i].buyGetInfo != null) {
        totalPrice += double.parse(cartList[i].price!) * int.parse(cartList[i].quantity!);
      } else {
        totalPrice += double.parse(cartList[i].discountedPrice!) * int.parse(cartList[i].quantity!);
      }
    }
    return totalPrice;
  }

  //cart item discount price calculation
  double cartTotalDiscountPrice() {
    double totalPrice = 0;
    // final carts = cartList.where((p0) => p0.comboProduct != null).toList();
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].comboProduct == null) {
        totalPrice += ((double.parse(cartList[i].price!) - double.parse(cartList[i].discountedPrice!)) * int.parse(cartList[i].quantity!));
      }
    }
    return totalPrice;
  }

  //cart item total price calculation with coupon and reward point
  double cartTotalPriceWithCouponAndReward() {
    double totalPrice = 0;
    totalPrice += cartTotalPrice();
    totalPrice -= cartTotalDiscountPrice();
    totalPrice -= (HomeApiController.to.couponInfo.value.amount ?? '0').toDouble();
    totalPrice -= rewardPointCalculation(HomeApiController.to.rewardPointInfo.value.rewardPointValue ?? '0', HomeApiController.to.rewardPointApply.value,
        HomeApiController.to.rewardPointInfo.value.rewardPoint ?? '0');
    return totalPrice;
  }

  //reward point calculation
  double rewardPointCalculation(String rewardPointValue, String rewardPoint, String rewardUnit) {
    return (rewardPointValue.toDouble() * (rewardPoint.toDouble() / rewardUnit.toDouble()));
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
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
      AuthController.to.passwordForNewConfirmController.clear();
      AuthController.to.passwordForNewController.clear();
      AuthController.to.passwordOldController.clear();
      Get.back();
    }
  }
}
