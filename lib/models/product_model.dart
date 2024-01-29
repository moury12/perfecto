class ProductModel {
  String? id;
  String? name;
  String? brandId;
  String? categoryId;
  String? subCategoryId;
  String? subSubCategoryId;
  List<String>? sizeId;
  List<String>? mainColorId;
  List<String>? preferenceId;
  String? formulationId;
  List<String>? finishId;
  String? countryId;
  List<String>? genderId;
  String? coverageId;
  List<String>? benefitId;
  List<String>? concernId;
  List<String>? ingredientId;
  String? skinTypeId;
  List<String>? packId;
  String? faq;
  String? variationType;
  String? price;
  String? discountAmount;
  String? discountPercent;
  String? discountPrice;
  String? image;
  String? tax;
  String? shortDescription;
  String? description;
  String? howToUse;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? reviewsCount;
  String? reviewsAvgStar;
  List<AllShadesByProduct>? allShadesByProduct;
  String? allShadesCount;
  String? sizeCount;
  List<ProductSizes>? productSizes;
  List<Reviews>? reviews;
  List<ProductImages>? productImages;

  ProductModel(
      {this.id,
      this.name,
      this.brandId,
      this.categoryId,
      this.subCategoryId,
      this.subSubCategoryId,
      this.sizeId,
      this.mainColorId,
      this.preferenceId,
      this.formulationId,
      this.finishId,
      this.countryId,
      this.genderId,
      this.coverageId,
      this.benefitId,
      this.concernId,
      this.ingredientId,
      this.skinTypeId,
      this.packId,
      this.faq,
      this.variationType,
      this.price,
      this.discountAmount,
      this.discountPercent,
      this.discountPrice,
      this.image,
      this.tax,
      this.shortDescription,
      this.description,
      this.howToUse,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.reviewsCount,
      this.reviewsAvgStar,
      this.allShadesByProduct,
      this.allShadesCount,
      this.sizeCount,
      this.productSizes,
      this.reviews,
      this.productImages});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    brandId = json['brand_id'].toString() == 'null' ? '' : json['brand_id'].toString();
    categoryId = json['category_id'].toString() == 'null' ? '' : json['category_id'].toString();
    subCategoryId = json['sub_category_id'].toString() == 'null' ? '' : json['sub_category_id'].toString();
    subSubCategoryId = json['sub_sub_category_id'].toString() == 'null' ? '' : json['sub_sub_category_id'].toString();
    sizeId = json['size_id'] == null ? [] : json['size_id'].cast<String>();
    mainColorId = json['main_color_id'] == null ? [] : json['main_color_id'].cast<String>();
    preferenceId = json['preference_id'] == null ? [] : json['preference_id'].cast<String>();
    formulationId = json['formulation_id'].toString() == 'null' ? '' : json['formulation_id'].toString();
    finishId = json['finish_id'] == null ? [] : json['finish_id'].cast<String>();
    countryId = json['country_id'].toString() == 'null' ? '' : json['country_id'].toString();
    genderId = json['gender_id'] == null ? [] : json['gender_id'].cast<String>();
    coverageId = json['coverage_id'].toString() == 'null' ? '' : json['coverage_id'].toString();
    benefitId = json['benefit_id'] == null ? [] : json['benefit_id'].cast<String>();
    concernId = json['concern_id'] == null ? [] : json['concern_id'].cast<String>();
    ingredientId = json['ingredient_id'] == null ? [] : json['ingredient_id'].cast<String>();
    skinTypeId = json['skin_type_id'].toString() == 'null' ? '' : json['skin_type_id'].toString();
    packId = json['pack_id'] == null ? [] : json['pack_id'].cast<String>();
    faq = json['faq'].toString() == 'null' ? '' : json['faq'].toString();
    variationType = json['variation_type'].toString() == 'null' ? '' : json['variation_type'].toString();
    price = json['price'].toString() == 'null' ? '' : json['price'].toString();
    discountAmount = json['discount_amount'].toString() == 'null' ? '' : json['discount_amount'].toString();
    discountPercent = json['discount_percent'].toString() == 'null' ? '' : json['discount_percent'].toString();
    discountPrice = json['discount_price'].toString() == 'null' ? '' : json['discount_price'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    tax = json['tax'].toString() == 'null' ? '' : json['tax'].toString();
    shortDescription = json['short_description'].toString() == 'null' ? '' : json['short_description'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    howToUse = json['how_to_use'].toString() == 'null' ? '' : json['how_to_use'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    reviewsCount = json['reviews_count'].toString() == 'null' ? '0' : json['reviews_count'].toString();
    reviewsAvgStar = json['reviews_avg_star'].toString() == 'null' ? '0' : json['reviews_avg_star'].toString();
    if (json['all_shades_by_product'] != null) {
      allShadesByProduct = <AllShadesByProduct>[];
      json['all_shades_by_product'].forEach((v) {
        allShadesByProduct!.add(AllShadesByProduct.fromJson(v));
      });
    }
    allShadesCount = json['all_shades_count'].toString() == 'null' ? '' : json['all_shades_count'].toString();
    sizeCount = json['size_count'].toString() == 'null' ? '' : json['size_count'].toString();
    if (json['product_sizes'] != null) {
      productSizes = <ProductSizes>[];
      json['product_sizes'].forEach((v) {
        productSizes!.add(ProductSizes.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['brand_id'] = brandId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['sub_sub_category_id'] = subSubCategoryId;
    data['size_id'] = sizeId;
    data['main_color_id'] = mainColorId;
    data['preference_id'] = preferenceId;
    data['formulation_id'] = formulationId;
    data['finish_id'] = finishId;
    data['country_id'] = countryId;
    data['gender_id'] = genderId;
    data['coverage_id'] = coverageId;
    data['benefit_id'] = benefitId;
    data['concern_id'] = concernId;
    data['ingredient_id'] = ingredientId;
    data['skin_type_id'] = skinTypeId;
    data['pack_id'] = packId;
    data['faq'] = faq;
    data['variation_type'] = variationType;
    data['price'] = price;
    data['discount_amount'] = discountAmount;
    data['discount_percent'] = discountPercent;
    data['discount_price'] = discountPrice;
    data['image'] = image;
    data['tax'] = tax;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['how_to_use'] = howToUse;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['reviews_count'] = reviewsCount;
    data['reviews_avg_star'] = reviewsAvgStar;
    if (allShadesByProduct != null) {
      data['all_shades_by_product'] = allShadesByProduct!.map((v) => v.toJson()).toList();
    }
    data['all_shades_count'] = allShadesCount;
    data['size_count'] = sizeCount;
    if (productSizes != null) {
      data['product_sizes'] = productSizes!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (productImages != null) {
      data['product_images'] = productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllShadesByProduct {
  String? id;
  String? name;
  String? image;
  String? status;
  String? colorId;
  String? createdAt;
  String? updatedAt;

  AllShadesByProduct({this.id, this.name, this.image, this.status, this.colorId, this.createdAt, this.updatedAt});

  AllShadesByProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    colorId = json['color_id'].toString() == 'null' ? '' : json['color_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['color_id'] = colorId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProductSizes {
  String? id;
  String? productId;
  String? sizeId;
  String? sizePrice;
  String? createdAt;
  String? updatedAt;
  Size? size;

  ProductSizes({this.id, this.productId, this.sizeId, this.sizePrice, this.createdAt, this.updatedAt, this.size});

  ProductSizes.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    sizePrice = json['size_price'].toString() == 'null' ? '' : json['size_price'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['size_id'] = sizeId;
    data['size_price'] = sizePrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (size != null) {
      data['size'] = size!.toJson();
    }
    return data;
  }
}

class Size {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Size({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Reviews {
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

  Reviews({this.id, this.userId, this.productId, this.orderId, this.title, this.comment, this.star, this.image, this.status, this.createdAt, this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class ProductImages {
  String? id;
  String? productId;
  List<String>? colorId;
  String? productImage;
  String? createdAt;
  String? updatedAt;
  List<ProductShadeImages>? productShadeImages;

  ProductImages({this.id, this.productId, this.colorId, this.productImage, this.createdAt, this.updatedAt, this.productShadeImages});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    colorId = json['color_id'] == null ? [] : json['color_id'].cast<String>();
    productImage = json['product_image'].toString() == 'null' ? '' : json['product_image'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    if (json['product_shade_images'] != null) {
      productShadeImages = <ProductShadeImages>[];
      json['product_shade_images'].forEach((v) {
        productShadeImages!.add(ProductShadeImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['color_id'] = colorId;
    data['product_image'] = productImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productShadeImages != null) {
      data['product_shade_images'] = productShadeImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductShadeImages {
  String? id;
  String? shadeId;
  String? productId;
  String? productImageId;
  String? shadePrice;
  String? shadeImage;
  String? createdAt;
  String? updatedAt;
  AllShadesByProduct? shade;

  ProductShadeImages({this.id, this.shadeId, this.productId, this.productImageId, this.shadePrice, this.shadeImage, this.createdAt, this.updatedAt, this.shade});

  ProductShadeImages.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? '' : json['shade_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    productImageId = json['product_image_id'].toString() == 'null' ? '' : json['product_image_id'].toString();
    shadePrice = json['shade_price'].toString() == 'null' ? '' : json['shade_price'].toString();
    shadeImage = json['shade_image'].toString() == 'null' ? '' : json['shade_image'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    shade = json['shade'] != null ? AllShadesByProduct.fromJson(json['shade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shade_id'] = shadeId;
    data['product_id'] = productId;
    data['product_image_id'] = productImageId;
    data['shade_price'] = shadePrice;
    data['shade_image'] = shadeImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (shade != null) {
      data['shade'] = shade!.toJson();
    }
    return data;
  }
}
