class GeneralSettingModel {
  String? id;
  String? companyName;
  String? phone;
  String? email;
  String? address;
  String? description;
  String? footerText;
  String? logo;
  String? favicon;
  String? facebookLink;
  String? instagramLink;
  String? twitterLink;
  String? youtubeLink;
  String? googleLink;
  String? appleLink;
  String? lowStockQuantity;
  String? bestSaleCount;
  String? buyStatus;
  String? createdAt;
  String? updatedAt;

  GeneralSettingModel(
      {this.id,
      this.companyName,
      this.phone,
      this.email,
      this.address,
      this.description,
      this.footerText,
      this.logo,
      this.favicon,
      this.facebookLink,
      this.instagramLink,
      this.twitterLink,
      this.youtubeLink,
      this.googleLink,
      this.appleLink,
      this.lowStockQuantity,
      this.bestSaleCount,
      this.buyStatus,
      this.createdAt,
      this.updatedAt});

  GeneralSettingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();
    companyName = json['company_name'].toString() == 'null' ? '' : json['company_name'].toString();
    phone = json['phone'].toString() == 'null' ? '' : json['phone'].toString();
    email = json['email'].toString() == 'null' ? '' : json['email'].toString();
    address = json['address'].toString() == 'null' ? '' : json['address'].toString();
    description = json['description'].toString() == 'null' ? '' : json['description'].toString();
    footerText = json['footer_text'].toString() == 'null' ? '' : json['footer_text'].toString();
    logo = json['logo'].toString() == 'null' ? '' : json['logo'].toString();
    favicon = json['favicon'].toString() == 'null' ? '' : json['favicon'].toString();
    facebookLink = json['facebook_link'].toString() == 'null' ? '' : json['facebook_link'].toString();
    instagramLink = json['instagram_link'].toString() == 'null' ? '' : json['instagram_link'].toString();
    twitterLink = json['twitter_link'].toString() == 'null' ? '' : json['twitter_link'].toString();
    youtubeLink = json['youtube_link'].toString() == 'null' ? '' : json['youtube_link'].toString();
    googleLink = json['google_link'].toString() == 'null' ? '' : json['google_link'].toString();
    appleLink = json['apple_link'].toString() == 'null' ? '' : json['apple_link'].toString();
    lowStockQuantity = json['low_stock_quantity'].toString() == 'null' ? '' : json['low_stock_quantity'].toString();
    bestSaleCount = json['best_sale_count'].toString() == 'null' ? '' : json['best_sale_count'].toString();
    buyStatus = json['buy_status'].toString() == 'null' ? '1' : json['buy_status'].toString();
    createdAt = json['created_at'].toString() == 'null' ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'].toString() == 'null' ? '' : json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['description'] = description;
    data['footer_text'] = footerText;
    data['logo'] = logo;
    data['favicon'] = favicon;
    data['facebook_link'] = facebookLink;
    data['instagram_link'] = instagramLink;
    data['twitter_link'] = twitterLink;
    data['youtube_link'] = youtubeLink;
    data['google_link'] = googleLink;
    data['apple_link'] = appleLink;
    data['low_stock_quantity'] = lowStockQuantity;
    data['best_sale_count'] = bestSaleCount;
    data['buy_status'] = buyStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
