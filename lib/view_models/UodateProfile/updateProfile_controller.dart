// ignore_for_file: unused_field

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/presentation/my_account/my_account_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:http/http.dart'as http;
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
var response;

class UpdateProfile_Controller extends GetxController {

  final _api = AuthRepository();
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  File? imgFile ;
  final ImagePicker _imgPicker = ImagePicker();


MyAccountController MyAccountControllerin= MyAccountController();
  Future<void> ProfileApiHit() async {
    final sp = await SharedPreferences.getInstance();

    loading.value = true;
    try {
      
      var url = Uri.parse('https://urlsdemo.net/mohally/api/user-profile-update-api');
      var request = http.MultipartRequest('POST', url);

  
      if (imgFile == null) {

      } else {
        print("object");
        var fileStream = http.ByteStream(imgFile!.openRead());
        var length = await imgFile!.length();
        var multipartFile = http.MultipartFile('pro_img', fileStream, length,
            filename: imgFile!.path.split('/').last);
        request.files.add(multipartFile);
        print(imgFile);
      }

      // Add other text fields to the request+
      request.fields['first_name'] = firstNameController.value.text;
      request.fields['last_name'] = lastNameController.value.text;
      request.fields['phone'] = phoneController.value.text;

      request.headers['Authorization'] =
      "Bearer ${sp.getString("token")}";
      

      // Send the request and get the response
      response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print(responseBody);
      // Check the response status
      if (response.statusCode == 200) {
           Utils2.snackBar('Success', 'Edit Successfully');Get.off(MyAccountScreen());

 
        loading.value = false;

      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        loading.value = false;
      }
    } catch (e) {
      loading.value = false;
      print(response);
        Utils2.snackBar('Failed','Error occurred while uploading file: $e');

    }
  }


}
