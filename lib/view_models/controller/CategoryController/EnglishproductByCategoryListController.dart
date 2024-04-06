import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecCameraSubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecHeadphonessubcatmodel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecLaptopsSubcatModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecSmartPhonesSubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/ElectronicsSubCategorybyCatModel/elecWearablesubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/FurnitureSubCatProductsModels/FurnitureAllProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/FurnitureSubCatProductsModels/FurnitureSubCatBedroomProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/FurnitureSubCatProductsModels/FurnitureSubCatCarpetsProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/FurnitureSubCatProductsModels/FurnitureSubCatDecorProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/FurnitureSubCatProductsModels/FurnitureSubCatLivingRoomProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/FurnitureSubCatProductsModels/FurnotureSubCatLightProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/GrocerySubCatProductsModel/GroceryAllProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HealthandWellnesSubcatProductsModel/health_SubCatpersonalProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HealthandWellnesSubcatProductsModel/health_fittnessProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HealthandWellnesSubcatProductsModel/health_subcatHelathguidesProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HealthandWellnesSubcatProductsModel/health_subcatWellnessguideProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HealthandWellnesSubcatProductsModel/health_vitaminsSubCatProductModels.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HealthandWellnesSubcatProductsModel/healthandWellnessAllproductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HomelivingModel/homelivingBeddingProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HomelivingModel/homelivingProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/HomelivingModel/homelivingSubCatFurnitureProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyAllProductsViewModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyBoysapparelProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyGirlsproductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyToySubCatModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyclothingProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KidsSubCategoryModel/babyshoesproductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KitchenSubcatProductsModel/KitchenAllProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KitchenSubcatProductsModel/KitchenCookwareProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KitchenSubcatProductsModel/KitchenGadgetProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KitchenSubcatProductsModel/KitchenLargeAppliancesProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KitchenSubcatProductsModel/KitchenSmallAppliancesProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/KitchenSubcatProductsModel/kitchendiningproductsmodel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensAllProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensBottomsubcatbycatidModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensFormalsSubCategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensJacketSubCategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensShoesSubcategoryModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensactivewearSubCategory.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/shirtandtopsSubCatViewModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/WomenSubcatSleepwareProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/WomensSubCatJacketModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/womenSubCatTopModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/womensSubCatDressProductViewModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/womensSubcatBottomProductsModel.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/GrocerySubCatProductsModel/GroceryBevergesProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/GrocerySubCatProductsModel/GroceryFreshProductSubCatProductModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/GrocerySubCatProductsModel/GroceryNavturalsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/GrocerySubCatProductsModel/GrocerySnacksProductsModel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/GrocerySubCatProductsModel/GrocerySubCatPantryProductsModel.dart';

String? EnglishproductbyCatId;

class ProductsByCatIdListControllerEnglish extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///Mensss
  final mens = MensAllProductModel().obs;
  final ShirtandTops_userlist = ShirtsSubcatviewModel().obs;
  final Bottom_userlist = MensBottomSubcatviewModel().obs;
  final jacket_userlist = MensJacketSubCategoryByCategoryIdModel().obs;
  final activewear_userlist = MensActivewearSubCategortModel().obs;
  final formal_userlist = MensFormalsSubcategoryModel().obs;
  final mensshoes_userlist = MensShoesSubcategoryModel().obs;
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

  ///Electronics
  final smartphone_userlist = ElectronicsSmartPhonesSubCatModel().obs;
  final laptops_userlist = ElectLaptopsSubCategortModel().obs;
  final headphones_userlist = ElecHeadphonessubCatModel().obs;
  final camera_userlist = ElecCamerasubcategoryModel().obs;
  final wearable_userlist = ElecWearableSubCatModel().obs;
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

//Womens
  final womensDress_userlist = WomensDressSubcatviewModel().obs;
  final womenstops_userlist = WomensTopsSubcatviewModel().obs;
  final womensbottom_userlist = WomensBottomSubcatviewModel().obs;
  final womensjacket_userlist = WomensJacketsSubcatviewModel().obs;
  final womenssleepware_userlist = WomensSleepwareSubcatviewModel().obs;

  void womenDressModel(WomensDressSubcatviewModel value) =>
      womensDress_userlist.value = value;
  void womenTopModel(WomensTopsSubcatviewModel value) =>
      womenstops_userlist.value = value;
  void womenbottomModel(WomensBottomSubcatviewModel value) =>
      womensbottom_userlist.value = value;
  void womenjacketModel(WomensJacketsSubcatviewModel value) =>
      womensjacket_userlist.value = value;
  void womensleepwareModel(WomensSleepwareSubcatviewModel value) =>
      womenssleepware_userlist.value = value;
//Kids//
  final kids_userlist = KidsAllProductsModel().obs;
  final kids_babyclothing_userlist = BabyClothingSubCatModel().obs;
  final kids_boysApparel_userlist = BabyBoysSubCatModel().obs;
  final kids_girlsApparel_userlist = BabyGirlsSubCatModel().obs;
  final kids_shoes_userlist = BabyShoesSubCatModel().obs;
  final kids_toys_userlist = BabytoysSubCatModel().obs;
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

//Homeliving
  final homeliving_userlist = HomelivingProducts().obs;
  final homeliving_furniture_userlist =
      HomelivingSubCatFurnitureProductsModel().obs;
  final homeliving_bedding_userlist =
      HomelivingSubCatBeddingProductsModel().obs;
  void homeliving_BeddingModel(HomelivingSubCatBeddingProductsModel value) =>
      homeliving_bedding_userlist.value = value;
  void homeliving_furnitureModel(
          HomelivingSubCatFurnitureProductsModel value) =>
      homeliving_furniture_userlist.value = value;
  void HomelivingModel(HomelivingProducts value) =>
      homeliving_userlist.value = value;

//HealthWellness
  final Health_vitamins_userlist = Health_vitaminsSubcatProductsviewModel().obs;
  final healthwellness_userlist = HealthandWellnessAllProductsviewModel().obs;
  final healthwellness_fittness = Health_fittnessSubcatProductsviewModel().obs;
  final healthwellness_personal =
      HealthandWellnessPersonalProductsviewModel().obs;
  final healthwellness_healthGuides =
      HealthandWellnessHealthGuidesProductsviewModel().obs;
  final healthwellness_wellnessGuides =
      HealthandWellnessWellnessGuidesProductsviewModel().obs;
  void healthandWellnessModel(HealthandWellnessAllProductsviewModel value) =>
      healthwellness_userlist.value = value;
  void Health_vitaminsModel(Health_vitaminsSubcatProductsviewModel value) =>
      Health_vitamins_userlist.value = value;
  void Health_personalModel(HealthandWellnessPersonalProductsviewModel value) =>
      healthwellness_personal.value = value;
  void Health_healthguidesModel(
          HealthandWellnessHealthGuidesProductsviewModel value) =>
      healthwellness_healthGuides.value = value;
  void Health_fittnessModel(Health_fittnessSubcatProductsviewModel value) =>
      healthwellness_fittness.value = value;
  void Health_wellnessGuidesModel(
          HealthandWellnessWellnessGuidesProductsviewModel value) =>
      healthwellness_wellnessGuides.value = value;

  //Grocery
  final Grocery_userlist = GroceryAllProductsModel().obs;
  final Grocery_produce_userlist = GrocerySubCatFreshProduceProductsModel().obs;
  final Grocery_pantry_userlist = GrocerySubCatPantryProductsModel().obs;
  final Grocery_Snacks_userlist = GrocerySubCatSnacksProductsModel().obs;
  final Grocery_Beverages_userlist = GroceryBevergesProductsModel().obs;
  final Grocery_Naturals_userlist = GroceryNaturalsProductsModel().obs;
  void GroceryModel(GroceryAllProductsModel value) =>
      Grocery_userlist.value = value;
  void GroceryProduceModel(GrocerySubCatFreshProduceProductsModel value) =>
      Grocery_produce_userlist.value = value;
  void GroceryPantryModel(GrocerySubCatPantryProductsModel value) =>
      Grocery_pantry_userlist.value = value;
  void GrocerysnacksModel(GrocerySubCatSnacksProductsModel value) =>
      Grocery_Snacks_userlist.value = value;
  void GrocerybeveragesModel(GroceryBevergesProductsModel value) =>
      Grocery_Beverages_userlist.value = value;
  void GrocerynaturalsModel(GroceryNaturalsProductsModel value) =>
      Grocery_Naturals_userlist.value = value;

//Furniture
  final furniture_userlist = FurnitureAllProductsModel().obs;
  final furniture_livingroom_userlist = Furniture_livingRoomProductsModel().obs;
  final furniture_bedroom_userlist = Furniture_BedroomProductsModel().obs;
  final furniture_decor_userlist = FurnitureHomeDecorProductsModel().obs;
  final furniture_light_userlist = Furniture_lightsProductsModel().obs;
  final furniture_carpets_userlist = Furniture_CarpetsProductsModel().obs;
  void FurnitureModel(FurnitureAllProductsModel value) =>
      furniture_userlist.value = value;
  void Furniture_livingroomModel(Furniture_livingRoomProductsModel value) =>
      furniture_livingroom_userlist.value = value;
  void Furniture_bedroomModel(Furniture_BedroomProductsModel value) =>
      furniture_bedroom_userlist.value = value;
  void Furniture_decorModel(FurnitureHomeDecorProductsModel value) =>
      furniture_decor_userlist.value = value;
  void Furniture_lightModel(Furniture_lightsProductsModel value) =>
      furniture_light_userlist.value = value;
  void Furniture_carpetModel(Furniture_CarpetsProductsModel value) =>
      furniture_carpets_userlist.value = value;

//Kitchen
  final Kitchen_userlist = Kitchen_AllProductsModel().obs;
  final Kitchen_smallAppliances_userlist =
      Kitchen_smallAppliancesProductsModel().obs;
  final Kitchen_cookware_userlist = Kitchen_CookwareProductsModel().obs;
  final Kitchen_gadget_userlist = Kitchen_GadgetsProductsModel().obs;
  final Kitchen_largeAppliances_userlist =
      Kitchen_largeappliancesProductsModel().obs;
  final Kitchen_dining_userlist = Kitchen_diningProductsModel().obs;
  void KitchenModel(Kitchen_AllProductsModel value) =>
      Kitchen_userlist.value = value;
  void KitchenSmallAppliancesModel(
          Kitchen_smallAppliancesProductsModel value) =>
      Kitchen_smallAppliances_userlist.value = value;
  void KitchenCookWareModel(Kitchen_CookwareProductsModel value) =>
      Kitchen_cookware_userlist.value = value;
  void KitchenGadgetModel(Kitchen_GadgetsProductsModel value) =>
      Kitchen_gadget_userlist.value = value;
  void KitchenLargeAppliancesModel(
          Kitchen_largeappliancesProductsModel value) =>
      Kitchen_largeAppliances_userlist.value = value;
  void KitchenDiningModel(Kitchen_diningProductsModel value) =>
      Kitchen_dining_userlist.value = value;

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
        case "178":
          return womenbottomModel(value);
        case "179":
          return womenjacketModel(value);
        case "180":
          return womensleepwareModel(value);
        case "181":
          return kidsModel(value);
        case "218":
          return Health_vitaminsModel(value);
        case "217":
          return healthandWellnessModel(value);
        case "219":
          return Health_fittnessModel(value);
        case "220":
          return Health_personalModel(value);
        case "221":
          return Health_healthguidesModel(value);
        case "222":
          return Health_wellnessGuidesModel(value);
        case "187":
          return HomelivingModel(value);
        case "188":
          return homeliving_furnitureModel(value);
        case "189":
          return homeliving_BeddingModel(value);
        case "182":
          return kidsclothingModel(value);
        case "183":
          return kidsboysModel(value);
        case "184":
          return kidsgirlsModel(value);
        case "185":
          return kidsshoesModel(value);
        case "186":
          return kidstoysModel(value);
        case "220":
          return kidsclothingModel(value);
        case "221":
          return kidsclothingModel(value);
        case "222":
          return kidsclothingModel(value);
        case "223":
          return GroceryModel(value);
        case "224":
          return GroceryProduceModel(value);
        case "225":
          return GroceryPantryModel(value);
        case "226":
          return GrocerysnacksModel(value);
        case "227":
          return GrocerybeveragesModel(value);
        case "228":
          return GrocerynaturalsModel(value);
        case "211":
          return FurnitureModel(value);
        case "212":
          return Furniture_livingroomModel(value);
        case "213":
          return Furniture_bedroomModel(value);
        case "214":
          return Furniture_decorModel(value);
        case "215":
          return Furniture_lightModel(value);
        case "216":
          return Furniture_carpetModel(value);
        case "205":
          return KitchenModel(value);
        case "206":
          return KitchenSmallAppliancesModel(value);
        case "207":
          return KitchenCookWareModel(value);
        case "208":
          return KitchenGadgetModel(value);
        case "209":
          return KitchenLargeAppliancesModel(value);
        case "210":
          return KitchenDiningModel(value);
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
