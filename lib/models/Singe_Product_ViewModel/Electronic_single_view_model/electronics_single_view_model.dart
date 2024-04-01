// class WearableModel {
//   WearableModel({
//     this.status,
//     this.modalCategory,
//     this.productView,
//     this.productReview,
//   });
//   bool? status;
//   var modalCategory;
//   ProductView? productView;
//   ProductReview? productReview;

//   WearableModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     modalCategory = json['modal_category'];
//     productView = ProductView.fromJson(json['product_view']);
//     productReview = ProductReview.fromJson(json['product_review']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['modal_category'] = modalCategory;
//     _data['product_view'] = productView!.toJson();
//     _data['product_review'] = productReview!.toJson();
//     return _data;
//   }
// }

// class ProductView {
//   ProductView({
//     this.id,
//     this.productType,
//     this.title,
//     this.slug,
//     this.description,
//     this.productCatgories,
//     this.productDetails,
//     this.quantity,
//     this.price,
//     this.imageUrl,
//     this.galleryUrl,
//   });
//   var id;
//   var productType;
//   var title;
//   var slug;
//   var description;
//   ProductCatgories? productCatgories;
//   ProductDetails? productDetails;
//   var quantity;
//   var price;
//   var imageUrl;
//   List<String>? galleryUrl;

//   ProductView.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productType = json['product_type'];
//     title = json['title'];
//     slug = json['slug'];
//     description = json['description'];
//     productCatgories = ProductCatgories.fromJson(json['product_catgories']);
//     productDetails = ProductDetails.fromJson(json['product_details']);
//     quantity = json['quantity'];
//     price = json['price'];
//     imageUrl = json['image_url'];
//     galleryUrl = List.castFrom<dynamic, String>(json['gallery_url']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['product_type'] = productType;
//     _data['title'] = title;
//     _data['slug'] = slug;
//     _data['description'] = description;
//     _data['product_catgories'] = productCatgories!.toJson();
//     _data['product_details'] = productDetails!.toJson();
//     _data['quantity'] = quantity;
//     _data['price'] = price;
//     _data['image_url'] = imageUrl;
//     _data['gallery_url'] = galleryUrl;
//     return _data;
//   }
// }

// class ProductCatgories {
//   ProductCatgories({
//     this.tags,
//     this.productCatgorey,
//   });
//   Tags? tags;
//   List<ProductCatgorey>? productCatgorey;

//   ProductCatgories.fromJson(Map<String, dynamic> json) {
//     tags = Tags.fromJson(json['tags']);
//     productCatgorey = List.from(json['product_catgorey'])
//         .map((e) => ProductCatgorey.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['tags'] = tags!.toJson();
//     _data['product_catgorey'] =
//         productCatgorey!.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Tags {
//   Tags({
//     this.item,
//   });
//   List<Item>? item;

//   Tags.fromJson(Map<String, dynamic> json) {
//     item = List.from(json['item']).map((e) => Item.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['item'] = item!.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Item {
//   Item({
//     this.key,
//     this.value,
//   });
//   var key;
//   List<String>? value;

//   Item.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     value = List.castFrom<dynamic, String>(json['value']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['key'] = key;
//     _data['value'] = value;
//     return _data;
//   }
// }

// class ProductCatgorey {
//   ProductCatgorey({
//     this.id,
//     this.categoryName,
//     this.imageUrl,
//   });
//   var id;
//   var categoryName;
//   var imageUrl;

//   ProductCatgorey.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryName = json['category_name'];
//     imageUrl = json['image_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['category_name'] = categoryName;
//     _data['image_url'] = imageUrl;
//     return _data;
//   }
// }

// class ProductDetails {
//   ProductDetails({
//     this.details,
//   });
//   Details? details;

//   ProductDetails.fromJson(Map<String, dynamic> json) {
//     details = Details.fromJson(json['details']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['details'] = details!.toJson();
//     return _data;
//   }
// }

// class Details {
//   Details({
//     this.color,
//     this.items,
//     this.model,
//   });
//   List<Color>? color;
//   List<Items>? items;
//   List<Model>? model;

//   Details.fromJson(Map<String, dynamic> json) {
//     color = List.from(json['Color']).map((e) => Color.fromJson(e)).toList();
//     items = List.from(json['Items']).map((e) => Items.fromJson(e)).toList();
//     model = List.from(json['Model']).map((e) => Model.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['Color'] = color!.map((e) => e.toJson()).toList();
//     _data['Items'] = items!.map((e) => e.toJson()).toList();
//     _data['Model'] = model!.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Color {
//   Color({
//     this.id,
//     this.value,
//   });
//   var id;
//   var value;

//   Color.fromJson(Map<String, dynamic> json) {
//     id = null;
//     value = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['value'] = value;
//     return _data;
//   }
// }

// class Items {
//   Items({
//     this.id,
//     this.value,
//   });
//   var id;
//   var value;

//   Items.fromJson(Map<String, dynamic> json) {
//     id = null;
//     value = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['value'] = value;
//     return _data;
//   }
// }

// class Model {
//   Model({
//     this.id,
//     this.value,
//   });
//   var id;
//   var value;

//   Model.fromJson(Map<String, dynamic> json) {
//     id = null;
//     value = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['value'] = value;
//     return _data;
//   }
// }

// class ProductReview {
//   ProductReview({
//     this.productAverageReview,
//     this.productReviewDetails,
//   });
//   var productAverageReview;
//   List<ProductReviewDetails>? productReviewDetails;

//   ProductReview.fromJson(Map<String, dynamic> json) {
//     productAverageReview = json['product_average_review'];
//     productReviewDetails = List.from(json['product_review_details'])
//         .map((e) => ProductReviewDetails.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_average_review'] = productAverageReview;
//     _data['product_review_details'] =
//         productReviewDetails!.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class ProductReviewDetails {
//   ProductReviewDetails({
//     this.id,
//     this.userName,
//     this.description,
//     this.ratting,
//     this.helpful,
//     this.helpfulStatus,
//     this.userImage,
//     this.reviewDate,
//     this.galleryUrl,
//   });
//   var id;
//   var userName;
//   var description;
//   var ratting;
//   var helpful;
//   var helpfulStatus;
//   var userImage;
//   var reviewDate;
//   var galleryUrl;

//   ProductReviewDetails.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userName = json['user_name'];
//     description = json['description'];
//     ratting = json['ratting'];
//     helpful = json['helpful'];
//     helpfulStatus = json['helpful_status'];
//     userImage = json['user_image'];
//     reviewDate = json['review_date'];
//     galleryUrl = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user_name'] = userName;
//     _data['description'] = description;
//     _data['ratting'] = ratting;
//     _data['helpful'] = helpful;
//     _data['helpful_status'] = helpfulStatus;
//     _data['user_image'] = userImage;
//     _data['review_date'] = reviewDate;
//     _data['gallery_url'] = galleryUrl;
//     return _data;
//   }
// }
