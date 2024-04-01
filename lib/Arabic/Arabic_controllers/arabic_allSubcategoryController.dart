import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_Models/SearchMainCategoryModel/arabicSearchmaincatModel.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Search_mainCategoryModel/searchMainCategorymodel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicAllSubCategory extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userlist = ArabicSearch_MainCategory_Model().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(ArabicSearch_MainCategory_Model value) =>
      userlist.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void AllSubCat() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();

    print(
        "$token==========Home=====================t==o==k==e==n==================");
    loading.value = true;
    Map data = {"main_cat_name": "", "language_type": "Arabic"};
    var header = {'Authorization': "Bearer $token"};
    _api.ArabicsearchcategoriesApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("AllSubCat===error");
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
