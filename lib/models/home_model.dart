import 'package:perfecto/models/product_model.dart';

class HomeModel {
  String? id;
  String? title;
  String? mobileTitle;
  String? banner;
  String? position;
  String? type;
  String? status;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<SectionData>? sectionData;
  List<ProductModel>? productList;

  HomeModel(
      {this.id,
      this.title,
      this.mobileTitle,
      this.banner,
      this.position,
      this.type,
      this.status,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.sectionData,
      this.productList});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    title = json['title'].toString() == 'null' ? '' : json['title'].toString();
    mobileTitle = json['mobile_title'].toString() == 'null' ? '' : json['mobile_title'].toString();
    banner = json['banner'].toString() == 'null' ? '' : json['banner'].toString();
    position = json['position'].toString() == 'null' ? '' : json['position'].toString();
    type = json['type'].toString() == 'null' ? '' : json['type'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    if (json['section_data'] != null) {
      sectionData = <SectionData>[];
      json['section_data'].forEach((v) {
        sectionData!.add(SectionData.fromJson(v));
      });
    }
    if (json['product_list'] != null) {
      productList = <ProductModel>[];
      json['product_list'].forEach((v) {
        productList!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['mobile_title'] = mobileTitle;
    data['banner'] = banner;
    data['position'] = position;
    data['type'] = type;
    data['status'] = status;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (sectionData != null) {
      data['section_data'] = sectionData!.map((v) => v.toJson()).toList();
    }
    if (productList != null) {
      data['product_list'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionData {
  String? id;
  String? sectionId;
  String? name;
  String? image;
  String? link;
  String? offerId;
  String? status;
  String? description;
  String? createdAt;
  String? updatedAt;
  OfferModel? offers;
  Categories? categories;
  Concerns? concerns;

  SectionData({
    this.id,
    this.sectionId,
    this.name,
    this.image,
    this.link,
    this.offerId,
    this.status,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.offers,
    this.categories,
    this.concerns,
  });

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    sectionId = json['section_id'].toString() == 'null' ? '' : json['section_id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    link = json['link'].toString() == 'null' ? '' : json['link'].toString();
    offerId = json['offer_id'].toString() == 'null' ? '' : json['offer_id'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    offers = json['offers'] != null ? OfferModel.fromJson(json['offers']) : null;
    categories = json['categories'] != null ? Categories.fromJson(json['categories']) : null;
    concerns = json['concerns'] != null ? Concerns.fromJson(json['concerns']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['section_id'] = sectionId;
    data['name'] = name;
    data['image'] = image;
    data['link'] = link;
    data['offer_id'] = offerId;
    data['status'] = status;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (offers != null) {
      data['offers'] = offers!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.toJson();
    }
    if (concerns != null) {
      data['concerns'] = concerns!.toJson();
    }
    return data;
  }
}

class OfferModel {
  String? id;
  String? name;
  String? title1;
  String? title2;
  String? color;
  String? bannerWeb;
  String? bannerMobile;
  String? offerTypeId;
  String? isFreeDelivery;
  String? minAmount;
  String? maxAmount;
  String? startDate;
  String? expiryDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  OfferModel(
      {this.id,
      this.name,
      this.title1,
      this.title2,
      this.color,
      this.bannerWeb,
      this.bannerMobile,
      this.offerTypeId,
      this.isFreeDelivery,
      this.minAmount,
      this.maxAmount,
      this.startDate,
      this.expiryDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    title1 = json['title1'].toString() == 'null' ? '' : json['title1'].toString();
    title2 = json['title2'].toString() == 'null' ? '' : json['title2'].toString();
    color = json['color'].toString() == 'null' ? '' : json['color'].toString();
    bannerWeb = json['banner_web'].toString() == 'null' ? '' : json['banner_web'].toString();
    bannerMobile = json['banner_mobile'].toString() == 'null' ? '' : json['banner_mobile'].toString();
    offerTypeId = json['offer_type_id'].toString() == 'null' ? '' : json['offer_type_id'].toString();
    isFreeDelivery = json['is_free_delivery'].toString() == 'null' ? '' : json['is_free_delivery'].toString();
    minAmount = json['min_amount'].toString() == 'null' ? '' : json['min_amount'].toString();
    maxAmount = json['max_amount'].toString() == 'null' ? '' : json['max_amount'].toString();
    startDate = json['start_date'].toString() == 'null' ? '' : json['start_date'].toString();
    expiryDate = json['expiry_date'].toString() == 'null' ? '' : json['expiry_date'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title1'] = title1;
    data['title2'] = title2;
    data['color'] = color;
    data['banner_web'] = bannerWeb;
    data['banner_mobile'] = bannerMobile;
    data['offer_type_id'] = offerTypeId;
    data['is_free_delivery'] = isFreeDelivery;
    data['min_amount'] = minAmount;
    data['max_amount'] = maxAmount;
    data['start_date'] = startDate;
    data['expiry_date'] = expiryDate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? image;
  String? status;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? icon;

  Categories({this.id, this.name, this.image, this.status, this.parentId, this.createdAt, this.updatedAt, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    parentId = json['parent_id'].toString() == 'null' ? '' : json['parent_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    icon = json['icon'].toString() == 'null' ? '' : json['icon'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['parent_id'] = parentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['icon'] = icon;
    return data;
  }
}

class Concerns {
  String? id;
  String? name;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  Concerns({this.id, this.name, this.image, this.status, this.createdAt, this.updatedAt});

  Concerns.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
