import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Singe_Product_ViewModel/single_product_view_model.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Englishproductid;
String? EnglishMainCatId;

class EnglishSingleProductViewController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final HomeLiving_userlist = HomeLivingSingleViewModel().obs;
  // final userList = Rx<dynamic>(null);
  RxString error = ''.obs;
  void HomelivingModel(HomeLivingSingleViewModel value) =>
      HomeLiving_userlist.value = value;

  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: CupertinoActivityIndicator(), // Circular progress indicator
        );
      },
    );
  }

  void Single_ProductApiHit(BuildContext context) async {
    loading.value = true;
    //showLoadingDialog(context);
    print("$EnglishMainCatId==============main_cat");

    print(Englishproductid);
    print("object========");
    Map data = {
      "main_category_id": EnglishMainCatId.toString(),
      "product_id": Englishproductid.toString(),
      "language_type": "English"
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.EnglishSingleproductviewApi(data, header).then((value) {
      // Get.back();
      setRxRequestStatus(Status.COMPLETED);
      //  mensApparelModel(value);

      print("----------$value");
      switch (mainCatId) {
        case "153":
          return HomelivingModel(value);
        case "154":
          return HomelivingModel(value);
        case "155":
          return HomelivingModel(value);
        case "156":
          return HomelivingModel(value);
        case "157":
          return HomelivingModel(value);
        case "174":
          return HomelivingModel(value);
        case "166":
          return HomelivingModel(value);
        case "170":
          return HomelivingModel(value);
        case "171":
          return HomelivingModel(value);
        case "172":
          return HomelivingModel(value);
        case "173":
          return HomelivingModel(value);
        case "176":
          return HomelivingModel(value);
        case "177":
          return HomelivingModel(value);
        case "178":
          return HomelivingModel(value);
        case "179":
          return HomelivingModel(value);
        case "180":
          return HomelivingModel(value);
        case "182":
          return HomelivingModel(value);
        case "183":
          return HomelivingModel(value);
        case "184":
          return HomelivingModel(value);
        case "185":
          return HomelivingModel(value);
        case "186":
          return HomelivingModel(value);
        case "188":
          return HomelivingModel(value);
        case "189":
          return HomelivingModel(value);
        case "190":
          return HomelivingModel(value);
        case "191":
          return HomelivingModel(value);
        case "192":
          return HomelivingModel(value);
        case "194":
          return HomelivingModel(value);
        case "195":
          return HomelivingModel(value);
        case "196":
          return HomelivingModel(value);
        case "197":
          return HomelivingModel(value);
        case "198":
          return HomelivingModel(value);
        case "200":
          return HomelivingModel(value);
        case "201":
          return HomelivingModel(value);
        case "202":
          return HomelivingModel(value);
        case "203":
          return HomelivingModel(value);
        case "204":
          return HomelivingModel(value);
        case "206":
          return HomelivingModel(value);
        case "207":
          return HomelivingModel(value);
        case "208":
          return HomelivingModel(value);
        case "209":
          return HomelivingModel(value);
        case "210":
          return HomelivingModel(value);
        case "275":
          return HomelivingModel(value);
        case "276":
          return HomelivingModel(value);
        default:
          throw Exception('Unexpected condition');
      }
    }).onError((error, stackTrace) {
      print("=====single====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());

      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
