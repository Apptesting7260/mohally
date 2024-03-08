import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Product_Search_By_NameModel/productsearchbynameModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProductByName_Controller extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = ProductSearchByNameModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(ProductSearchByNameModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void Search_Product_By_Name_ApiHit() async {
    loading.value = true;
    Map data = {
      "pro_name": "و",
      "language_type": "Arabic",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    try {
      var value = await _api.ProductSearchbyNameApi(data, header);
      print('API Response: $value');
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      loading.value = false;
    } catch (error, stackTrace) {
      print("=====SearchProductByName_Controller=======Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    }
  }
}
