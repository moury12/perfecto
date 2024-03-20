class RewardModel {
  String? id;
  String? userId;
  String? orderId;
  String? withdrawId;
  String? usingPoint;
  String? addedPoint;
  String? createdAt;
  String? updatedAt;
  Order? order;

  RewardModel({this.id, this.userId, this.orderId, this.withdrawId, this.usingPoint, this.addedPoint, this.createdAt, this.updatedAt, this.order});

  RewardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    orderId = json['order_id'].toString() == 'null' ? '' : json['order_id'].toString();
    withdrawId = json['withdraw_id'].toString() == 'null' ? '' : json['withdraw_id'].toString();
    usingPoint = json['using_point'].toString() == 'null' ? '' : json['using_point'].toString();
    addedPoint = json['added_point'].toString() == 'null' ? '' : json['added_point'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_id'] = orderId;
    data['withdraw_id'] = withdrawId;
    data['using_point'] = usingPoint;
    data['added_point'] = addedPoint;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  String? id;
  String? orderNo;
  String? grandTotal;
  String? status;

  Order({this.id, this.orderNo, this.grandTotal, this.status});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    orderNo = json['order_no'].toString() == 'null' ? '' : json['order_no'].toString();
    grandTotal = json['grand_total'].toString() == 'null' ? '' : json['grand_total'].toString();
    status = json['status'].toString() == 'null' ? '' : json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_no'] = orderNo;
    data['grand_total'] = grandTotal;
    data['status'] = status;
    return data;
  }
}
