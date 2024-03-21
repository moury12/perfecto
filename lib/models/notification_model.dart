class NotificationModel {
  String? id;
  String? title;
  String? senderId;
  String? receiverId;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  NotificationModel({this.id, this.title, this.senderId, this.receiverId, this.description, this.createdAt, this.updatedAt, this.deletedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    title = json['title'].toString() == 'null' ? '' : json['title'].toString();
    senderId = json['sender_id'].toString() == 'null' ? '' : json['sender_id'].toString();
    receiverId = json['receiver_id'].toString() == 'null' ? '' : json['receiver_id'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
