import 'package:get/get.dart';

import '../wishlist_page/widgets/wishlistgrid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {


  //   @override
  // void initState() {
  //   super.initState();
  //       setInitialLocale();
  // }
  //   void setInitialLocale() {
  //   if (Get.locale == null || Get.locale?.languageCode == 'ar') {
  //     Get.updateLocale(Locale('ar', 'DZ'));
  //   } else {
  //     Get.updateLocale(Locale('en', 'US'));
  //   }
  // }
  @override

  
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              children: [
                SizedBox(height: 25.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Wishlist",
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 25.v),
                _buildEdit(context),
                SizedBox(height: 27.v),
                _buildWishlistGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditButton(BuildContext context) {
    return CustomElevatedButton(
      height: 35.v,
      width: 65.h,
      text: "Edit".tr,
      margin: EdgeInsets.only(bottom: 2.v),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEdit,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: CustomTextStyles.bodyMediumGray9000115,
    );
  }

  /// Section Widget
  Widget _buildEdit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "20 Items",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 6.v),
              Text(
                "in wishlist".tr,
                style: CustomTextStyles.bodyLargeGray50001_3,
              ),
            ],
          ),
          _buildEditButton(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWishlistGrid(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 265.v,
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return WishlistgridItemWidget();
          },
        ),
      ),
    );
  }
}
