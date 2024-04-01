import 'dart:math';

import 'package:mohally/Arabic/Arabic_Models/ArabicAllMensModel/ArabicAllMensProductsModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSearchModel/arabic_SearchModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/ArabicSubCatWomensProductViewModel/arabicWomensSubCatDressProductView.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/ArabicSubCatWomensProductViewModel/arabicWomensSubCatTopsProductViewModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/Arabic_ElectronicsSubCategoryViewModel/arabic_AllelectronicModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/Arabic_ElectronicsSubCategoryViewModel/arabic_ElecsubcatPhoneModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/Arabic_ElectronicsSubCategoryViewModel/arabic_elecsubcatCameraModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/Arabic_ElectronicsSubCategoryViewModel/arabic_elecsubcatHeadphoneModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/Arabic_ElectronicsSubCategoryViewModel/arabic_elecsubcatLaptopModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/Arabic_ElectronicsSubCategoryViewModel/arabic_elecsubcatWearableModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabicMenssubcatProductView/arabic_menSubCatFormalsModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabicMenssubcatProductView/arabic_mensShoeSubCatModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabicMenssubcatProductView/arabic_menssubcatActivewearModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabicMenssubcatProductView/arabic_shirtSubCatModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabicMenssubcatProductView/arabic_subcatBoottomModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabic_mensSubcatJacketModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicViewCartModel/Arabic_viewCartModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/AarbicWomensSingleViewModel/arabicWomenDressSingleviewModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/AarbicWomensSingleViewModel/arabicWomensTopSingleView.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicESinglephoneModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleCameraModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleHeadphonesModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleLaptopModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleWearableModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensActivewearModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensBottosModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensFormalsModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensJacketModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensShirtModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicsingleMensShoesModel.dart';
import 'package:mohally/Arabic/Arabic_Models/SearchMainCategoryModel/arabicSearchmaincatModel.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryMensScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/app_url/url.dart';
import 'package:mohally/data/network/network_api_services.dart';
import 'package:mohally/models/Add_Remove_Wishlist_Model/add_remove_wishlish_model.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_Add_new_address_model/arabic_add_new%20address_model.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicAddtoCartModel/ArabicaddtocartModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_AllProductViewModel/arabic_allproductViewModel.dart';
import 'package:mohally/models/CancelOrderModel/cancelordermodel.dart';
import 'package:mohally/models/CartProductQtyUpdateModel/cartproductQtyUpdate.dart';
import 'package:mohally/models/CouponCodeApply/applyCouponCodeModel.dart';
import 'package:mohally/models/CouponModel/couponCodeModel.dart';
import 'package:mohally/models/English_Allproductmodel/English_allProductModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/arabic_ElectronicViewModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/arabic_HealthAndWellnessModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/arabic_HomeLivingViewModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_deleteCartModel/arabic_DeleteCartModel.dart';
import 'package:mohally/models/ContactUsModel/contactus_model.dart';
import 'package:mohally/models/Create_password_model/create_password_model.dart';
import 'package:mohally/models/DeleteAccount/DeleteAccountModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicEditaddressmodel/edit_address_arabic_model.dart';
import 'package:mohally/models/OrderDetailsModel/orderDetailsModel.dart';
import 'package:mohally/models/OrderStatusModel/orderstatusModel.dart';
import 'package:mohally/models/PlaceOrderModel/placeorderModel.dart';
import 'package:mohally/models/ProductAddReviewModel/productAddreviewModel.dart';
import 'package:mohally/models/ProductByCatList/productbycatlistModel.dart';
import 'package:mohally/models/ProductPriceCangeByAttributeModel/ProductpricechangebyAttributeModel.dart';
import 'package:mohally/models/ProductReviewHelpfulModel/productreviewHelpfulModel.dart';
import 'package:mohally/models/ProductViewReviewModel/productviewreviewmodel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/ElectrinicsAllProductViewModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecCameraSubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecHeadphonessubcatmodel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecLaptopsSubcatModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecSmartPhonesSubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecWearablesubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyAllProductsViewModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyBoysapparelProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyGirlsproductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyToySubCatModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyclothingProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyshoesproductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensAllProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensBottomsubcatbycatidModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensFormalsSubCategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensJacketSubCategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensShoesSubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensactivewearSubCategory.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/shirtandtopsSubCatViewModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/WomensAllProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/womenSubCatTopModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/womensSubCatDressProductViewModel.dart';
import 'package:mohally/models/SearchModel/EnglishSearchModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/LaptopsModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/WearableModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/cameraModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/headPhones.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/smartphonesModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/ActiveWearModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/BottomsModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/electronics_single_view_model.dart';
import 'package:mohally/models/EnglishAdd_to_cart_Model/EnglishaddtocartModel.dart';
import 'package:mohally/models/EnglishDeleteCartModel/English_deleteCartModel.dart';
import 'package:mohally/models/English_ViewCartModel/english_viewCartModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/WomensSingleProductViewModel/WomensSingleProductViewModel.dart';
import 'package:mohally/models/Home_Banner_Model/home_banner_model.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicHome_Model/ArabichomeModel.dart';
import 'package:mohally/models/Home_ModelEnglish/homeModel_English.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Home_living_view_model/home_living_view_Model.dart';
import 'package:mohally/models/Login_Model/login_model.dart';
import 'package:mohally/models/MensSubCategoryModel/menssubcategoryModel.dart';
import 'package:mohally/models/MyAccount_Model/myAccount_model.dart';
import 'package:mohally/models/Product_Search_By_NameModel/productsearchbynameModel.dart';
import 'package:mohally/models/Remove_Address_Model/remove_address_model.dart';
import 'package:mohally/models/Search_mainCategoryModel/searchMainCategorymodel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCatElectronics.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCatHomeWomensModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCatMens.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/FormalsModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/JaketandOutwearModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/MensShoesModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/ShirtAndTopsSingleViewModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/WomensSingleProductViewModel/WomensTopSingleProductViewModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/single_product_view_model.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/singleproductviewModel.dart';
import 'package:mohally/models/SubCategories/subcategories_WomensModel.dart';
import 'package:mohally/models/SubCategories/subcategories_electronicsModel.dart';
import 'package:mohally/models/SubCategories/subcategories_homeandlivingModel.dart';
import 'package:mohally/models/SubCategories/subcategories_kidsModel.dart';
import 'package:mohally/models/SubCategories/subcategories_mensModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCathealthAndwellness.dart';
import 'package:mohally/models/Sub_category_Model/sub_category_model.dart';
import 'package:mohally/models/Update_Profile_Model/update_profile_Modal.dart';
import 'package:mohally/models/User_address_view_Model/user_address_view_model.dart';
import 'package:mohally/models/View_Wishlist_Model/View_wishlistModel.dart';
import 'package:mohally/models/View_Wishlist_Model/view_wishlist_English_Model.dart';
import 'package:mohally/models/privacypolicy_Model/privacy_policy_model.dart';
import 'package:mohally/models/reset_password_model/reset_password_model.dart';
import 'package:mohally/models/resetpasswordotp_model/resetpasswordotp_model.dart';
import 'package:mohally/models/user_verify_model/user_verify_model.dart';
import 'package:mohally/presentation/category_page/SubCategories/widgets/AllProductView.dart';
import 'package:mohally/presentation/category_page/SubCategories/widgets/SubCategoriesMens.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_allProductviewEnglish.dart';

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

  Future<MyAccountModal> myAccountapi(var data) async {
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
    dynamic response =
        await _apiService.postApi(data, AppUrl.homecategoryapi, header);
    return HomeModel.fromJson(response);
  }

  // Future<AllProductModel> all_productapi(
  //     var data, Map<String, String> header) async {
  //   dynamic response =
  //       await _apiService.postApi(data, AppUrl.homecategoryapi, header);
  //   return AllProductModel.fromJson(response);
  // }

  Future<HomeModel_English> english_homepageapi(
      var data, Map<String, String> header) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.homecategoryapi, header);
    return HomeModel_English.fromJson(response);
  }

  Future<dynamic> categoriesApi(var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.categorybyname,
    );
    switch (arabicMainCatId) {
      case "133":
        return arabic_subcatMens.fromJson(response);
      case "134":
        return ArabicSubCatElectronicsModel.fromJson(response);
      case "175":
        return ArabicSubCatWomensModel.fromJson(response);

      default:
        throw Exception('Unexpected condition');
    }
  }

  Future<MensModel> arabicsubcategoriesApi(
      var data, Map<String, String> header) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.subcategory, header);
    return MensModel.fromJson(response);
  }

  //    Future<SubCategoryModel>englishsubcategoriesApi(var data,Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(data, AppUrl.subcategory,header );
  //   return SubCategoryModel.fromJson(response);
  // }
  Future<dynamic> english_categoriesApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.categorybyname,
    );
    switch (mainCatId) {
      case "133":
        return EnglishMensSubCategoryModel.fromJson(response);
      case "134":
        return SubElectronicsCategoryModel.fromJson(response);

      case "175":
        return EnglishSubCatWomensModel.fromJson(response);
      case "181":
        return EnglishKidsSubCatModel.fromJson(response);
      default:
        throw Exception('Unexpected condition');
    }
  }
  // Future<CategoryByNameModel> english_categoriesApi(
  //     var data, Map<String, String> header) async {
  //   dynamic response =
  //       await _apiService.postApi(data, AppUrl.categorybyname, header);
  //   return CategoryByNameModel.fromJson(response);
  // }

  // Future<Search_MainCategory_Model> searchcategoriesApi(
  //     var data, Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(
  //     data,
  //     AppUrl.searchMainCategory,
  //   );
  //   return Search_MainCategory_Model.fromJson(response);
  // }

  Future<Search_MainCategory_Model> EnglishsearchcategoriesApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.searchMainCategory,
    );
    return Search_MainCategory_Model.fromJson(response);
  }

  Future<ArabicSearch_MainCategory_Model> ArabicsearchcategoriesApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.searchMainCategory,
    );
    return ArabicSearch_MainCategory_Model.fromJson(response);
  }

  Future<Add_new_Address_Arabic_Model> arabic_addnewaddressApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.addnewaddress,
    );
    return Add_new_Address_Arabic_Model.fromJson(response);
  }

  Future<EditAddressModel> arabic_editnewaddress(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.editaddress,
    );
    return EditAddressModel.fromJson(response);
  }

  Future<UserAddressViewModel> userAddressviewApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.addressview,
    );
    return UserAddressViewModel.fromJson(response);
  }

  Future<RemoveAddressModel> removeAddressApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.removeaddress,
    );
    return RemoveAddressModel.fromJson(response);
  }

  Future<dynamic> SingleproductviewApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.singleProdectView,
    );
    switch (arabicMainCatId) {
      case "153":
        return ArabicShirtAndTopsModel.fromJson(response);
      case "154":
        return ArabicBottomsModel.fromJson(response);
      case "155":
        return ArabicJacketandOutwearModel.fromJson(response);
      case "156":
        return ArabicActiveWearModel.fromJson(response);
      case "157":
        return ArabicFormalModel.fromJson(response);
      case "174":
        return ArabicMensShoesModel.fromJson(response);
      case "166":
        return ArabicSmartPhoneModel.fromJson(response);
      case "170":
        return ArabicLaptopsModel.fromJson(response);
      case "171":
        return ArabicHeadphonesAudioModel.fromJson(response);
      case "172":
        return ArabicCameraModel.fromJson(response);
      case "173":
        return ArabicWearableModel.fromJson(response);
      case "177":
        return ArabicWomensTopsSingleViewModel.fromJson(response);
      case "176":
        return ArabicWomensdressSingleViewModel.fromJson(response);
      default:
        throw Exception('Unexpected condition');
    }
  }

  Future<dynamic> EnglishSingleproductviewApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.singleProdectView,
    );
    // print(response);
    //return MensApparelModel.fromJson(response);
    error(response);
    switch (mainCatId) {
      case "153":
        return ShirtAndTopsModel.fromJson(response);
      case "154":
        return BottomsModel.fromJson(response);
      case "155":
        return JacketandOutwearModel.fromJson(response);

      case "156":
        return ActiveWearModel.fromJson(response);

      case "157":
        return FormalModel.fromJson(response);

      case "174":
        return MensShoesModel.fromJson(response);
      case "166":
        return SmartPhoneModel.fromJson(response);

      case "170":
        return LaptopsModel.fromJson(response);
      case "171":
        return HeadphonesAudioModel.fromJson(response);
      case "172":
        return CameraModel.fromJson(response);
      case "173":
        return WearableModel.fromJson(response);
      case "176":
        return WomensDressSingleViewModel.fromJson(response);
      case "177":
        return WomensTopSingleViewModel.fromJson(response);
      default:
        throw Exception('Unexpected condition');
    }
  }

  error(dynamic response) {
    print("hited 174");
    print(mainCatId.runtimeType);
    print(mainCatId.toString());
    // MensShoesModel.fromJson(response);
  }

  Future<dynamic> arabic_allproductview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.singleProdectView,
    );
    print(response);

    //return MensApparelModel.fromJson(response);

    switch (arabicMainCatId) {
      case "133":
        return arabicMensApparelModel.fromJson(response);
      case "134":
        return arabic_ElectronicsViewModel.fromJson(response);
      case "135":
        return arabic_HomeLivingModel.fromJson(response);
      case "136":
        return ArabicHealthandWellnessModel.fromJson(response);
      default:
        throw Exception('Unexpected condition');
    }
  }

  Future<dynamic> English_allproductview(
      var data, Map<String, String> header) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.singleProdectView);
    print(response);

    //return MensApparelModel.fromJson(response);

    switch (engallmainCatId) {
      case "153":
        return ShirtAndTopsModel.fromJson(response);
      case "154":
        return BottomsModel.fromJson(response);
      case "155":
        return JacketandOutwearModel.fromJson(response);
      case "156":
        return ActiveWearModel.fromJson(response);

      case "157":
        return FormalModel.fromJson(response);

      case "174":
        return MensShoesModel.fromJson(response);
      case "166":
        return SmartPhoneModel.fromJson(response);

      case "170":
        return LaptopsModel.fromJson(response);
      case "171":
        return HeadphonesAudioModel.fromJson(response);
      case "172":
        return CameraModel.fromJson(response);
      case "173":
        return WearableModel.fromJson(response);
      //  return HealthandWellnessModel.fromJson(response);
      default:
        throw Exception('Unexpected condition');
    }
  }

  Future<ProductSearchByNameModel> ProductSearchbyNameApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productSearchbyNameApi,
    );
    print(response);
    return ProductSearchByNameModel.fromJson(response);
  }

  Future<Add_Remove_WishlistModel> AddRemoveWishlistApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.addremoveWishlistApi,
    );
    print(response);
    return Add_Remove_WishlistModel.fromJson(response);
  }

  Future<WishlistViewModel> ViewWishlistApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.wishlistViewApi,
    );
    print(response);
    return WishlistViewModel.fromJson(response);
  }

  Future<English_WishlistViewModel> EnglishViewWishlistApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.wishlistViewApi,
    );
    print(response);
    return English_WishlistViewModel.fromJson(response);
  }

  Future<MensSubCategoryModel> MensSubCategoryApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.seeAllMens,
    );
    print(response);
    return MensSubCategoryModel.fromJson(response);
  }

  Future<ContactUsModel> contactusApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.contactUs,
    );
    print(response);
    return ContactUsModel.fromJson(response);
  }

  Future<EnglishAddtoCartModel> AddtocartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.Addtocart,
    );
    print(response);
    return EnglishAddtoCartModel.fromJson(response);
  }

  Future<EnglishViewcartModel> viewcartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.viewcart,
    );
    print(response);
    return EnglishViewcartModel.fromJson(response);
  }

  Future<EnglishDeleteCartModel> deletecartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.deletecart,
    );
    print(response);
    return EnglishDeleteCartModel.fromJson(response);
  }

  Future<ArabicAddtoCartModel> arabic_AddtocartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.Addtocart,
    );
    print(response);
    return ArabicAddtoCartModel.fromJson(response);
  }

  Future<ArabicViewcartModel> arabic_viewcartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.viewcart,
    );
    print(response);
    return ArabicViewcartModel.fromJson(response);
  }

  Future<ArabicDeleteCartModel> arabic_deletecartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.deletecart,
    );
    print(response);
    return ArabicDeleteCartModel.fromJson(response);
  }

  Future<EnglishAllProductViewModel> English_allcategoryproductview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.allproduct,
    );
    print(response);
    return EnglishAllProductViewModel.fromJson(response);
  }

  Future<arabicAllProductViewModel> arabic_allcategoryproductview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.allproduct,
    );
    print(response);
    return arabicAllProductViewModel.fromJson(response);
  }
  // Future<CouponCodeModel> CouponCodeApi(var data) async {
  //   dynamic response = await _apiService.getApi(AppUrl.couponcode);

  //   return CouponCodeModel.fromJson(response);
  // }
  Future<CouponCodeModel> CouponCodeApi() async {
    dynamic response = await _apiService.getApi(AppUrl.couponcode);
    return CouponCodeModel.fromJson(response);
  }

  Future<CouponCodeApplyModel> CouponCodeApplyApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.couponcodeapply,
    );
    print(response);
    return CouponCodeApplyModel.fromJson(response);
  }

  Future<dynamic> ProductByCatListApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );
    switch (submainCatId) {
      case "133":
        return MensAllProductModel.fromJson(response);
      case "153":
        return ShirtsSubcatviewModel.fromJson(response);
      case "154":
        return MensBottomSubcatviewModel.fromJson(response);
      case "155":
        return MensJacketSubCategoryByCategoryIdModel.fromJson(response);

      case "156":
        return MensActivewearSubCategortModel.fromJson(response);

      case "157":
        return MensFormalsSubcategoryModel.fromJson(response);

      case "174":
        return MensShoesSubcategoryModel.fromJson(response);
      case "166":
        return ElectronicsSmartPhonesSubCatModel.fromJson(response);

      case "170":
        return ElectLaptopsSubCategortModel.fromJson(response);
      case "171":
        return ElecHeadphonessubCatModel.fromJson(response);
      case "172":
        return ElecCamerasubcategoryModel.fromJson(response);
      case "173":
        return ElecWearableSubCatModel.fromJson(response);

      case "176":
        return WomensDressSubcatviewModel.fromJson(response);
      case "177":
        return WomensTopsSubcatviewModel.fromJson(response);
      case "181":
        return KidsAllProductsModel.fromJson(response);
      case "182":
        return BabyClothingSubCatModel.fromJson(response);
      case "183":
        return BabyBoysSubCatModel.fromJson(response);
      case "184":
        return BabyGirlsSubCatModel.fromJson(response);
      case "185":
        return BabyShoesSubCatModel.fromJson(response);
      case "186":
        return BabytoysSubCatModel.fromJson(response);
      default:
        throw Exception('Unexpected condition');
    }
  }

  Future<MensAllProductModel> EngAllProductOfMens(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );
    print(response);
    return MensAllProductModel.fromJson(response);
  }

  Future<ElectronicsAllProductsModel> EngAllProductOfElectronics(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );
    print(response);
    return ElectronicsAllProductsModel.fromJson(response);
  }

  Future<WomensAllProductModel> EngAllProductOfWomens(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );
    print(response);
    return WomensAllProductModel.fromJson(response);
  }

  Future<CartProductQtyUpdateModel> CartProductQtyUpdateApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.cartProductQtyUpdate,
    );
    print(response);
    return CartProductQtyUpdateModel.fromJson(response);
  }

  Future<ArabicMensAllProductModel> ArabicAllProductOfMens(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );
    print(response);
    return ArabicMensAllProductModel.fromJson(response);
  }

  Future<dynamic> arabicProductByCatListApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );
    switch (arabicsubmainCatId) {
      case '134':
        return AllElectronicModel.fromJson(response);
      case "153":
        return ArabicShirtsSubcatviewModel.fromJson(response);
      case "154":
        return ArabicMensBottomSubCatModel.fromJson(response);
      case "155":
        return ArabicMensJacketSubCatModel.fromJson(response);

      case "156":
        return ArabicMensSubcatactivewearModel.fromJson(response);

      case "157":
        return ArabicmensSubCatFormalModel.fromJson(response);

      case "174":
        return ArabicMensSubCatShoesModel.fromJson(response);
      case "166":
        return ArabicelecsubcatPhoneModel.fromJson(response);

      case "170":
        return ArabicelecsubcatLaptopModel.fromJson(response);
      case "171":
        return ArabicsubcatHeadphoneModel.fromJson(response);
      case "172":
        return ArabicelecsubcatCameraModel.fromJson(response);
      case "173":
        return ArabicelecsubcatWearableModel.fromJson(response);
      case "176":
        return ArabicWomensDressesProductViewModel.fromJson(response);
      case "177":
        return ArabicWomensTopsProductViewModel.fromJson(response);
      default:
        throw Exception('Unexpected condition');
    }
  }

  Future<PlaceOrderModel> PlaceOrderApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.placeorder,
    );
    print(response);
    return PlaceOrderModel.fromJson(response);
  }

  Future<OrderStatusModel> OrderStatusApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.orderstatus,
    );
    print(response);
    return OrderStatusModel.fromJson(response);
  }

  Future<SearchModel> ProductSearchByNameApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productSearchbyNameApi,
    );
    print(response);
    return SearchModel.fromJson(response);
  }

  Future<ArabicSeachModel> ArabicProductSearchByNameApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productSearchbyNameApi,
    );
    print(response);
    return ArabicSeachModel.fromJson(response);
  }

  Future<ProductReviewHelpfulModel> ProductReviewHelpful(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productreviewhelpful,
    );
    print(response);
    return ProductReviewHelpfulModel.fromJson(response);
  }

  Future<ProductPriceChangeByAttributeModel> ProductPriceChangeByAttribute(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productpricechangebyattribute,
    );
    print(response);
    return ProductPriceChangeByAttributeModel.fromJson(response);
  }

  Future<ProductViewReviewModel> ProductviewReview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productviewreview,
    );
    print(response);
    return ProductViewReviewModel.fromJson(response);
  }

  Future<ProductAddReviewModel> ProductAddReview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productaddreview,
    );
    print(response);
    return ProductAddReviewModel.fromJson(response);
  }

  Future<CancelOrderModel> CancelOrder(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.usercancelorder,
    );
    print(response);
    return CancelOrderModel.fromJson(response);
  }

  Future<CancelOrderModel> Reorder(var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.reorder,
    );
    print(response);
    return CancelOrderModel.fromJson(response);
  }

  Future<OrderDetailsModel> OrderDetails(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.orderDetails,
    );
    print(response);
    return OrderDetailsModel.fromJson(response);
  }
}
