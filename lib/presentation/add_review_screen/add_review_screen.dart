import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController groupEditTextController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 19.v,
            ),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 9.v),
                _buildNameEditText(context),
                SizedBox(height: 19.v),
                Text(
                  "How was your experience ?",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 7.v),
                _buildGroupEditText(context),
                SizedBox(height: 19.v),
                Text(
                 "What is you rate?",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 7.v),
                CustomRatingBar(
                  initialRating: 5,
                  itemSize: 50,
                ),
                SizedBox(height: 30.v),
                _buildAddPhotosVideoButton(context),
                SizedBox(height: 15.v),
                _buildSubmitReviewButton(context),
                SizedBox(height: 5.v),
              ],
            ),
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
        onTap: () {
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
        text: "Add Review",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
      controller: nameEditTextController,
      hintText:  'Enter your name',
      borderDecoration: TextFormFieldStyleHelper.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildGroupEditText(BuildContext context) {
    return CustomTextFormField(
      controller: groupEditTextController,
      hintText: "Describe your experience..",
      textInputAction: TextInputAction.done,
      maxLines: 12,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 22.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildAddPhotosVideoButton(BuildContext context) {
    return CustomOutlinedButton(
      text:"Add photos/video",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 9.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgBaselinephotocamera24px,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineOnPrimaryContainer,
      buttonTextStyle: CustomTextStyles.bodyLargeGray5000118,
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildSubmitReviewButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Submit Review",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      alignment: Alignment.center,
      onPressed: () {
        Get.offAll(ReviewsScreen());
      },
    );
  }
}
