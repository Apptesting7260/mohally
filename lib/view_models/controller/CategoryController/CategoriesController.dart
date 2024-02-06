import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/SeeAllMainCategoryModelEnglish/CategoryModel_English.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesControllerEnglish extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = CategoriesModelEnglish().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(CategoriesModelEnglish value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void SeeAll_apiHit() async {
  
    loading.value = true;
    Map data = {
      "language_type":"English"
    };
     final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
     var header = {'Authorization': "Bearer $token"};
    _api.english_categoriesApi(data,header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value );
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
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
