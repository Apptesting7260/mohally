import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
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
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/womenSubCatTopModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/womensSubCatDressProductViewModel.dart';
import 'package:mohally/presentation/category_page/SubCategories/widgets/SubCategoriesMens.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? EnglishproductbyCatId;

class ProductsByCatIdListControllerEnglish extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final mens = MensAllProductModel().obs;
  final ShirtandTops_userlist = ShirtsSubcatviewModel().obs;
  final Bottom_userlist = MensBottomSubcatviewModel().obs;
  final jacket_userlist = MensJacketSubCategoryByCategoryIdModel().obs;
  final activewear_userlist = MensActivewearSubCategortModel().obs;
  final formal_userlist = MensFormalsSubcategoryModel().obs;
  final mensshoes_userlist = MensShoesSubcategoryModel().obs;
  final smartphone_userlist = ElectronicsSmartPhonesSubCatModel().obs;
  final laptops_userlist = ElectLaptopsSubCategortModel().obs;
  final headphones_userlist = ElecHeadphonessubCatModel().obs;
  final camera_userlist = ElecCamerasubcategoryModel().obs;
  final wearable_userlist = ElecWearableSubCatModel().obs;
  final womensDress_userlist = WomensDressSubcatviewModel().obs;
  final womenstops_userlist = WomensTopsSubcatviewModel().obs;
  final kids_userlist = KidsAllProductsModel().obs;
  final kids_babyclothing_userlist = BabyClothingSubCatModel().obs;
  final kids_boysApparel_userlist = BabyBoysSubCatModel().obs;
  final kids_girlsApparel_userlist = BabyGirlsSubCatModel().obs;
  final kids_shoes_userlist = BabyShoesSubCatModel().obs;
  final kids_toys_userlist = BabytoysSubCatModel().obs;

  // final userList = Rx<dynamic>(null);

  void MensModel(MensAllProductModel value) => mens.value = value;
  void shirtandTopsModel(ShirtsSubcatviewModel value) =>
      ShirtandTops_userlist.value = value;
  void bottomModel(MensBottomSubcatviewModel value) =>
      Bottom_userlist.value = value;
  void jacketandOutwearModel(MensJacketSubCategoryByCategoryIdModel value) =>
      jacket_userlist.value = value;
  void activewearModel(MensActivewearSubCategortModel value) =>
      activewear_userlist.value = value;
  void formalModel(MensFormalsSubcategoryModel value) =>
      formal_userlist.value = value;
  void mensshoeModel(MensShoesSubcategoryModel value) =>
      mensshoes_userlist.value = value;
  void smartphonesModel(ElectronicsSmartPhonesSubCatModel value) =>
      smartphone_userlist.value = value;
  void laptopsModel(ElectLaptopsSubCategortModel value) =>
      laptops_userlist.value = value;
  void headphonesModel(ElecHeadphonessubCatModel value) =>
      headphones_userlist.value = value;
  void cameraModel(ElecCamerasubcategoryModel value) =>
      camera_userlist.value = value;
  void wearableModel(ElecWearableSubCatModel value) =>
      wearable_userlist.value = value;
  void womenDressModel(WomensDressSubcatviewModel value) =>
      womensDress_userlist.value = value;
  void womenTopModel(WomensTopsSubcatviewModel value) =>
      womenstops_userlist.value = value;
  void kidsclothingModel(BabyClothingSubCatModel value) =>
      kids_babyclothing_userlist.value = value;
  void kidsModel(KidsAllProductsModel value) => kids_userlist.value = value;
  void kidsboysModel(BabyBoysSubCatModel value) =>
      kids_boysApparel_userlist.value = value;
  void kidsgirlsModel(BabyGirlsSubCatModel value) =>
      kids_girlsApparel_userlist.value = value;
  void kidsshoesModel(BabyShoesSubCatModel value) =>
      kids_shoes_userlist.value = value;
  void kidstoysModel(BabytoysSubCatModel value) =>
      kids_toys_userlist.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void ProductByCatId_apiHit() async {
    loading.value = true;
    Map data = {
      "cat_id": EnglishproductbyCatId.toString(),
      "language_type": "English",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.ProductByCatListApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      //  mensApparelModel(value);
      switch (submainCatId) {
        case "133":
          return MensModel(value);
        case "153":
          return shirtandTopsModel(value);
        case "154":
          return bottomModel(value);
        case "155":
          return jacketandOutwearModel(value);
        case "156":
          return activewearModel(value);
        case "157":
          return formalModel(value);
        case "174":
          return mensshoeModel(value);
        case "166":
          return smartphonesModel(value);
        case "170":
          return laptopsModel(value);
        case "171":
          return headphonesModel(value);
        case "172":
          return cameraModel(value);
        case "173":
          return wearableModel(value);
        case "176":
          return womenDressModel(value);
        case "177":
          return womenTopModel(value);
        case "181":
          return kidsModel(value);
        case "182":
          return kidsclothingModel(value);
        case "183":
          return kidsclothingModel(value);
        case "184":
          return kidsclothingModel(value);
        case "185":
          return kidsclothingModel(value);
        case "186":
          return kidsclothingModel(value);
        default:
          throw Exception('Unexpected condition');
      }
    }).onError((error, stackTrace) {
      print("=====Sub====Cat======ProductView Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
