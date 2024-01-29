import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/address_model.dart';
import '../models/user_model.dart';

class UserService {
  static Future<UserModel> userProfileCall() async {
    UserModel userModel = UserModel();
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}profile', httpMethod: HttpMethod.get);
    globalLogger.d(response, "Profile route");
    if (response['status'] != null && response['status']) {
      userModel = UserModel.fromJson(response['data']);
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return userModel;
  }

  static Future<bool> updateProfile(
      dynamic body, List<Map<String, dynamic>> imageList) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}edit',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        imageListWithKeyValue: imageList,
        isLoadingEnable: true);
    globalLogger.d(response, "Profile Update Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> updateAddress(dynamic body, String addressId) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}edit_address/$addressId',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        isLoadingEnable: true);
    globalLogger.d('${ServiceAPI.apiUrl}edit_address/$addressId', 'fgkgfjkgdn');
    globalLogger.d(response, "Address Update Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> addNewAddress(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}add_address',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        isLoadingEnable: true);
    globalLogger.d(response, "add address Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }
  static Future<bool> addToWish(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}wishlist',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        isLoadingEnable: true);
    globalLogger.d(response, "add wish Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }
  static Future<bool> addToReview(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}product-review',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        isLoadingEnable: true);
    globalLogger.d(response, "add product review Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<bool> deleteAddress(String addressId) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}delete_address/$addressId',
        httpMethod: HttpMethod.del,
        isLoadingEnable: true);
    globalLogger.d(response, "delete address Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<List<DistrictModel>> getDistrictData() async {
  try  {
      List<DistrictModel> dislist = [];
      final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}district',
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
    }catch (e) {
    globalLogger.e("Error occurred in Call: $e");
    return []; // Return an empty list or handle the error accordingly
  }
  }

  static Future<List<CityModel>> getAreaData(String districtId) async {
    try{
      List<CityModel> areaList = [];
      final response = await ServiceAPI.genericCall(
        url:
            '${ServiceAPI.apiUrl}city?district_id=$districtId' /*${dislist.map((e) => e.id)}*/,
        httpMethod: HttpMethod.get,
        noNeedAuthToken: false,
      );
      globalLogger.d(response, "Get Area Route");
      if (response['status'] != null && response['status']) {
        response['data']['cities'].forEach((course) {
          areaList.add(CityModel.fromJson(course));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return areaList;
    }catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<AddressModel>> userAddressCall() async {
    try{
      List<AddressModel> addressModel = [];
      final response = await ServiceAPI.genericCall(
          url: '${ServiceAPI.apiUrl}get_address', httpMethod: HttpMethod.get);
      globalLogger.d(response, "AddressModel route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          addressModel.add(AddressModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return addressModel;
    }catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<WishListModel>> userWishListCall() async {
    try{
      List<WishListModel> wishList = [];
      final response = await ServiceAPI.genericCall(
          url: '${ServiceAPI.apiUrl}getwishlist', httpMethod: HttpMethod.get);
      globalLogger.d(response, "WishListModel route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          wishList.add(WishListModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return wishList;
    }catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ReviewListModel>> userReviewListCall() async {
    try{
      List<ReviewListModel> reviewList = [];
      final response = await ServiceAPI.genericCall(
          url: '${ServiceAPI.apiUrl}get-review', httpMethod: HttpMethod.get);
      globalLogger.d(response, "ReviewListModel route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          reviewList.add(ReviewListModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return reviewList;
    }catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<bool> editPassword(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}edit_pass',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body);
    globalLogger.d(response, "edit password");

    if (response['status'] != null && response['status']) {
      showSnackBar(msg: response['message']);
      return true;
    } else if (response['status'] != null && !response['status']) {
      Get.back();
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }
}
