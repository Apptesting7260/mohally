import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_forget_password_controller.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_Passwordcreate_screen.dart';

import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/reset_password_model/reset_password_model.dart';
import 'package:mohally/models/resetpasswordotp_model/resetpasswordotp_model.dart';
import 'package:mohally/presentation/verification_code_screen/verification_code_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class arabic_ResetpasswordOTP_controller extends GetxController {
  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final pinController = TextEditingController().obs ;

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  final otpModel = ResetpassOTPModel().obs;
  RxString error = ''.obs;
    final rxRequestStatus = Status.LOADING.obs;
void setaccountdetails(ResetpassOTPModel value) => otpModel.value = value;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
Future<bool> resendOtp(String varificationemail) async {
    try {
      loading.value = true;

      // Make the API call to resend OTP
      ResetpasswordModel value = await _api.Resetpasswordapi({'email': varificationemail});

      // Check the response and return a boolean indicating success or failure
      if (value.status == "success" && value.message == " Otp Send On Your Email") {
        
        return true;
      } else {
        setError(value.message.toString());
        return false;
      }
    } catch (error) {
      print("Error: $error");
      setError('Failed to Resend OTP');
      return false;
    } finally {
      loading.value = false;
    }
  }

  Future<void> arabic_ResetpasswordOTP_apihit(BuildContext? context) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String lang= prefs.getString('selectedLanguage').toString();
     print("${prefs.getString('selectedLanguage').toString()}==========lang");
    loading.value = true ;
    Map data = {
      'email' : varificationemail,
      'otp' : pinController.value.text,
      'language_type':lang
    };
    print(data);
    _api.ResetpasswordOTPapi(data).then((value){

             setaccountdetails(value);
      loading.value = false;
      print("Message: ${value.message}");

      if (value.message == "Otp Successfully Match") {
        Utils.snackBar(context!, 'Success', value.message.toString());

     Get.to( CreatePassword_arabic());

      } else {
        // Utils.snackBar(context!, 'Error', value.message.toString());
      }
    })
    //   statusOfApi.value = value.status.toString();
    //   loading.value = false ;
    //     Utils2.snackBar('Right', 'Successfully');
    //     Get.to( CreatePassword());
    // })
    .onError((error, stackTrace){
      Utils2.snackBar('incorrect','please retry otp');
      loading.value = false ;
      otpbuttonused.value = false;
// error.toString()
    });
  }
}