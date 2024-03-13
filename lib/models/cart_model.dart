import 'package:perfecto/models/combo_product_model.dart';
import 'package:perfecto/models/product_model.dart';

class CartModel {
  String? id;
  String? userId;
  String? productId;
  String? sizeId;
  String? colorId;
  String? shadeId;
  String? quantity;
  String? stockStatus;
  String? price;
  String? discountedPrice;
  String? buyGetId;
  String? comboProductId;
  List<ComboInfo>? comboInfo;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;
  List<Offers>? offers;
  ComboDetailsModel? comboProduct;
  BuyGetInfo? buyGetInfo;
  Size? size;
  ColorModel? color;
  Shade? shade;

  CartModel(
      {this.id,
      this.userId,
      this.productId,
      this.sizeId,
      this.colorId,
      this.shadeId,
      this.quantity,
      this.stockStatus,
      this.price,
      this.discountedPrice,
      this.comboProductId,
      this.comboInfo,
      this.createdAt,
      this.updatedAt,
      this.product,
      this.offers,
      this.comboProduct,
      this.buyGetId,
      this.buyGetInfo,
      this.size,
      this.color,
      this.shade});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    colorId = json['color_id'].toString() == 'null' ? '' : json['color_id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? '' : json['shade_id'].toString();
    quantity = json['quantity'].toString() == 'null' ? '' : json['quantity'].toString();
    stockStatus = json['stock_status'].toString() == 'null' ? '' : json['stock_status'].toString();
    price = json['price'].toString() == 'null' ? '' : json['price'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? '' : json['discounted_price'].toString();
    buyGetId = json['buy_get_id'].toString() == 'null' ? '' : json['buy_get_id'].toString();

    comboProductId = json['combo_product_id'].toString() == 'null' ? '' : json['combo_product_id'].toString();
    if (json['combo_info'] != null) {
      comboInfo = <ComboInfo>[];
      json['combo_info'].forEach((v) {
        comboInfo!.add(ComboInfo.fromJson(v));
      });
    }
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    product = json['product'] != null ? ProductModel.fromJson(json['product']) : null;

    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
    comboProduct = json['combo_product'] != null ? ComboDetailsModel.fromJson(json['combo_product']) : null;
    buyGetInfo = json['buy_get_info'] != null ? BuyGetInfo.fromJson(json['buy_get_info']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
    color = json['color'] != null ? ColorModel.fromJson(json['color']) : null;
    shade = json['shade'] != null ? Shade.fromJson(json['shade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['size_id'] = sizeId;
    data['color_id'] = colorId;
    data['shade_id'] = shadeId;
    data['quantity'] = quantity;
    data['stock_status'] = stockStatus;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    data['combo_product_id'] = comboProductId;
    if (comboInfo != null) {
      data['combo_info'] = comboInfo!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    if (comboProduct != null) {
      data['combo_product'] = comboProduct!.toJson();
    }
    if (buyGetInfo != null) {
      data['buy_get_info'] = buyGetInfo!.toJson();
    }
    if (size != null) {
      data['size'] = size!.toJson();
    }
    if (color != null) {
      data['color'] = color!.toJson();
    }
    if (shade != null) {
      data['shade'] = shade!.toJson();
    }
    return data;
  }
}

class ComboInfo {
  String? productId;
  String? sizeId;
  String? shadeId;
  String? productName;
  String? sizeName;
  String? shadeName;

  ComboInfo({this.productId, this.sizeId, this.productName, this.sizeName, this.shadeId, this.shadeName});

  ComboInfo.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? '' : json['shade_id'].toString();
    productName = json['product_name'].toString() == 'null' ? '' : json['product_name'].toString();
    sizeName = json['size_name'].toString() == 'null' ? '' : json['size_name'].toString();
    shadeName = json['shade_name'].toString() == 'null' ? '' : json['shade_name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['size_id'] = sizeId;
    data['shade_id'] = shadeId;
    data['product_name'] = productName;
    data['size_name'] = sizeName;
    data['shade_name'] = shadeName;
    return data;
  }
}

class ColorModel {
  String? id;
  String? name;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  ColorModel({this.id, this.name, this.image, this.status, this.createdAt, this.updatedAt});

  ColorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class BuyGetInfo {
  String? id;
  String? offerId;
  String? buyCategoryId;
  String? buyProductId;
  String? buyVariantType;
  String? buyShadeId;
  List<String>? buySizeId;
  String? buyQuantity;
  String? getCategoryId;
  String? getProductId;
  String? getVariantType;
  String? getShadeId;
  String? getSizeId;
  String? getQuantity;
  String? createdAt;
  String? updatedAt;
  Offer? offer;
  ProductForBuy? productForBuy;
  ProductForBuy? productForGet;
  Size? sizeForGet;
  Shade? shadeForGet;

  BuyGetInfo(
      {this.id,
      this.offerId,
      this.buyCategoryId,
      this.buyProductId,
      this.buyVariantType,
      this.buyShadeId,
      this.buySizeId,
      this.buyQuantity,
      this.getCategoryId,
      this.getProductId,
      this.getVariantType,
      this.getShadeId,
      this.getSizeId,
      this.getQuantity,
      this.createdAt,
      this.updatedAt,
      this.offer,
      this.productForBuy,
      this.productForGet,
      this.sizeForGet,
      this.shadeForGet});

  BuyGetInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    offerId = json['offer_id'].toString() == 'null' ? '' : json['offer_id'].toString();
    buyCategoryId = json['buy_category_id'].toString() == 'null' ? '' : json['buy_category_id'].toString();
    buyProductId = json['buy_product_id'].toString() == 'null' ? '' : json['buy_product_id'].toString();
    buyVariantType = json['buy_variant_type'].toString() == 'null' ? '' : json['buy_variant_type'].toString();
    buyShadeId = json['buy_shade_id'].toString() == 'null' ? '' : json['buy_shade_id'].toString();
    buySizeId = json['buy_size_id'].cast<String>();
    buyQuantity = json['buy_quantity'].toString() == 'null' ? '' : json['buy_quantity'].toString();
    getCategoryId = json['get_category_id'].toString() == 'null' ? '' : json['get_category_id'].toString();
    getProductId = json['get_product_id'].toString() == 'null' ? '' : json['get_product_id'].toString();
    getVariantType = json['get_variant_type'].toString() == 'null' ? '' : json['get_variant_type'].toString();
    getShadeId = json['get_shade_id'].toString() == 'null' ? '' : json['get_shade_id'].toString();
    getSizeId = json['get_size_id'].toString() == 'null' ? '' : json['get_size_id'].toString();
    getQuantity = json['get_quantity'].toString() == 'null' ? '' : json['get_quantity'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
    productForBuy = json['product_for_buy'] != null ? ProductForBuy.fromJson(json['product_for_buy']) : null;
    productForGet = json['product_for_get'] != null ? ProductForBuy.fromJson(json['product_for_get']) : null;
    sizeForGet = json['size_for_get'] != null ? Size.fromJson(json['size_for_get']) : null;
    shadeForGet = json['shade_for_get'] != null ? Shade.fromJson(json['shade_for_get']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['offer_id'] = offerId;
    data['buy_category_id'] = buyCategoryId;
    data['buy_product_id'] = buyProductId;
    data['buy_variant_type'] = buyVariantType;
    data['buy_shade_id'] = buyShadeId;
    data['buy_size_id'] = buySizeId;
    data['buy_quantity'] = buyQuantity;
    data['get_category_id'] = getCategoryId;
    data['get_product_id'] = getProductId;
    data['get_variant_type'] = getVariantType;
    data['get_shade_id'] = getShadeId;
    data['get_size_id'] = getSizeId;
    data['get_quantity'] = getQuantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (offer != null) {
      data['offer'] = offer!.toJson();
    }
    if (productForBuy != null) {
      data['product_for_buy'] = productForBuy!.toJson();
    }
    if (productForGet != null) {
      data['product_for_get'] = productForGet!.toJson();
    }
    if (sizeForGet != null) {
      data['size_for_get'] = sizeForGet!.toJson();
    }
    data['shade_for_get'] = shadeForGet;
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
  String? percentage;
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
      this.percentage,
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
    percentage = json['percentage'].toString() == 'null' ? '' : json['percentage'].toString();
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
    data['percentage'] = percentage;
    data['start_date'] = startDate;
    data['expiry_date'] = expiryDate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class ProductForBuy {
  String? id;
  String? name;
  String? image;

  ProductForBuy({this.id, this.name, this.image});

  ProductForBuy.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
