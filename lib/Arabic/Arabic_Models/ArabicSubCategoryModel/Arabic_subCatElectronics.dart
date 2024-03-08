class ArabicSubCatElectronicsModel {
  ArabicSubCatElectronicsModel({
    this.status,
    this.seeAllMainCategory,
  });
  bool? status;
  List<SeeAllMainCategory>? seeAllMainCategory;

  ArabicSubCatElectronicsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    seeAllMainCategory = List.from(json['see_all_main_category'])
        .map((e) => SeeAllMainCategory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['see_all_main_category'] =
        seeAllMainCategory!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SeeAllMainCategory {
  SeeAllMainCategory({
    this.id,
    this.aCategoryName,
    this.imageUrl,
  });
  var id;
  var aCategoryName;
  var imageUrl;

  SeeAllMainCategory.fromJson(Map<String, dynamic> json) {
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
