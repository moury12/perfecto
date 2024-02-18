// class ProductModel {
//   int? id;
//   String? name;
//   Null? slug;
//   String? brandId;
//   String? categoryId;
//   Null? subCategoryId;
//   Null? subSubCategoryId;
//   Null? sizeId;
//   List<String>? shadeId;
//   List<String>? preferenceId;
//   String? formulationId;
//   List<String>? finishId;
//   String? countryId;
//   List<String>? genderId;
//   String? coverageId;
//   List<String>? benefitId;
//   List<String>? concernId;
//   List<String>? ingredientId;
//   String? skinTypeId;
//   List<String>? packId;
//   Null? faq;
//   String? variationType;
//   String? price;
//   String? discountAmount;
//   String? discountPercent;
//   String? discountPrice;
//   String? image;
//   String? tax;
//   String? shortDescription;
//   Null? description;
//   Null? ingredientDescription;
//   Null? howToUse;
//   String? isFreeDelivery;
//   String? isCombo;
//   String? status;
//   Null? deletedAt;
//   String? createdAt;
//   String? updatedAt;
//   String? reviewsCount;
//   String? reviewsAvgStar;
//   List<Null>? preferences;
//   List<Null>? finishes;
//   List<Null>? genders;
//   List<Null>? ingredients;
//   List<Null>? benefits;
//   List<Null>? concerns;
//   List<Null>? packs;
//   int? allShadesCount;
//   int? allSizesCount;
//   int? totalStock;
//   List<ProductShades>? productShades;
//   List<ProductSizes>? productSizes;
//   List<Reviews>? reviews;
//   NameModel? brand;
//   NameModel? category;
//   Null? subCategory;
//   Null? subSubCategory;
//   NameModel? formulation;
//   NameModel? country;
//   NameModel? coverage;
//   NameModel? skinType;
//
//   ProductModel(
//       {this.id,
//       this.name,
//       this.slug,
//       this.brandId,
//       this.categoryId,
//       this.subCategoryId,
//       this.subSubCategoryId,
//       this.sizeId,
//       this.shadeId,
//       this.preferenceId,
//       this.formulationId,
//       this.finishId,
//       this.countryId,
//       this.genderId,
//       this.coverageId,
//       this.benefitId,
//       this.concernId,
//       this.ingredientId,
//       this.skinTypeId,
//       this.packId,
//       this.faq,
//       this.variationType,
//       this.price,
//       this.discountAmount,
//       this.discountPercent,
//       this.discountPrice,
//       this.image,
//       this.tax,
//       this.shortDescription,
//       this.description,
//       this.ingredientDescription,
//       this.howToUse,
//       this.isFreeDelivery,
//       this.isCombo,
//       this.status,
//       this.deletedAt,
//       this.createdAt,
//       this.updatedAt,
//       this.reviewsCount,
//       this.reviewsAvgStar,
//       this.preferences,
//       this.finishes,
//       this.genders,
//       this.ingredients,
//       this.benefits,
//       this.concerns,
//       this.packs,
//       this.allShadesCount,
//       this.allSizesCount,
//       this.totalStock,
//       this.productShades,
//       this.productSizes,
//       this.reviews,
//       this.brand,
//       this.category,
//       this.subCategory,
//       this.subSubCategory,
//       this.formulation,
//       this.country,
//       this.coverage,
//       this.skinType});
//
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     brandId = json['brand_id'];
//     categoryId = json['category_id'];
//     subCategoryId = json['sub_category_id'];
//     subSubCategoryId = json['sub_sub_category_id'];
//     sizeId = json['size_id'];
//     shadeId = json['shade_id'].cast<String>();
//     preferenceId = json['preference_id'].cast<String>();
//     formulationId = json['formulation_id'];
//     finishId = json['finish_id'].cast<String>();
//     countryId = json['country_id'];
//     genderId = json['gender_id'].cast<String>();
//     coverageId = json['coverage_id'];
//     benefitId = json['benefit_id'].cast<String>();
//     concernId = json['concern_id'].cast<String>();
//     ingredientId = json['ingredient_id'].cast<String>();
//     skinTypeId = json['skin_type_id'];
//     packId = json['pack_id'].cast<String>();
//     faq = json['faq'];
//     variationType = json['variation_type'];
//     price = json['price'];
//     discountAmount = json['discount_amount'];
//     discountPercent = json['discount_percent'];
//     discountPrice = json['discount_price'];
//     image = json['image'];
//     tax = json['tax'];
//     shortDescription = json['short_description'];
//     description = json['description'];
//     ingredientDescription = json['ingredient_description'];
//     howToUse = json['how_to_use'];
//     isFreeDelivery = json['is_free_delivery'];
//     isCombo = json['is_combo'];
//     status = json['status'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     reviewsCount = json['reviews_count'];
//     reviewsAvgStar = json['reviews_avg_star'];
//     if (json['preferences'] != null) {
//       preferences = <Null>[];
//       json['preferences'].forEach((v) {
//         preferences!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['finishes'] != null) {
//       finishes = <Null>[];
//       json['finishes'].forEach((v) {
//         finishes!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['genders'] != null) {
//       genders = <Null>[];
//       json['genders'].forEach((v) {
//         genders!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['ingredients'] != null) {
//       ingredients = <Null>[];
//       json['ingredients'].forEach((v) {
//         ingredients!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['benefits'] != null) {
//       benefits = <Null>[];
//       json['benefits'].forEach((v) {
//         benefits!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['concerns'] != null) {
//       concerns = <Null>[];
//       json['concerns'].forEach((v) {
//         concerns!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['packs'] != null) {
//       packs = <Null>[];
//       json['packs'].forEach((v) {
//         packs!.add(new Null.fromJson(v));
//       });
//     }
//     allShadesCount = json['all_shades_count'];
//     allSizesCount = json['all_sizes_count'];
//     totalStock = json['total_stock'];
//     if (json['product_shades'] != null) {
//       productShades = <ProductShades>[];
//       json['product_shades'].forEach((v) {
//         productShades!.add(new ProductShades.fromJson(v));
//       });
//     }
//     if (json['product_sizes'] != null) {
//       productSizes = <ProductSizes>[];
//       json['product_sizes'].forEach((v) {
//         productSizes!.add(new ProductSizes.fromJson(v));
//       });
//     }
//     if (json['reviews'] != null) {
//       reviews = <Reviews>[];
//       json['reviews'].forEach((v) {
//         reviews!.add(new Reviews.fromJson(v));
//       });
//     }
//     brand = json['brand'] != null ? new NameModel.fromJson(json['brand']) : null;
//     category = json['category'] != null ? new NameModel.fromJson(json['category']) : null;
//     subCategory = json['sub_category'];
//     subSubCategory = json['sub_sub_category'];
//     formulation = json['formulation'] != null ? new NameModel.fromJson(json['formulation']) : null;
//     country = json['country'] != null ? new NameModel.fromJson(json['country']) : null;
//     coverage = json['coverage'] != null ? new NameModel.fromJson(json['coverage']) : null;
//     skinType = json['skin_type'] != null ? new NameModel.fromJson(json['skin_type']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['brand_id'] = this.brandId;
//     data['category_id'] = this.categoryId;
//     data['sub_category_id'] = this.subCategoryId;
//     data['sub_sub_category_id'] = this.subSubCategoryId;
//     data['size_id'] = this.sizeId;
//     data['shade_id'] = this.shadeId;
//     data['preference_id'] = this.preferenceId;
//     data['formulation_id'] = this.formulationId;
//     data['finish_id'] = this.finishId;
//     data['country_id'] = this.countryId;
//     data['gender_id'] = this.genderId;
//     data['coverage_id'] = this.coverageId;
//     data['benefit_id'] = this.benefitId;
//     data['concern_id'] = this.concernId;
//     data['ingredient_id'] = this.ingredientId;
//     data['skin_type_id'] = this.skinTypeId;
//     data['pack_id'] = this.packId;
//     data['faq'] = this.faq;
//     data['variation_type'] = this.variationType;
//     data['price'] = this.price;
//     data['discount_amount'] = this.discountAmount;
//     data['discount_percent'] = this.discountPercent;
//     data['discount_price'] = this.discountPrice;
//     data['image'] = this.image;
//     data['tax'] = this.tax;
//     data['short_description'] = this.shortDescription;
//     data['description'] = this.description;
//     data['ingredient_description'] = this.ingredientDescription;
//     data['how_to_use'] = this.howToUse;
//     data['is_free_delivery'] = this.isFreeDelivery;
//     data['is_combo'] = this.isCombo;
//     data['status'] = this.status;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['reviews_count'] = this.reviewsCount;
//     data['reviews_avg_star'] = this.reviewsAvgStar;
//     if (this.preferences != null) {
//       data['preferences'] = this.preferences!.map((v) => v.toJson()).toList();
//     }
//     if (this.finishes != null) {
//       data['finishes'] = this.finishes!.map((v) => v.toJson()).toList();
//     }
//     if (this.genders != null) {
//       data['genders'] = this.genders!.map((v) => v.toJson()).toList();
//     }
//     if (this.ingredients != null) {
//       data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
//     }
//     if (this.benefits != null) {
//       data['benefits'] = this.benefits!.map((v) => v.toJson()).toList();
//     }
//     if (this.concerns != null) {
//       data['concerns'] = this.concerns!.map((v) => v.toJson()).toList();
//     }
//     if (this.packs != null) {
//       data['packs'] = this.packs!.map((v) => v.toJson()).toList();
//     }
//     data['all_shades_count'] = this.allShadesCount;
//     data['all_sizes_count'] = this.allSizesCount;
//     data['total_stock'] = this.totalStock;
//     if (this.productShades != null) {
//       data['product_shades'] = this.productShades!.map((v) => v.toJson()).toList();
//     }
//     if (this.productSizes != null) {
//       data['product_sizes'] = this.productSizes!.map((v) => v.toJson()).toList();
//     }
//     if (this.reviews != null) {
//       data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
//     }
//     if (this.brand != null) {
//       data['brand'] = this.brand!.toJson();
//     }
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     data['sub_category'] = this.subCategory;
//     data['sub_sub_category'] = this.subSubCategory;
//     if (this.formulation != null) {
//       data['formulation'] = this.formulation!.toJson();
//     }
//     if (this.country != null) {
//       data['country'] = this.country!.toJson();
//     }
//     if (this.coverage != null) {
//       data['coverage'] = this.coverage!.toJson();
//     }
//     if (this.skinType != null) {
//       data['skin_type'] = this.skinType!.toJson();
//     }
//     return data;
//   }
// }
//
// class ProductShades {
//   int? id;
//   String? productId;
//   int? shadeId;
//   String? shadePrice;
//   String? createdAt;
//   String? updatedAt;
//   String? stock;
//   List<ProductShadeImages>? productShadeImages;
//   Shade? shade;
//
//   ProductShades({this.id, this.productId, this.shadeId, this.shadePrice, this.createdAt, this.updatedAt, this.stock, this.productShadeImages, this.shade});
//
//   ProductShades.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     shadeId = json['shade_id'];
//     shadePrice = json['shade_price'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     stock = json['stock'];
//     if (json['product_shade_images'] != null) {
//       productShadeImages = <ProductShadeImages>[];
//       json['product_shade_images'].forEach((v) {
//         productShadeImages!.add(new ProductShadeImages.fromJson(v));
//       });
//     }
//     shade = json['shade'] != null ? new Shade.fromJson(json['shade']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['shade_id'] = this.shadeId;
//     data['shade_price'] = this.shadePrice;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['stock'] = this.stock;
//     if (this.productShadeImages != null) {
//       data['product_shade_images'] = this.productShadeImages!.map((v) => v.toJson()).toList();
//     }
//     if (this.shade != null) {
//       data['shade'] = this.shade!.toJson();
//     }
//     return data;
//   }
// }
//
// class ProductShadeImages {
//   int? id;
//   String? productShadeId;
//   String? productId;
//   String? shadeId;
//   String? productShadeImage;
//   String? createdAt;
//   String? updatedAt;
//
//   ProductShadeImages({this.id, this.productShadeId, this.productId, this.shadeId, this.productShadeImage, this.createdAt, this.updatedAt});
//
//   ProductShadeImages.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productShadeId = json['product_shade_id'];
//     productId = json['product_id'];
//     shadeId = json['shade_id'];
//     productShadeImage = json['product_shade_image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_shade_id'] = this.productShadeId;
//     data['product_id'] = this.productId;
//     data['shade_id'] = this.shadeId;
//     data['product_shade_image'] = this.productShadeImage;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Shade {
//   int? id;
//   String? name;
//   String? image;
//   String? status;
//   String? colorId;
//   String? createdAt;
//   String? updatedAt;
//
//   Shade({this.id, this.name, this.image, this.status, this.colorId, this.createdAt, this.updatedAt});
//
//   Shade.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     status = json['status'];
//     colorId = json['color_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['color_id'] = this.colorId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class ProductSizes {
//   int? id;
//   String? productId;
//   String? sizeId;
//   String? sizePrice;
//   String? createdAt;
//   String? updatedAt;
//   String? stock;
//   Size? size;
//   List<Null>? productSizeImages;
//
//   ProductSizes({this.id, this.productId, this.sizeId, this.sizePrice, this.createdAt, this.updatedAt, this.stock, this.size, this.productSizeImages});
//
//   ProductSizes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     sizeId = json['size_id'];
//     sizePrice = json['size_price'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     stock = json['stock'];
//     size = json['size'] != null ? new Size.fromJson(json['size']) : null;
//     if (json['product_size_images'] != null) {
//       productSizeImages = <Null>[];
//       json['product_size_images'].forEach((v) {
//         productSizeImages!.add(new Null.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['size_id'] = this.sizeId;
//     data['size_price'] = this.sizePrice;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['stock'] = this.stock;
//     if (this.size != null) {
//       data['size'] = this.size!.toJson();
//     }
//     if (this.productSizeImages != null) {
//       data['product_size_images'] = this.productSizeImages!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Size {
//   int? id;
//   String? name;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//
//   Size({this.id, this.name, this.status, this.createdAt, this.updatedAt});
//
//   Size.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Reviews {
//   int? id;
//   String? userId;
//   String? productId;
//   Null? shadeId;
//   Null? sizeId;
//   String? orderId;
//   String? title;
//   String? comment;
//   String? star;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   String? reviewHelpfulCount;
//   List<Null>? reviewHelpful;
//   Null? shade;
//   Null? size;
//
//   Reviews(
//       {this.id,
//       this.userId,
//       this.productId,
//       this.shadeId,
//       this.sizeId,
//       this.orderId,
//       this.title,
//       this.comment,
//       this.star,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.reviewHelpfulCount,
//       this.reviewHelpful,
//       this.shade,
//       this.size});
//
//   Reviews.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     productId = json['product_id'];
//     shadeId = json['shade_id'];
//     sizeId = json['size_id'];
//     orderId = json['order_id'];
//     title = json['title'];
//     comment = json['comment'];
//     star = json['star'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     reviewHelpfulCount = json['review_helpful_count'];
//     if (json['review_helpful'] != null) {
//       reviewHelpful = <Null>[];
//       json['review_helpful'].forEach((v) {
//         reviewHelpful!.add(new Null.fromJson(v));
//       });
//     }
//     shade = json['shade'];
//     size = json['size'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['product_id'] = this.productId;
//     data['shade_id'] = this.shadeId;
//     data['size_id'] = this.sizeId;
//     data['order_id'] = this.orderId;
//     data['title'] = this.title;
//     data['comment'] = this.comment;
//     data['star'] = this.star;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['review_helpful_count'] = this.reviewHelpfulCount;
//     if (this.reviewHelpful != null) {
//       data['review_helpful'] = this.reviewHelpful!.map((v) => v.toJson()).toList();
//     }
//     data['shade'] = this.shade;
//     data['size'] = this.size;
//     return data;
//   }
// }
//
// class NameModel {
//   int? id;
//   String? name;
//
//   NameModel({this.id, this.name});
//
//   NameModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

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
  String? allSizesCount;
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
      this.allSizesCount,
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
    allSizesCount = json['all_sizes_count'].toString() == 'null' ? '' : json['all_sizes_count'].toString();
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
    data['all_sizes_count'] = allSizesCount;
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
