import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/models/user_verify_model/user_verify_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';

import '../../../data/response/status.dart';

String? varificationemail;

class UserVerify_controller extends GetxController {
  final _api = AuthRepository();

var userList = UserVerifyModel().obs;
   RxString error = ''.obs;

  // void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserVerifyModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;

  void UserVerify_apihit(String phone) async {
    print("otp send1");
    print(phone);

    loading.value = true;
    Map data = {
      'mobile': phone,
      'type': "mobile" ,
    };
    await _api.Verifyphoneapi(data).then((value) {
      statusOfApi.value = value.status.toString();
      setUserList(value);
      loading.value = false;

      Utils.snackBar('send otp', 'please check otp in email');
      print("otp send2");
      // Get.to(VerificationCodeScreen(
      //   emailText: email,
      //   controller: TextEditingController(),
      //   pinPutFocusNode: FocusNode(),
      // ));

      // varificationemail = email;
      // Get.to(TabScreen(index:0,));

    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('incorrect', 'please check email');
      return; // error.toString()
    });
  }
}
