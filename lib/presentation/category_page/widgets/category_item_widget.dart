import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse2,
                height: 60.adaptSize,
                width: 60.adaptSize,
                radius: BorderRadius.circular(
                  30.h,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgEllipse360x60,
                height: 60.adaptSize,
                width: 60.adaptSize,
                radius: BorderRadius.circular(
                  30.h,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgEllipse460x60,
                height: 60.adaptSize,
                width: 60.adaptSize,
                radius: BorderRadius.circular(
                  30.h,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.only(right: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 66.h,
                child: Text(
                  "Headphones,\nEarbuds &\nAccessories",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge!.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              Spacer(
                flex: 43,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 34.v),
                child: Text(
                  "Makeup",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              Spacer(
                flex: 56,
              ),
              SizedBox(
                width: 49.h,
                child: Text(
                  "Women’s\nBlouses &\nShirts",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge!.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
