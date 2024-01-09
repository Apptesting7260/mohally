import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_controller extends GetxController {
  final _api = AuthRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void Login_apihit(BuildContext context) async {
    if(context == null){
 print("Error: Context is null!");
      return;
    }
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.Loginapi(data).then((value) {
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);

      loading.value = false;
      // loginbuttonused.value = false;
print(value.message);
       if (value.message == "success_login".tr) {


      
       navigateToHomeScreen();

      }
      else {
        Utils.snackBar(context, '_Login'.tr, value.message.toString());  
      }
      saveData(
        token: value.token.toString(),
        message: value.message.toString(),
        status: value.status.toString(),
      );

    }).onError((error, stackTrace) {
      loading.value = false;
    Utils.snackBar(context, '_Failed'.tr, 'check'.tr);
      // loginbuttonused.value = false;
      // error.toString()
    });
  }
}

// shareperfences
Future<void> saveData({
  required String token,
  required String message,
  required String status,
}) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('token', token);
  prefs.setString('status', status);
  prefs.setString('message', message);

  // similarly, save username and password if needed
  print("Successfullly stored data in sp");
}

// Function to retrieve data
Future<Map<String, dynamic>> retrieveData() async {
  final prefs = await SharedPreferences.getInstance();

  return {
    'token': prefs.getString('token'),
    'status': prefs.getString('status'),
    'message': prefs.getString('message'),
    // similarly, retrieve username and password if needed
  };

  
}
void navigateToHomeScreen() {
  if (Get.locale == null || Get.locale?.languageCode == 'ar') {
    Get.updateLocale(Locale('ar', 'DZ'));
  } else {
    Get.updateLocale(Locale('en', 'US'));
  }
  Get.offAll(() => TabScreen(index: 0));
}
