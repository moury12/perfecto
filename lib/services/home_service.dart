import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/combo_product_model.dart';
import 'package:perfecto/models/coupon_model.dart';
import 'package:perfecto/models/home_model.dart';
import 'package:perfecto/models/menu_offer_model.dart';
import 'package:perfecto/models/offer_details_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/shade_model.dart';
import 'package:perfecto/models/shade_model.dart';
import 'package:perfecto/models/shade_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';

import '../models/shipping_model.dart';
import '../utils.dart';

class HomeService {
  static Future<List<BlogModel>> blogCall() async {
    try {
      List<BlogModel> blogList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}blogs', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "blog route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          blogList.add(BlogModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return blogList;
    } catch (e) {
      globalLogger.e("Error occurred in blogCall: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  // home page HomeModel list
  static Future<List<HomeModel>> homeCall() async {
    try {
      List<HomeModel> homeList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}get-home-mobile', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "home route");
      if (response['status'] != null && response['status']) {
        (response['data'] as List).insert(1, {'id': 'cat'});
        response['data'].forEach((dis) {
          try {
            if (HomeController.to.productListId.contains(dis['id'].toString())) {
              // globalLogger.d(HomeController.to.productListId, "product_list section id list");
              dis['product_list'] = dis['section_data'];
              dis['section_data'] = [];
            }
            if (dis['section_data'].runtimeType.toString() == '_Map<String, dynamic>') {
              dis['section_data'] = [dis['section_data']];
            }
            homeList.add(HomeModel.fromJson(dis));
          } catch (e) {
            // globalLogger.d(dis['section_data'].runtimeType, "home route");
            globalLogger.e("Error occurred in homeCall: $dis");
            globalLogger.e("Error occurred in homeCall: $e");
          }
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return homeList;
    } catch (e) {
      globalLogger.e("Error occurred in homeCall: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> preferenceCall() async {
    try {
      List<ProductAttributeModel> preference = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}preference', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "preference route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          preference.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return preference;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<OutletModel>> outletCall() async {
    try {
      List<OutletModel> outletList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}get-outlet', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "outletList route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          outletList.add(OutletModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return outletList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> colorCall() async {
    try {
      List<ProductAttributeModel> color = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}product/color', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "product color");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          color.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return color;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> formulationCall() async {
    try {
      List<ProductAttributeModel> formulation = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}formulation', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "formulation route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          formulation.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return formulation;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> finishCall() async {
    try {
      List<ProductAttributeModel> finish = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}finish', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "finish route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          finish.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return finish;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> countryCall() async {
    try {
      List<ProductAttributeModel> country = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}country', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "country route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          country.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return country;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> genderCall() async {
    try {
      List<ProductAttributeModel> gender = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}gender', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "gender route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          gender.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return gender;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> coverageCall() async {
    try {
      List<ProductAttributeModel> coverage = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}coverage', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "coverage route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          coverage.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return coverage;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> benefitCall() async {
    try {
      List<ProductAttributeModel> benefit = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}benefit', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "benefit route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          benefit.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return benefit;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  //offerList
  static Future<List<OfferModel>> offerCall() async {
    try {
      List<OfferModel> offer = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}offers',
        httpMethod: HttpMethod.get,
        isLoadingEnable: true,
      );
      globalLogger.d(response, error: "offer route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          offer.add(OfferModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return offer;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  //get-available-offers
  static Future<List<MenuOfferModel>> availableOfferCall() async {
    try {
      List<MenuOfferModel> offer = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}get-available-offers',
        httpMethod: HttpMethod.get,
      );
      globalLogger.d(response, error: "available offer route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          offer.add(MenuOfferModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return offer;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  //OfferDetailsModel data
  static Future<Map<OfferType, dynamic>> offerDetailsCall(String offerId) async {
    try {
      OfferDetailsModel offerDetails = OfferDetailsModel();
      List<ComboOfferItemModel> offerCombo = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}offer-products',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: {'offer_id': offerId},
        isLoadingEnable: true,
      );
      globalLogger.d(response, error: "offerDetails route $offerId");
      if (response['status'] != null && response['status']) {
        if (response['data']['offer_type_id'].toString() == '2') {
          response['data']['data']['data'].forEach((dis) {
            offerCombo.add(ComboOfferItemModel.fromJson(dis));
          });
          response['data']['data'] = [];
        }
        offerDetails = OfferDetailsModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return {OfferType.offer: offerDetails, OfferType.combo: offerCombo};
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return {OfferType.offer: OfferDetailsModel, OfferType.combo: []}; // Return an empty list or handle the error accordingly
    }
  }

  //OfferDetailsModel data
  static Future<OfferDetailsModel> offerDetailsCatCall(String offerId, String catId) async {
    try {
      OfferDetailsModel offerDetails = OfferDetailsModel();
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}offer-cat-products',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: {'offer_id': offerId, 'category_id': catId},
        isLoadingEnable: true,
      );
      globalLogger.d(response, error: "offerDetails route");
      if (response['status'] != null && response['status']) {
        response['data']['data'] = [response['data']['data']];
        offerDetails = OfferDetailsModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return offerDetails;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return OfferDetailsModel(); // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> concernCall() async {
    try {
      List<ProductAttributeModel> concern = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}concern', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "concern route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          concern.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return concern;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> ingredientCall() async {
    try {
      List<ProductAttributeModel> ingredient = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}ingredient', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "ingredient route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          ingredient.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return ingredient;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> packSizeCall() async {
    try {
      List<ProductAttributeModel> packSize = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}pack-size', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "packSize route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          packSize.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return packSize;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductAttributeModel>> skinTypeCall() async {
    try {
      List<ProductAttributeModel> skinType = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}skin-type', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "skinType route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          skinType.add(ProductAttributeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return skinType;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<BrandModel>> brandCall() async {
    try {
      List<BrandModel> brandList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}brand', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "brand route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          brandList.add(BrandModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return brandList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<CategoryModel>> categoryCall() async {
    try {
      List<CategoryModel> categoryList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}category', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "category route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          categoryList.add(CategoryModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return categoryList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<SizeModel>> sizeCall() async {
    try {
      List<SizeModel> sizeList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}product/unit', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "Size route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
          sizeList.add(SizeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return sizeList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ShadeModel>> shadeCall() async {
    try {
      List<ShadeModel> shadeList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}product/shade?color_id=2', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "shade route");
      if (response['status'] != null && response['status']) {
        response['data']['Shades'].forEach((dis) {
          shadeList.add(ShadeModel.fromJson(dis));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return shadeList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<SingleBlogModel> singleBlogCall(String? blogId) async {
    try {
      SingleBlogModel singleBlog = SingleBlogModel();

      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}blogs/$blogId', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "Single blog route");
      if (response['status'] != null && response['status']) {
        singleBlog = SingleBlogModel.fromJson(response['data']['blog']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return singleBlog;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return SingleBlogModel(); // Return an empty list or handle the error accordingly
    }
  }

  static Future<bool> addBlogComment(dynamic body) async {
    try {
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}blogs/add-comment', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);

      globalLogger.d(response, error: "blog comment Route");
      if (response['status'] != null && response['status']) {
        return response['status'];
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return false;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return false; // Return an empty list or handle the error accordingly
    }
  }

  static Future<CouponModel> addCouponCode(dynamic body) async {
    try {
      CouponModel coupon = CouponModel();
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}coupon', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
      globalLogger.d(response, error: "coupon Route");
      if (response['status'] != null && response['status']) {
        coupon = CouponModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return coupon;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return CouponModel(); // Return an empty list or handle the error accordingly
    }
  }

  //rewardPointCall
  static Future<RewardPointModel> rewardPointCall() async {
    try {
      RewardPointModel rewardPoint = RewardPointModel();
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}getRewardData', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "rewardPoint route");
      if (response['status'] != null && response['status']) {
        rewardPoint = RewardPointModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return rewardPoint;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return RewardPointModel(); // Return an empty list or handle the error accordingly
    }
  }

  //shippingCall
  static Future<ShippingModel> shippingCall() async {
    try {
      ShippingModel shipping = ShippingModel();
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}getShippingCharge', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "shipping route");
      if (response['status'] != null && response['status']) {
        shipping = ShippingModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return shipping;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return ShippingModel(); // Return an empty list or handle the error accordingly
    }
  }

  static Future<TermsConditionModel> termsConditionCall() async {
    try {
      TermsConditionModel termsModel = TermsConditionModel();
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}termcondition', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "TermsCondition route");
      if (response['status'] != null && response['status']) {
        termsModel = TermsConditionModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return termsModel;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return TermsConditionModel(); // Return an empty list or handle the error accordingly
    }
  }

  static Future<TermsConditionModel> privacyPolicyCall() async {
    try {
      TermsConditionModel privacyModel = TermsConditionModel();
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}privacypolicy', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "privacy policy route");
      if (response['status'] != null && response['status']) {
        privacyModel = TermsConditionModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return privacyModel;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return TermsConditionModel(); // Return an empty list or handle the error accordingly
    }
  }

  static Future<TermsConditionModel> returnRefundCall() async {
    try {
      TermsConditionModel returnModel = TermsConditionModel();
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}returnrefund', httpMethod: HttpMethod.get);
      globalLogger.d(response, error: "return refund route");
      if (response['status'] != null && response['status']) {
        returnModel = TermsConditionModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return returnModel;
    } catch (e) {
      globalLogger.e(e);
      return TermsConditionModel();
    }
  }
}
