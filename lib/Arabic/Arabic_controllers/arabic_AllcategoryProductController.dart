import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_ProductAll.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/singleproductviewModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/arabic_ElectronicViewModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/arabic_HealthAndWellnessModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/arabic_HomeLivingViewModel.dart';
import 'package:mohally/presentation/category_page/widgets/AllProductView.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? arabicAllproductid;
String? arabicAllMainCatId;

class ArabicAllSingleProductViewController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = arabicMensApparelModel().obs;
  final healthwellnss_userlist = ArabicHealthandWellnessModel().obs;
  final electronics_userlist = arabic_ElectronicsViewModel().obs;
  final home_living_userlist = arabic_HomeLivingModel().obs;
  // final userList = Rx<dynamic>(null);
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void mensApparelModel(arabicMensApparelModel value) => userList.value = value;
  void health_wellnessModel(ArabicHealthandWellnessModel value) =>
      healthwellnss_userlist.value = value;
  void electronics_model(arabic_ElectronicsViewModel value) =>
      electronics_userlist.value = value;
  void home_living_model(arabic_HomeLivingModel value) =>
      home_living_userlist.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void All_ProductApiHit() async {
    loading.value = true;

    Map data = {
      "main_category_id": arabicAllproductid.toString(),
      "product_id": arabicAllMainCatId.toString(),
      "language_type": "Arabic"
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.arabic_allproductview(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      //  mensApparelModel(value);
      switch (allmainCatId) {
        case "133":
          return mensApparelModel(value);
        case "134":
          return electronics_model(value);
        case "135":
          return home_living_model(value);
        case "136":
          return health_wellnessModel(value);
        default:
          throw Exception('Unexpected condition');
      }
    }).onError((error, stackTrace) {
      print("=====single====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
