import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCatElectronics.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCatHomeWomensModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCatMens.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/Arabic_subCathealthAndwellness.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? arabicid;

class categorybyNameController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final userList = arabic_subcatMens().obs;
  final healthwellnss_userlist = ArabicSubCaHealthandWellnessModel().obs;
  final electronics_userlist = ArabicSubCatElectronicsModel().obs;
  final womens_userlist = ArabicSubCatWomensModel().obs;
  // final userList = Rx<dynamic>(null);
  void mensApparelModel(arabic_subcatMens value) => userList.value = value;
  void health_wellnessModel(ArabicSubCaHealthandWellnessModel value) =>
      healthwellnss_userlist.value = value;
  void electronics_model(ArabicSubCatElectronicsModel value) =>
      electronics_userlist.value = value;
  void womens_model(ArabicSubCatWomensModel value) =>
      womens_userlist.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void SeeAll_apiHit() async {
    loading.value = true;
    Map data = {
      "language_type": "Arabic",
      "cat_id": arabicid.toString(),
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.categoriesApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      switch (arabicMainCatId) {
        case "133":
          return mensApparelModel(value);
        case "134":
          return electronics_model(value);
        case "175":
          return womens_model(value);

        default:
          throw Exception('Unexpected condition');
      }
      // print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      // print(value);
      // loading.value = false;
    }).onError((error, stackTrace) {
      print("=====categorybyNameController======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
