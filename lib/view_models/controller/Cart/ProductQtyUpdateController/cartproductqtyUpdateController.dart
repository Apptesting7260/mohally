import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/CartProductQtyUpdateModel/cartproductQtyUpdate.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:mohally/view_models/controller/Cart/EnglishViewCartController.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? CartId;

class CartProductQtyIncrementCartcontroller extends GetxController {
  // void incrementQuantity(int index) {
  //   _viewcartcontroller.userList.value.viewCart![index].totalQty.value += 1;
  // }

  // void decrementQuantity(int index) {
  //   _viewcartcontroller.userList.value.viewCart![index].totalQty.value -= 1;
  // }

  EnglishViewCart _viewcartcontroller = EnglishViewCart();

  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final signupModel = CartProductQtyUpdateModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(CartProductQtyUpdateModel value) =>
      signupModel.value = value;

  void setError(String value) => error.value = value;

  Future<void> addtocart_Apihit(
      BuildContext context, int index, String quantityUpdateAction) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    loading.value = true;

    Map data = {
      'cart_id': CartId.toString(),
      'quantity_update': quantityUpdateAction,
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.CartProductQtyUpdateApi(data, header).then((value) {
      loading.value = false;
      print(data);
      print("Message: ${value.message}");
      if (value.status == true) {
        // Utils.snackBar(context, 'Success', value.message.toString());
      } else {
        // Utils.snackBar(context, 'Failed', value.message.toString());
      }
      if (value.message == 'Your cart is deleted') {
        // If message indicates cart is deleted, navigate to home screen
        Get.offAll(TabScreen(
          index: 0,
        ));
      }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString());
    });
  }
}
