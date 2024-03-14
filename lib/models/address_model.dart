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
  String? cityId;
  String? cityName;

  CityModel({this.cityId, this.cityName});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'].toString() == 'null' ? '' : json['city_id'].toString();
    cityName = json['city_name'].toString() == 'null' ? '' : json['city_name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    return data;
  }
}

class ZoneModel {
  String? zoneId;
  String? zoneName;

  ZoneModel({this.zoneId, this.zoneName});

  ZoneModel.fromJson(Map<String, dynamic> json) {
    zoneId = json['zone_id'].toString() == 'null' ? '' : json['zone_id'].toString();
    zoneName = json['zone_name'].toString() == 'null' ? '' : json['zone_name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zone_id'] = zoneId;
    data['zone_name'] = zoneName;
    return data;
  }
}

class AreaModel {
  String? areaId;
  String? areaName;
  String? homeDeliveryAvailable;
  String? pickupAvailable;

  AreaModel({this.areaId, this.areaName, this.homeDeliveryAvailable, this.pickupAvailable});

  AreaModel.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id'].toString() == 'null' ? '' : json['area_id'].toString();
    areaName = json['area_name'].toString() == 'null' ? '' : json['area_name'].toString();
    homeDeliveryAvailable = json['home_delivery_available'].toString() == 'null' ? '' : json['home_delivery_available'].toString();
    pickupAvailable = json['pickup_available'].toString() == 'null' ? '' : json['pickup_available'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['home_delivery_available'] = homeDeliveryAvailable;
    data['pickup_available'] = pickupAvailable;
    return data;
  }
}

class AddressModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? cityId;
  String? cityName;
  String? zoneId;
  String? zoneName;
  String? areaId;
  String? areaName;
  String? status;

  AddressModel({this.id, this.name, this.phone, this.email, this.address, this.cityId, this.cityName, this.zoneId, this.zoneName, this.areaId, this.areaName, this.status});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    phone = json['phone'].toString() == 'null' ? '' : json['phone'].toString();
    email = json['email'].toString() == 'null' ? '-' : json['email'].toString();
    address = json['address'].toString() == 'null' ? '' : json['address'].toString();
    cityId = json['city_id'].toString() == 'null' ? '' : json['city_id'].toString();
    cityName = json['city_name'].toString() == 'null' ? '' : json['city_name'].toString();
    zoneId = json['zone_id'].toString() == 'null' ? '' : json['zone_id'].toString();
    zoneName = json['zone_name'].toString() == 'null' ? '' : json['zone_name'].toString();
    areaId = json['area_id'].toString() == 'null' ? '' : json['area_id'].toString();
    areaName = json['area_name'].toString() == 'null' ? '' : json['area_name'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['zone_id'] = zoneId;
    data['zone_name'] = zoneName;
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['status'] = status;
    return data;
  }
}
