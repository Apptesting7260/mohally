// ignore_for_file: unused_import
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicAddtoCartModel/ArabicaddtocartModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_deleteCartModel/arabic_DeleteCartModel.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class arabic_addtocart_controller extends GetxController {
  final _api = AuthRepository();

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final addtocartModel = ArabicDeleteCartModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(ArabicDeleteCartModel value) =>
      addtocartModel.value = value;

  void setError(String value) => error.value = value;
  Future<void> signup_apihit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");
    loading.value = true;
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    Map data = {};
    _api.arabic_deletecartApi(data, header).then((value) {
      loading.value = false;
      print(data);
      print("Message: ${value.message}");

      if (value.message == "Product quantity updated") {
        // Get.to(() => LoginScreen());
      } else {
        Utils.snackBar(context, 'Failed', value.message.toString());
      }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString()); // error.toString()
    });
  }
}
