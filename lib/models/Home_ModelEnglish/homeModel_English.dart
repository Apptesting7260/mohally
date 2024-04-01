class HomeModel_English {
  HomeModel_English({
    this.status,
    this.categoryData,
    this.recommendedProduct,
  });
  bool? status;
  List<CategoryData>? categoryData;
  List<RecommendedProduct>? recommendedProduct;

  HomeModel_English.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    categoryData = List.from(json['category_data'])
        .map((e) => CategoryData.fromJson(e))
        .toList();
    recommendedProduct = List.from(json['recommended_product'])
        .map((e) => RecommendedProduct.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['category_data'] = categoryData!.map((e) => e.toJson()).toList();
    _data['recommended_product'] =
        recommendedProduct!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CategoryData {
  CategoryData({
    this.id,
    this.categoryName,
    this.imageUrl,
  });
  int? id;
  String? categoryName;
  String? imageUrl;

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_name'] = categoryName;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class RecommendedProduct {
  RecommendedProduct(
      {this.id,
      this.title,
      this.price,
      this.averageRating,
      this.mainCategoryId,
      this.imageUrl,
      this.galleryUrl,
      this.producttype,
      this.incart});
  int? id;
  String? title;
  String? price;
  var averageRating;
  String? mainCategoryId;
  String? imageUrl;
  Null galleryUrl;
  var producttype;
  var incart;
  RecommendedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    averageRating = json['average_rating'];
    mainCategoryId = json['main_category_id'];
    imageUrl = json['image_url'];
    galleryUrl = null;
    producttype = json['product_type'];
    incart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['average_rating'] = averageRating;
    _data['main_category_id'] = mainCategoryId;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    _data['product_type'] = producttype;
    _data['in_cart'] = incart;
    return _data;
  }
}
