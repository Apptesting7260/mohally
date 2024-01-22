import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Myprofile/Notifications/arabic_notifications_widgets.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

class NotificationsOneScreen_arabic extends StatelessWidget {
  const NotificationsOneScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          title: Text('إشعارات', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),),
          leading: Padding(
            padding: const EdgeInsets.only(top:15, ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Get.width*.07,
                height: Get.height*.03,
                decoration: BoxDecoration(shape: BoxShape.circle, color: const Color.fromARGB(90, 158, 158, 158)),
                child: Icon(Icons.arrow_back, )),
            ),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 22.v,
              right: 20.h,
            ),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 10.v,
                );
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return NotificationsoneItemWidget_arabic();
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
 
}
