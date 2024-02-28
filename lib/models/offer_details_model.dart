import 'package:perfecto/models/product_model.dart';

class OfferDetailsModel {
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
  List<CategoryData>? data;

  OfferDetailsModel(
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
      this.deletedAt,
      this.data});

  OfferDetailsModel.fromJson(Map<String, dynamic> json) {
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
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
      });
    }
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  String? id;
  String? name;
  String? image;
  String? status;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? icon;
  Products? products;

  CategoryData({this.id, this.name, this.image, this.status, this.parentId, this.createdAt, this.updatedAt, this.icon, this.products});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    parentId = json['parent_id'].toString() == 'null' ? '' : json['parent_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    icon = json['icon'].toString() == 'null' ? '' : json['icon'].toString();
    products = json['products'] != null ? Products.fromJson(json['products']) : null;
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
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}

class Products {
  String? currentPage;
  List<ProductModel>? data;
  String? firstPageUrl;
  String? from;
  String? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  String? to;
  String? total;

  Products(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'].toString() == 'null' ? '' : json['current_page'].toString();
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data'].forEach((v) {
        data!.add(ProductModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'].toString() == 'null' ? '' : json['first_page_url'].toString();
    from = json['from'].toString() == 'null' ? '' : json['from'].toString();
    lastPage = json['last_page'].toString() == 'null' ? '' : json['last_page'].toString();
    lastPageUrl = json['last_page_url'].toString() == 'null' ? '' : json['last_page_url'].toString();
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'].toString() == 'null' ? '' : json['next_page_url'].toString();
    path = json['path'].toString() == 'null' ? '' : json['path'].toString();
    perPage = json['per_page'].toString() == 'null' ? '' : json['per_page'].toString();
    prevPageUrl = json['prev_page_url'].toString() == 'null' ? '' : json['prev_page_url'].toString();
    to = json['to'].toString() == 'null' ? '' : json['to'].toString();
    total = json['total'].toString() == 'null' ? '' : json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  String? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'].toString() == 'null' ? '' : json['url'].toString();
    label = json['label'].toString() == 'null' ? '' : json['label'].toString();
    active = json['active'].toString() == 'null' ? '' : json['active'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
