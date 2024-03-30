import 'package:perfecto/models/product_model.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? isGoogleLogin;
  String? rewardPoints;

  UserModel({this.name, this.email, this.phone, this.avatar, this.rewardPoints});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    email = json['email'].toString() == 'null' ? '' : json['email'].toString();
    phone = json['phone'].toString() == 'null' ? '' : json['phone'].toString();
    avatar = json['avatar'].toString() == 'null' ? '' : json['avatar'].toString();
    isGoogleLogin = json['is_google_login'].toString() == 'null' ? '0' : json['is_google_login'].toString();
    rewardPoints = json['reward_points'].toString() == 'null' ? '0' : json['reward_points'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['is_google_login'] = isGoogleLogin;
    data['reward_points'] = rewardPoints;
    return data;
  }
}

class WishListModel {
  String? id;
  String? productId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  WishListModel({this.id, this.productId, this.userId, this.createdAt, this.updatedAt, this.product});

  WishListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    product = json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ReviewListModel {
  String? id;
  String? userId;
  String? productId;
  String? orderId;
  String? title;
  String? comment;
  String? star;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  ProductDetails? product;

  ReviewListModel({this.id, this.userId, this.productId, this.orderId, this.title, this.comment, this.star, this.image, this.status, this.createdAt, this.updatedAt, this.product});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    orderId = json['order_id'].toString() == 'null' ? '' : json['order_id'].toString();
    title = json['title'].toString() == 'null' ? '' : json['title'].toString();
    comment = json['comment'].toString() == 'null' ? '' : json['comment'].toString();
    star = json['star'].toString() == 'null' ? '' : json['star'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    product = json['product'] != null ? ProductDetails.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['order_id'] = orderId;
    data['title'] = title;
    data['comment'] = comment;
    data['star'] = star;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  String? name;
  String? image;
  String? price;
  String? discountPrice;
  String? brandId;
  String? categoryId;
  String? brandName;
  String? categoryName;

  ProductDetails({this.name, this.image, this.price, this.discountPrice, this.brandId, this.categoryId, this.brandName, this.categoryName});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    discountPrice = json['discount_price'];
    brandId = json['brand_id'];
    categoryId = json['category_id'];
    brandName = json['brand_name'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['brand_id'] = brandId;
    data['category_id'] = categoryId;
    data['brand_name'] = brandName;
    data['category_name'] = categoryName;
    return data;
  }
}
