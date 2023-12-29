import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';

import '../../../models/user_verify_model/user_verify_model.dart';

String? varificationemail;

class Verifyemail_controller extends GetxController {
  final _api = AuthRepository();
  var userList = UserVerifyModel().obs;
  RxString error = ''.obs;

  // void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserVerifyModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;

  void Verifyeusermail_apihit(String email) async {
    print("otp send1");
    print(email);

    loading.value = true;
    Map data = {
      'email': email,
      'type': "email"
    };
    await _api.Verifyemailapi(data).then((value) {
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

      varificationemail = email;
      // Get.to(TabScreen(index:0,));
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('incorrect', 'please check email');
      return; // error.toString()
    });
  }
}
