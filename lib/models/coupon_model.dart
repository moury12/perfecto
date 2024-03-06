class CouponModel {
  String? couponCode;
  String? amount;
  String? minimumExpenses;
  String? maxExpenses;
  String? discountType;

  CouponModel({this.couponCode, this.amount, this.minimumExpenses, this.maxExpenses, this.discountType});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponCode = json['coupon_code'].toString() == 'null' ? '' : json['coupon_code'].toString();
    amount = json['amount'].toString() == 'null' ? '' : json['amount'].toString();
    minimumExpenses = json['minimum_expenses'].toString() == 'null' ? '' : json['minimum_expenses'].toString();
    maxExpenses = json['max_expenses'].toString() == 'null' ? '' : json['max_expenses'].toString();
    discountType = json['discount_type'].toString() == 'null' ? '' : json['discount_type'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_code'] = this.couponCode;
    data['amount'] = this.amount;
    data['minimum_expenses'] = this.minimumExpenses;
    data['max_expenses'] = this.maxExpenses;
    data['discount_type'] = this.discountType;
    return data;
  }
}
