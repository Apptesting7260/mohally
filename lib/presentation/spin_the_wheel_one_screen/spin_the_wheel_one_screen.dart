import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

class SpinTheWheelOneScreen extends StatelessWidget {
  const SpinTheWheelOneScreen({Key? key})
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
          padding: EdgeInsets.only(
            left: 46.h,
            top: 65.v,
            right: 46.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 316.v,
                width: 280.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // CustomImageView(
                    //   imagePath: ImageConstant.imgVector237x280,
                    //   height: 237.v,
                    //   width: 280.h,
                    //   alignment: Alignment.bottomCenter,
                    // ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: fs.Svg(
                              ImageConstant.imgGroup53,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 37.h,
                            vertical: 39.v,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: fs.Svg(
                                ImageConstant.imgGroup54,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 23.v),
                                    child: Text(
                                      "1.20",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70002Bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 26.h,
                                      bottom: 23.v,
                                    ),
                                    child: Text(
                                      "1.50",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70002Bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 26.h,
                                      top: 23.v,
                                      bottom: 3.v,
                                    ),
                                    child: Text(
                                      "2.0",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70002Bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 23.v),
                              Padding(
                                padding: EdgeInsets.only(right: 5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "3 scratch ",
                                      style: CustomTextStyles
                                          .labelLargeWhiteA70002,
                                    ),
                                    Text(
                                      "2 scratch ",
                                      style: CustomTextStyles
                                          .labelLargeWhiteA70002,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 23.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 2.v,
                                      bottom: 18.v,
                                    ),
                                    child: Text(
                                      "1.0",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70002Bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 27.h,
                                      top: 18.v,
                                    ),
                                    child: Text(
                                      "0.9",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70002Bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 25.h,
                                      bottom: 17.v,
                                    ),
                                    child: Text(
                                      "0.7",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70002Bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.v),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.v),
              Text(
                "Spin The Wheel",
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 20.v),
              Text(
                "Daily Raffle To Win Or Scratch To Win Card",
                style: CustomTextStyles.bodyLargeGray50001_3,
              ),
              SizedBox(height: 26.v),
              CustomElevatedButton(
                text: "Play",
                margin: EdgeInsets.only(
                  left: 26.h,
                  right: 27.h,
                ),
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
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
      leading: AppbarLeadingIconbuttonTwo(
        onTap: (){
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
        text: "Spin the Wheel",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
