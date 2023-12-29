import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import '../../../presentation/verification_code_screen/verification_code_screen.dart';
import '../../../repository/Auth_Repository/auth_repository.dart';

class VerifyEmailOTP_controller extends GetxController {
  final _api = AuthRepository();
  RxBool verified =  false.obs;


  final pinController = TextEditingController().obs;
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;

  void VerifyEmailOTP_apihit(String email,BuildContext context) {
    loading.value = true;
    Map data = {
      'email': email,
      'otp': pinController.value.text,
    };
    print(data);
    // _api.Verifyemailotpapi(data).then((value) {
    //   print("1");
    //   statusOfApi.value = value.status.toString();
    //   print("2");
    //
    //   loading.value = false;
    //
    //   Utils.snackBar('Success', 'Successfully Verified Email');
    //   print("3");
    //
    //   verified.value = true;
    //   Navigator.pop(context);
    //   print("4");
    //
    // }).onError((error, stackTrace) {
    //   print("object");
    //   Utils.snackBar('incorrect', 'please retry otp');
    //   loading.value = false;
    //   otpbuttonused.value = false;

// error.toString()
//     });
  }
}
