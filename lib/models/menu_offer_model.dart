import 'package:perfecto/models/home_model.dart';

class MenuOfferModel {
  String? id;
  String? offerId;
  String? createdAt;
  String? updatedAt;
  OfferModel? offer;

  MenuOfferModel({this.id, this.offerId, this.createdAt, this.updatedAt, this.offer});

  MenuOfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    offerId = json['offer_id'].toString() == 'null' ? '' : json['offer_id'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    offer = json['offer'] != null ? OfferModel.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['offer_id'] = offerId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (offer != null) {
      data['offer'] = offer!.toJson();
    }
    return data;
  }
}
