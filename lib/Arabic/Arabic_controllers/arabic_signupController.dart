import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
// String? varificationemail;
class arabic_Signup_controller extends GetxController {
  
  final _api = AuthRepository();
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
    final countryController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
    RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final signupModel = SignUpModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(SignUpModel value) => signupModel.value = value;

  void setError(String value) => error.value = value;

  Future<void> arabic_signup_apihit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     String lang= prefs.getString('selectedLanguage').toString();
     print("${prefs.getString('selectedLanguage').toString()}==========lang");
    loading.value = true;
    Map data = {
      'first_name': firstNameController.value.text,
      'last_name': lastNameController.value.text,
      'phone': phoneController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'country':countryController.value.text,
      'language_type':lang
    };
    _api.Signupapi(data).then((value) {
      loading.value = false;
      print(data);
       print("Message: ${value.message}");

       if (value.message == "User SignUp Successfully") {
        //  varificationemail = emailController.value.text;
           Get.to(() => LoginScreen_arabic());

      }
     else {
        Utils.snackBar(context, 'Failed', value.message.toString());  
      }
     
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString());// error.toString()
    });
  }
}
