import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_varification_code_screen.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/reset_password_model/reset_password_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? varificationemail;

class arabic_Resetpassword_controller extends GetxController {
  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final emailController = TextEditingController().obs;

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
    RxString error = ''.obs;
  RxString statusOfApi = ''.obs;
    final forgetpasswordModel = ResetpasswordModel().obs;
  final rxRequestStatus = Status.LOADING.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setaccountdetails(ResetpasswordModel value) => forgetpasswordModel.value = value;
  void setError(String value) => error.value = value;

  void arabic_forget_password(BuildContext context) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String lang= prefs.getString('selectedLanguage').toString();
     print("${prefs.getString('selectedLanguage').toString()}==========lang");
    print("otppppp sendddd1");

    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'language_type':lang
    };
    await _api.Resetpasswordapi(data).then((value) {
      // statusOfApi.value = value.status.toString();

      // loading.value = false;

      // Utils2.snackBar('send otp', 'please check otp in email');
      // print("otppppp sendddd2");
      // Get.to(VerificationCodeScreen(
      //   emailText: emailController.value.text,
      //   controller: TextEditingController(),
      //   pinPutFocusNode: FocusNode(),
      // ));

      // varificationemail = emailController.value.text;
      // Get.to(TabScreen(index:0,));

      setaccountdetails(value);
      loading.value = false;
      if (value.message == " Otp Send On Your Email") {
        // print("ForgetPassVm.emailcontroller.value.text: ${ForgetPassVm.emailcontroller.value.text}");

        Utils.snackBar(context, 'Success', value.message.toString());

        // Set the email value here
        varificationemail = emailController.value.text;

        // Pass the email to OtpVerification
        Get.to(VerificationCodeScreen_arabic(
        emailText: emailController.value.text,
        controller: TextEditingController(),
        pinPutFocusNode: FocusNode(),
      ));

      } else {
        // Utils.snackBar(context, 'Error', value.message.toString());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils2.snackBar('غير صحيح', 'يرجى التحقق من البريد الإلكتروني');
      return; // error.toString()
    });
  }
}
