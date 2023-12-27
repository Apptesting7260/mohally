import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/presentation/create_password/create_password_screen.dart';
import '../../../presentation/verification_code_screen/verification_code_screen.dart';
import '../../../repository/Auth_Repository/auth_repository.dart';
import '../reset_password/reset_password_controller.dart';

class ResetpasswordOTP_controller extends GetxController {


  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final pinController = TextEditingController().obs ;

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;


  void ResetpasswordOTP_apihit(){
    loading.value = true ;
    Map data = {
      'email' : varificationemail,
      'otp' : pinController.value.text,

    };
    print(data);
    _api.ResetpasswordOTPapi(data).then((value){
      statusOfApi.value = value.status.toString();

      loading.value = false ;

        Utils.snackBar('Right', 'Successfully');
        Get.to( CreatePassword());


    }).onError((error, stackTrace){
      Utils.snackBar('incorrect','please retry otp');
      loading.value = false ;
      otpbuttonused.value = false;

// error.toString()
    });
  }
}