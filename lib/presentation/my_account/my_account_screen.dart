import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/data/app_exceptions.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/update_profile_screen.dart';
import 'package:mohally/view_models/UodateProfile/updateProfile_controller.dart';
import 'package:mohally/view_models/controller/DeleteAccountController/delete_account_controller.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_MyAccount_text_form_field.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final DeleteAccountIns = Get.put(DeleteAccountController());
  final  UpdateProfile_Controllerins  = Get.put(UpdateProfile_Controller());
   final  _controller = Get.put(MyAccountController());
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
  void initState() {
     setInitialLocale();

      SchedulerBinding.instance.addPostFrameCallback((_) {
 _controller.fetchMyAccountData();

});
    super.initState();
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() {

        if(_controller.rxRequestStatus.value==Status.LOADING){
          return Center(child: CircularProgressIndicator(  color: Colors.pink,));
        }else if(_controller.rxRequestStatus.value==Status.ERROR){
return GeneralExceptionWidget(onPress: (){},
             
            );
        }else{
          return
    
      Padding(
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
                      child:_controller.MyAccount.value.userDetails!.imageUrl==null? CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                        backgroundColor: Colors.transparent,
                      ):CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                           _controller.MyAccount.value.userDetails!.imageUrl.toString()),
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
              "fname".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            _buildFirstName(context),
            SizedBox(height: 9.v),
            Text(
              "lname".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            _buildLastName(context),
            SizedBox(height: 17.v),

            Text(
              "_Email".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            _buildEmail(context),
            SizedBox(height: 17.v),
            Text(
              "mobile_num".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            MyAccountTextField(

               hintText: _controller.MyAccount.value.userDetails!.phone.toString(),

            ),
            SizedBox(height: 30.v),
             _buildContinueButton(context),
            SizedBox(height: 109.v),
          ],
        ),
      );
  }}));
  }

  Widget _buildFirstName(BuildContext context) {
    return MyAccountTextField(
       hintText: _controller.MyAccount.value.userDetails!.firstName.toString(),

    );
  }
  Widget _buildLastName(BuildContext context) {
    return MyAccountTextField(
       hintText: _controller.MyAccount.value.userDetails!.lastName.toString(),

    );
  }

  Widget _buildEmail(BuildContext context) {
    return MyAccountTextField(
       hintText: _controller.MyAccount.value.userDetails!.email.toString(),
    );
  }
Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        DeleteAccountIns.deleteUserData();
        },
      text: "delete_acc".tr,
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
      title: Row(
        children: [
          AppbarSubtitle(
            text: "my_acc".tr,
            margin: EdgeInsets.only(left: 16),
          ),
SizedBox(width: Get.width*.3,),
           CustomElevatedButton(
                            height: 28.v,
                            width: 56.h,
                            text: "_Edit".tr,
                            leftIcon: Container(
                              margin: EdgeInsets.only(right: 4.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgEditWhiteA70002,
                                height: 12.adaptSize,
                                width: 12.adaptSize,
                              ),
                            ),
                            onPressed: () {
                               Get.to(UpdateProfileScreen());
                            },
                            buttonTextStyle:
                                CustomTextStyles.bodySmallWhiteA70002,
                          ),
        ],
      ),
    );
  }
}
