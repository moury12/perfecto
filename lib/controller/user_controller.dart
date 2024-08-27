import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/models/cart_model.dart';
import 'package:perfecto/models/notification_model.dart';
import 'package:perfecto/models/order_model.dart';
import 'package:perfecto/models/product_model.dart';
import 'package:perfecto/models/reward_model.dart';
import 'package:perfecto/models/user_model.dart';
import 'package:perfecto/pages/my-cart/cart_page.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';
import 'package:perfecto/services/ssl.dart';
import 'package:perfecto/services/user_service.dart';
import 'package:perfecto/utils.dart';

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
  RxString upToDiscount = '0'.obs;
  RxBool eligibleDeliveryFree = false.obs;
  RxList<WishListModel> wishList = <WishListModel>[].obs;
  RxList<RewardModel> rewardList = <RewardModel>[].obs;
  RxList<CartModel> cartList = <CartModel>[].obs;
  RxList<OrderModel> orderList = <OrderModel>[].obs;
  RxList<OrderModel> cancelOrderList = <OrderModel>[].obs;
  Rx<OrderModel> orderDetails = OrderModel().obs;
  RxStatus orderStatus = RxStatus.empty();
  RxStatus cancelOrderStatus = RxStatus.empty();
  RxString orderPaginateURL = ''.obs;
  RxString cancelOrderPaginateURL = ''.obs;

  RxList<Reviews> reviewList = <Reviews>[].obs;
  RxString reviewPaginateURL = ''.obs;
  Rx<LoadingStatus> reviewStatus = LoadingStatus.initial.obs;
  ScrollController scrollController = ScrollController();
  Future<void> _scrollListener() async {
    // globalLogger.d('Scroll Listener');
    // globalLogger.d(scrollController.position.pixels, 'pixels');
    if (reviewStatus.value != LoadingStatus.loadingMore && scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (reviewPaginateURL.value.isNotEmpty) {
        getReviewListCall(initialCall: false);
      }
      globalLogger.d(scrollController.position.minScrollExtent, error: 'min scroll live chat screen');
    }
  }

  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;
  RxString notificationPaginateURL = ''.obs;
  Rx<LoadingStatus> notificationStatus = LoadingStatus.initial.obs;
  ScrollController notificationScrollController = ScrollController();
  Future<void> _notificationScrollListener() async {
    if (notificationStatus.value != LoadingStatus.loadingMore && notificationScrollController.position.pixels == notificationScrollController.position.maxScrollExtent) {
      if (notificationPaginateURL.value.isNotEmpty) {
        getNotificationListCall(initialCall: false);
      }
      globalLogger.d(notificationScrollController.position.maxScrollExtent, error: 'min scroll live chat screen');
    }
  }

  TextEditingController orderNoteController = TextEditingController();

  var processesMap = {
    '1': 'Pending',
    '2': 'Accepted',
    '3': 'Shipped',
    '4': 'Delivered',
    '5': 'Cancelled',
  };

  @override
  Future<void> onInit() async {
    scrollController.addListener(_scrollListener);
    notificationScrollController.addListener(_notificationScrollListener);
    await getUserInfoCall();

    Get.put<AddressController>(AddressController(), permanent: true);
    await getCartListCall();
    await getReviewListCall();
    await getWishListCall();
    getOrderListCall();
    getRewardListCall();
    getNotificationListCall();
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

  //OrderModel list with pagination
  Future<void> getOrderListCall({bool initialCall = true}) async {
    orderStatus = RxStatus.loading();
    final data = await UserService.userOrderListCall(initialCall: initialCall);
    if (data.isNotEmpty) {
      if (initialCall) {
        orderList.value = data;
      } else {
        orderList.addAll(data);
      }
      orderStatus = RxStatus.success();
    } else {
      orderStatus = RxStatus.error('No Data Found');
    }
  }

  //OrderModel list with pagination
  Future<void> getCancelOrderListCall({bool initialCall = true}) async {
    cancelOrderStatus = RxStatus.loading();
    final data = await UserService.userCancelOrderListCall(initialCall: initialCall);
    if (data.isNotEmpty) {
      if (initialCall) {
        cancelOrderList.value = data;
      } else {
        cancelOrderList.addAll(data);
      }
      cancelOrderStatus = RxStatus.success();
    } else {
      cancelOrderStatus = RxStatus.error('No Data Found');
    }
  }

  //orderDetails call
  Future<void> getOrderDetailsCall(String orderId) async {
    orderDetails.value = await UserService.orderDetailsCall(orderId);
  }

  //orderDestroy
  Future<void> cancelOrder(String orderId) async {
    final isCreated = await UserService.cancelOrder(orderId);
    if (isCreated) {
      Get.back();

      getOrderListCall();
      // afterLogin(isCreated);
    }
  }

  //order edit
  Future<void> editOrder(String orderId) async {
    final isCreated = await UserService.editOrder(orderId);
    if (isCreated) {
      Get.back();

      getOrderListCall();
      getCartListCall();

      Get.toNamed(CartScreen.routeName);
    }
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

  Future<void> checkAndAddCart(dynamic body) async {
    for (var element in cartList) {
      if (element.product != null && element.product!.id == body['product_id'] && element.product!.variationType == 'shade'
          ? element.shadeId == body['shade_id']
          : element.sizeId == body['size_id']) {
        updateCart({
          'quantity': (element.quantity!.toInt() + 1).toString(),
        }, element.id!);
      } else {
        await addToCart(body);
      }
    }
  }

  CartModel? checkCart() {
    for (var element in cartList) {
      if (element.product != null &&
          element.product!.id == ProductDetailsController.to.product.value.id &&
          (element.product!.variationType == 'shade'
              ? element.shadeId == ProductDetailsController.to.selectedVariation.value
              : element.sizeId == ProductDetailsController.to.selectedVariation.value)) {
        return element;
      } else if (element.comboProduct != null &&
          element.comboProduct!.id == ProductDetailsController.to.comboDetails.value.id &&
          ProductDetailsController.to.comboDetails.value.comboProductDetails!.length == element.comboInfo!.length) {
        final checkData = [];
        globalLogger.d(element.comboInfo!.length);
        globalLogger.d(ProductDetailsController.to.comboDetails.value.comboProductDetails!.length);

        for (int i = 0; i < element.comboInfo!.length; i++) {
          if ((element.comboInfo![i].size?.id ?? element.comboInfo![i].shade?.id!) == ProductDetailsController.to.comboDetails.value.comboProductDetails![i].variantId) {
            checkData.add(true);
          } else {
            checkData.add(false);
          }
        }

        if (!checkData.contains(false)) {
          return element;
        }
      }
    }
    return null;
  }

  //add addToCart
  Future<void> addToCart(dynamic body) async {
    final isCreated = await UserService.addToCart(body);

    if (isCreated) {
      for (var element in wishList) {
        if (element.product != null && element.product!.id == body['product_id']) {
          addToWish(element.productId!);
        }
      }
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

  //Stock request
  Future<void> stockRequest(dynamic body) async {
    final isCreated = await UserService.stockRequest(body);
    // if (isCreated) {
    //   showSnackBar(
    //     msg: 'Stock Request Sent',
    //   );
    //   // Get.back();
    //   // afterLogin(isCreated);
    // }
  }

  //cart item price calculation
  double cartTotalPrice() {
    double totalPrice = 0;
    // final carts = cartList.where((p0) => p0.comboProduct != null).toList();
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].stockStatus == '1') {
        if (cartList[i].product != null || cartList[i].buyGetInfo != null) {
          totalPrice += double.parse(cartList[i].discountedPrice!) * int.parse(cartList[i].quantity!);
        } else {
          totalPrice += double.parse(cartList[i].discountedPrice!) * int.parse(cartList[i].quantity!);
        }
      }
    }
    return totalPrice;
  }

  //cart item discount price calculation
  // double cartTotalDiscountPrice() {
  //   double totalPrice = 0;
  //   // final carts = cartList.where((p0) => p0.comboProduct != null).toList();
  //   for (int i = 0; i < cartList.length; i++) {
  //     if (cartList[i].stockStatus == '1') {
  //       if (cartList[i].comboProduct == null) {
  //         totalPrice += ((double.parse(cartList[i].price!) - double.parse(cartList[i].discountedPrice!)) * int.parse(cartList[i].quantity!));
  //       }
  //     }
  //   }
  //   return totalPrice;
  // }

  //cart item total price calculation with coupon and reward point
  double cartTotalPriceWithCouponAndReward([double shippingCost = 0]) {
    double totalPrice = 0;
    totalPrice += cartTotalPrice();

    // totalPrice -= cartTotalDiscountPrice();

    totalPrice -= upToDiscount.value.toDouble();

    totalPrice -= (HomeApiController.to.couponInfo.value.amount ?? '0').toDouble();

    totalPrice -= rewardPointCalculation(HomeApiController.to.rewardPointInfo.value.rewardPointValue ?? '0', HomeApiController.to.rewardPointApply.value,
        HomeApiController.to.rewardPointInfo.value.rewardPoint ?? '0');

    totalPrice += shippingCost;
    if (UserController.to.eligibleDeliveryFree.value) totalPrice -= shippingCost;
    return totalPrice;
  }

  //notificationList call
  Future<void> getNotificationListCall({bool initialCall = true}) async {
    if (initialCall) {
      notificationList.clear();
      notificationStatus.value = LoadingStatus.loading;
    } else {
      notificationStatus.value = LoadingStatus.loadingMore;
    }
    try {
      final data = await UserService.getNotificationData(paginationUrl: initialCall ? null : notificationPaginateURL.value);
      if (initialCall) {
        notificationList.value = data;
        notificationStatus.value = LoadingStatus.loaded;
      } else {
        notificationList.addAll(data);
        notificationStatus.value = LoadingStatus.loaded;
      }
    } catch (e) {
      notificationStatus.value = LoadingStatus.error;
    }
  }

  //reward point calculation
  double rewardPointCalculation(String rewardPointValue, String rewardPoint, String rewardUnit) {
    return (rewardPointValue.toDouble() * (rewardPoint.toDouble() / rewardUnit.toDouble()));
  }

  //reviewList call with pagination
  Future<void> getReviewListCall({bool initialCall = true}) async {
    if (initialCall) {
      reviewList.clear();
      reviewStatus.value = LoadingStatus.loading;
    } else {
      reviewStatus.value = LoadingStatus.loadingMore;
    }
    try {
      final data = await UserService.getReviewData(paginationUrl: initialCall ? null : reviewPaginateURL.value);
      if (initialCall) {
        reviewList.value = data;
        reviewStatus.value = LoadingStatus.loaded;
      } else {
        reviewList.addAll(data);
        reviewStatus.value = LoadingStatus.loaded;
      }
    } catch (e) {
      reviewStatus.value = LoadingStatus.error;
    }
  }

  Future<void> getUserInfoCall() async {
    userInfo.value = await UserService.userProfileCall();
    userInfo.refresh();
    update();

    final token = await FirebaseMessaging.instance.getToken();
    print("fcm token");
    print(token);
    try {
      final isUpdateToken = await UserService.storeFCMToken({"token": token!});
    } catch (e) {
      globalLogger.d(e);
    }
  }

  // //pathao city
  // Future<void> pathaoCity() async {
  //   final data = await UserService.pathaoCity();
  //
  //   data.forEach((element) async {
  //     element['zone'] = await pathaoZone(element['city_id'].toString());
  //   });
  //   globalLogger.d(data);
  // }
  //
  // //pathao zone
  // Future<List<dynamic>> pathaoZone(String cityId) async {
  //   final data = await UserService.pathaoZone(cityId);
  //   Future.delayed(Duration(seconds: 10));
  //   data.forEach((element) async {
  //     element['area'] = await pathaoArea(element['zone_id'].toString());
  //   });
  //   return data;
  // }
  //
  // //pathao area
  // Future<List<dynamic>> pathaoArea(String zoneId) async {
  //   Future.delayed(Duration(seconds: 10));
  //   final data = await UserService.pathaoArea(zoneId);
  //   return data;
  // }

  //order-store
  Future<void> orderStore(dynamic body, PaymentType paymentType) async {
    final isCreated = await UserService.orderStore(body);
    if (isCreated.runtimeType != bool && isCreated['status']) {
      if (paymentType == PaymentType.cod) {
        showSnackBar(
          msg: 'Order Placed Successfully',
        );
        Get.back();
        Get.back();
        getCartListCall();
        getOrderListCall();
      } else {
        final data = {
          "bank_tran_id": "240321121029qdMS6f08hCya6mW",
          "card_brand": "MOBILEBANKING",
          "card_issuer": "BKash Mobile Banking",
          "card_type": "BKASH-BKash",
          "sessionkey": "E4CD76D6A21E9F0511DD9C172B5EF674",
          "tran_date": "2024-03-21 12:10:22",
          "tran_id": "1cf534dd-191f-4255-8b60-089d9c1cf7c7",
          "val_id": "240321121029QunG6MPpZkswj78",
          "value_a": "value a",
          "value_b": "value b",
          "value_c": "value c",
          "value_d": "value d"
        };

        final res = await sslCommerzGeneralCallTest(
            UserController.to.cartTotalPriceWithCouponAndReward(
                (AddressController.to.cityList.firstWhere((element) => element.cityId == AddressController.to.selectedCity.value).cityName!.toLowerCase() != 'dhaka'
                        ? HomeApiController.to.shippingInfo.value.outsideCity ?? '0'
                        : HomeApiController.to.shippingInfo.value.insideCity ?? '0')
                    .toDouble()),
            'Products',
            isCreated['data']['tran_id'].toString());
        if (res.status != null && res.status == 'VALID') {
          globalLogger.d(res.toJson());
          await orderUpdate({
            "payment_status": "success",
            "bank_tran_id": res.bankTranId!,
            "card_brand": res.cardBrand!,
            "card_issuer": res.cardIssuer!,
            "card_type": res.cardType!,
            "validated_on": res.validatedOn!,
            // "sessionkey": res.sessionkey!,
            "tran_date": res.tranDate!,
            "amount": res.amount!,
            "tran_id": res.tranId!,
            "val_id": res.valId!,
            "value_a": res.valueA!,
            "value_b": res.valueB!,
            "value_c": res.valueC!,
            "value_d": res.valueD!
          }, isCreated['data']['id'].toString());
        } else {
          await orderUpdate({
            "payment_status": "failed",
            // "bank_tran_id": res.bankTranId!,
            // "card_brand": res.cardBrand!,
            // "card_issuer": res.cardIssuer!,
            // "card_type": res.cardType!,
            // "sessionkey": res.sessionkey!,
            // "tran_date": res.tranDate!,
            // "tran_id": res.tranId!,
            // "val_id": res.valId!,
            // "value_a": res.valueA!,
            // "value_b": res.valueB!,
            // "value_c": res.valueC!,
            // "value_d": res.valueD!
          }, isCreated['data']['id'].toString());
        }
      }
    }
  }

  //order-update
  Future<void> orderUpdate(dynamic body, String orderId) async {
    final isCreated = await UserService.orderUpdate(body, orderId);
    if (isCreated.runtimeType != bool && isCreated['data']['payment_status'] == 'success') {
      showSnackBar(
        msg: 'Order Placed Successfully',
      );
      Get.back();
      Get.back();
      getCartListCall();
      getOrderListCall();
    } else {
      showSnackBar(msg: 'Payment failed!');
      Get.back();
      Get.back();
      getCartListCall();
      getOrderListCall();
    }
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
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

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
      if (UserController.to.getUserInfo.isGoogleLogin == '0') "old_password": oldPassword,
      "new_password": password,
      "c_password": cPassword,
    });
    if (isVerified) {
      AuthController.to.passwordForNewConfirmController.clear();
      AuthController.to.passwordForNewController.clear();
      AuthController.to.passwordOldController.clear();
      if (UserController.to.getUserInfo.isGoogleLogin == '0') {
        showSnackBar(msg: 'Password Updated Successfully');
      } else {
        getUserInfoCall();
      }
      Get.back();
    }
  }
}
