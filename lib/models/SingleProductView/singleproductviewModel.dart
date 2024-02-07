class ProductViewModel {
  ProductViewModel({
     this.status,
     this.productView,
  });
   bool ?status;
   ProductView ?productView;
  
  ProductViewModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    productView = ProductView.fromJson(json['product_view']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['product_view'] = productView!.toJson();
    return _data;
  }
}

class ProductView {
  ProductView({
     this.id,
     this.atitle,
     this.slug,
     this.description,
     this.productCatgories,
     this.productDetails,
     this.imageUrl,
     this.galleryUrl,
  });
   var id;
   var atitle;
   var slug;
   var description;
   ProductCatgories? productCatgories;
   List<ProductDetails>? productDetails;
   var imageUrl;
   List<String> ?galleryUrl;
  
  ProductView.fromJson(Map<String, dynamic> json){
    id = json['id'];
    atitle = json['a_title'];
    slug = json['slug'];
    description = json['description'];
    productCatgories = ProductCatgories.fromJson(json['product_catgories']);
    productDetails = List.from(json['product_details']).map((e)=>ProductDetails.fromJson(e)).toList();
    imageUrl = json['image_url'];
    galleryUrl = List.castFrom<dynamic, String>(json['gallery_url']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_title'] = atitle;
    _data['slug'] = slug;
    _data['a_description'] = description;
    _data['product_catgories'] = productCatgories!.toJson();
    _data['product_details'] = productDetails!.map((e)=>e.toJson()).toList();
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}

class ProductCatgories {
  ProductCatgories({
     this.productCatgorey,
     this.tags,
     this.subtags,
  });
   List<ProductCatgorey>? productCatgorey;
   List<Tags>? tags;
   List<Subtags>? subtags;
  
  ProductCatgories.fromJson(Map<String, dynamic> json){
    productCatgorey = List.from(json['product_catgorey']).map((e)=>ProductCatgorey.fromJson(e)).toList();
    tags = List.from(json['tags']).map((e)=>Tags.fromJson(e)).toList();
    subtags = List.from(json['subtags']).map((e)=>Subtags.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_catgorey'] = productCatgorey!.map((e)=>e.toJson()).toList();
    _data['tags'] = tags!.map((e)=>e.toJson()).toList();
    _data['subtags'] = subtags!.map((e)=>e.toJson()).toList();
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
  
  ProductCatgorey.fromJson(Map<String, dynamic> json){
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

class Tags {
  Tags({
     this.id,
     this.tagTitle,
  });
   var id;
   var tagTitle;
  
  Tags.fromJson(Map<String, dynamic> json){
    id = json['id'];
    tagTitle = json['a_tag_title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_tag_title'] = tagTitle;
    return _data;
  }
}

class Subtags {
  Subtags({
     this.id,
     this.subTagName,
  });
   var id;
   var subTagName;
  
  Subtags.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subTagName = json['a_sub_tag_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_sub_tag_name'] = subTagName;
    return _data;
  }
}

class ProductDetails {
  ProductDetails({
     this.sizecapicity,
     this.color,
     this.sku,
     this.quantity,
     this.price,
  });
   var sizecapicity;
   var color;
   var sku;
   var quantity;
   var price;
  
  ProductDetails.fromJson(Map<String, dynamic> json){
    sizecapicity = json['sizecapicity'];
    color = json['color'];
    sku = json['sku'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sizecapicity'] = sizecapicity;
    _data['color'] = color;
    _data['sku'] = sku;
    _data['quantity'] = quantity;
    _data['price'] = price;
    return _data;
  }
}