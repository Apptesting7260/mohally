import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/view_models/UodateProfile/updateProfile_controller.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final  MyAccountControllerins = Get.put(MyAccountController());
 final  UpdateProfile_Controllerins  = Get.put(UpdateProfile_Controller());
  bool isEmail(String input) => EmailValidator.validate(input);
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //  void _submit() {
  //   final isValid = _formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   UpdateProfile_Controllerins.updateprofile_apihit();
  //   _formKey.currentState!.save();
  // }


  final imgPicker = ImagePicker();
  // void openCamera(abc) async {
  //   var imgCamera = await imgPicker.pickImage(source: abc);
  //   setState(() {
  //     UpdateProfile_Controllerins.imgFile = File(imgCamera!.path);
  //   });
  //   Navigator.of(context).pop();
  // }

  // //open camera
  // void openCameraa(abc) async {
  //   var imgCamera = await imgPicker.pickImage(source: abc);
  //   setState(() {
  //       UpdateProfile_Controllerins.imgFile = File(imgCamera!.path);
  //     print("image------${ UpdateProfile_Controllerins.imgFile}");
  //   });
  //   Navigator.of(context).pop();
  // }

  void openCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        UpdateProfile_Controllerins.imgFile = File(pickedFile.path);
      }
    });
    Navigator.of(context).pop();
  }

  // Open gallery method
  void openGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        UpdateProfile_Controllerins.imgFile = File(pickedFile.path);
      }
    });
    Navigator.of(context).pop();
  }
void initState() {
  if (MyAccountControllerins.MyAccount.value.userDetails != null) {
    UpdateProfile_Controllerins.imgFile = MyAccountControllerins.MyAccount.value.userDetails!.imageUrl != null
        ? File(MyAccountControllerins.MyAccount.value.userDetails!.imageUrl!)
        : null;
    UpdateProfile_Controllerins.firstNameController.value.text = MyAccountControllerins.MyAccount.value.userDetails!.firstName ?? '';
    UpdateProfile_Controllerins.lastNameController.value.text = MyAccountControllerins.MyAccount.value.userDetails!.lastName ?? '';
    UpdateProfile_Controllerins.emailController.value.text = MyAccountControllerins.MyAccount.value.userDetails!.email ?? '';
    UpdateProfile_Controllerins.phoneController.value.text = MyAccountControllerins.MyAccount.value.userDetails!.phone ?? '';
  }
  super.initState();
}



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Form(
        key: _formKey,
        child: Padding(
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
                        child:  UpdateProfile_Controllerins.imgFile.toString()=="null"? CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                          backgroundColor: Colors.transparent,
                        ):
                         CircleAvatar(
                          radius: 30.0,
                          backgroundImage: FileImage(UpdateProfile_Controllerins.imgFile!),
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
                                            openCamera();
                                          },
                                        ),
                                        SizedBox(width: 80),
                                        GestureDetector(
                                          child: Text("Gallery"),
                                          onTap: () {
                                            // UpdateProfile_Controllerins.openCamera(ImageSource.camera);
                                            openGallery();
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
              _builNumber(context),
              SizedBox(height: 17.v),
            
              _buildContinueButton(context),
              SizedBox(height: 109.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstName(BuildContext context) {
    return CustomTextFormField(
         controller: UpdateProfile_Controllerins.firstNameController.value,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Your First Name";
        } else {
          return null;
        }
      },
      hintText: "Your First Name",
    );
  }
  Widget _buildLastName(BuildContext context) {
    return CustomTextFormField(
         controller: UpdateProfile_Controllerins.lastNameController.value,
      validator: (value) {
        if (value!.isEmpty&&value.length<3) {
          return "Enter Last Name";
        } else {
          return null;
        }
      },
      hintText: "Your Last Name",
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
         controller: UpdateProfile_Controllerins.emailController.value,
      validator: (value) {
        if (!isEmail(value!)) {
          return 'valid valid Email';
        }
        return null;
      },
      hintText: 'enter your Email',
      textInputType: TextInputType.emailAddress,
    );
  }

  
Widget _builNumber(BuildContext context) {
    return CustomTextFormField(
    
         controller: UpdateProfile_Controllerins.phoneController.value,
      validator: (value) {
        if (value!.isEmpty && value.length==10) {
          return 'enter valid mobile number';
        } else {
          return null;
        }
      },
      hintText: 'enter your number',
    );
  }
  Widget _buildContinueButton(BuildContext context) {
    return Obx((){
return CustomElevatedButton(
  loading: UpdateProfile_Controllerins.loading.value,
        onPressed: () {
          checkvalidate();
          },
        text: 'update',
        buttonStyle: CustomButtonStyles.fillPrimary,
      );
    }
      
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
        text: "Update Profile",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }
   checkvalidate() async {
  print("send");
  if (_formKey.currentState!.validate()) {
    UpdateProfile_Controllerins.loading.value = true;
    print('apihit');
    await UpdateProfile_Controllerins.ProfileApiHit(); // Await the ProfileApiHit function
    _formKey.currentState!.save();
    return;
  } else {
    print('data');
  }
}

}
