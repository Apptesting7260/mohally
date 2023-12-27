import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

import '../choose_language_screen/choose_language_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 52.h,
            vertical: 23.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(
                flex: 51,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgBags,
                height: 210.v,
                width: 217.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 17.h),
              ),
              Spacer(
                flex: 48,
              ),
              Container(
                width: 189.h,
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome To\n",
                        style: CustomTextStyles.headlineMediumMedium,
                      ),
                      TextSpan(
                        text: "Mohally",
                        style: theme.textTheme.displayLarge,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 8.v),
              SizedBox(
                width: 268.h,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeGray50001_1.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildGetStartedButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildGetStartedButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
         Get.to(()=>ChooseLanguageScreen());
        // Get.to(() => LoginScreen());
      },
      text: "Get Started",
      margin: EdgeInsets.only(
        left: 37.h,
        right: 38.h,
        bottom: 56.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
