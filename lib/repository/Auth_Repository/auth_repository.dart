import 'package:mohally/app_url/url.dart';
import 'package:mohally/data/network/network_api_services.dart';
import 'package:mohally/models/Add_Remove_Wishlist_Model/add_remove_wishlish_model.dart';
import 'package:mohally/models/Add_new_address_Arabic_model/add_new%20address_model.dart';
import 'package:mohally/models/Create_password_model/create_password_model.dart';
import 'package:mohally/models/DeleteAccount/DeleteAccountModel.dart';
import 'package:mohally/models/Edit_address_arabic_model/edit_address_arabic_model.dart';
import 'package:mohally/models/Home_Banner_Model/home_banner_model.dart';
import 'package:mohally/models/Home_Model/homeModel.dart';
import 'package:mohally/models/Home_ModelEnglish/homeModel_English.dart';
import 'package:mohally/models/Login_Model/login_model.dart';
import 'package:mohally/models/MensSubCategoryModel/menssubcategoryModel.dart';
import 'package:mohally/models/Mens_clothing_english_Model/mens_clothing_english_model.dart';
import 'package:mohally/models/MyAccount_Model/myAccount_model.dart';
import 'package:mohally/models/Product_Search_By_NameModel/productsearchbynameModel.dart';
import 'package:mohally/models/Remove_Address_Model/remove_address_model.dart';
import 'package:mohally/models/Search_mainCategoryModel/searchMainCategorymodel.dart';
import 'package:mohally/models/SeeAllMainCategoryModel/CategoryModel.dart';
import 'package:mohally/models/SeeAllMainCategoryModelEnglish/CategoryModel_English.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/models/Singe_Product_ViewModel/single_product_view_model.dart';
import 'package:mohally/models/SingleProductView/singleproductviewModel.dart';
import 'package:mohally/models/Sub_category_Model/sub_category_model.dart';
import 'package:mohally/models/Update_Profile_Model/update_profile_Modal.dart';
import 'package:mohally/models/User_address_view_Model/user_address_view_model.dart';
import 'package:mohally/models/View_Wishlist_Model/View_wishlistModel.dart';
import 'package:mohally/models/View_Wishlist_Model/view_wishlist_English_Model.dart';
import 'package:mohally/models/WishlistView_Model/viewWishlistmodel.dart';
import 'package:mohally/models/privacypolicy_Model/privacy_policy_model.dart';
import 'package:mohally/models/reset_password_model/reset_password_model.dart';
import 'package:mohally/models/resetpasswordotp_model/resetpasswordotp_model.dart';
import 'package:mohally/models/user_verify_model/user_verify_model.dart';

class AuthRepository {
  final _apiService = NetworkApiServices();

  Future<SignUpModel> Signupapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.signupapi);
    return SignUpModel.fromJson(response);
  }

  Future<LoginModel> Loginapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginapi);
    return LoginModel.fromJson(response);
  }

  Future<ResetpasswordModel> Resetpasswordapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordapi);
    return ResetpasswordModel.fromJson(response);
  }

  Future<ResetpassOTPModel> ResetpasswordOTPapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordotp);
    return ResetpassOTPModel.fromJson(response);
  }

  Future<CreatepassModel> Createpassapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.createpassword);
    return CreatepassModel.fromJson(response);
  }

  Future<UserVerifyModel> Verifyemailapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.verifyuser);
    return UserVerifyModel.fromJson(response);
  }

  Future<UserVerifyModel> Verifyphoneapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.verifyuser);
    return UserVerifyModel.fromJson(response);
  }
  // Future<CreatepassModel> Verifyemailotpapi(var data) async{
  //   dynamic response = await _apiService.postApi(data, AppUrl.emailverifyotp);
  //   return CreatepassModel.fromJson(response);
  // }

  Future<UpdateprofileModel> Updateprofile(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.profileupdate);
    return UpdateprofileModel.fromJson(response);
  }

  Future<MyAccountModal> myAccountapi() async {
    dynamic response = await _apiService.getApi(AppUrl.myaccount);
    return MyAccountModal.fromJson(response);
  }

  Future<DeleteAccountModel> deleteAccountapi() async {
    dynamic response = await _apiService.deleteApi(
      AppUrl.deleteMyAccount,
    );
    return DeleteAccountModel.fromJson(response);
  }

  Future<HomeBannerModel> homeBannerapi(var data, {required headers}) async {
    dynamic response = await _apiService.postApi(data, AppUrl.homebannerapi);
    return HomeBannerModel.fromJson(response);
  }

  Future<PrivacypolicyModel> pivacyPolicyApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.privacypolicy);
    return PrivacypolicyModel.fromJson(response);
  }
  Future<HomeModel> homepageapi(var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(data, AppUrl.homecategoryapi, header);
    return HomeModel.fromJson(response);
  }
  Future<HomeModel_English> english_homepageapi(var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(data, AppUrl.homecategoryapi, header);
    return HomeModel_English.fromJson(response);
  }
  Future<CategoriesModel> categoriesApi(var data,Map<String, String> header) async {
    dynamic response = await _apiService.postApi(data, AppUrl.seeallapi,header );
    return CategoriesModel.fromJson(response);
  }

   Future<MensModel> arabicsubcategoriesApi(var data,Map<String, String> header) async {
    dynamic response = await _apiService.postApi(data, AppUrl.subcategory,header );
    return MensModel.fromJson(response);
  }
     Future<MensClothingEnglishModel> englishmensubcategoriesApi(var data,Map<String, String> header) async {
    dynamic response = await _apiService.postApi(data, AppUrl.subcategory,header );
    return MensClothingEnglishModel.fromJson(response);
  }

  //    Future<SubCategoryModel>englishsubcategoriesApi(var data,Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(data, AppUrl.subcategory,header );
  //   return SubCategoryModel.fromJson(response);
  // }

  Future<CategoriesModelEnglish> english_categoriesApi(var data,Map<String, String> header) async {
    dynamic response = await _apiService.postApi(data, AppUrl.seeallapi,header );
    return CategoriesModelEnglish.fromJson(response);
  }

   Future<Search_MainCategory_Model> searchcategoriesApi(var data,Map<String, String> header) async {
    dynamic response = await _apiService.postApi(data, AppUrl.searchMainCategory, );
    return Search_MainCategory_Model.fromJson(response);
  }

  Future<Add_new_Address_Arabic_Model> arabic_addnewaddressApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.addnewaddress, );
    return Add_new_Address_Arabic_Model.fromJson(response);
  }
    Future<EditAddressModel> arabic_editnewaddress(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.editaddress, );
    return EditAddressModel.fromJson(response);
  }

   Future<UserAddressViewModel> userAddressviewApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.addressview, );
    return UserAddressViewModel.fromJson(response);
  }

  Future<RemoveAddressModel>removeAddressApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.removeaddress, );
    return RemoveAddressModel.fromJson(response);
  }

    Future<ProductViewModel>SingleproductviewApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.singleProdectView, );
    return ProductViewModel.fromJson(response);
  }
      Future<EnglishProductViewModel>EnglishSingleproductviewApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.singleProdectView, );
    return EnglishProductViewModel.fromJson(response);
  }

   Future<ProductSearchByNameModel>ProductSearchbyNameApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.productSearchbyNameApi, );print(response);
    return ProductSearchByNameModel.fromJson(response);
  }

  Future<Add_Remove_WishlistModel>AddRemoveWishlistApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.addremoveWishlistApi, );print(response);
    return Add_Remove_WishlistModel.fromJson(response);
  }

  Future<WishlistViewModel>ViewWishlistApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.wishlistViewApi, );print(response);
    return WishlistViewModel.fromJson(response);
  }
   Future<English_WishlistViewModel>EnglishViewWishlistApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.wishlistViewApi, );print(response);
    return English_WishlistViewModel.fromJson(response);
  }
   Future<MensSubCategoryModel>MensSubCategoryApi(var data,Map<String, String> header ) async {
    dynamic response = await _apiService.postApi(data, AppUrl.seeAllMens, );print(response);
    return MensSubCategoryModel.fromJson(response);
  }
}
