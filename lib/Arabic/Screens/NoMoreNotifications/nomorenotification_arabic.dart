import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

class No_More_Notifications_arabic extends StatelessWidget {
  const No_More_Notifications_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("إشعار", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),),
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
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/bell.png'),
            SizedBox(height: Get.height*.03,),
            Text('لا يوجد إشعار حتى الآن', style: CustomTextStyles.bodyLargeInterGray50001,)
          ],
        ),)
      ),
    );
  }

  /// Section Widget
  
}
