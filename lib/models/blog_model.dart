class BlogModel {
  String? id;
  String? title;
  String? image;
  String? description;
  String? status;
  String? slug;
  String? createdAt;
  String? updatedAt;

  BlogModel(
      {this.id,
        this.title,
        this.image,
        this.description,
        this.status,
        this.slug,
        this.createdAt,
        this.updatedAt});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    title = json['title'].toString()=='null'?'':json['title'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    description = json['description'].toString()=='null'?'':json['description'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class BlogCommentModel {
  String? id;
  String? blogId;
  String? userId;
  String? comment;
  String? status;
  String? createdAt;
  String? updatedAt;

  BlogCommentModel(
      {this.id,
        this.blogId,
        this.userId,
        this.comment,
        this.status,
        this.createdAt,
        this.updatedAt});

  BlogCommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    blogId = json['blog_id'].toString()=='null'?'':json['blog_id'].toString();
    userId = json['user_id'].toString()=='null'?'':json['user_id'].toString();
    comment = json['comment'].toString()=='null'?'':json['comment'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    data['id'] = id;
    data['blog_id'] = blogId;
    data['user_id'] = userId;
    data['comment'] = comment;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
