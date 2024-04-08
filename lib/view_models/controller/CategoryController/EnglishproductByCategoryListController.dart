import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/SubCategoryProductModel.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? EnglishproductbyCatId;

class ProductsByCatIdListControllerEnglish extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  final subcategoryProductuserlist = SubCategoryProducts().obs;
  void SubCatProductsModel(SubCategoryProducts value) =>
      subcategoryProductuserlist.value = value;

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
          return SubCatProductsModel(value);
        case "153":
          return SubCatProductsModel(value);
        case "154":
          return SubCatProductsModel(value);
        case "155":
          return SubCatProductsModel(value);
        case "156":
          return SubCatProductsModel(value);
        case "157":
          return SubCatProductsModel(value);
        case "174":
          return SubCatProductsModel(value);
        case "166":
          return SubCatProductsModel(value);
        case "170":
          return SubCatProductsModel(value);
        case "171":
          return SubCatProductsModel(value);
        case "172":
          return SubCatProductsModel(value);
        case "173":
          return SubCatProductsModel(value);
        case "176":
          return SubCatProductsModel(value);
        case "177":
          return SubCatProductsModel(value);
        case "178":
          return SubCatProductsModel(value);
        case "179":
          return SubCatProductsModel(value);
        case "180":
          return SubCatProductsModel(value);
        case "181":
          return SubCatProductsModel(value);
        case "218":
          return SubCatProductsModel(value);
        case "217":
          return SubCatProductsModel(value);
        case "219":
          return SubCatProductsModel(value);
        case "220":
          return SubCatProductsModel(value);
        case "221":
          return SubCatProductsModel(value);
        case "222":
          return SubCatProductsModel(value);
        case "187":
          return SubCatProductsModel(value);
        case "188":
          return SubCatProductsModel(value);
        case "189":
          return SubCatProductsModel(value);
        case "190":
          return SubCatProductsModel(value);
        case "191":
          return SubCatProductsModel(value);
        case "192":
          return SubCatProductsModel(value);
        case "182":
          return SubCatProductsModel(value);
        case "183":
          return SubCatProductsModel(value);
        case "184":
          return SubCatProductsModel(value);
        case "185":
          return SubCatProductsModel(value);
        case "186":
          return SubCatProductsModel(value);
        case "220":
          return SubCatProductsModel(value);
        case "221":
          return SubCatProductsModel(value);
        case "222":
          return SubCatProductsModel(value);
        case "223":
          return SubCatProductsModel(value);
        case "224":
          return SubCatProductsModel(value);
        case "225":
          return SubCatProductsModel(value);
        case "226":
          return SubCatProductsModel(value);
        case "227":
          return SubCatProductsModel(value);
        case "228":
          return SubCatProductsModel(value);
        case "211":
          return SubCatProductsModel(value);
        case "212":
          return SubCatProductsModel(value);
        case "213":
          return SubCatProductsModel(value);
        case "214":
          return SubCatProductsModel(value);
        case "215":
          return SubCatProductsModel(value);
        case "216":
          return SubCatProductsModel(value);

        case "193":
          return SubCatProductsModel(value);
        case "194":
          return SubCatProductsModel(value);
        case "195":
          return SubCatProductsModel(value);
        case "196":
          return SubCatProductsModel(value);
        case "197":
          return SubCatProductsModel(value);
        case "198":
          return SubCatProductsModel(value);
        case "199":
          return SubCatProductsModel(value);
        case "200":
          return SubCatProductsModel(value);
        case "201":
          return SubCatProductsModel(value);
        case "202":
          return SubCatProductsModel(value);
        case "203":
          return SubCatProductsModel(value);
        case "204":
          return SubCatProductsModel(value);
        case "205":
          return SubCatProductsModel(value);
        case "206":
          return SubCatProductsModel(value);
        case "207":
          return SubCatProductsModel(value);
        case "208":
          return SubCatProductsModel(value);
        case "209":
          return SubCatProductsModel(value);
        case "210":
          return SubCatProductsModel(value);
        case "274":
          return SubCatProductsModel(value);
        case "275":
          return SubCatProductsModel(value);
        case "2":
          return SubCatProductsModel(value);
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
