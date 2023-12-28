import 'dart:convert';
import 'dart:typed_data';

import 'package:mohally/app_url/url.dart';
import 'package:mohally/data/network/network_api_services.dart';
import 'package:mohally/models/Create_password_model/create_password_model.dart';
import 'package:mohally/models/DeleteAccount/DeleteAccountModel.dart';
import 'package:mohally/models/Login_Model/login_model.dart';
import 'package:mohally/models/MyAccount_Model/myAccount_model.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/models/Update_Profile_Model/update_profile_Modal.dart';
import 'package:mohally/models/reset_password_model/reset_password_model.dart';
import 'package:mohally/models/resetpasswordotp_model/resetpasswordotp_model.dart';

class AuthRepository {
  final _apiService  = NetworkApiServices();

  Future<SignUpModel> Signupapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.signupapi);
    return SignUpModel.fromJson(response);
  }
  Future<LoginModel> Loginapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.loginapi);
    return LoginModel.fromJson(response);
  }

  Future<ResetpasswordModel> Resetpasswordapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordapi);
    return ResetpasswordModel.fromJson(response);
  }

  Future<ResetpassOTPModel> ResetpasswordOTPapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordotp);
    return ResetpassOTPModel.fromJson(response);
  }
  Future<CreatepassModel> Createpassapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.createpassword);
    return CreatepassModel.fromJson(response);
  }

   Future<UpdateprofileModel> Updateprofile(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.profileupdate);
    return UpdateprofileModel.fromJson(response);
  }

   Future<MyAccountModal> myAccountapi() async{
    dynamic response = await _apiService.getApi(AppUrl.myaccount);
    return MyAccountModal.fromJson(response);
  }
 Future<DeleteAccountModel> deleteAccountapi( ) async{
    dynamic response = await _apiService.deleteApi(AppUrl.deleteMyAccount, );
    return DeleteAccountModel.fromJson(response);
  }
}