import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';

class Signup_controller extends GetxController {
  final _api = AuthRepository();
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  void signup_apihit() {
    loading.value = true;
    Map data = {
      'first_name': firstNameController.value.text,
      'last_name': lastNameController.value.text,
      'phone': phoneController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.Signupapi(data).then((value) {
      loading.value = false;

      Get.to(LoginScreen());

      Utils.snackBar(value.status.toString(), value.message.toString()
          // 'Signup successfully'
          );
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Already exit account', error.toString()
          // 'please check because already sign up'
          ); // error.toString()
    });
  }
}
