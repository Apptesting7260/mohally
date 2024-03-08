import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/EnglishDeleteCartModel/English_deleteCartModel.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? deleteCartId;

class DeleteCartCartController extends GetxController {
  final AuthRepository _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = EnglishDeleteCartModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(EnglishDeleteCartModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  List<String> selectedCartIds = [];

  void deleteCartApiHit(String? deleteCartId) async {
    if (deleteCartId != null) {
      selectedCartIds.add(deleteCartId.toString());
    }

    loading.value = true;
    Map data = {
      "cart_id[]": "86", // Pass the list of cart IDs directly
      "language_type": "English",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.deletecartApi(data, header).then((value) {
      print("Delete Cart successful");
      setRxRequestStatus(Status.COMPLETED);

      // Check the status key in the response
      if (value.status == true) {
        print(value.message);
        Get.offAll(() => TabScreen(index: 0));
        // Product successfully added to wishlist
        setUserList(value);
      } else {
        // Handle the case where the status is false
        print(value.message);
        // You might want to perform additional actions based on your requirements
      }
      print('deletecart Value ');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("deletecart error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
