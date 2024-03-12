import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicHome_Model/ArabichomeModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicHomeView_controllerpage3 extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = HomeModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(HomeModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void homeview_apihit() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    print(
        "$token==========Home=====================t==o==k==e==n==================");
    loading.value = true;
    Map data = {"page_no": "3", "per_page": "10", "language_type": "Arabic"};
    var header = {'Authorization': "Bearer $token"};
    _api.homepageapi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("=====Home====Page======Error======");
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
