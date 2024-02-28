class TrendingSearchModel {
  String? id;
  String? userId;
  String? keyword;
  String? count;
  String? ipAddress;
  String? country;
  String? device;
  String? createdAt;
  String? updatedAt;
  String? user;

  TrendingSearchModel({this.id, this.userId, this.keyword, this.count, this.ipAddress, this.country, this.device, this.createdAt, this.updatedAt, this.user});

  TrendingSearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    keyword = json['keyword'].toString() == 'null' ? '' : json['keyword'].toString();
    count = json['count'].toString() == 'null' ? '' : json['count'].toString();
    ipAddress = json['ip_address'].toString() == 'null' ? '' : json['ip_address'].toString();
    country = json['country'].toString() == 'null' ? '' : json['country'].toString();
    device = json['device'].toString() == 'null' ? '' : json['device'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    user = json['user'].toString() == 'null' ? '' : json['user'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['keyword'] = this.keyword;
    data['count'] = this.count;
    data['ip_address'] = this.ipAddress;
    data['country'] = this.country;
    data['device'] = this.device;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    return data;
  }
}
