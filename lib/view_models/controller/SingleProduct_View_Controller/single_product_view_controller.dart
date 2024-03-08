import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/LaptopsModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/WearableModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/cameraModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/headPhones.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Electronic_single_view_model/smartphonesModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/ActiveWearModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/BottomsModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/FormalsModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/JaketandOutwearModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/MensShoesModel.dart';
import 'package:mohally/models/Singe_Product_ViewModel/MensWearModel/ShirtAndTopsSingleViewModel.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/home_page_one_page.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Englishproductid;
String? EnglishMainCatId;

class EnglishSingleProductViewController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final ShirtandTops_userlist = ShirtAndTopsModel().obs;
  final Bottom_userlist = BottomsModel().obs;
  final jacket_userlist = JacketandOutwearModel().obs;
  final activewear_userlist = ActiveWearModel().obs;
  final formal_userlist = FormalModel().obs;
  final mensshoes_userlist = MensShoesModel().obs;
  final smartphone_userlist = SmartPhoneModel().obs;
  final laptops_userlist = LaptopsModel().obs;
  final headphones_userlist = HeadphonesAudioModel().obs;
  final camera_userlist = CameraModel().obs;
  final wearable_userlist = WearableModel().obs;
  // final userList = Rx<dynamic>(null);
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void shirtandTopsModel(ShirtAndTopsModel value) =>
      ShirtandTops_userlist.value = value;
  void bottomModel(BottomsModel value) => Bottom_userlist.value = value;
  void jacketandOutwearModel(JacketandOutwearModel value) =>
      jacket_userlist.value = value;
  void activewearModel(ActiveWearModel value) =>
      activewear_userlist.value = value;
  void formalModel(FormalModel value) => formal_userlist.value = value;
  void mensshoeModel(MensShoesModel value) => mensshoes_userlist.value = value;
  void smartphonesModel(SmartPhoneModel value) =>
      smartphone_userlist.value = value;
  void laptopsModel(LaptopsModel value) => laptops_userlist.value = value;
  void headphonesModel(HeadphonesAudioModel value) =>
      headphones_userlist.value = value;
  void cameraModel(CameraModel value) => camera_userlist.value = value;
  void wearableModel(WearableModel value) => wearable_userlist.value = value;

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
          return shirtandTopsModel(value);
        case "154":
          return bottomModel(value);
        case "155":
          return jacketandOutwearModel(value);
        case "156":
          return activewearModel(value);
        case "157":
          return formalModel(value);
        case "174":
          return mensshoeModel(value);
        case "166":
          return smartphonesModel(value);
        case "170":
          return laptopsModel(value);
        case "171":
          return headphonesModel(value);
        case "172":
          return cameraModel(value);
        case "173":
          return wearableModel(value);
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
