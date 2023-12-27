import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:mohally/view_models/controller/reset_password/reset_password_controller.dart';

class Createpass_controller extends GetxController {


  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final passwordController = TextEditingController().obs ;
  final confirmpasswordController = TextEditingController().obs ;


  RxBool loading = false.obs;


  void Createpass_apihit(){
    loading.value = true ;
    Map data = {
      'email':   varificationemail,
      'password' : passwordController.value.text,
      'confirm_password' : confirmpasswordController.value.text

    };
    print(data);
    _api.Createpassapi(data).then((value){
      loading.value = false ;

      Get.to(  ()=>LoginScreen() );


      Utils.snackBar('Success', 'Password Created successfully');


    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('Incorrect','Try again');   // error.toString()
    });
  }
}