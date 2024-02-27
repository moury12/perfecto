import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/home_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/shade_model.dart';
import 'package:perfecto/models/shade_model.dart';
import 'package:perfecto/models/shade_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';
import 'package:perfecto/pages/home/controller/home_controller.dart';

class HomeService {
  static Future<List<BlogModel>> blogCall() async {
    try {
      List<BlogModel> blogList = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}blogs', httpMethod: HttpMethod.get);
      globalLogger.d(response, "blog route");
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
      globalLogger.d(response, "home route");
      if (response['status'] != null && response['status']) {
        (response['data'] as List).insert(1, {'id': 'cat'});
        response['data'].forEach((dis) {
          try {
            if (HomeController.to.productListId.contains(dis['id'].toString())) {
              globalLogger.d(HomeController.to.productListId, "product_list section id list");
              dis['product_list'] = dis['section_data'];
              dis['section_data'] = [];
            }
            if (dis['section_data'].runtimeType.toString() == '_Map<String, dynamic>') {
              dis['section_data'] = [dis['section_data']];
            }
            homeList.add(HomeModel.fromJson(dis));
          } catch (e) {
            globalLogger.d(dis['section_data'].runtimeType, "home route");
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
      globalLogger.d(response, "preference route");
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
      globalLogger.d(response, "outletList route");
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
      globalLogger.d(response, "product color");
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
      globalLogger.d(response, "formulation route");
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
      globalLogger.d(response, "finish route");
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
      globalLogger.d(response, "country route");
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
      globalLogger.d(response, "gender route");
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
      globalLogger.d(response, "coverage route");
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
      globalLogger.d(response, "benefit route");
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

  static Future<List<ProductAttributeModel>> concernCall() async {
    try {
      List<ProductAttributeModel> concern = [];
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}concern', httpMethod: HttpMethod.get);
      globalLogger.d(response, "concern route");
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
      globalLogger.d(response, "ingredient route");
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
      globalLogger.d(response, "packSize route");
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
      globalLogger.d(response, "skinType route");
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
      globalLogger.d(response, "brand route");
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
      globalLogger.d(response, "category route");
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
      globalLogger.d(response, "Size route");
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
      globalLogger.d(response, "shade route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((dis) {
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
      globalLogger.d(response, "Single blog route");
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

      globalLogger.d(response, "blog comment Route");
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

  static Future<bool> addCuponCode(dynamic body) async {
    try {
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}coupon', httpMethod: HttpMethod.multipartFilePost, allInfoField: body, isLoadingEnable: true);
      globalLogger.d(response, "coupon Route");
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

  static Future<TermsConditionModel> termsConditionCall() async {
    try {
      TermsConditionModel termsModel = TermsConditionModel();
      final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}termcondition', httpMethod: HttpMethod.get);
      globalLogger.d(response, "TermsCondition route");
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
      globalLogger.d(response, "privacy policy route");
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
      globalLogger.d(response, "return refund route");
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
