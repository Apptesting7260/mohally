import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 231.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBell1,
                height: 100.adaptSize,
                width: 100.adaptSize,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 38.h),
              ),
              SizedBox(height: 28.v),
              Text(
                "No Notification yet",
                style: CustomTextStyles.headlineSmallLeagueSpartan,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(onTap: (){
        Get.back();
      },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Notifications",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
