import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class ListrectangleItemWidget extends StatelessWidget {
  const ListrectangleItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.h,
      child: Align(
        alignment: Alignment.center,
        child: CustomImageView(
          imagePath: ImageConstant.imgRectangle575,
          height: 60.adaptSize,
          width: 60.adaptSize,
          radius: BorderRadius.circular(
            6.h,
          ),
        ),
      ),
    );
  }
}
