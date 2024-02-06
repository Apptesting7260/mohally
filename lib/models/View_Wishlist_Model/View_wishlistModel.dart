class WishlistViewModel {
  WishlistViewModel({
     this.status,
     this.wishlistViewList,
  });
   bool? status;
   List<WishlistViewList> ?wishlistViewList;
  
  WishlistViewModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    wishlistViewList = List.from(json['wishlist_view_list']).map((e)=>WishlistViewList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['wishlist_view_list'] = wishlistViewList!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class WishlistViewList {
  WishlistViewList({
     this.id,
     this.price,
     this.aTitle,
     this.imageUrl,
     this.galleryUrl,
  });
   int ?id;
   String?price;
   String? aTitle;
   String? imageUrl;
   Null ?galleryUrl;
  
  WishlistViewList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price=json['price'];
    aTitle = json['a_title'];
    imageUrl = json['image_url'];
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price']=price;
    _data['a_title'] = aTitle;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}