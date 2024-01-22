// ignore_for_file: unused_import
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_update_controller.dart';
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

class UpdateProfileScreen_arabic extends StatefulWidget {
  const UpdateProfileScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<UpdateProfileScreen_arabic> createState() => _UpdateProfileScreen_arabicState();
}

class _UpdateProfileScreen_arabicState extends State<UpdateProfileScreen_arabic> {
  final  MyAccountControllerins = Get.put(MyAccountController());
 final  UpdateProfile_Controllerins  = Get.put(arabic_UpdateProfile_Controller());
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
  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      UpdateProfile_Controllerins.imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  //open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
        UpdateProfile_Controllerins.imgFile = File(imgCamera!.path);
      print("image------${ UpdateProfile_Controllerins.imgFile}");
    });
    Navigator.of(context).pop();
  }
void initState() {
    UpdateProfile_Controllerins.firstNameController.value.text=MyAccountControllerins.MyAccount.value.userDetails!.firstName.toString();
     UpdateProfile_Controllerins.lastNameController.value.text=MyAccountControllerins.MyAccount.value.userDetails!.lastName.toString();
      UpdateProfile_Controllerins.emailController.value.text=MyAccountControllerins.MyAccount.value.userDetails!.email.toString();
       UpdateProfile_Controllerins.phoneController.value.text=MyAccountControllerins.MyAccount.value.userDetails!.phone.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Form(
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
                            backgroundImage: FileImage(  UpdateProfile_Controllerins.imgFile!),
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
                                      title: Text("يختار"),
                                      content: Row(
                                        children: [
                                          GestureDetector(
                                            child: Text("آلة تصوير"),
                                            onTap: () {
                                              // UpdateProfile_Controllerins.openCamera(ImageSource.camera);
                                              openCameraa(ImageSource.camera);
                                            },
                                          ),
                                          SizedBox(width: 80),
                                          GestureDetector(
                                            child: Text("صالة عرض"),
                                            onTap: () {
                                              // UpdateProfile_Controllerins.openCamera(ImageSource.camera);
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
                Align(
                     alignment: Alignment.centerRight,
                  child: Text(
                    "الاسم الأول",
                    style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                  ),
                ),
                SizedBox(height: 9.v),
                _buildFirstName(context),
                SizedBox(height: 9.v),
                Align(
                     alignment: Alignment.centerRight,
                  child: Text(
                    "اسم العائلة",
                  style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                  ),
                ),
                SizedBox(height: 9.v),
                _buildLastName(context),
                SizedBox(height: 17.v),
          
                Align(
                     alignment: Alignment.centerRight,
                  child: Text(
                    "بريد إلكتروني",
                     style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                  ),
                ),
                SizedBox(height: 9.v),
                _buildEmail(context),
                SizedBox(height: 17.v),
                Align(
                     alignment: Alignment.centerRight,
                  child: Text(
                    "رقم الهاتف المحمول",
                    style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                  ),
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
      ),
    );
  }

  Widget _buildFirstName(BuildContext context) {
    return CustomTextFormField(
         controller: UpdateProfile_Controllerins.firstNameController.value,
      validator: (value) {
        if (value!.isEmpty) {
          return "أدخل اسمك الأول";
        } else {
          return null;
        }
      },
      hintText: "اسمك الأول",
       hintStyle: TextStyle(fontFamily: 'Almarai',color: Colors.grey),
    );
  }
  Widget _buildLastName(BuildContext context) {
    return CustomTextFormField(
         controller: UpdateProfile_Controllerins.lastNameController.value,
      validator: (value) {
        if (value!.isEmpty&&value.length<3) {
          return "إدخال اسم آخر";
        } else {
          return null;
        }
      },
      hintText: "اسمك الاخير",
       hintStyle: TextStyle(fontFamily: 'Almarai',color: Colors.grey),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
         controller: UpdateProfile_Controllerins.emailController.value,
      validator: (value) {
        if (!isEmail(value!)) {
          return 'أدخل بريدًا إلكترونيًا صالحًا';
        }
        return null;
      },
      hintText: 'أدخل البريد الإلكتروني الخاص بك',
      textInputType: TextInputType.emailAddress,
         hintStyle: TextStyle(fontFamily: 'Almarai',color: Colors.grey),
    );
  }

  
Widget _builNumber(BuildContext context) {
    return CustomTextFormField(
    
         controller: UpdateProfile_Controllerins.phoneController.value,
      validator: (value) {
        if (value!.isEmpty && value.length==10) {
          return 'ادخل رقم هاتف خلوي ساري المفعول';
        } else {
          return null;
        }
      },
      hintText: 'أدخل رقمك',
      hintStyle: TextStyle(fontFamily: 'Almarai',color: Colors.grey),
    );
  }
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
       
        checkvalidate();
       
        },
      text: 'تحديث',
      buttonTextStyle: TextStyle(fontFamily: 'Almarai', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
        text: "تحديث الملف",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }
   checkvalidate() {
    print("send");
    if (_formKey.currentState!.validate()) {print('apihit');
       UpdateProfile_Controllerins.arabicProfileApiHit();
      return;
    } else {
     print('data');
    }
  }
}
