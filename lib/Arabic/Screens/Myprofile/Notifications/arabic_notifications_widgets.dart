import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class NotificationsoneItemWidget_arabic extends StatelessWidget {
  const NotificationsoneItemWidget_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgNotification1Gray9000124x24,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              top: 4.v,
              bottom: 6.v,
            ),
          ),
          Container(
            width: 200.h,
            margin: EdgeInsets.only(
              left: 12.h,
              top: 2.v,
            ),
            child: Text(
              "جيلبرت، لقد قمت بوضع الطلب والتحقق منه \nسجل الطلب للحصول على التفاصيل الكاملة",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontFamily: 'Almarai', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black)
            ),
          ),
          Spacer(),
          Container(
            height: 9.v,
            width: 2.h,
            margin: EdgeInsets.only(
              top: 4.v,
              bottom: 21.v,
            ),
            decoration: BoxDecoration(
              color: appTheme.blueGray40001,
              borderRadius: BorderRadius.circular(
                4.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
