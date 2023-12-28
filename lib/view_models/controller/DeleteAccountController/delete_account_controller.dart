import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:mohally/app_url/url.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/DeleteAccount/DeleteAccountModel.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountController extends GetxController {
  final _api = AuthRepository();
   final rxRequestStatus = Status.LOADING.obs;
    final deleteMyAccount = DeleteAccountModel().obs;
    Future<void> deleteUserData() async {
        final sp = await SharedPreferences.getInstance();

    var token =
        'token';
    try {
      http.Response response = await http.delete(
        Uri.parse(AppUrl.deleteMyAccount),
        headers: {
          'Authorization': "Bearer ${sp.getString("token")}"
        },
      );print("Bearer ${sp.getString("token")}");
print(response.statusCode);
      if (response.statusCode == 200) {
  
        print('deleted user');Get.offAll(SplashScreen());
      } else {
        print('response status code not 200');
        throw jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
