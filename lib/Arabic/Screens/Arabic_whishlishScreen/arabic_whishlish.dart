import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mohally/Arabic/Screens/Arabic_whishlishScreen/arabic_whishlist_widgets.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/theme/app_decoration.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class WishlistPage_arabic extends StatefulWidget {
  const WishlistPage_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<WishlistPage_arabic> createState() => _WishlistPage_arabicState();
}

class _WishlistPage_arabicState extends State<WishlistPage_arabic> {


    @override
  void initState() {
    super.initState();
        setInitialLocale();
  }
    void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }
  @override

  
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h,),
              child: Column(
                children: [
                  SizedBox(height: 25.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "قائمة الرغبات",
                      style: theme.textTheme.headlineMedium?.copyWith(fontFamily: "Almarai"),
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
      ),
    );
  }

  /// Section Widget
  Widget _buildEditButton(BuildContext context) {
    return CustomElevatedButton(
      height: 35.v,
      width: 65.h,
      text: "يحرر",
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
      buttonTextStyle: CustomTextStyles.bodyMediumGray9000115?.copyWith(fontFamily: "Almarai"),
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
                  '20 عنصر',
                  style: theme.textTheme.titleMedium?.copyWith(fontFamily: "Almarai"),
                ),
              ),
              SizedBox(height: 6.v),
              Text(
               'في قائمة الرغبات',
                style: CustomTextStyles.bodyLargeGray50001_3?.copyWith(fontFamily: "Almarai"),
              ),
            ],
          ),
          _buildEditButton(context),
        ],
      ),
    );
  }

   //Section Widget
  Widget _buildWishlistGrid(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: Get.height*.4,
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return WishlistgridItemWidget_arabic();
          },
        ),
      ),
    );
  }
}
