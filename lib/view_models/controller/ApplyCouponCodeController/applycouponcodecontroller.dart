import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/CouponCodeApply/applyCouponCodeModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? CouponId;
String? TotalAmount;
String? discountprice;
String? totalpriceafterdiscount;
String? couponidforcheckout;

class CouponCodeApplyController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = CouponCodeApplyModel().obs;
  RxString error = ''.obs;
  RxList selectedCartIds = [].obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(CouponCodeApplyModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void applyCoupon_apihit(BuildContext context, List ids) async {
    loading.value = true;
    Map data = {
      "coupon_id": CouponId.toString(),
      "total_amount": TotalAmount.toString(),
      "cart_id": ids.toString(),
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.CouponCodeApplyApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      if (value.status == true) {
        Get.back();
      } else {}
      discountprice = value.discountPrice.toString();
      totalpriceafterdiscount = value.totalPrice.toString();
      // couponidforcheckout = value.couponid.toString();
      print("========dis${discountprice}");
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("Apply CouponCode error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
