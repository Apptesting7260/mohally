import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/MensSubCategoryModel/menssubcategoryModel.dart';
import 'package:mohally/models/Search_mainCategoryModel/searchMainCategorymodel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubMensCategory extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = MensSubCategoryModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(MensSubCategoryModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void SubMensCategory_ApiHit() async {
  loading.value = true;
  Map data = {
    "cat_id": "44",
    "language_type": "Arabic",
  };
  final sp = await SharedPreferences.getInstance();
  String token = sp.getString('token').toString();
  var header = {'Authorization': "Bearer $token"};
  
  try {
    var value = await _api.MensSubCategoryApi(data, header);
    print('API Response: $value');
    setRxRequestStatus(Status.COMPLETED);
    setUserList(value);
    loading.value = false;
  } catch (error, stackTrace) {
    print("=====Search====Page======Error======");
    print(error.toString());
    print(stackTrace.toString());
    loading.value = false;
    setError(error.toString());
    setRxRequestStatus(Status.ERROR);
  }
}
}
