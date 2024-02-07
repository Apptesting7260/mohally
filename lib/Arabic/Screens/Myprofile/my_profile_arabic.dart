// ignore_for_file: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_HomeTab.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/Arabic/Screens/CustomerSupport/arabic_customersupport.dart';
import 'package:mohally/Arabic/Screens/MyAccount/arabic_myaccount.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/arabic_my_order.dart';
import 'package:mohally/Arabic/Screens/Myprofile/MyCoupons/arabic_coupons.dart';
import 'package:mohally/Arabic/Screens/Myprofile/Notifications/arabic_notifications.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/Arabic/widgets/Address/arabic_address.dart';
import 'package:mohally/Arabic/widgets/arabic_review.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/choose_language_screen/choose_language_screen.dart';
import 'package:mohally/presentation/my_account/my_account_screen.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class MyProfilePage_arabic extends StatefulWidget {
  const MyProfilePage_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyProfilePage_arabic> createState() => _MyProfilePage_arabicState();
}

class _MyProfilePage_arabicState extends State<MyProfilePage_arabic> {
   final  _controller = Get.put(MyAccountController());

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
    // uploadProfile();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Align(alignment: Alignment.centerRight,
         child :Text( "ملفي", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),)),
          leading: Padding(
            padding: const EdgeInsets.only(top:15, ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Get.width*.07,
                height: Get.height*.03,
                decoration: BoxDecoration(shape: BoxShape.circle, color: const Color.fromARGB(90, 158, 158, 158)),
                child: Icon(Icons.arrow_back, )),
            ),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              children: [
                SizedBox(height: 28.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 19.h,
                        right: 19.h,
                        bottom: 5.v,
                      ),
                      child: Column(
                        children: [
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(
                          //     "My Profile",
                          //     style: theme.textTheme.headlineMedium,
                          //   ),
                          // ),
                          // SizedBox(height: 33.v),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 100.adaptSize,
                              width: 100.adaptSize,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
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
                                    alignment: Alignment.bottomLeft,
                                    child: CustomImageView(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                    backgroundColor: Color(0xFFFF8300),
                                    title: Text("يختار" , textAlign:TextAlign.right, style:TextStyle( fontFamily: 'Almarai', color: Colors.black, fontWeight: FontWeight.w400),),
                                    content: Row(
                                      children: [
                                        GestureDetector(
                                          child: Text("آلة تصوير", style: TextStyle( fontFamily: 'Almarai', color: Colors.white,fontSize:16),),
                                          onTap: () {
                                            openCameraa(ImageSource.camera);
                                          },
                                        ),
                                        SizedBox(width: 80),
                                        GestureDetector(
                                          child: Text("صالة عرض", style: TextStyle( fontFamily: 'Almarai', color: Colors.white, fontSize:16)),
                                          onTap: () {
                                            openCameraa(ImageSource.gallery);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                            });
                                      },
                                      imagePath:
                                          ImageConstant.imgCamera1WhiteA70002,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 26.v),
                          Obx((){
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                             "${ _controller.MyAccount.value.userDetails?.firstName.toString()}",
                             // "Name",
                              style: CustomTextStyles
                                  .headlineSmallLeagueSpartanSemiBold,
                            ),
                          );
                        }
                        ),
  
                  
                        SizedBox(height: 10.v),
                         Obx((){
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                             "${ _controller.MyAccount.value.userDetails?.email.toString()}",
                             // "Name",
                              style:  CustomTextStyles.bodyLargeGray50001_3,
                            ),
                          );
                        }
                        ),
                          SizedBox(height: 36.v),
                          GestureDetector(
                            onTap: () {
                              Get.to(()=>MyAccountScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgProfileIcon,
                              userMessage: "حسابي",
                            ),
                          ),
                          // SizedBox(height: 26.v),
                          // _buildMessageOne(
                          //   context,
                          //   userImage: ImageConstant.imgMessage1,
                          //   userMessage: "Messages_".tr,
                          // ),
                          SizedBox(height: 26.v),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => MyOrdersTab_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgBag,
                              userMessage: "طلباتي",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ReviewsScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgRateReview1,
                              userMessage: "تعليقاتي",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => CoupanScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgCoupon1,
                              userMessage: "عروض القسيمة",
                            ),
                          ),
                       
                          // _buildMessageOne(
                          //   context,
                          //   userImage: ImageConstant.imgShop1,
                          //   userMessage: "Followed_shops".tr,
                          // ),
                          SizedBox(height: 26.v),
                          _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgHistory1,
                            userMessage: "تاريخ التصفح",
                          ),
                          SizedBox(height: 26.v),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => addresses_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgBagPrimary,
                              userMessage: "عنوان ",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => NotificationsOneScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgNotification1,
                              userMessage: "إشعارات",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>CustomerSupport_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgSupport1,
                              userMessage: "دعم العملاء",
                            ),
                          ),
                          SizedBox(height: 26.v),
          
                          _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgSettingPrimary,
                            userMessage:  "إعدادات",
                          ),
                          SizedBox(height: 40.v),
                          CustomElevatedButton(
                            onPressed: () async {
                              await clearSharedPreferences();
          
                            
                            },
                            text: "تسجيل خروج",
                            margin: EdgeInsets.symmetric(horizontal: 10.h),
                            buttonStyle: CustomButtonStyles.fillPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
 
  /// Common widget
  Widget _buildMessageOne(
    BuildContext context, {
    required String userImage,
    required String userMessage,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: userImage,
          height: 25.adaptSize,
          width: 25.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 5.v,
            bottom: 2.v,
          ),
          child: Text(
            userMessage,
            style: CustomTextStyles.bodyLarge18.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        Spacer(),
        Icon(Icons.keyboard_arrow_left)
      ],
    );
  }

  Future<void> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.clear();
      Get.offAll(() => SplashScreen());
    print('data clearrrerererererererererre');
  }
}
