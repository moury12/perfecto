class DistrictModel {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  DistrictModel(
      {this.id, this.name, this.status, this.createdAt, this.updatedAt});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] =id;
    data['name'] =name;
    data['status'] =status;
    data['created_at'] =createdAt;
    data['updated_at'] =updatedAt;
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

  CityModel(
      {this.id,
        this.name,
        this.districtId,
        this.status,
        this.createdAt,
        this.updatedAt});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    districtId = json['district_id'].toString()=='null'?'':json['district_id'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
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
  String? name;
  String? phone;
  String? email;
  String? address;
  int? districtId;
  String? districtName;
  int? cityId;
  String? cityName;
  String? status;

  AddressModel(
      {this.name,
        this.phone,
        this.email,
        this.address,
        this.districtId,
        this.districtName,
        this.cityId,
        this.cityName,
        this.status});

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
