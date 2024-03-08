import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/EnglishAdd_to_cart_Model/EnglishaddtocartModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Englishcartproductid;
String? EnglishAddtocartquantity;
String? EnglishAddtocartColor;
String? EnglishAddtocartSize;
String? EnglishAddtocartprice;
String? EnglishAddtocartModelId;

class AddToCartcontroller extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final signupModel = EnglishAddtoCartModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(EnglishAddtoCartModel value) =>
      signupModel.value = value;

  void setError(String value) => error.value = value;

  Future<void> addtocart_Apihit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    Map<String, String> productDetails = {};

    addIfNotNull(productDetails, 'Color', EnglishAddtocartColor?.toString());
    addIfNotNull(productDetails, 'Size', EnglishAddtocartSize?.toString());
    addIfNotNull(
        productDetails, 'Model_id', EnglishAddtocartModelId?.toString());

    loading.value = true;

    Map<String, dynamic> data = {
      'product_id': Englishcartproductid.toString(),
      'total_quantity': 1.toString(),
      'price': EnglishAddtocartprice.toString(),
      'coupon': "".toString(),
      'product_details': json.encode(productDetails), // Encode the map to JSON
      'language_type': 'English'
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.AddtocartApi(data, header).then((value) {
      loading.value = false;
      print(data);
      print("Message: ${value.message}");
      if (value.status == true) {
        Get.back();
        Utils.snackBar(context, 'Success', value.message.toString());
      } else {
        Utils.snackBar(context, 'Failed', value.message.toString());
      }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString());
    });
  }

  void addIfNotNull(Map<String, String> map, String key, String? value) {
    if (value != null && value != 'null') {
      map[key] = value;
    }
  }
}