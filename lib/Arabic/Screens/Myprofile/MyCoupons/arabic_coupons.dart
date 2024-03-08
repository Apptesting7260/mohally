import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/CouponController/couponcodeController.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

class CoupanScreen_arabic extends StatefulWidget {
  const CoupanScreen_arabic({
    Key? key,
  }) : super(key: key);

  @override
  State<CoupanScreen_arabic> createState() => _CoupanScreen_arabicState();
}

class _CoupanScreen_arabicState extends State<CoupanScreen_arabic> {
  CouponCodeController _couponCodeController = CouponCodeController();
  @override
  void initState() {
    super.initState();
    _couponCodeController.fetchMycouponData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'القسيمة والعروض',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  width: Get.width * .07,
                  height: Get.height * .03,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(90, 158, 158, 158)),
                  child: Icon(
                    Icons.arrow_back,
                  )),
            ),
          ),
        ),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: Obx(() {
              if (_couponCodeController.rxRequestStatus.value ==
                  Status.LOADING) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              } else if (_couponCodeController.rxRequestStatus.value ==
                  Status.ERROR) {
                return Scaffold(
                    body: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/error2.png',
                    ),
                    Text(
                      "أُووبس! تواجه خوادمنا مشكلة في الاتصال.\nيُرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى",
                      style: theme.textTheme.headlineMedium?.copyWith(
                          color: Color.fromARGB(73, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: 'Almarai'),
                    ),
                  ],
                )));
              } else {
                return _couponCodeController.couponlist.value.availableCoupon ==
                            null ||
                        _couponCodeController
                            .couponlist.value.availableCoupon!.isEmpty
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/nocoupon.png'),
                          Text(
                            "لا يوجد قسيمة متاحة",
                            style: theme.textTheme.headlineMedium?.copyWith(
                                color: const Color.fromARGB(132, 0, 0, 0),
                                fontSize: 20),
                          ),
                        ],
                      ))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: _couponCodeController
                                    .couponlist.value.availableCoupon?.length ??
                                0,
                            itemExtent: 90,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(5),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: Get.height * .15,
                                  width: Get.width * .9,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(52, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: Get.height * .15,
                                        width: Get.width * .3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              topLeft: Radius.circular(10)),
                                          color: Colors.orange,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${_couponCodeController.couponlist.value.availableCoupon?[index].amount}",
                                            style: theme
                                                .textTheme.headlineMedium
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 45,
                                                    fontFamily: 'Almarai'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * .06,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${_couponCodeController.couponlist.value.availableCoupon?[index].type}",
                                            style: theme.textTheme.subtitle1,
                                          ),
                                          Text(
                                            "${_couponCodeController.couponlist.value.availableCoupon?[index].code}",
                                            style: theme.textTheme.subtitle2,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Get.width * .2,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Expire At: ${_couponCodeController.couponlist.value.availableCoupon?[index].expireAt}",
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(
                                                    color:
                                                        Colors.grey.shade400),
                                          ),
                                          Gap(5),
                                          CustomElevatedButton(
                                            height: 40.v,
                                            width: 100.h,
                                            text: "Apply",
                                            margin: EdgeInsets.only(left: 8.h),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL15,
                                            buttonTextStyle: CustomTextStyles
                                                .labelLargeWhiteA70002_1,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
              }
            })));
  }
}
