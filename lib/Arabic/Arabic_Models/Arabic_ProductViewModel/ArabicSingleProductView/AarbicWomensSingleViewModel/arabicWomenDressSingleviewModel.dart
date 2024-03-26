class ArabicWomensdressSingleViewModel {
  ArabicWomensdressSingleViewModel({
     this.status,
     this.modalCategory,
     this.productView,
     this.productReview,
  });
  bool ?status;
  var modalCategory;
  ProductView? productView;
  ProductReview? productReview;
  
  ArabicWomensdressSingleViewModel.fromJson(Map<String, dynamic> json){
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
     this.productType,
     this.aTitle,
     this.slug,
     this.aDescription,
     this.productCatgories,
     this.productDetails,
     this.imageUrl,
     this.galleryUrl,
  });
 var id;
  var productType;
 var aTitle;
  var slug;
 var aDescription;
  ProductCatgories ?productCatgories;
  ProductDetails? productDetails;
  var imageUrl;
  List<String> ?galleryUrl;
  
  ProductView.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productType = json['product_type'];
    aTitle = null;
    slug = json['slug'];
    aDescription = null;
    productCatgories = ProductCatgories.fromJson(json['product_catgories']);
    productDetails = ProductDetails.fromJson(json['product_details']);
    imageUrl = json['image_url'];
    galleryUrl = List.castFrom<dynamic, String>(json['gallery_url']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_type'] = productType;
    _data['a_title'] = aTitle;
    _data['slug'] = slug;
    _data['a_description'] = aDescription;
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
  Tags ?tags;
  List<ProductCatgorey> ?productCatgorey;
  
  ProductCatgories.fromJson(Map<String, dynamic> json){
    tags = Tags.fromJson(json['tags']);
    productCatgorey = List.from(json['product_catgorey']).map((e)=>ProductCatgorey.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tags'] = tags!.toJson();
    _data['product_catgorey'] = productCatgorey!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Tags {
  Tags({
     this.item,
  });
  List<Item> ?item;
  
  Tags.fromJson(Map<String, dynamic> json){
    item = List.from(json['item']).map((e)=>Item.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item'] = item!.map((e)=>e.toJson()).toList();
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
  
  Item.fromJson(Map<String, dynamic> json){
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
     this.aCategoryName,
     this.imageUrl,
  });
 var id;
  var aCategoryName;
  var imageUrl;
  
  ProductCatgorey.fromJson(Map<String, dynamic> json){
    id = json['id'];
    aCategoryName = json['a_category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_category_name'] = aCategoryName;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class ProductDetails {
  ProductDetails({
     this.details,
  });
  List<Details>? details;
  
  ProductDetails.fromJson(Map<String, dynamic> json){
    details = List.from(json['details']).map((e)=>Details.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Details {
  Details({
     this.Size,
     this.SizeId,
     this.Color,
     this.ColorId,
     this.sku,
     this.skuId,
     this.totalQuantity,
     this.totalQuantityId,
     this.price,
     this.priceId,
     this.productPrice,
     this.productPriceId,
  });
  var Size;
 var SizeId;
  var Color;
 var ColorId;
 var sku;
 var skuId;
  var totalQuantity;
 var totalQuantityId;
  var price;
 var priceId;
 var productPrice;
 var productPriceId;
  
  Details.fromJson(Map<String, dynamic> json){
    Size = json['Size'];
    SizeId = json['Size_id'];
    Color = json['Color'];
    ColorId = json['Color_id'];
    sku = null;
    skuId = null;
    totalQuantity = json['total_quantity'];
    totalQuantityId = null;
    price = json['price'];
    priceId = null;
    productPrice = null;
    productPriceId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Size'] = Size;
    _data['Size_id'] = SizeId;
    _data['Color'] = Color;
    _data['Color_id'] = ColorId;
    _data['sku'] = sku;
    _data['sku_id'] = skuId;
    _data['total_quantity'] = totalQuantity;
    _data['total_quantity_id'] = totalQuantityId;
    _data['price'] = price;
    _data['price_id'] = priceId;
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
  List<ProductReviewDetails> ?productReviewDetails;
  
  ProductReview.fromJson(Map<String, dynamic> json){
    productAverageReview = json['product_average_review'];
    productReviewDetails = List.from(json['product_review_details']).map((e)=>ProductReviewDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_average_review'] = productAverageReview;
    _data['product_review_details'] = productReviewDetails!.map((e)=>e.toJson()).toList();
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
  
  ProductReviewDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userName = json['user_name'];
    description = json['description'];
    ratting = null;
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