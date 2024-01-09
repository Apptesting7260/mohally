

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/models/Home_Banner_Model/home_banner_model.dart';
import 'package:mohally/models/user_verify_model/user_verify_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';

import '../../../core/utils/Utils_2.dart';
import '../../../data/response/status.dart';

String? varificationemail;

class UserVerify_controller extends GetxController {
  final _api = AuthRepository();
  RxBool verified =  false.obs;

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
    'type': "mobile",
  };
  await _api.Verifyphoneapi(data).then((value) {
    statusOfApi.value = value.status.toString();
    setUserList(value);
    loading.value = false;
    if (value.message == "Otp Verifed Successfully.") {
      Utils2.snackBar('Success', 'OTP verified successfully.');
      // If you want to show a different message, replace the line above with:
      // Utils2.snackBar('Success', 'OTP sent to your email.');
      Get.offAll(HomeBanner());
    } else {
      Utils2.snackBar('Error', value.message.toString());
    }
  }).onError((error, stackTrace) {
    print("Error: $error");
    loading.value = false;
    Utils2.snackBar('Failed', 'Please check OTP');
  });
}

}
