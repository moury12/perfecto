class TermsConditionModel {
  String? id;
  String? document;
  String? createdAt;
  String? updatedAt;

  TermsConditionModel({this.id, this.document, this.createdAt, this.updatedAt});

  TermsConditionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    document = json['document'].toString()=='null'?'':json['document'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =id;
    data['document'] =document;
    data['created_at'] =createdAt;
    data['updated_at'] =updatedAt;
    return data;
  }
}
