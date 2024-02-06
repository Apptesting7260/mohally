import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/SeeAllMainCategoryModel/CategoryModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = CategoriesModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(CategoriesModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void SeeAll_apiHit() async {
    loading.value = true;
    Map data = {
      "language_type":"Arabic"
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
     var header = {'Authorization': "Bearer $token"};
    _api.categoriesApi(data,header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value );
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("=====Home====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}

// import 'package:get/get.dart';
// import 'package:mohally/data/response/status.dart';
// import 'package:mohally/models/SeeAllMainCategoryModel/CategoryModel.dart';
// import 'package:mohally/presentation/category_page/category_screen.dart';
// import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CategoriesController extends GetxController {
//   final _api = AuthRepository();

//   final rxRequestStatus = Status.LOADING.obs;
//   final userList = CategoriesModel().obs;
//   RxString error = ''.obs;
//   List<SeeAllMainCategory>? seeallCat = [];

//   void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
//   void setUserList(CategoriesModel value) => userList.value = value;
//   void setError(String value) => error.value = value;
//   RxBool loading = false.obs;
//   void SeeAll_apiHit(String mainCatId) async {
//     final sp = await SharedPreferences.getInstance();
//     var token = 'token';
//     Map data = {'language_type': "English"};
//     data.addIf(mainCatId.isNotEmpty, "cat_id", mainCatId);
//     // 'cat_id': mainCatId};
//     loading.value = true;

//     var header = {'Authorization': "Bearer ${sp.getString("token")}"};
//     _api.categoriesApi(data, header).then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//       seeallCat = value.seeAllMainCategory ;
//       print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
//       print(value);
//       loading.value = false;
//     }).onError((error, stackTrace) {
//       print("fdfdgfdgfdfdhf");
//       print(error);
//       print(stackTrace);
//       loading.value = false;
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//       // error.toString()
//     });
//   }


//   void allCat(String mainCatId) async {
//     final sp = await SharedPreferences.getInstance();
//     var token = 'token';
//     Map data = {'language_type': "English"};
//     data.addIf(mainCatId.isNotEmpty, "cat_id", mainCatId);
//     // 'cat_id': mainCatId};
//     loading.value = true;

//     var header = {'Authorization': "Bearer ${sp.getString("token")}"};
//     _api.categoriesApi(data, header).then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//       print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
//       print(value);
//       loading.value = false;
//     }).onError((error, stackTrace) {
//       print("fdfdgfdgfdfdhf");
//       print(error);
//       print(stackTrace);
//       loading.value = false;
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//       // error.toString()
//     });
//   }
// }
