class CouponCodeApplyModel {
  CouponCodeApplyModel({
    this.status,
    this.message,
    this.totalPrice,
  });
  bool? status;
  String? message;
  int? totalPrice;

  CouponCodeApplyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['total_price'] = totalPrice;
    return _data;
  }
}
