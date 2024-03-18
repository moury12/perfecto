class OrderModel {
  String? id;
  String? userId;
  String? warehouseId;
  String? orderNo;
  String? quantity;
  String? orderNote;
  String? totalDiscountAmount;
  String? totalOfferDiscountAmount;
  String? deliveryCharge;
  String? couponCode;
  String? couponDiscount;
  String? subTotal;
  String? grandTotal;
  String? taxAmount;
  String? rewardPoStrings;
  String? paymentMethod;
  String? paymentStatus;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<List<OrderDetails>>? orderDetails;

  OrderModel(
      {this.id,
      this.userId,
      this.warehouseId,
      this.orderNo,
      this.quantity,
      this.orderNote,
      this.totalDiscountAmount,
      this.totalOfferDiscountAmount,
      this.deliveryCharge,
      this.couponCode,
      this.couponDiscount,
      this.subTotal,
      this.grandTotal,
      this.taxAmount,
      this.rewardPoStrings,
      this.paymentMethod,
      this.paymentStatus,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.orderDetails});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    warehouseId = json['warehouse_id'].toString() == 'null' ? '' : json['warehouse_id'].toString();
    orderNo = json['order_no'].toString() == 'null' ? '' : json['order_no'].toString();
    quantity = json['quantity'].toString() == 'null' ? '' : json['quantity'].toString();
    orderNote = json['order_note'].toString() == 'null' ? '' : json['order_note'].toString();
    totalDiscountAmount = json['total_discount_amount'].toString() == 'null' ? '' : json['total_discount_amount'].toString();
    totalOfferDiscountAmount = json['total_offer_discount_amount'].toString() == 'null' ? '' : json['total_offer_discount_amount'].toString();
    deliveryCharge = json['delivery_charge'].toString() == 'null' ? '' : json['delivery_charge'].toString();
    couponCode = json['coupon_code'].toString() == 'null' ? '' : json['coupon_code'].toString();
    couponDiscount = json['coupon_discount'].toString() == 'null' ? '' : json['coupon_discount'].toString();
    subTotal = json['sub_total'].toString() == 'null' ? '' : json['sub_total'].toString();
    grandTotal = json['grand_total'].toString() == 'null' ? '' : json['grand_total'].toString();
    taxAmount = json['tax_amount'].toString() == 'null' ? '' : json['tax_amount'].toString();
    rewardPoStrings = json['reward_poStrings'].toString() == 'null' ? '' : json['reward_poStrings'].toString();
    paymentMethod = json['payment_method'].toString() == 'null' ? '' : json['payment_method'].toString();
    paymentStatus = json['payment_status'].toString() == 'null' ? '' : json['payment_status'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    if (json['order_details'] != null) {
      orderDetails = <List<OrderDetails>>[];
      for (var i = 0; i < json['order_details'].length; i++) {
        orderDetails!.add(<OrderDetails>[]);
        json['order_details'][i].forEach((e) {
          orderDetails![i].add(OrderDetails.fromJson(e));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['warehouse_id'] = warehouseId;
    data['order_no'] = orderNo;
    data['quantity'] = quantity;
    data['order_note'] = orderNote;
    data['total_discount_amount'] = totalDiscountAmount;
    data['total_offer_discount_amount'] = totalOfferDiscountAmount;
    data['delivery_charge'] = deliveryCharge;
    data['coupon_code'] = couponCode;
    data['coupon_discount'] = couponDiscount;
    data['sub_total'] = subTotal;
    data['grand_total'] = grandTotal;
    data['tax_amount'] = taxAmount;
    data['reward_poStrings'] = rewardPoStrings;
    data['payment_method'] = paymentMethod;
    data['payment_status'] = paymentStatus;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (orderDetails != null) {
      data['order_details'] = orderDetails!.map((v) => v.map((e) => e.toJson()).toList()).toList();
    }
    return data;
  }
}

class OrderDetails {
  String? id;
  String? orderId;
  String? productId;
  String? productName;
  String? productImage;
  String? price;
  String? discountedPrice;
  String? quantity;
  String? comboId;
  String? buyGetId;
  String? normalOfferId;
  String? normalOfferName;
  String? comboOfferId;
  String? comboOfferName;
  String? buyGetOfferId;
  String? buyGetOfferName;
  String? uptoOfferId;
  String? uptoOfferName;
  String? shadeId;
  String? sizeId;
  String? size;
  String? shade;
  String? createdAt;
  String? updatedAt;
  Combo? combo;

  OrderDetails(
      {this.id,
      this.orderId,
      this.productId,
      this.productName,
      this.productImage,
      this.price,
      this.discountedPrice,
      this.quantity,
      this.comboId,
      this.buyGetId,
      this.normalOfferId,
      this.normalOfferName,
      this.comboOfferId,
      this.comboOfferName,
      this.buyGetOfferId,
      this.buyGetOfferName,
      this.uptoOfferId,
      this.uptoOfferName,
      this.shadeId,
      this.sizeId,
      this.size,
      this.shade,
      this.createdAt,
      this.updatedAt,
      this.combo});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    orderId = json['order_id'].toString() == 'null' ? '' : json['order_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    productName = json['product_name'].toString() == 'null' ? '' : json['product_name'].toString();
    productImage = json['product_image'].toString() == 'null' ? '' : json['product_image'].toString();
    price = json['price'].toString() == 'null' ? '' : json['price'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? '' : json['discounted_price'].toString();
    quantity = json['quantity'].toString() == 'null' ? '' : json['quantity'].toString();
    comboId = json['combo_id'].toString() == 'null' ? '' : json['combo_id'].toString();
    buyGetId = json['buy_get_id'].toString() == 'null' ? '' : json['buy_get_id'].toString();
    normalOfferId = json['normal_offer_id'].toString() == 'null' ? '' : json['normal_offer_id'].toString();
    normalOfferName = json['normal_offer_name'].toString() == 'null' ? '' : json['normal_offer_name'].toString();
    comboOfferId = json['combo_offer_id'].toString() == 'null' ? '' : json['combo_offer_id'].toString();
    comboOfferName = json['combo_offer_name'].toString() == 'null' ? '' : json['combo_offer_name'].toString();
    buyGetOfferId = json['buy_get_offer_id'].toString() == 'null' ? '' : json['buy_get_offer_id'].toString();
    buyGetOfferName = json['buy_get_offer_name'].toString() == 'null' ? '' : json['buy_get_offer_name'].toString();
    uptoOfferId = json['upto_offer_id'].toString() == 'null' ? '' : json['upto_offer_id'].toString();
    uptoOfferName = json['upto_offer_name'].toString() == 'null' ? '' : json['upto_offer_name'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? '' : json['shade_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    size = json['size'].toString() == 'null' ? '' : json['size'].toString();
    shade = json['shade'].toString() == 'null' ? '' : json['shade'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    combo = json['combo'] != null ? Combo.fromJson(json['combo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    data['quantity'] = quantity;
    data['combo_id'] = comboId;
    data['buy_get_id'] = buyGetId;
    data['normal_offer_id'] = normalOfferId;
    data['normal_offer_name'] = normalOfferName;
    data['combo_offer_id'] = comboOfferId;
    data['combo_offer_name'] = comboOfferName;
    data['buy_get_offer_id'] = buyGetOfferId;
    data['buy_get_offer_name'] = buyGetOfferName;
    data['upto_offer_id'] = uptoOfferId;
    data['upto_offer_name'] = uptoOfferName;
    data['shade_id'] = shadeId;
    data['size_id'] = sizeId;
    data['size'] = size;
    data['shade'] = shade;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (combo != null) {
      data['combo'] = combo!.toJson();
    }
    return data;
  }
}

class Combo {
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

  Combo({this.id, this.name, this.slug, this.image, this.discountedPrice, this.images, this.description, this.isOptional, this.isCombo, this.createdAt, this.updatedAt});

  Combo.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? 'Combo Product' : json['name'].toString();
    slug = json['slug'].toString() == 'null' ? '' : json['slug'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? '' : json['discounted_price'].toString();
    images = json['images'].toString() == 'null' ? '' : json['images'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    isOptional = json['is_optional'].toString() == 'null' ? '' : json['is_optional'].toString();
    isCombo = json['is_combo'].toString() == 'null' ? '' : json['is_combo'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
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
    return data;
  }
}
