class ShippingModel {
  String? id;
  String? insideCity;
  String? outsideCity;
  String? createdAt;
  String? updatedAt;

  ShippingModel({this.id, this.insideCity, this.outsideCity, this.createdAt, this.updatedAt});

  ShippingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    insideCity = json['inside_city'].toString() == 'null' ? '' : json['inside_city'].toString();
    outsideCity = json['outside_city'].toString() == 'null' ? '' : json['outside_city'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['inside_city'] = insideCity;
    data['outside_city'] = outsideCity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RewardPointModel {
  String? id;
  String? amount;
  String? rewardPoint;
  String? rewardPointValue;
  String? createdAt;
  String? updatedAt;

  RewardPointModel({this.id, this.amount, this.rewardPoint, this.rewardPointValue, this.createdAt, this.updatedAt});

  RewardPointModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    amount = json['amount'].toString() == 'null' ? '0' : json['amount'].toString();
    rewardPoint = json['reward_point'].toString() == 'null' ? '0' : json['reward_point'].toString();
    rewardPointValue = json['reward_point_value'].toString() == 'null' ? '0' : json['reward_point_value'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['reward_point'] = rewardPoint;
    data['reward_point_value'] = rewardPointValue;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
