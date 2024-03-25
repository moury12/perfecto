class OutletModel {
  String? id;
  String? name;
  String? email;
  String? address;
  String? mobile;
  String? logo;
  String? latitude;
  String? longitude;
  String? defaultAddress;
  String? status;
  String? defaultS;
  String? mapImage;
  String? createdAt;
  String? updatedAt;

  OutletModel(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.mobile,
      this.logo,
      this.latitude,
      this.longitude,
      this.defaultAddress,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.defaultS,
      this.mapImage});

  OutletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    email = json['email'].toString() == 'null' ? '' : json['email'].toString();
    address = json['address'].toString() == 'null' ? '' : json['address'].toString();
    mobile = json['mobile'].toString() == 'null' ? '' : json['mobile'].toString();
    logo = json['logo'].toString() == 'null' ? '' : json['logo'].toString();
    latitude = json['latitude'].toString() == 'null' ? '' : json['latitude'].toString();
    longitude = json['longitude'].toString() == 'null' ? '' : json['longitude'].toString();
    defaultAddress = json['default'].toString() == 'null' ? '' : json['default'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
    defaultS = json['default'].toString() == 'null' ? '' : json['default'].toString();
    mapImage = json['map_image'].toString() == 'null' ? '' : json['map_image'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['mobile'] = mobile;
    data['logo'] = logo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['default'] = defaultAddress;
    data['status'] = status;
    data['default'] = defaultS;
    data['map_image'] = mapImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
