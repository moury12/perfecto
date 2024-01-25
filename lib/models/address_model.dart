class DistrictModel {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  DistrictModel({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  DistrictModel.fromJson(Map<String, dynamic> json) {
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

class CityModel {
  String? id;
  String? name;
  String? districtId;
  String? status;
  String? createdAt;
  String? updatedAt;

  CityModel({this.id, this.name, this.districtId, this.status, this.createdAt, this.updatedAt});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    districtId = json['district_id'].toString() == 'null' ? '' : json['district_id'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['district_id'] = districtId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AddressModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? districtId;
  String? districtName;
  String? cityId;
  String? cityName;
  String? status;

  AddressModel({this.id,this.name, this.phone, this.email, this.address, this.districtId, this.districtName, this.cityId, this.cityName, this.status});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    phone = json['phone'].toString() == 'null' ? '' : json['phone'].toString();
    email = json['email'].toString() == 'null' ? '' : json['email'].toString();
    address = json['address'].toString() == 'null' ? '' : json['address'].toString();
    districtId = json['district_id'].toString() == 'null' ? '' : json['district_id'].toString();
    districtName = json['district_name'].toString() == 'null' ? '' : json['district_name'].toString();
    cityId = json['city_id'].toString() == 'null' ? '' : json['city_id'].toString();
    cityName = json['city_name'].toString() == 'null' ? '' : json['city_name'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['status'] = status;
    return data;
  }
}