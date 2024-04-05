import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/SubCategories/maincategoriesGroceryandPantryModel.dart';
import 'package:mohally/models/SubCategories/subcategoriesFurnitureModel.dart';
import 'package:mohally/models/SubCategories/subcategoriesHomesAndLivingModel.dart';
import 'package:mohally/models/SubCategories/subcategories_BeautyModel.dart';
import 'package:mohally/models/SubCategories/subcategories_SportsModel.dart';
import 'package:mohally/models/SubCategories/subcategories_WomensModel.dart';
import 'package:mohally/models/SubCategories/subcategories_electronicsModel.dart';
import 'package:mohally/models/SubCategories/subcategories_healthandwellnessModel.dart';
import 'package:mohally/models/SubCategories/subcategories_kidsModel.dart';
import 'package:mohally/models/SubCategories/subcategories_kitchenwearModel.dart';
import 'package:mohally/models/SubCategories/subcategories_mensModel.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? EnglishsubMainCatId;

class CategoriesByNameControllerEnglish extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final userList = EnglishMensSubCategoryModel().obs;
  final Womens_userlist = EnglishSubCatWomensModel().obs;
  final electronics_userlist = SubElectronicsCategoryModel().obs;
  final kids_userlist = EnglishKidsSubCatModel().obs;
  final healthAndWellness_userlist = HealthandWellnessSubCatModel().obs;
  final furniture_userlist = FurnitureSubCatModel().obs;
  final kitchen_userlist = KitchenwareSubCatModel().obs;
  final sports_userlist = SportsSubCatModel().obs;
  final beauty_userlist = BeautySubCatModel().obs;
  final homeAndliving_userlist = HomeandLivingSubCatModel().obs;
  final grocery_userlist = EnglishGrocerySubCategoryModel().obs;

  void GroceryModel(EnglishGrocerySubCategoryModel value) =>
      grocery_userlist.value = value;
  void HealthAndWellnessModel(HealthandWellnessSubCatModel value) =>
      healthAndWellness_userlist.value = value;
  void FurnitureModel(FurnitureSubCatModel value) =>
      furniture_userlist.value = value;
  void KitchenModel(KitchenwareSubCatModel value) =>
      kitchen_userlist.value = value;
  void SportsModel(SportsSubCatModel value) => sports_userlist.value = value;
  void BeautyModel(BeautySubCatModel value) => beauty_userlist.value = value;
  void HomeLivingModel(HomeandLivingSubCatModel value) =>
      homeAndliving_userlist.value = value;
  void KidsModel(EnglishKidsSubCatModel value) => kids_userlist.value = value;
  void WomensModel(EnglishSubCatWomensModel value) =>
      Womens_userlist.value = value;
  void electronics_model(SubElectronicsCategoryModel value) =>
      electronics_userlist.value = value;
  void mensApparelModel(EnglishMensSubCategoryModel value) =>
      userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void SeeAll_apiHit() async {
    loading.value = true;
    Map data = {
      "language_type": "English",
      "cat_id": EnglishsubMainCatId.toString(),
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.english_categoriesApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      //  mensApparelModel(value);
      switch (mainCatId) {
        case "133":
          return mensApparelModel(value);
        case "134":
          return electronics_model(value);
        case "175":
          return WomensModel(value);
        case "181":
          return KidsModel(value);
        case "217":
          return HealthAndWellnessModel(value);
        case "211":
          return FurnitureModel(value);
        case "205":
          return KitchenModel(value);
        case "199":
          return SportsModel(value);
        case "193":
          return BeautyModel(value);
        case "187":
          return HomeLivingModel(value);
        case "223":
          return GroceryModel(value);
        default:
          throw Exception('Unexpected condition');
      }
    }).onError((error, stackTrace) {
      print("=====Home====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
