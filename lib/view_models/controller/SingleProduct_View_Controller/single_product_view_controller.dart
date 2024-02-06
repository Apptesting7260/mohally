import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Singe_Product_ViewModel/single_product_view_model.dart';
import 'package:mohally/models/SingleProductView/singleproductviewModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Englishproductid;
class EnglishSingleProductViewController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = EnglishProductViewModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(EnglishProductViewModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  
  
  void Single_ProductApiHit() async {
    loading.value = true;

    print(Englishproductid);
    print("object========");
    Map data = {
      "product_id":Englishproductid.toString(),
      "language_type":"English"
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.EnglishSingleproductviewApi(data,header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value );
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
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
