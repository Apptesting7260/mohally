class OrderDetailsModel {
  OrderDetailsModel({
    this.status,
    this.orderInformation,
    this.orderItemInformation,
    this.shippingAddress,
  });
  bool? status;
  OrderInformation? orderInformation;
  List<OrderItemInformation>? orderItemInformation;
  ShippingAddress? shippingAddress;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderInformation = OrderInformation.fromJson(json['order_information']);
    orderItemInformation = List.from(json['order_item_information'])
        .map((e) => OrderItemInformation.fromJson(e))
        .toList();
    shippingAddress = ShippingAddress.fromJson(json['shipping_address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['order_information'] = orderInformation!.toJson();
    _data['order_item_information'] =
        orderItemInformation!.map((e) => e.toJson()).toList();
    _data['shipping_address'] = shippingAddress!.toJson();
    return _data;
  }
}

class OrderInformation {
  OrderInformation({
    this.orderId,
    this.orderStatus,
    this.shipingDate,
    this.orderDate,
    this.amount,
    this.discunt,
    this.payAmount,
    this.shippingTo,
  });
  var orderId;
  var orderStatus;
  var shipingDate;
  var orderDate;
  var amount;
  var discunt;
  var payAmount;
  var shippingTo;

  OrderInformation.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    shipingDate = null;
    orderDate = json['order_date'];
    amount = json['amount'];
    discunt = json['discunt'];
    payAmount = json['pay_amount'];
    shippingTo = json['shipping_to'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order_id'] = orderId;
    _data['order_status'] = orderStatus;
    _data['shiping_date'] = shipingDate;
    _data['order_date'] = orderDate;
    _data['amount'] = amount;
    _data['discunt'] = discunt;
    _data['pay_amount'] = payAmount;
    _data['shipping_to'] = shippingTo;
    return _data;
  }
}

class OrderItemInformation {
  OrderItemInformation({
    this.name,
    this.image,
    this.price,
    this.totalPrice,
    this.totalQuantity,
    this.productDetails,
  });
  var name;
  var image;
  var price;
  var totalPrice;
  var totalQuantity;
  ProductDetails? productDetails;

  OrderItemInformation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    totalPrice = json['total_price'];
    totalQuantity = json['total_quantity'];
    productDetails = ProductDetails.fromJson(json['product_details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['image'] = image;
    _data['price'] = price;
    _data['total_price'] = totalPrice;
    _data['total_quantity'] = totalQuantity;
    _data['product_details'] = productDetails!.toJson();
    return _data;
  }
}

class ProductDetails {
  ProductDetails({
    this.Color,
    this.Size,
  });
  var Color;
  var Size;

  ProductDetails.fromJson(Map<String, dynamic> json) {
    Color = json['Color'];
    Size = json['Size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Color'] = Color;
    _data['Size'] = Size;
    return _data;
  }
}

class ShippingAddress {
  ShippingAddress({
    this.id,
    this.userId,
    this.tempUserName,
    this.address,
    this.city,
    this.country,
    this.state,
    this.zipCode,
    this.mobileNumber,
    this.primaryAddressStatus,
    this.languageType,
  });
  var id;
  var userId;
  var tempUserName;
  var address;
  var city;
  var country;
  var state;
  var zipCode;
  var mobileNumber;
  var primaryAddressStatus;
  var languageType;

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tempUserName = json['temp_user_name'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    zipCode = json['zip_code'];
    mobileNumber = json['mobile_number'];
    primaryAddressStatus = json['primary_address_status'];
    languageType = json['language_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['temp_user_name'] = tempUserName;
    _data['address'] = address;
    _data['city'] = city;
    _data['country'] = country;
    _data['state'] = state;
    _data['zip_code'] = zipCode;
    _data['mobile_number'] = mobileNumber;
    _data['primary_address_status'] = primaryAddressStatus;
    _data['language_type'] = languageType;
    return _data;
  }
}
