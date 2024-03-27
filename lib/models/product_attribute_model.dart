import 'package:azlistview/azlistview.dart';

class BrandModel with ISuspensionBean {
  String? id;
  String? name;
  String? image;
  String? status;
  String? productsCount;
  bool? isChecked = false;
  String? createdAt;
  String? updatedAt;
  String? isPopular;
  String? isTopBrand;
  String? susTag;

  BrandModel({this.productsCount, this.id, this.name, this.isChecked, this.image, this.status, this.createdAt, this.updatedAt, this.isPopular, this.isTopBrand, this.susTag});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    productsCount = json['products_count'].toString() == 'null' ? '' : json['products_count'].toString();

    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    isChecked = false;
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    isPopular = json['is_popular'].toString() == 'null' ? '' : json['is_popular'].toString();
    isTopBrand = json['is_top_brand'].toString() == 'null' ? '' : json['is_top_brand'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['products_count'] = productsCount;

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_popular'] = isPopular;
    data['is_top_brand'] = isTopBrand;
    return data;
  }

  @override
  String getSuspensionTag() {
    return susTag ?? '';
  }
}

class CategoryModel {
  String? id;
  String? name;
  String? image;
  String? icon;
  String? status;
  String? parentId;
  String? productsCount;
  String? showOnHeader;
  String? position;

  String? createdAt;
  String? updatedAt;
  bool? isExpanded = false;
  bool? isChecked = false;
  List<CategoryModel>? subcategory;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.icon,
    this.status,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.isExpanded,
    this.isChecked,
    this.subcategory,
    this.productsCount,
    this.showOnHeader,
    this.position,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    icon = json['icon'].toString() == 'null' ? '' : json['icon'].toString();
    productsCount = json['products_count'].toString() == 'null' ? '' : json['products_count'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    parentId = json['parent_id'].toString() == 'null' ? '' : json['parent_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    showOnHeader = json['show_on_header'].toString() == 'null' ? '' : json['show_on_header'].toString();
    position = json['position'].toString() == 'null' ? '' : json['position'].toString();

    isExpanded = false;
    isChecked = false;
    if (json['subcategory'] != null) {
      subcategory = <CategoryModel>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['icon'] = icon;
    data['status'] = status;
    data['products_count'] = productsCount;
    data['show_on_header'] = showOnHeader;
    data['position'] = position;

    data['parent_id'] = parentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_expanded'] = isExpanded;
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttributeModel {
  String? id;
  String? name;
  String? image;
  String? status;
  bool? filtered;
  String? productsCount;
  String? createdAt;
  String? updatedAt;

  ProductAttributeModel({this.productsCount, this.id, this.name, this.image, this.status, this.filtered = false, this.createdAt, this.updatedAt});

  ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    productsCount = json['products_count'].toString() == 'null' ? '' : json['products_count'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    filtered = false;
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['products_count'] = productsCount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AttributeModel {
  String? name;
  String? keyName;
  List<ProductAttributeModel> attributes;
  bool isSelected = false;

  AttributeModel({
    this.name,
    this.keyName,
    required this.attributes,
    this.isSelected = false,
  });
  void toggleSelected() {
    isSelected = !isSelected; // Toggle isSelected
  }
}

class SortModel {
  String? name;
  String? keyName;
  bool isSelected = false;

  SortModel({
    this.name,
    this.keyName,
    this.isSelected = false,
  });
  void toggleSelected() {
    isSelected = !isSelected; // Toggle isSelected
  }
}
