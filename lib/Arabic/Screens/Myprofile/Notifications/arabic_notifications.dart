import 'package:get/get.dart';
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
        appBar: AppBar(
          title: Text(
            'إشعارات',
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
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 231.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgBell1,
                  height: 100.adaptSize,
                  width: 100.adaptSize,
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(right: 38.h),
                ),
                SizedBox(height: 28.v),
                Text(
                  "لا يوجد إشعار حتى الآن ",
                  style: theme.textTheme.headlineMedium?.copyWith(
                      color: Color.fromARGB(73, 0, 0, 0),
                      fontSize: 12,
                      fontFamily: 'Almarai'),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.only(
          //     left: 20.h,
          //     top: 22.v,
          //     right: 20.h,
          //   ),
          //   child: ListView.separated(
          //     physics: BouncingScrollPhysics(),
          //     shrinkWrap: true,
          //     separatorBuilder: (
          //       context,
          //       index,
          //     ) {
          //       return SizedBox(
          //         height: 10.v,
          //       );
          //     },
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 15.h,
          //           vertical: 17.v,
          //         ),
          //         decoration: AppDecoration.fillGray.copyWith(
          //           borderRadius: BorderRadiusStyle.roundedBorder8,
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             CustomImageView(
          //               imagePath: ImageConstant.imgNotification1Gray9000124x24,
          //               height: 24.adaptSize,
          //               width: 24.adaptSize,
          //               margin: EdgeInsets.only(
          //                 top: 4.v,
          //                 bottom: 6.v,
          //               ),
          //             ),
          //             Container(
          //               width: 200.h,
          //               margin: EdgeInsets.only(
          //                 left: 12.h,
          //                 top: 2.v,
          //               ),
          //               child: Text(
          //                   "جيلبرت، لقد قمت بوضع الطلب والتحقق منه \nسجل الطلب للحصول على التفاصيل الكاملة",
          //                   maxLines: 3,
          //                   overflow: TextOverflow.ellipsis,
          //                   style: TextStyle(
          //                       fontFamily: 'Almarai',
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.w400,
          //                       color: Colors.black)),
          //             ),
          //             Spacer(),
          //             Container(
          //               height: 9.v,
          //               width: 2.h,
          //               margin: EdgeInsets.only(
          //                 top: 4.v,
          //                 bottom: 21.v,
          //               ),
          //               decoration: BoxDecoration(
          //                 color: appTheme.blueGray40001,
          //                 borderRadius: BorderRadius.circular(
          //                   4.h,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ),
      ),
    );
  }

  /// Section Widget
}
