import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/ProductAddReviewController/ProductAddreviewController.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AddReviewScreen extends StatefulWidget {
  AddReviewScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final picker = ImagePicker();
  // File imgFile = File("");
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _addreviewController.imgFile = File(pickedFile.path);
        print("====file${_addreviewController.imgFile}");
      } else {
        print('No image selected.');
      }
    });
  }

  AddReviewController _addreviewController = AddReviewController();

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
                  ignoreGestures: true,
                  initialRating: 2,
                  itemSize: 20,
                ),
                SizedBox(height: 30.v),
                SizedBox(
                  height: 120.adaptSize,
                  width: 120.adaptSize,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: Get.height * .2,
                        width: Get.width * .3,
                        child: _addreviewController.imgFile == null
                            ? Container(
                                height: Get.height * .2,
                                width: Get.width * .3,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffff8300),
                                  // image: DecorationImage(

                                  //     image: AssetImage(
                                  //         'assets/images/editprofile.png' ,  ),
                                  //         )
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/editprofile.png',
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            // CircleAvatar(
                            //     radius: 30.0,
                            //     backgroundImage: NetworkImage(
                            //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                            //     backgroundColor: Colors.transparent,
                            //   )
                            : CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    FileImage(_addreviewController.imgFile!),
                                backgroundColor: Colors.transparent,
                              ),
                      ),
                      CustomIconButton(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        padding: EdgeInsets.all(8.h),
                        alignment: Alignment.bottomRight,
                        child: CustomImageView(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Choose"),
                                    content: Row(
                                      children: [
                                        GestureDetector(
                                          child: Text("Camera"),
                                          onTap: () {
                                            // UpdateProfile_Controllerins.openCamera(ImageSource.camera);
                                            getImage(ImageSource.camera);
                                            Get.back();
                                          },
                                        ),
                                        SizedBox(width: 80),
                                        GestureDetector(
                                          child: Text("Gallery"),
                                          onTap: () {
                                            // UpdateProfile_Controllerins.openCamera(ImageSource.camera);
                                            getImage(ImageSource.gallery);
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          imagePath: ImageConstant.imgCamera1WhiteA70002,
                        ),
                      ),
                    ],
                  ),
                ),
                // _buildAddPhotosVideoButton(context),
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
      controller: _addreviewController.namecontroller.value,
      hintText: 'Enter your name',
      borderDecoration: TextFormFieldStyleHelper.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildGroupEditText(BuildContext context) {
    return CustomTextFormField(
      controller: _addreviewController.descriptioncontroller.value,
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
      text: "Add photos/video",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 9.h),
        child: CustomImageView(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Choose"),
                    content: Row(
                      children: [
                        GestureDetector(
                          child: Text("Camera"),
                          onTap: () {
                            // UpdateProfile_Controllerins.openCamera(ImageSource.camera);
                            getImage(ImageSource.camera);
                            Get.back();
                          },
                        ),
                        SizedBox(width: 80),
                        GestureDetector(
                          child: Text("Gallery"),
                          onTap: () {
                            // UpdateProfile_Controllerins.openCamera(ImageSource.camera);
                            getImage(ImageSource.gallery);
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  );
                });
          },
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
        if (!_formKey.currentState!.validate()) {
          return;
        } else {
          _addreviewController.loading.value = true;
          _addreviewController.AddReviewApiHit();
          _formKey.currentState!.save();
        }
      },
    );
  }
}
