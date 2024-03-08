import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/CouponCodeApply/applyCouponCodeModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Arabic_Add_remove_productid;

class ArabicAdd_remove_wishlistController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = CouponCodeApplyModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(CouponCodeApplyModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void AddRemoveWishlish_apihit(BuildContext context) async {
    loading.value = true;
    Map data = {
      "coupon_id": Arabic_Add_remove_productid.toString(),
      "total_amount": "Arabic",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.CouponCodeApplyApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      if (value.status == true) {
        Utils.snackBar(context, 'Success', value.message.toString());
      } else {}

      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("Apply CouponCode: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
