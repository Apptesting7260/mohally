import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/ArabicSubCatWomensProductViewModel/arabicWomensSubCatDressProductView.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/ArabicSubCatWomensProductViewModel/arabicWomensSubCatTopsProductViewModel.dart';
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
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryMensScreen.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? arabicproductbyCatId;

class ProductsByCatIdListControllerarabic extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final ShirtandTops_userlist = ArabicShirtsSubcatviewModel().obs;
  final Bottom_userlist = ArabicMensBottomSubCatModel().obs;
  final jacket_userlist = ArabicMensJacketSubCatModel().obs;
  final activewear_userlist = ArabicMensSubcatactivewearModel().obs;
  final formal_userlist = ArabicmensSubCatFormalModel().obs;
  final mensshoes_userlist = ArabicMensSubCatShoesModel().obs;
  final smartphone_userlist = ArabicelecsubcatPhoneModel().obs;
  final laptops_userlist = ArabicelecsubcatLaptopModel().obs;
  final headphones_userlist = ArabicsubcatHeadphoneModel().obs;
  final camera_userlist = ArabicelecsubcatCameraModel().obs;
  final wearable_userlist = ArabicelecsubcatWearableModel().obs;
  final womens_dressUserlist = ArabicWomensDressesProductViewModel().obs;
  final womens_topUserlist = ArabicWomensTopsProductViewModel().obs;
  // final userList = Rx<dynamic>(null);
  void shirtandTopsModel(ArabicShirtsSubcatviewModel value) =>
      ShirtandTops_userlist.value = value;
  void bottomModel(ArabicMensBottomSubCatModel value) =>
      Bottom_userlist.value = value;
  void jacketandOutwearModel(ArabicMensJacketSubCatModel value) =>
      jacket_userlist.value = value;
  void activewearModel(ArabicMensSubcatactivewearModel value) =>
      activewear_userlist.value = value;
  void formalModel(ArabicmensSubCatFormalModel value) =>
      formal_userlist.value = value;
  void mensshoeModel(ArabicMensSubCatShoesModel value) =>
      mensshoes_userlist.value = value;
  void smartphonesModel(ArabicelecsubcatPhoneModel value) =>
      smartphone_userlist.value = value;
  void laptopsModel(ArabicelecsubcatLaptopModel value) =>
      laptops_userlist.value = value;
  void headphonesModel(ArabicsubcatHeadphoneModel value) =>
      headphones_userlist.value = value;
  void cameraModel(ArabicelecsubcatCameraModel value) =>
      camera_userlist.value = value;
  void wearableModel(ArabicelecsubcatWearableModel value) =>
      wearable_userlist.value = value;
  void womensDressModel(ArabicWomensDressesProductViewModel value) =>
      womens_dressUserlist.value = value;
  void womenstopModel(ArabicWomensTopsProductViewModel value) =>
      womens_topUserlist.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void ProductByCatId_apiHit() async {
    loading.value = true;
    Map data = {
      "cat_id": arabicproductbyCatId.toString(),
      "language_type": "Arabic",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.arabicProductByCatListApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      //  mensApparelModel(value);
      switch (arabicsubmainCatId) {
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
        case "177":
          return womenstopModel(value);
        case "176":
          return womensDressModel(value);
        default:
          throw Exception('Unexpected condition');
      }
    }).onError((error, stackTrace) {
      print("=====Arabic====ProductByCategorylist======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
