import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';

class HomeService {
  static Future<List<BlogModel>> blogCall() async {
    List<BlogModel> blogList = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}blogs', httpMethod: HttpMethod.get);
    globalLogger.d(response, "blog route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        blogList.add(BlogModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return blogList;
  }

  static Future<List<ProductAttributeModel>> preferenceCall() async {
    List<ProductAttributeModel> preference = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}preference', httpMethod: HttpMethod.get);
    globalLogger.d(response, "preference route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        preference.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return preference;
  }

  static Future<List<ProductAttributeModel>> formulationCall() async {
    List<ProductAttributeModel> formulation = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}formulation', httpMethod: HttpMethod.get);
    globalLogger.d(response, "formulation route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        formulation.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return formulation;
  }

  static Future<List<ProductAttributeModel>> finishCall() async {
    List<ProductAttributeModel> finish = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}finish', httpMethod: HttpMethod.get);
    globalLogger.d(response, "finish route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        finish.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return finish;
  }

  static Future<List<ProductAttributeModel>> countryCall() async {
    List<ProductAttributeModel> country = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}country', httpMethod: HttpMethod.get);
    globalLogger.d(response, "country route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        country.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return country;
  }

  static Future<List<ProductAttributeModel>> genderCall() async {
    List<ProductAttributeModel> gender = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}gender', httpMethod: HttpMethod.get);
    globalLogger.d(response, "gender route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        gender.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return gender;
  }

  static Future<List<ProductAttributeModel>> coverageCall() async {
    List<ProductAttributeModel> coverage = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}coverage', httpMethod: HttpMethod.get);
    globalLogger.d(response, "coverage route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        coverage.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return coverage;
  }

  static Future<List<ProductAttributeModel>> benefitCall() async {
    List<ProductAttributeModel> benefit = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}benefit', httpMethod: HttpMethod.get);
    globalLogger.d(response, "benefit route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        benefit.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return benefit;
  }

  static Future<List<ProductAttributeModel>> concernCall() async {
    List<ProductAttributeModel> concern = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}concern', httpMethod: HttpMethod.get);
    globalLogger.d(response, "concern route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        concern.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return concern;
  }

  static Future<List<ProductAttributeModel>> ingredientCall() async {
    List<ProductAttributeModel> ingredient = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}ingredient', httpMethod: HttpMethod.get);
    globalLogger.d(response, "ingredient route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        ingredient.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return ingredient;
  }

  static Future<List<ProductAttributeModel>> packSizeCall() async {
    List<ProductAttributeModel> packSize = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}pack-size', httpMethod: HttpMethod.get);
    globalLogger.d(response, "packSize route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        packSize.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return packSize;
  }

  static Future<List<ProductAttributeModel>> skinTypeCall() async {
    List<ProductAttributeModel> skinType = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}skin-type', httpMethod: HttpMethod.get);
    globalLogger.d(response, "skinType route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        skinType.add(ProductAttributeModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return skinType;
  }

  static Future<List<BrandModel>> brandCall() async {
    List<BrandModel> brandList = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}brand', httpMethod: HttpMethod.get);
    globalLogger.d(response, "brand route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        brandList.add(BrandModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return brandList;
  }

  static Future<List<CategoryModel>> categoryCall() async {
    List<CategoryModel> categoryList = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}category', httpMethod: HttpMethod.get);
    globalLogger.d(response, "category route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        categoryList.add(CategoryModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return categoryList;
  }

  static Future<SingleBlogModel> singleBlogCall(String? blogId) async {
    SingleBlogModel singleBlog = SingleBlogModel();

    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}blogs/$blogId', httpMethod: HttpMethod.get);
    globalLogger.d(response, "Single blog route");
    if (response['status'] != null && response['status']) {
      singleBlog = SingleBlogModel.fromJson(response['data']['blog']);
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return singleBlog;
  }



  static Future<bool> addBlogComment(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}blogs/add-comment',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        isLoadingEnable: true);
    globalLogger.d(response, "blog comment Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<TermsConditionModel> termsConditionCall() async {
    TermsConditionModel termsModel = TermsConditionModel();
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}termcondition', httpMethod: HttpMethod.get);
    globalLogger.d(response, "TermsCondition route");
    if (response['status'] != null && response['status']) {
      termsModel = TermsConditionModel.fromJson(response['data']);
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return termsModel;
  }
}
