import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicESinglephoneModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleCameraModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleHeadphonesModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleLaptopModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicElectronicsSingleViewModel/arabicEsingleWearableModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensActivewearModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensBottosModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensFormalsModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensJacketModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicSingleMensShirtModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicMensSingleModel/arabicsingleMensShoesModel.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? productid;
String? MainCatId;

class SingleProductViewController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final ShirtandTops_userlist = ArabicShirtAndTopsModel().obs;
  final Bottom_userlist = ArabicBottomsModel().obs;
  final jacket_userlist = ArabicJacketandOutwearModel().obs;
  final activewear_userlist = ArabicActiveWearModel().obs;
  final formal_userlist = ArabicFormalModel().obs;
  final mensshoes_userlist = ArabicMensShoesModel().obs;
  final smartphone_userlist = ArabicSmartPhoneModel().obs;
  final laptops_userlist = ArabicLaptopsModel().obs;
  final headphones_userlist = ArabicHeadphonesAudioModel().obs;
  final camera_userlist = ArabicCameraModel().obs;
  final wearable_userlist = ArabicWearableModel().obs;
  // final userList = Rx<dynamic>(null);
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void shirtandTopsModel(ArabicShirtAndTopsModel value) =>
      ShirtandTops_userlist.value = value;
  void bottomModel(ArabicBottomsModel value) => Bottom_userlist.value = value;
  void jacketandOutwearModel(ArabicJacketandOutwearModel value) =>
      jacket_userlist.value = value;
  void activewearModel(ArabicActiveWearModel value) =>
      activewear_userlist.value = value;
  void formalModel(ArabicFormalModel value) => formal_userlist.value = value;
  void mensshoeModel(ArabicMensShoesModel value) =>
      mensshoes_userlist.value = value;
  void smartphonesModel(ArabicSmartPhoneModel value) =>
      smartphone_userlist.value = value;
  void laptopsModel(ArabicLaptopsModel value) => laptops_userlist.value = value;
  void headphonesModel(ArabicHeadphonesAudioModel value) =>
      headphones_userlist.value = value;
  void cameraModel(ArabicCameraModel value) => camera_userlist.value = value;
  void wearableModel(ArabicWearableModel value) =>
      wearable_userlist.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  Single_ProductApiHit() async {
    loading.value = true;

    print(productid);
    print("object========");
    Map data = {
      "main_category_id": MainCatId.toString(),
      "product_id": productid,
      "language_type": "Arabic"
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.SingleproductviewApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      switch (arabicMainCatId) {
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
      // setUserList(value);
      // print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      // print(value);
      // loading.value = false;
    }).onError((error, stackTrace) {
      print("=====Arabicsingle====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
