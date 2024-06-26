import 'package:get/get_rx/src/rx_types/rx_types.dart';

class EnglishViewcartModel {
  EnglishViewcartModel({
    this.status,
    this.viewCartTotal,
    this.subTotalPrice,
    this.totalPrice,
    this.message,
    this.viewCart,
  });
  bool? status;
  var viewCartTotal;
  var subTotalPrice;
  var totalPrice;
  var message;
  List<ViewCart>? viewCart;

  EnglishViewcartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    viewCartTotal = json['view_cart_total'];
    subTotalPrice = json['sub_total_price'];
    totalPrice = json['total_price'];
    message = json['message'];
    viewCart =
        List.from(json['view_cart']).map((e) => ViewCart.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['view_cart_total'] = viewCartTotal;
    _data['sub_total_price'] = subTotalPrice;
    _data['total_price'] = totalPrice;
    _data['message'] = message;
    _data['view_cart'] = viewCart!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ViewCart {
  ViewCart({
    this.id,
    this.userId,
    this.productId,
    this.categoryId,
    this.productDetails,
    this.totalQuantity,
    this.price,
    this.totalPrice,
    this.coupon,
    this.available,
    this.availableQuantity,
    this.image,
    this.name,
  });
  var id;
  var userId;
  var productId;
  var categoryId;
  var productDetails;
  var totalQuantity;
  var price;
  var totalPrice;
  var coupon;
  bool? available;
  var availableQuantity;
  var image;
  var name;
  RxInt totalQty = 0.obs;
  ViewCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    productDetails = null;
    totalQuantity = json['total_quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
    coupon = null;
    available = json['available'];
    availableQuantity = json['available_quantity'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['product_id'] = productId;
    _data['category_id'] = categoryId;
    _data['product_details'] = productDetails;
    _data['total_quantity'] = totalQuantity;
    _data['price'] = price;
    _data['total_price'] = totalPrice;
    _data['coupon'] = coupon;
    _data['available'] = available;
    _data['available_quantity'] = availableQuantity;
    _data['image'] = image;
    _data['name'] = name;
    return _data;
  }
}
