class HomeBannerModel {
  bool? status;
  HomeBanner? homeBanner;

  HomeBannerModel({this.status, this.homeBanner});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    try{
      homeBanner = json['home_banner'] != null
          ? new HomeBanner.fromJson(json['home_banner'])
          : null;
    }catch(e){
      print(e);
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.homeBanner != null) {
      data['home_banner'] = this.homeBanner!.toJson();
    }
    return data;
  }
}

class HomeBanner {
  int? id;
  String? pageName;
  String? pageBannerLocation;
  List<BannerUrl>? bannerUrl;

  HomeBanner({this.id, this.pageName, this.pageBannerLocation, this.bannerUrl});

  HomeBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageName = json['page_name'];
    pageBannerLocation = json['page_banner_location'];
    if (json['banner_url'] != null) {
      bannerUrl = <BannerUrl>[];
      json['banner_url'].forEach((v) {
        bannerUrl!.add(new BannerUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_name'] = this.pageName;
    data['page_banner_location'] = this.pageBannerLocation;
    if (this.bannerUrl != null) {
      data['banner_url'] = this.bannerUrl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerUrl {
  String? s0;
  String? s1;
  String? s2;
  String? s3;

  BannerUrl({this.s0, this.s1, this.s2, this.s3});

  BannerUrl.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    return data;
  }
}
