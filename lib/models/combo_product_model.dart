import 'package:perfecto/models/product_model.dart';

class ComboOfferItemModel {
  String? id;
  String? offerId;
  String? comboProductId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  ComboDetailsModel? comboProducts;

  ComboOfferItemModel({this.id, this.offerId, this.comboProductId, this.status, this.createdAt, this.updatedAt, this.deletedAt, this.comboProducts});

  ComboOfferItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    offerId = json['offer_id'].toString() == 'null' ? '' : json['offer_id'].toString();
    comboProductId = json['combo_product_id'].toString() == 'null' ? '' : json['combo_product_id'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
    comboProducts = json['combo_products'] != null ? ComboDetailsModel.fromJson(json['combo_products']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['offer_id'] = offerId;
    data['combo_product_id'] = comboProductId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (comboProducts != null) {
      data['combo_products'] = comboProducts!.toJson();
    }
    return data;
  }
}

class ComboDetailsModel {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? discountedPrice;
  String? images;
  String? description;
  String? isOptional;
  String? isCombo;
  String? createdAt;
  String? updatedAt;
  List<OfferCombo>? offerCombo;
  List<ComboProductDetails>? comboProductDetails;

  ComboDetailsModel(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.discountedPrice,
      this.images,
      this.description,
      this.isOptional,
      this.isCombo,
      this.createdAt,
      this.updatedAt,
      this.offerCombo,
      this.comboProductDetails});

  ComboDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    slug = json['slug'].toString() == 'null' ? '' : json['slug'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? '' : json['discounted_price'].toString();
    images = json['images'].toString() == 'null' ? '[]' : json['images'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    isOptional = json['is_optional'].toString() == 'null' ? '' : json['is_optional'].toString();
    isCombo = json['is_combo'].toString() == 'null' ? '' : json['is_combo'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    if (json['offer_combo'] != null) {
      offerCombo = <OfferCombo>[];
      json['offer_combo'].forEach((v) {
        offerCombo!.add(OfferCombo.fromJson(v));
      });
    }
    if (json['combo_product_details'] != null) {
      comboProductDetails = <ComboProductDetails>[];
      json['combo_product_details'].forEach((v) {
        comboProductDetails!.add(ComboProductDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['discounted_price'] = discountedPrice;
    data['images'] = images;
    data['description'] = description;
    data['is_optional'] = isOptional;
    data['is_combo'] = isCombo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (offerCombo != null) {
      data['offer_combo'] = offerCombo!.map((v) => v.toJson()).toList();
    }
    if (comboProductDetails != null) {
      data['combo_product_details'] = comboProductDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferCombo {
  String? id;
  String? offerId;
  String? comboProductId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Offer? offer;

  OfferCombo({this.id, this.offerId, this.comboProductId, this.status, this.createdAt, this.updatedAt, this.deletedAt, this.offer});

  OfferCombo.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    offerId = json['offer_id'].toString() == 'null' ? '' : json['offer_id'].toString();
    comboProductId = json['combo_product_id'].toString() == 'null' ? '' : json['combo_product_id'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['offer_id'] = offerId;
    data['combo_product_id'] = comboProductId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (offer != null) {
      data['offer'] = offer!.toJson();
    }
    return data;
  }
}

class Offer {
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

  Offer(
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

  Offer.fromJson(Map<String, dynamic> json) {
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

class ComboProductDetails {
  String? id;
  String? comboProductId;
  String? productId;
  String? createdAt;
  String? updatedAt;
  List<ComboProductInfos>? comboProductInfos; // 1ml, 2ml
  ProductModel? product;
  String? variantId; //1ml

  ComboProductDetails({this.id, this.comboProductId, this.productId, this.createdAt, this.updatedAt, this.comboProductInfos, this.product, this.variantId});

  ComboProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    comboProductId = json['combo_product_id'].toString() == 'null' ? '' : json['combo_product_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    if (json['combo_product_infos'] != null) {
      comboProductInfos = <ComboProductInfos>[];
      json['combo_product_infos'].forEach((v) {
        comboProductInfos!.add(ComboProductInfos.fromJson(v));
      });
    }
    product = json['product'] != null ? ProductModel.fromJson(json['product']) : null;

    variantId = json['variant_id'].toString() == 'null' ? '' : json['variant_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['combo_product_id'] = comboProductId;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (comboProductInfos != null) {
      data['combo_product_infos'] = comboProductInfos!.map((v) => v.toJson()).toList();
    }

    if (product != null) {
      data['product'] = product!.toJson();
    }

    data['variant_id'] = variantId;
    return data;
  }
}

class ComboProductInfos {
  String? id;
  String? comboProductDetailId;
  String? comboProductId;
  String? categoryId;
  String? productId;
  String? variantType;
  String? price;
  String? sizeId;
  String? shadeId;
  String? quantity;
  String? createdAt;
  String? updatedAt;
  Shade? shade;
  Size? size;

  ComboProductInfos(
      {this.id,
      this.comboProductDetailId,
      this.comboProductId,
      this.categoryId,
      this.productId,
      this.variantType,
      this.price,
      this.sizeId,
      this.shadeId,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.shade,
      this.size});

  ComboProductInfos.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    comboProductDetailId = json['combo_product_detail_id'].toString() == 'null' ? '' : json['combo_product_detail_id'].toString();
    comboProductId = json['combo_product_id'].toString() == 'null' ? '' : json['combo_product_id'].toString();
    categoryId = json['category_id'].toString() == 'null' ? '' : json['category_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    variantType = json['variant_type'].toString() == 'null' ? '' : json['variant_type'].toString();
    price = json['price'].toString() == 'null' ? '' : json['price'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? '' : json['shade_id'].toString();
    quantity = json['quantity'].toString() == 'null' ? '' : json['quantity'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    shade = json['shade'] != null ? Shade.fromJson(json['shade']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['combo_product_detail_id'] = comboProductDetailId;
    data['combo_product_id'] = comboProductId;
    data['category_id'] = categoryId;
    data['product_id'] = productId;
    data['variant_type'] = variantType;
    data['price'] = price;
    data['size_id'] = sizeId;
    data['shade_id'] = shadeId;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (shade != null) {
      data['shade'] = shade!.toJson();
    }
    if (size != null) {
      data['size'] = size!.toJson();
    }
    return data;
  }
}
