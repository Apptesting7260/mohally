class arabic_HomeLivingModel {
  arabic_HomeLivingModel({
    this.status,
    this.modalCategory,
    this.productView,
    this.productReview,
  });
  var status;
  var modalCategory;
  ProductView? productView;
  ProductReview? productReview;

  arabic_HomeLivingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    modalCategory = json['modal_category'];
    productView = ProductView.fromJson(json['product_view']);
    productReview = ProductReview.fromJson(json['product_review']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['modal_category'] = modalCategory;
    _data['product_view'] = productView!.toJson();
    _data['product_review'] = productReview!.toJson();
    return _data;
  }
}

class ProductView {
  ProductView({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.productCatgories,
    this.productDetails,
    this.imageUrl,
    this.galleryUrl,
  });
  var id;
  var title;
  var slug;
  var description;
  ProductCatgories? productCatgories;
  ProductDetails? productDetails;
  var imageUrl;
  List<String>? galleryUrl;

  ProductView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['a_title'];
    slug = json['slug'];
    description = json['a_description'];
    productCatgories = ProductCatgories.fromJson(json['product_catgories']);
    productDetails = ProductDetails.fromJson(json['product_details']);
    imageUrl = json['image_url'];
    galleryUrl = List.castFrom<dynamic, String>(json['gallery_url']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_title'] = title;
    _data['slug'] = slug;
    _data['a_description'] = description;
    _data['product_catgories'] = productCatgories!.toJson();
    _data['product_details'] = productDetails!.toJson();
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}

class ProductCatgories {
  ProductCatgories({
    this.tags,
    this.productCatgorey,
  });
  Tags? tags;
  List<ProductCatgorey>? productCatgorey;

  ProductCatgories.fromJson(Map<String, dynamic> json) {
    tags = Tags.fromJson(json['tags']);
    productCatgorey = List.from(json['product_catgorey'])
        .map((e) => ProductCatgorey.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tags'] = tags!.toJson();
    _data['product_catgorey'] =
        productCatgorey!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Tags {
  Tags({
    this.item,
  });
  List<Item>? item;

  Tags.fromJson(Map<String, dynamic> json) {
    item = List.from(json['item']).map((e) => Item.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item'] = item!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Item {
  Item({
    this.key,
    this.value,
  });
  var key;
  List<String>? value;

  Item.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = List.castFrom<dynamic, String>(json['value']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['value'] = value;
    return _data;
  }
}

class ProductCatgorey {
  ProductCatgorey({
    this.id,
    this.categoryName,
    this.imageUrl,
  });
  var id;
  var categoryName;
  var imageUrl;

  ProductCatgorey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['a_category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_category_name'] = categoryName;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class ProductDetails {
  ProductDetails({
    this.details,
  });
  List<Details>? details;

  ProductDetails.fromJson(Map<String, dynamic> json) {
    details =
        List.from(json['details']).map((e) => Details.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Details {
  Details({
    this.Color,
    this.ColorId,
    this.BedSize,
    this.BedSizeId,
    this.Size,
    this.SizeId,
    this.totalQuantity,
    this.totalQuantityId,
    this.price,
    this.priceId,
    this.sku,
    this.skuId,
    this.productPrice,
    this.productPriceId,
  });
  var Color;
  var ColorId;
  var BedSize;
  var BedSizeId;
  var Size;
  var SizeId;
  var totalQuantity;
  var totalQuantityId;
  var price;
  var priceId;
  var sku;
  var skuId;
  var productPrice;
  var productPriceId;

  Details.fromJson(Map<String, dynamic> json) {
    Color = null;
    ColorId = null;
    BedSize = null;
    BedSizeId = null;
    Size = null;
    SizeId = null;
    totalQuantity = json['total_quantity'];
    totalQuantityId = null;
    price = json['price'];
    priceId = null;
    sku = null;
    skuId = null;
    productPrice = json['product_price'];
    productPriceId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Color'] = Color;
    _data['Color_id'] = ColorId;
    _data['Bed-Size'] = BedSize;
    _data['Bed-Size_id'] = BedSizeId;
    _data['Size'] = Size;
    _data['Size_id'] = SizeId;
    _data['total_quantity'] = totalQuantity;
    _data['total_quantity_id'] = totalQuantityId;
    _data['price'] = price;
    _data['price_id'] = priceId;
    _data['sku'] = sku;
    _data['sku_id'] = skuId;
    _data['product_price'] = productPrice;
    _data['product_price_id'] = productPriceId;
    return _data;
  }
}

class ProductReview {
  ProductReview({
    this.productAverageReview,
    this.productReviewDetails,
  });
  var productAverageReview;
  List<ProductReviewDetails>? productReviewDetails;

  ProductReview.fromJson(Map<String, dynamic> json) {
    productAverageReview = json['product_average_review'];
    productReviewDetails = List.from(json['product_review_details'])
        .map((e) => ProductReviewDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_average_review'] = productAverageReview;
    _data['product_review_details'] =
        productReviewDetails!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProductReviewDetails {
  ProductReviewDetails({
    this.id,
    this.userName,
    this.description,
    this.ratting,
    this.helpful,
    this.helpfulStatus,
    this.userImage,
    this.reviewDate,
    this.galleryUrl,
  });
  var id;
  var userName;
  var description;
  var ratting;
  var helpful;
  var helpfulStatus;
  var userImage;
  var reviewDate;
  var galleryUrl;

  ProductReviewDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    description = json['description'];
    ratting = json['ratting'];
    helpful = json['helpful'];
    helpfulStatus = json['helpful_status'];
    userImage = json['user_image'];
    reviewDate = json['review_date'];
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_name'] = userName;
    _data['description'] = description;
    _data['ratting'] = ratting;
    _data['helpful'] = helpful;
    _data['helpful_status'] = helpfulStatus;
    _data['user_image'] = userImage;
    _data['review_date'] = reviewDate;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}
