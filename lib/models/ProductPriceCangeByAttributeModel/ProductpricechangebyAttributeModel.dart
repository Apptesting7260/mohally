class ProductPriceChangeByAttributeModel {
  ProductPriceChangeByAttributeModel({
    this.status,
    this.message,
    this.data,
  });
  bool? status;
  var message;
  Data? data;

  ProductPriceChangeByAttributeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.price,
    this.totalQuantity,
  });
  var price;
  var totalQuantity;

  Data.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    totalQuantity = json['total_quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['price'] = price;
    _data['total_quantity'] = totalQuantity;
    return _data;
  }
}
