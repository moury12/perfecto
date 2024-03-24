import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/user_model.dart';

class ProductModel {
  String? id;
  String? name;
  String? slug;
  String? brandId;
  String? categoryId;
  String? subCategoryId;
  String? subSubCategoryId;
  List<String>? colorId;
  List<String>? sizeId;
  List<String>? shadeId;
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
  String? comboPrice;
  String? image;
  String? orderId;
  String? reviewEligible;
  Reviews? myReview;
  String? tax;
  String? shortDescription;
  String? description;
  String? ingredientDescription;
  String? howToUse;
  String? isFreeDelivery;
  String? isCombo;
  String? bestSale;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? reviewsCount;
  String? reviewsAvgStar;
  List<ProductAttributeModel>? colors;
  List<ProductAttributeModel>? preferences;
  List<ProductAttributeModel>? finishes;
  List<ProductAttributeModel>? genders;
  List<ProductAttributeModel>? ingredients;
  List<ProductAttributeModel>? benefits;
  List<ProductAttributeModel>? concerns;
  List<ProductAttributeModel>? packs;
  OffersMain? offers;
  String? allShadesCount;
  String? allSizesCount;
  String? totalStock;
  List<ProductShades>? productShades;
  List<ProductSizes>? productSizes;
  List<Reviews>? reviews;
  NameModel? brand;
  NameModel? category;
  NameModel? subCategory;
  NameModel? subSubCategory;
  NameModel? formulation;
  NameModel? country;
  NameModel? coverage;
  NameModel? skinType;

  ProductModel(
      {this.id,
      this.name,
      this.slug,
      this.brandId,
      this.categoryId,
      this.subCategoryId,
      this.subSubCategoryId,
      this.colorId,
      this.sizeId,
      this.shadeId,
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
      this.comboPrice,
      this.image,
      this.orderId,
      this.reviewEligible,
      this.myReview,
      this.tax,
      this.shortDescription,
      this.description,
      this.ingredientDescription,
      this.howToUse,
      this.isFreeDelivery,
      this.bestSale,
      this.isCombo,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.reviewsCount,
      this.reviewsAvgStar,
      this.colors,
      this.preferences,
      this.finishes,
      this.genders,
      this.ingredients,
      this.benefits,
      this.concerns,
      this.packs,
      this.offers,
      this.allShadesCount,
      this.allSizesCount,
      this.totalStock,
      this.productShades,
      this.productSizes,
      this.reviews,
      this.brand,
      this.category,
      this.subCategory,
      this.subSubCategory,
      this.formulation,
      this.country,
      this.coverage,
      this.skinType});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    slug = json['slug'].toString() == 'null' ? '' : json['slug'].toString();
    brandId = json['brand_id'].toString() == 'null' ? '' : json['brand_id'].toString();
    categoryId = json['category_id'].toString() == 'null' ? '' : json['category_id'].toString();
    subCategoryId = json['sub_category_id'].toString() == 'null' ? '' : json['sub_category_id'].toString();
    subSubCategoryId = json['sub_sub_category_id'].toString() == 'null' ? '' : json['sub_sub_category_id'].toString();
    colorId = json['color_id'] != null ? json['color_id'].cast<String>() : [];
    sizeId = json['size_id'] != null ? json['size_id'].cast<String>() : [];
    shadeId = json['shade_id'] != null ? json['shade_id'].cast<String>() : [];
    preferenceId = json['preference_id'] != null ? json['preference_id'].cast<String>() : [];
    formulationId = json['formulation_id'].toString() == 'null' ? '' : json['formulation_id'].toString();
    finishId = json['finish_id'] != null ? json['finish_id'].cast<String>() : [];
    countryId = json['country_id'].toString() == 'null' ? '' : json['country_id'].toString();
    genderId = json['gender_id'] != null ? json['gender_id'].cast<String>() : [];
    coverageId = json['coverage_id'].toString() == 'null' ? '' : json['coverage_id'].toString();
    benefitId = json['benefit_id'] != null ? json['benefit_id'].cast<String>() : [];
    concernId = json['concern_id'] != null ? json['concern_id'].cast<String>() : [];
    ingredientId = json['ingredient_id'] != null ? json['ingredient_id'].cast<String>() : [];
    skinTypeId = json['skin_type_id'].toString() == 'null' ? '' : json['skin_type_id'].toString();
    packId = json['pack_id'] != null ? json['pack_id'].cast<String>() : [];
    faq = json['faq'].toString() == 'null' ? '' : json['faq'].toString();
    variationType = json['variation_type'].toString() == 'null' ? '' : json['variation_type'].toString();
    price = json['price'].toString() == 'null' ? '' : json['price'].toString();
    discountAmount = json['discount_amount'].toString() == 'null' ? '0' : json['discount_amount'].toString();
    discountPercent = json['discount_percent'].toString() == 'null' ? '0' : json['discount_percent'].toString();
    discountPrice = json['discount_price'].toString() == 'null' ? '0' : json['discount_price'].toString();
    comboPrice = json['discounted_price'].toString() == 'null' ? '0' : json['discounted_price'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    orderId = json['order_id'].toString() == 'null' ? '' : json['order_id'].toString();
    reviewEligible = json['review_eligible'].toString() == 'null' ? '' : json['review_eligible'].toString();
    myReview = json['my_review'] != null ? Reviews.fromJson(json['my_review']) : null;
    tax = json['tax'].toString() == 'null' ? '' : json['tax'].toString();
    shortDescription = json['short_description'].toString() == 'null' ? '' : json['short_description'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    ingredientDescription = json['ingredient_description'].toString() == 'null' ? '' : json['ingredient_description'].toString();
    howToUse = json['how_to_use'].toString() == 'null' ? '' : json['how_to_use'].toString();
    isFreeDelivery = json['is_free_delivery'].toString() == 'null' ? '' : json['is_free_delivery'].toString();
    bestSale = json['best_sale'].toString() == 'null' ? '0' : json['best_sale'].toString();
    isCombo = json['is_combo'].toString() == 'null' ? '' : json['is_combo'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    reviewsCount = json['reviews_count'].toString() == 'null' ? '' : json['reviews_count'].toString();
    reviewsAvgStar = json['reviews_avg_star'].toString() == 'null' ? '0' : json['reviews_avg_star'].toString();
    if (json['colors'] != null) {
      colors = <ProductAttributeModel>[];
      json['colors'].forEach((v) {
        colors!.add(ProductAttributeModel.fromJson(v));
      });
    }
    if (json['preferences'] != null) {
      preferences = <ProductAttributeModel>[];
      json['preferences'].forEach((v) {
        preferences!.add(ProductAttributeModel.fromJson(v));
      });
    }
    if (json['finishes'] != null) {
      finishes = <ProductAttributeModel>[];
      json['finishes'].forEach((v) {
        finishes!.add(ProductAttributeModel.fromJson(v));
      });
    }
    if (json['genders'] != null) {
      genders = <ProductAttributeModel>[];
      json['genders'].forEach((v) {
        genders!.add(ProductAttributeModel.fromJson(v));
      });
    }
    if (json['ingredients'] != null) {
      ingredients = <ProductAttributeModel>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(ProductAttributeModel.fromJson(v));
      });
    }
    if (json['benefits'] != null) {
      benefits = <ProductAttributeModel>[];
      json['benefits'].forEach((v) {
        benefits!.add(ProductAttributeModel.fromJson(v));
      });
    }
    if (json['concerns'] != null) {
      concerns = <ProductAttributeModel>[];
      json['concerns'].forEach((v) {
        concerns!.add(ProductAttributeModel.fromJson(v));
      });
    }
    if (json['packs'] != null) {
      packs = <ProductAttributeModel>[];
      json['packs'].forEach((v) {
        packs!.add(ProductAttributeModel.fromJson(v));
      });
    }
    offers = json['offers'] != null ? OffersMain.fromJson(json['offers']) : null;
    allShadesCount = json['all_shades_count'].toString() == 'null' ? '0' : json['all_shades_count'].toString();
    allSizesCount = json['all_sizes_count'].toString() == 'null' ? '0' : json['all_sizes_count'].toString();
    totalStock = json['total_stock'].toString() == 'null' ? '0' : json['total_stock'].toString();
    if (json['product_shades'] != null) {
      productShades = <ProductShades>[];
      json['product_shades'].forEach((v) {
        productShades!.add(ProductShades.fromJson(v));
      });
    }
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
    brand = json['brand'] != null ? NameModel.fromJson(json['brand']) : null;
    category = json['category'] != null ? NameModel.fromJson(json['category']) : null;
    subCategory = json['sub_category'] != null ? NameModel.fromJson(json['sub_category']) : null;
    subSubCategory = json['sub_sub_category'] != null ? NameModel.fromJson(json['sub_sub_category']) : null;
    formulation = json['formulation'] != null ? NameModel.fromJson(json['formulation']) : null;
    country = json['country'] != null ? NameModel.fromJson(json['country']) : null;
    coverage = json['coverage'] != null ? NameModel.fromJson(json['coverage']) : null;
    skinType = json['skin_type'] != null ? NameModel.fromJson(json['skin_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['brand_id'] = brandId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['sub_sub_category_id'] = subSubCategoryId;
    data['color_id'] = colorId;
    data['size_id'] = sizeId;
    data['shade_id'] = shadeId;
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
    data['discounted_price'] = comboPrice;
    data['image'] = image;
    data['order_id'] = orderId;
    data['review_eligible'] = reviewEligible;
    if (myReview != null) {
      data['my_review'] = myReview!.toJson();
    }
    data['tax'] = tax;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['ingredient_description'] = ingredientDescription;
    data['how_to_use'] = howToUse;
    data['best_sale'] = bestSale;
    data['is_free_delivery'] = isFreeDelivery;
    data['is_combo'] = isCombo;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['reviews_count'] = reviewsCount;
    data['reviews_avg_star'] = reviewsAvgStar;
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (preferences != null) {
      data['preferences'] = preferences!.map((v) => v.toJson()).toList();
    }
    if (finishes != null) {
      data['finishes'] = finishes!.map((v) => v.toJson()).toList();
    }
    if (genders != null) {
      data['genders'] = genders!.map((v) => v.toJson()).toList();
    }
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    if (benefits != null) {
      data['benefits'] = benefits!.map((v) => v.toJson()).toList();
    }
    if (concerns != null) {
      data['concerns'] = concerns!.map((v) => v.toJson()).toList();
    }
    if (packs != null) {
      data['packs'] = packs!.map((v) => v.toJson()).toList();
    }
    if (offers != null) {
      data['offers'] = offers!.toJson();
    }
    data['all_shades_count'] = allShadesCount;
    data['all_sizes_count'] = allSizesCount;
    data['total_stock'] = totalStock;
    if (productShades != null) {
      data['product_shades'] = productShades!.map((v) => v.toJson()).toList();
    }
    if (productSizes != null) {
      data['product_sizes'] = productSizes!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['sub_category'] = subCategory;
    data['sub_sub_category'] = subSubCategory;
    if (formulation != null) {
      data['formulation'] = formulation!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (coverage != null) {
      data['coverage'] = coverage!.toJson();
    }
    if (skinType != null) {
      data['skin_type'] = skinType!.toJson();
    }
    return data;
  }
}

class OffersMain {
  String? count;
  List<OfferDetails>? offerDetails;

  OffersMain({this.count, this.offerDetails});

  OffersMain.fromJson(Map<String, dynamic> json) {
    count = json['count'].toString() == 'null' ? '0' : json['count'].toString();
    if (json['offer_details'] != null) {
      offerDetails = <OfferDetails>[];
      json['offer_details'].forEach((v) {
        offerDetails!.add(OfferDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (offerDetails != null) {
      data['offer_details'] = offerDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferDetails {
  String? title;
  ProductDetails? productDetails;

  OfferDetails({this.title, this.productDetails});

  OfferDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'].toString() == 'null' ? '' : json['title'].toString();
    productDetails = json['product_details'] != null ? ProductDetails.fromJson(json['product_details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (productDetails != null) {
      data['product_details'] = productDetails!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  String? id;
  String? productId;
  String? categoryId;
  String? brandId;
  String? offerId;
  String? productShadeId;
  String? productSizeId;
  String? currentPrice;
  String? discountedPrice;
  String? flatDiscount;
  String? percentDiscount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
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
  Offer? offer;
  String? comboProductId;
  ComboProducts? comboProducts;

  ProductDetails(
      {this.id,
      this.productId,
      this.categoryId,
      this.brandId,
      this.offerId,
      this.productShadeId,
      this.productSizeId,
      this.currentPrice,
      this.discountedPrice,
      this.flatDiscount,
      this.percentDiscount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.offer,
      this.comboProductId,
      this.comboProducts,
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
      this.getQuantity});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    categoryId = json['category_id'].toString() == 'null' ? '' : json['category_id'].toString();
    brandId = json['brand_id'].toString() == 'null' ? '' : json['brand_id'].toString();
    offerId = json['offer_id'].toString() == 'null' ? '' : json['offer_id'].toString();
    productShadeId = json['product_shade_id'].toString() == 'null' ? '' : json['product_shade_id'].toString();
    productSizeId = json['product_size_id'].toString() == 'null' ? '' : json['product_size_id'].toString();
    currentPrice = json['current_price'].toString() == 'null' ? '' : json['current_price'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? '' : json['discounted_price'].toString();
    flatDiscount = json['flat_discount'].toString() == 'null' ? '' : json['flat_discount'].toString();
    percentDiscount = json['percent_discount'].toString() == 'null' ? '' : json['percent_discount'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
    buyCategoryId = json['buy_category_id'].toString() == 'null' ? '' : json['buy_category_id'].toString();
    buyProductId = json['buy_product_id'].toString() == 'null' ? '' : json['buy_product_id'].toString();
    buyVariantType = json['buy_variant_type'].toString() == 'null' ? '' : json['buy_variant_type'].toString();
    buyShadeId = json['buy_shade_id'].toString() == 'null' ? '' : json['buy_shade_id'].toString();
    buySizeId = json['buy_size_id'] != null ? json['buy_size_id'].cast<String>() : [];
    buyQuantity = json['buy_quantity'].toString() == 'null' ? '' : json['buy_quantity'].toString();
    getCategoryId = json['get_category_id'].toString() == 'null' ? '' : json['get_category_id'].toString();
    getProductId = json['get_product_id'].toString() == 'null' ? '' : json['get_product_id'].toString();
    getVariantType = json['get_variant_type'].toString() == 'null' ? '' : json['get_variant_type'].toString();
    getShadeId = json['get_shade_id'].toString() == 'null' ? '' : json['get_shade_id'].toString();
    getSizeId = json['get_size_id'].toString() == 'null' ? '' : json['get_size_id'].toString();
    getQuantity = json['get_quantity'].toString() == 'null' ? '' : json['get_quantity'].toString();

    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
    comboProductId = json['combo_product_id'].toString() == 'null' ? '' : json['combo_product_id'].toString();
    comboProducts = json['combo_products'] != null ? ComboProducts.fromJson(json['combo_products']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['offer_id'] = offerId;
    data['product_shade_id'] = productShadeId;
    data['product_size_id'] = productSizeId;
    data['current_price'] = currentPrice;
    data['discounted_price'] = discountedPrice;
    data['flat_discount'] = flatDiscount;
    data['percent_discount'] = percentDiscount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
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
    if (offer != null) {
      data['offer'] = offer!.toJson();
    }
    data['combo_product_id'] = comboProductId;
    if (comboProducts != null) {
      data['combo_products'] = comboProducts!.toJson();
    }
    return data;
  }
}

class ComboProducts {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? originalPrice;
  String? discountedPrice;
  String? flatDiscount;
  String? images;
  String? description;
  String? isOptional;
  String? isCombo;
  String? createdAt;
  String? updatedAt;

  ComboProducts(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.originalPrice,
      this.discountedPrice,
      this.flatDiscount,
      this.images,
      this.description,
      this.isOptional,
      this.isCombo,
      this.createdAt,
      this.updatedAt});

  ComboProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    slug = json['slug'].toString() == 'null' ? '' : json['slug'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    originalPrice = json['original_price'].toString() == 'null' ? '' : json['original_price'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? '' : json['discounted_price'].toString();
    flatDiscount = json['flat_discount'].toString() == 'null' ? '' : json['flat_discount'].toString();
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
    data['original_price'] = originalPrice;
    data['discounted_price'] = discountedPrice;
    data['flat_discount'] = flatDiscount;
    data['images'] = images;
    data['description'] = description;
    data['is_optional'] = isOptional;
    data['is_combo'] = isCombo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProductShades {
  String? id;
  String? productId;
  String? shadeId;
  String? shadePrice;
  String? discountPercent;
  String? discountedPrice;
  String? flatDiscount;
  String? createdAt;
  String? updatedAt;
  String? stock;
  List<Offers>? offers;
  List<ProductShadeImages>? productShadeImages;
  Shade? shade;

  ProductShades(
      {this.id,
      this.productId,
      this.shadeId,
      this.shadePrice,
      this.discountPercent,
      this.discountedPrice,
      this.flatDiscount,
      this.createdAt,
      this.updatedAt,
      this.stock,
      this.offers,
      this.productShadeImages,
      this.shade});

  ProductShades.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? "" : json['id'].toString();
    productId = json['product_id'].toString() == 'null' ? "" : json['product_id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? "" : json['shade_id'].toString();
    shadePrice = json['shade_price'].toString() == 'null' ? "" : json['shade_price'].toString();
    discountPercent = json['discount_percent'].toString() == 'null' ? "" : json['discount_percent'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? "" : json['discounted_price'].toString();
    flatDiscount = json['flat_discount'].toString() == 'null' ? "" : json['flat_discount'].toString();
    createdAt = json['created_at'].toString() == 'null' ? "" : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? "" : json['updated_at'].toString();
    stock = json['stock'].toString() == 'null' ? "0" : json['stock'].toString();
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
    if (json['product_shade_images'] != null) {
      productShadeImages = <ProductShadeImages>[];
      json['product_shade_images'].forEach((v) {
        productShadeImages!.add(ProductShadeImages.fromJson(v));
      });
    }
    shade = json['shade'] != null ? Shade.fromJson(json['shade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['shade_id'] = shadeId;
    data['shade_price'] = shadePrice;
    data['discount_percent'] = discountPercent;
    data['discounted_price'] = discountedPrice;
    data['flat_discount'] = flatDiscount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['stock'] = stock;
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    if (productShadeImages != null) {
      data['product_shade_images'] = productShadeImages!.map((v) => v.toJson()).toList();
    }
    if (shade != null) {
      data['shade'] = shade!.toJson();
    }
    return data;
  }
}

class Offers {
  String? title;
  ProductDetails? productDetails;
  String? maximumDiscountAmount;

  Offers({this.title, this.productDetails, this.maximumDiscountAmount});

  Offers.fromJson(Map<String, dynamic> json) {
    title = json['title'].toString() == 'null' ? "" : json['title'].toString();
    productDetails = json['product_details'] != null ? ProductDetails.fromJson(json['product_details']) : null;
    maximumDiscountAmount = json['maximum_discount_amount'].toString() == 'null' ? "" : json['maximum_discount_amount'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (productDetails != null) {
      data['product_details'] = productDetails!.toJson();
    }
    data['maximum_discount_amount'] = maximumDiscountAmount;
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
    id = json['id'].toString() == 'null' ? "" : json['id'].toString();
    name = json['name'].toString() == 'null' ? "" : json['name'].toString();
    title1 = json['title1'].toString() == 'null' ? "" : json['title1'].toString();
    title2 = json['title2'].toString() == 'null' ? "" : json['title2'].toString();
    color = json['color'].toString() == 'null' ? "" : json['color'].toString();
    bannerWeb = json['banner_web'].toString() == 'null' ? "" : json['banner_web'].toString();
    bannerMobile = json['banner_mobile'].toString() == 'null' ? "" : json['banner_mobile'].toString();
    offerTypeId = json['offer_type_id'].toString() == 'null' ? "" : json['offer_type_id'].toString();
    isFreeDelivery = json['is_free_delivery'].toString() == 'null' ? "" : json['is_free_delivery'].toString();
    minAmount = json['min_amount'].toString() == 'null' ? "" : json['min_amount'].toString();
    maxAmount = json['max_amount'].toString() == 'null' ? "" : json['max_amount'].toString();
    startDate = json['start_date'].toString() == 'null' ? "" : json['start_date'].toString();
    expiryDate = json['expiry_date'].toString() == 'null' ? "" : json['expiry_date'].toString();
    status = json['status'].toString() == 'null' ? "" : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? "" : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? "" : json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? "" : json['deleted_at'].toString();
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

class ProductShadeImages {
  String? id;
  String? productShadeId;
  String? productId;
  String? shadeId;
  String? productShadeImage;
  String? createdAt;
  String? updatedAt;

  ProductShadeImages({this.id, this.productShadeId, this.productId, this.shadeId, this.productShadeImage, this.createdAt, this.updatedAt});

  ProductShadeImages.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? "" : json['id'].toString();
    productShadeId = json['product_shade_id'].toString() == 'null' ? "" : json['product_shade_id'].toString();
    productId = json['product_id'].toString() == 'null' ? "" : json['product_id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? "" : json['shade_id'].toString();
    productShadeImage = json['product_shade_image'].toString() == 'null' ? "" : json['product_shade_image'].toString();
    createdAt = json['created_at'].toString() == 'null' ? "" : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? "" : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_shade_id'] = productShadeId;
    data['product_id'] = productId;
    data['shade_id'] = shadeId;
    data['product_shade_image'] = productShadeImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Shade {
  String? id;
  String? name;
  String? image;
  String? status;
  String? colorId;
  String? createdAt;
  String? updatedAt;
  ProductShades? productShade;

  Shade({this.id, this.name, this.image, this.status, this.colorId, this.createdAt, this.updatedAt, this.productShade});

  Shade.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? "" : json['id'].toString();
    name = json['name'].toString() == 'null' ? "" : json['name'].toString();
    image = json['image'].toString() == 'null' ? "" : json['image'].toString();
    status = json['status'].toString() == 'null' ? "" : json['status'].toString();
    colorId = json['color_id'].toString() == 'null' ? "" : json['color_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? "" : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? "" : json['updated_at'].toString();
    productShade = json['product_shade'] != null ? ProductShades.fromJson(json['product_shade']) : null;
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
    if (productShade != null) {
      data['product_shade'] = productShade!.toJson();
    }
    return data;
  }
}

class ProductSizes {
  String? id;
  String? productId;
  String? sizeId;
  String? sizePrice;
  String? discountPercent;
  String? discountedPrice;
  String? flatDiscount;
  String? createdAt;
  String? updatedAt;
  List<Offers>? offers;
  String? bestSale;
  String? stock;
  List<ProductSizeImages>? productSizeImages;
  Size? size;

  ProductSizes(
      {this.id,
      this.productId,
      this.sizeId,
      this.sizePrice,
      this.discountPercent,
      this.discountedPrice,
      this.flatDiscount,
      this.createdAt,
      this.updatedAt,
      this.offers,
      this.bestSale,
      this.stock,
      this.productSizeImages,
      this.size});

  ProductSizes.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    sizePrice = json['size_price'].toString() == 'null' ? '' : json['size_price'].toString();
    discountPercent = json['discount_percent'].toString() == 'null' ? '' : json['discount_percent'].toString();
    discountedPrice = json['discounted_price'].toString() == 'null' ? '' : json['discounted_price'].toString();
    flatDiscount = json['flat_discount'].toString() == 'null' ? '' : json['flat_discount'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    stock = json['stock'].toString() == 'null' ? '0' : json['stock'].toString();
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
    bestSale = json['best_sale'].toString() == 'null' ? '' : json['best_sale'].toString();
    if (json['product_size_images'] != null) {
      productSizeImages = <ProductSizeImages>[];
      json['product_size_images'].forEach((v) {
        productSizeImages!.add(ProductSizeImages.fromJson(v));
      });
    }
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['size_id'] = sizeId;
    data['size_price'] = sizePrice;
    data['discount_percent'] = discountPercent;
    data['discounted_price'] = discountedPrice;
    data['flat_discount'] = flatDiscount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['stock'] = stock;
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    data['best_sale'] = bestSale;
    if (productSizeImages != null) {
      data['product_size_images'] = productSizeImages!.map((v) => v.toJson()).toList();
    }
    if (size != null) {
      data['size'] = size!.toJson();
    }
    return data;
  }
}

class ProductSizeImages {
  String? id;
  String? productSizeId;
  String? productId;
  String? sizeId;
  String? productSizeImage;
  String? createdAt;
  String? updatedAt;

  ProductSizeImages({this.id, this.productSizeId, this.productId, this.sizeId, this.productSizeImage, this.createdAt, this.updatedAt});

  ProductSizeImages.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productSizeId = json['product_size_id'].toString() == 'null' ? '' : json['product_size_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    productSizeImage = json['product_size_image'].toString() == 'null' ? '' : json['product_size_image'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_size_id'] = productSizeId;
    data['product_id'] = productId;
    data['size_id'] = sizeId;
    data['product_size_image'] = productSizeImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Size {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  ProductSizes? productSize;

  Size({this.id, this.name, this.status, this.createdAt, this.updatedAt, this.productSize});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    productSize = json['product_size'] != null ? ProductSizes.fromJson(json['product_size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productSize != null) {
      data['product_size'] = productSize!.toJson();
    }
    return data;
  }
}

class Reviews {
  String? id;
  String? userId;
  String? productId;
  String? shadeId;
  String? sizeId;
  String? orderId;
  String? title;
  String? comment;
  String? star;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? reviewHelpfulCount;
  bool? readMore = false;
  List<ReviewHelpful>? reviewHelpful;
  Shade? shade;
  Size? size;
  UserModel? user;
  List<ProductReviewImages>? productReviewImages;
  ProductModel? productInfo;

  Reviews({
    this.id,
    this.userId,
    this.productId,
    this.shadeId,
    this.sizeId,
    this.orderId,
    this.title,
    this.comment,
    this.star,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.reviewHelpfulCount,
    this.readMore,
    this.reviewHelpful,
    this.shade,
    this.size,
    this.user,
    this.productReviewImages,
    this.productInfo,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? '' : json['shade_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    orderId = json['order_id'].toString() == 'null' ? '' : json['order_id'].toString();
    title = json['title'].toString() == 'null' ? '' : json['title'].toString();
    comment = json['comment'].toString() == 'null' ? '' : json['comment'].toString();
    star = json['star'].toString() == 'null' ? '0' : json['star'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    reviewHelpfulCount = json['review_helpful_count'].toString() == 'null' ? '' : json['review_helpful_count'].toString();
    if (json['review_helpful'] != null) {
      reviewHelpful = <ReviewHelpful>[];
      json['review_helpful'].forEach((v) {
        reviewHelpful!.add(ReviewHelpful.fromJson(v));
      });
    }
    readMore = false;
    shade = json['shade'] != null ? Shade.fromJson(json['shade']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    if (json['product_review_images'] != null) {
      productReviewImages = <ProductReviewImages>[];
      json['product_review_images'].forEach((v) {
        productReviewImages!.add(ProductReviewImages.fromJson(v));
      });
    }
    productInfo = json['product_info'] != null ? ProductModel.fromJson(json['product_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['shade_id'] = shadeId;
    data['size_id'] = sizeId;
    data['order_id'] = orderId;
    data['title'] = title;
    data['comment'] = comment;
    data['star'] = star;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['read_more'] = readMore;
    data['review_helpful_count'] = reviewHelpfulCount;
    // data['review_helpful'] = reviewHelpful;
    if (reviewHelpful != null) {
      data['review_helpful'] = reviewHelpful!.map((v) => v.toJson()).toList();
    }
    if (shade != null) {
      data['shade'] = shade!.toJson();
    }
    if (size != null) {
      data['size'] = size!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (productReviewImages != null) {
      data['product_review_images'] = productReviewImages!.map((v) => v.toJson()).toList();
    }
    if (productInfo != null) {
      data['product_info'] = productInfo!.toJson();
    }
    return data;
  }
}

class ReviewHelpful {
  String? id;
  String? productReviewId;
  String? userId;
  String? helpful;
  String? createdAt;
  String? updatedAt;

  ReviewHelpful({this.id, this.productReviewId, this.userId, this.helpful, this.createdAt, this.updatedAt});

  ReviewHelpful.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productReviewId = json['product_review_id'].toString() == 'null' ? '' : json['product_review_id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    helpful = json['helpful'].toString() == 'null' ? '' : json['helpful'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['product_review_id'] = productReviewId;
    data['user_id'] = userId;
    data['helpful'] = helpful;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProductReviewImages {
  String? id;
  String? productReviewId;
  String? productId;
  String? shadeId;
  String? sizeId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductReviewImages({this.id, this.productReviewId, this.productId, this.shadeId, this.sizeId, this.image, this.createdAt, this.updatedAt});

  ProductReviewImages.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    productReviewId = json['product_review_id'].toString() == 'null' ? '' : json['product_review_id'].toString();
    productId = json['product_id'].toString() == 'null' ? '' : json['product_id'].toString();
    shadeId = json['shade_id'].toString() == 'null' ? '' : json['shade_id'].toString();
    sizeId = json['size_id'].toString() == 'null' ? '' : json['size_id'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_review_id'] = productReviewId;
    data['product_id'] = productId;
    data['shade_id'] = shadeId;
    data['size_id'] = sizeId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class NameModel {
  String? id;
  String? name;

  NameModel({this.id, this.name});

  NameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
