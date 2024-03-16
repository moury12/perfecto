import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/address_model.dart';
import 'package:perfecto/models/cart_model.dart';
import 'package:perfecto/models/cart_model.dart';
import 'package:perfecto/models/cart_model.dart';
import 'package:perfecto/models/cart_model.dart';
import '../models/reward_model.dart';
import '../models/user_model.dart';

class UserService {
  static Future<UserModel> userProfileCall() async {
    UserModel userModel = UserModel();
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}profile', httpMethod: HttpMethod.get);
    globalLogger.d(response, "Profile route");
    if (response['status'] != null && response['status']) {
      userModel = UserModel.fromJson(response['data']);
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return userModel;
  }

  static Future<bool> updateProfile(dynamic body, List<Map<String, dynamic>> imageList) async {
    final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}edit', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, imageListWithKeyValue: imageList, isLoadingEnable: true);
    globalLogger.d(response, "Profile Update Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> updateAddress(dynamic body, String addressId) async {
    final response =
        await ServiceAPI.genericCall(url: '${Service.apiUrl}edit_address/$addressId', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
    globalLogger.d('${Service.apiUrl}edit_address/$addressId', 'fgkgfjkgdn');
    globalLogger.d(response, "Address Update Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> addNewAddress(dynamic body) async {
    globalLogger.d(body, "add address body");
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}add_address', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
    globalLogger.d(response, "add address Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> addToWish(dynamic body) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}wishlist', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
    globalLogger.d(response, "add wish Route");
    if (response['status'] != null && response['status']) {
      showSnackBar(
        msg: response['message'],
      );
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> addToCart(dynamic body) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}user/add-to-cart', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
    globalLogger.d(response, "Add Cart Route");
    if (response['status'] != null && response['status']) {
      showSnackBar(
        msg: response['message'],
      );
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> addToReview(dynamic body, List<Map<String, dynamic>>? imageList) async {
    final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}product-review', httpMethod: HttpMethod.multipartFilePost, multipleImageListWithKeyValue: imageList, allInfoField: body, isLoadingEnable: true);
    globalLogger.d(response, "add product review Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> deleteAddress(String addressId) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}delete_address/$addressId', httpMethod: HttpMethod.del, isLoadingEnable: true);
    globalLogger.d(response, "delete address Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<List<DistrictModel>> getDistrictData() async {
    try {
      List<DistrictModel> dislist = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}district',
        httpMethod: HttpMethod.get,
        noNeedAuthToken: false,
      );

      globalLogger.d(response, "Get District Route");
      // Get.back();
      if (response['status'] != null && response['status']) {
        response['data']['districts'].forEach((dis) {
          dislist.add(DistrictModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return dislist;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<CityModel>> getCityData() async {
    try {
      List<CityModel> cityList = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}get-city-list',
        httpMethod: HttpMethod.get,
        noNeedAuthToken: false,
      );

      globalLogger.d(response, "Get City List Route");
      // Get.back();
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          cityList.add(CityModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return cityList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<dynamic>> getAreaData(String id, String type) async {
    try {
      List<ZoneModel> zoneList = [];
      List<AreaModel> areaList = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}get-${type == 'zone' ? 'zone' : 'area'}-list/$id',
        httpMethod: HttpMethod.get,
        noNeedAuthToken: false,
      );
      globalLogger.d(response, "Get ${type == 'zone' ? 'Zone' : 'Area'} Route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((item) {
          if (type == 'zone') {
            zoneList.add(ZoneModel.fromJson(item));
          } else {
            areaList.add(AreaModel.fromJson(item));
          }
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return type == 'zone' ? zoneList : areaList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<AddressModel>> userAddressCall() async {
    try {
      List<AddressModel> addressModel = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}get_address', httpMethod: HttpMethod.get);
      globalLogger.d(response, "AddressModel route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          addressModel.add(AddressModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return addressModel;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<WishListModel>> userWishListCall() async {
    try {
      List<WishListModel> wishList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}getwishlist', httpMethod: HttpMethod.get);
      globalLogger.d(response, "WishListModel route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          wishList.add(WishListModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return wishList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<CartModel>> userCartListCall() async {
    try {
      List<CartModel> cartList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}user/add-to-cart/list', httpMethod: HttpMethod.get);
      globalLogger.d(response, "CartModel route");
      if (response['status'] != null && response['status']) {
        response['data']['cartData'].forEach((dis) {
          try {
            cartList.add(CartModel.fromJson(dis));
          } catch (e) {
            globalLogger.e("Error occurred in CartModel: $e");
          }
        });
        UserController.to.upToDiscount.value = response['data']['uptoSaleDiscount'].toString();
        UserController.to.eligibleDeliveryFree.value = response['data']['eligible_delivery_free'];
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return cartList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  //RewardModel list
  static Future<List<RewardModel>> userRewardListCall() async {
    try {
      List<RewardModel> rewardList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}reward-history', httpMethod: HttpMethod.get);
      globalLogger.d(response, "RewardModel route");
      if (response['status'] != null && response['status']) {
        response['data']['data'].forEach((dis) {
          rewardList.add(RewardModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return rewardList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  //user/update-cart
  static Future<bool> updateCart(dynamic body, String productId) async {
    final response =
        await ServiceAPI.genericCall(url: '${Service.apiUrl}user/update-cart/$productId', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
    globalLogger.d(response, "update cart Route");
    if (response['status'] != null && response['status']) {
      showSnackBar(
        msg: response['message'].runtimeType == bool ? response['data'] : response['message'],
      );
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(
        response['message'].runtimeType == bool ? response['data'] : response['message'],
      );
    }
    return false;
  }

  //user/remove-form-cart
  static Future<bool> removeFromCart(String cartId) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}user/remove-form-cart/$cartId', httpMethod: HttpMethod.multipartFilePost, isLoadingEnable: true);
    globalLogger.d(response, "remove from cart Route");
    if (response['status'] != null && response['status']) {
      showSnackBar(
        msg: response['message'],
      );
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  //order-store
  static Future<bool> orderStore(dynamic body) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}order-store', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
    globalLogger.d(response, "order store Route");
    if (response['status'] != null && response['status']) {
      showSnackBar(
        msg: response['message'],
      );
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<List<ReviewListModel>> userReviewListCall() async {
    try {
      List<ReviewListModel> reviewList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}get-review', httpMethod: HttpMethod.get);
      globalLogger.d(response, "ReviewListModel route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          reviewList.add(ReviewListModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return reviewList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<bool> editPassword(dynamic body) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}edit_pass', httpMethod: HttpMethod.multipartFilePost, allInfoField: body);
    globalLogger.d(response, "edit password");

    if (response['status'] != null && response['status']) {
      showSnackBar(msg: response['message']);
      return true;
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }
}
