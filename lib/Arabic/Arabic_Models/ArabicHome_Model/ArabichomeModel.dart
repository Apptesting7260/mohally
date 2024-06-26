class HomeModel {
  HomeModel({
    this.status,
    this.categoryData,
    this.recommendedProduct,
  });
  bool? status;
  List<CategoryData>? categoryData;
  List<RecommendedProduct>? recommendedProduct;

  HomeModel.fromJson(Map<String, dynamic> json) {
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

class RecommendedProduct {
  RecommendedProduct(
      {this.id,
      this.title,
      this.pricee,
      this.rating,
      this.mainCategoryId,
      this.imageUrl,
      this.galleryUrl,
      this.producttype});
  int? id;
  String? title;
  String? pricee;
  var rating;
  String? mainCategoryId;
  String? imageUrl;
  var galleryUrl;
  var producttype;

  RecommendedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['a_title'];
    pricee = json['price'];
    rating = json['average_rating'];
    mainCategoryId = json['main_category_id'];
    imageUrl = json['image_url'];
    producttype = json['product_type'];
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_title'] = title;
    _data['price'] = pricee;
    _data['average_rating'] = rating;
    _data['main_category_id'] = mainCategoryId;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    _data['product_type'] = producttype;
    return _data;
  }
}
