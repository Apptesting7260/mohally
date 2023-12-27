import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_radio_button.dart';

import '../login_screen/login_screen.dart';

class ChooseLanguageScreen extends StatefulWidget {
  ChooseLanguageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String radioGroup = "";

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose language",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 23.v),
              _buildChooseLanguageArabic(context),
              SizedBox(height: 20.v),
              _buildChooseLanguageEnglish(context),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                text: "continue",
                buttonStyle: CustomButtonStyles.fillPrimary,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChooseLanguageArabic(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img123604121,
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                top: 5.v,
                bottom: 5.v,
              ),
              child: CustomRadioButton(
                width: 240.h,
                text: "Arabic",
                value: "Arabic",
                groupValue: radioGroup,
                isRightCheck: true,
                onChange: (value) {
                  setState(() {
                    radioGroup = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildChooseLanguageEnglish(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img123604122,
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                top: 5.v,
                bottom: 5.v,
              ),
              child: CustomRadioButton(
                width: 240.h,
                text: "English",
                value: "English",
                groupValue: radioGroup,
                isRightCheck: true,
                onChange: (value) {
                  setState(() {
                    radioGroup = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
