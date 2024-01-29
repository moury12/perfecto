class ShadeModel {
  String? id;
  String? name;
  String? image;
  String? status;
  String? colorId;
  String? createdAt;
  String? updatedAt;
  String? productsCount;

  ShadeModel(
      {this.id,
        this.name,
        this.image,
        this.status,
        this.colorId,
        this.createdAt,
        this.updatedAt,
        this.productsCount});

  ShadeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    colorId = json['color_id'].toString()=='null'?'':json['color_id'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
    productsCount = json['products_count'].toString()=='null'?'':json['products_count'].toString();
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
    data['products_count'] = productsCount;
    return data;
  }
}
class SizeModel {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? productsCount;

  SizeModel(
      {this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.productsCount});

  SizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
    productsCount = json['products_count'].toString()=='null'?'':json['products_count'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['products_count'] = productsCount;
    return data;
  }
}
