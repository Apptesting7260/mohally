import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Home_ModelEnglish/homeModel_English.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/MensSubCatViewModel/mensAllProductsModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MensAllProductEnglish extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final mens = MensAllProductModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(MensAllProductModel value) => mens.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void MensAllProductView() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();

    print(
        "$token==========Home=====================t==o==k==e==n==================");
    loading.value = true;
    Map data = {"cat_id": "133", "language_type": "English"};
    var header = {'Authorization': "Bearer $token"};
    _api.EngAllProductOfMens(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("AllMensProduct===error");
      print(error.toString());
      print(stackTrace.toString());
      // print("fdfdgfdgfdfdhf");
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
