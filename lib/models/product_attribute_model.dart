import 'package:azlistview/azlistview.dart';

class BrandModel with ISuspensionBean {
  String? id;
  String? name;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? isPopular;
  String? isTopBrand;
  String? susTag;

  BrandModel({this.id, this.name, this.image, this.status, this.createdAt, this.updatedAt, this.isPopular, this.isTopBrand, this.susTag});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
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
  String? status;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  bool? isExpanded = false;
  List<CategoryModel>? subcategory;

  CategoryModel({this.id, this.name, this.image, this.status, this.parentId, this.createdAt, this.updatedAt, this.isExpanded, this.subcategory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    parentId = json['parent_id'].toString() == 'null' ? '' : json['parent_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    isExpanded = false;
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
    data['status'] = status;
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