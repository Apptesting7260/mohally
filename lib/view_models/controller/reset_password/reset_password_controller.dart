import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/presentation/verification_code_screen/verification_code_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';

String? varificationemail;

class Resetpassword_controller extends GetxController {
  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final emailController = TextEditingController().obs;

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;

  void Resetpassword_apihit() async {
    print("otppppp sendddd1");

    loading.value = true;
    Map data = {
      'email': emailController.value.text,
    };
    await _api.Resetpasswordapi(data).then((value) {
      statusOfApi.value = value.status.toString();

      loading.value = false;

      Utils2.snackBar('send otp', 'please check otp in email');
      print("otppppp sendddd2");
      Get.to(VerificationCodeScreen(
        emailText: emailController.value.text,
        controller: TextEditingController(),
        pinPutFocusNode: FocusNode(),
      ));

      varificationemail = emailController.value.text;
      // Get.to(TabScreen(index:0,));
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils2.snackBar('incorrect', 'please check email');
      return; // error.toString()
    });
  }
}
