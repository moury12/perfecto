class ChatModel {
  String? id;
  String? adminId;
  String? userId;
  String? isAdminRead;
  String? isUserRead;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  User? user;
  MessageDetails? messageDetails;

  ChatModel({
    this.id,
    this.adminId,
    this.userId,
    this.isAdminRead,
    this.isUserRead,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.messageDetails,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    adminId = json['admin_id'].toString() == 'null' ? '' : json['admin_id'].toString();
    userId = json['user_id'].toString() == 'null' ? '' : json['user_id'].toString();
    isAdminRead = json['is_admin_read'].toString() == 'null' ? '' : json['is_admin_read'].toString();
    isUserRead = json['is_user_read'].toString() == 'null' ? '' : json['is_user_read'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString() == 'null' ? '' : json['deleted_at'].toString();
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    messageDetails = json['message_details'] != null ? MessageDetails.fromJson(json['message_details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['admin_id'] = adminId;
    data['user_id'] = userId;
    data['is_admin_read'] = isAdminRead;
    data['is_user_read'] = isUserRead;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (messageDetails != null) {
      data['message_details'] = messageDetails!.toJson();
    }
    return data;
  }
}

class MessageDetails {
  String? currentPage;
  List<MessageModel>? data;
  String? firstPageUrl;
  String? from;
  String? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  String? to;
  String? total;

  MessageDetails(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  MessageDetails.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'].toString() == 'null' ? '' : json['current_page'].toString();
    if (json['data'] != null) {
      data = <MessageModel>[];
      json['data'].forEach((v) {
        data!.add(MessageModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'].toString() == 'null' ? '' : json['first_page_url'].toString();
    from = json['from'].toString() == 'null' ? '' : json['from'].toString();
    lastPage = json['last_page'].toString() == 'null' ? '' : json['last_page'].toString();
    lastPageUrl = json['last_page_url'].toString() == 'null' ? '' : json['last_page_url'].toString();
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'].toString() == 'null' ? '' : json['next_page_url'].toString();
    path = json['path'].toString() == 'null' ? '' : json['path'].toString();
    perPage = json['per_page'].toString() == 'null' ? '' : json['per_page'].toString();
    prevPageUrl = json['prev_page_url'].toString() == 'null' ? '' : json['prev_page_url'].toString();
    to = json['to'].toString() == 'null' ? '' : json['to'].toString();
    total = json['total'].toString() == 'null' ? '' : json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  String? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'].toString() == 'null' ? '' : json['url'].toString();
    label = json['label'].toString() == 'null' ? '' : json['label'].toString();
    active = json['active'].toString() == 'null' ? '' : json['active'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? avatar;

  User({this.id, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    name = json['name'].toString() == 'null' ? '' : json['name'].toString();
    avatar = json['avatar'].toString() == 'null' ? '' : json['avatar'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}

class MessageModel {
  String? message;
  String? image;
  String? messageId;
  String? senderId;
  String? receiverId;
  String? updatedAt;
  String? createdAt;
  String? id;

  MessageModel({this.message, this.image, this.messageId, this.senderId, this.receiverId, this.updatedAt, this.createdAt, this.id});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString() == 'null' ? '' : json['message'].toString();
    image = json['image'].toString() == 'null' ? '' : json['image'].toString();
    messageId = json['message_id'].toString() == 'null' ? '' : json['message_id'].toString();
    senderId = json['sender_id'].toString() == 'null' ? '' : json['sender_id'].toString();
    receiverId = json['receiver_id'].toString() == 'null' ? '' : json['receiver_id'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['image'] = image;
    data['message_id'] = messageId;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
