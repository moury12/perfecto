class UserModel {
  String? name;
  String? email;
  String? phone;
  String? avatar;

  UserModel({this.name, this.email, this.phone, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString()=='null'?'':json['name'];
    email = json['email'].toString()=='null'?'':json['email'];
    phone = json['phone'].toString()=='null'?'':json['phone'];
    avatar = json['avatar'].toString()=='null'?'':json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    return data;
  }
}
