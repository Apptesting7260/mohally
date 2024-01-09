import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class BagssectionItemWidget extends StatelessWidget {
  const BagssectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.v),
      padding: EdgeInsets.symmetric(
        horizontal: 3.h,
        vertical: 2.v,
      ),
      width: 68.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse1,
            height: 60.adaptSize,
            width: 60.adaptSize,
            radius: BorderRadius.circular(
              30.h,
            ),
          ),
          SizedBox(height: 7.v),
          Text(
            "_All".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 13.v),
        ],
      ),
    );
  }
}
