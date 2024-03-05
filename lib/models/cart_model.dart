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
  String? comboProductId;
  List<ComboInfo>? comboInfo;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;
  List<Offers>? offers;
  ComboDetailsModel? comboProduct;
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
      this.comboProductId,
      this.comboInfo,
      this.createdAt,
      this.updatedAt,
      this.product,
      this.offers,
      this.comboProduct,
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
