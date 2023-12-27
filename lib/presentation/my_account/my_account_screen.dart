import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  bool isEmail(String input) => EmailValidator.validate(input);

  File imgFile = File("");

  final imgPicker = ImagePicker();
  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  //open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            SizedBox(height: 33),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 120.adaptSize,
                width: 120.adaptSize,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: height * .2,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
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
                                          openCameraa(ImageSource.camera);
                                        },
                                      ),
                                      SizedBox(width: 80),
                                      GestureDetector(
                                        child: Text("Gallery"),
                                        onTap: () {
                                          openCameraa(ImageSource.gallery);
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
            ),
            SizedBox(height: 9.v),
            Text(
              "First Name",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            _buildFirstName(context),
            SizedBox(height: 9.v),
            Text(
              "Last Name",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            _buildLastName(context),
            SizedBox(height: 17.v),

            Text(
              "Email",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            _buildEmail(context),
            SizedBox(height: 17.v),
            Text(
              "Mobile Number",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Mobile Number";
                } else {
                  return null;
                }
              },
              hintText: "Enter your mobile number",
            ),
            SizedBox(height: 30.v),
            _buildContinueButton(context),
            SizedBox(height: 109.v),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter First Name";
        } else {
          return null;
        }
      },
      hintText: "Enter your first name",
    );
  }
  Widget _buildLastName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter last Name";
        } else {
          return null;
        }
      },
      hintText: "Enter your last name",
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (!isEmail(value!)) {
          return 'Please enter a valid email.';
        }
        return null;
      },
      hintText: "Enter your email",
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {},
      text: "Save",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20,
          top: 8,
          bottom: 8,
        ),
      ),
      title: AppbarSubtitle(
        text: "My Account",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }
}
