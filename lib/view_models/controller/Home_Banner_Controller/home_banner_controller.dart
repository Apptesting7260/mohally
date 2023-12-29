
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Home_Banner_Model/home_banner_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';

class HomeBanner_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = HomeBannerModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(HomeBannerModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;
  // RxList<Widget> carouselItems=[].obs;
  RxBool loading = false.obs;
  List<Widget> carouselItems=[];
  void homeBanner_apihit() async {
    loading.value = true;
    Map data = {"page_name": "home", "location": "top"};

    _api.homeBannerapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;

    }).onError((error, stackTrace) {

      print("fdfdgfdgfdfdhf");
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
