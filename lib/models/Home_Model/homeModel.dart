class HomeModel {
  bool? status;
  List<CategoryData>? categoryData;
  List<RecommendedProduct>? recommendedProduct;

  HomeModel({this.status, this.categoryData, this.recommendedProduct});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['category_data'] != null) {
      categoryData = <CategoryData>[];
      json['category_data'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
    if (json['recommended_product'] != null) {
      recommendedProduct = <RecommendedProduct>[];
      json['recommended_product'].forEach((v) {
        recommendedProduct!.add(new RecommendedProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categoryData != null) {
      data['category_data'] =
          this.categoryData!.map((v) => v.toJson()).toList();
    }
    if (this.recommendedProduct != null) {
      data['recommended_product'] =
          this.recommendedProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  String? categoryName;
  String? imageUrl;

  CategoryData({this.id, this.categoryName, this.imageUrl});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['a_category_name'].toString();
    imageUrl = json['image_url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['a_category_name'] = this.categoryName;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class RecommendedProduct {
  var id;
  String? title;
  String? imageUrl;
  String? pricee;

  RecommendedProduct({this.id, this.title, this.imageUrl, this.pricee});

  RecommendedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['a_title'];
    imageUrl = json['image_url'];
    pricee=json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['a_title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['price']=this.pricee;
    return data;
  }
}