import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/address_screen/address_screen.dart';
import 'package:mohally/presentation/choose_language_screen/choose_language_screen.dart';
import 'package:mohally/presentation/coupans_offeres/coupan_screen.dart';
import 'package:mohally/presentation/my_account/my_account_screen.dart';
import 'package:mohally/presentation/my_orders_tab_container_screen/my_orders_tab_container_screen.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../customer_support/customer_support.dart';
import '../notifications_one_screen/notifications_one_screen.dart';

// ignore_for_file: must_be_immutable
class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

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
        appBar: _buildAppBar(context),

        body: Container(
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
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 100.adaptSize,
                            width: 100.adaptSize,
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
                                                      openCameraa(
                                                          ImageSource.camera);
                                                    },
                                                  ),
                                                  SizedBox(width: 80),
                                                  GestureDetector(
                                                    child: Text("Gallery"),
                                                    onTap: () {
                                                      openCameraa(
                                                          ImageSource.gallery);
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "John Due",
                            style: CustomTextStyles
                                .headlineSmallLeagueSpartanSemiBold,
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "examplejohn@gmail.com",
                            style: CustomTextStyles.bodyLargeGray50001_3,
                          ),
                        ),
                        SizedBox(height: 36.v),
                        GestureDetector(
                          onTap: () {
                            Get.to(()=>MyAccountScreen());
                          },
                          child: _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgProfileIcon,
                            userMessage: "MyAccount",
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
                            Get.to(() => MyOrdersTabContainerScreen());
                          },
                          child: _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgBag,
                            userMessage: "My Orders",
                          ),
                        ),
                        SizedBox(height: 26.v),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ReviewsScreen());
                          },
                          child: _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgRateReview1,
                            userMessage: "MyReviews",
                          ),
                        ),
                        SizedBox(height: 26.v),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => CoupanScreen());
                          },
                          child: _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgCoupon1,
                            userMessage: "Coupon offers",
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
                          userMessage: "Browsing history",
                        ),
                        SizedBox(height: 26.v),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => AddressScreen());
                          },
                          child: _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgBagPrimary,
                            userMessage: "Address ",
                          ),
                        ),
                        SizedBox(height: 26.v),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => NotificationsOneScreen());
                          },
                          child: _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgNotification1,
                            userMessage: "Notifications",
                          ),
                        ),
                        SizedBox(height: 26.v),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>CustomerSupport());
                          },
                          child: _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgSupport1,
                            userMessage: "Customer support",
                          ),
                        ),
                        SizedBox(height: 26.v),

                        _buildMessageOne(
                          context,
                          userImage: ImageConstant.imgSettingPrimary,
                          userMessage:  "Settings",
                        ),
                        SizedBox(height: 40.v),
                        CustomElevatedButton(
                          onPressed: () async {
                            await clearSharedPreferences();

                            Get.offAll(() => ChooseLanguageScreen());
                          },
                          text: "Logout",
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
        text: "My Profile",
        margin: EdgeInsets.only(left: 16),
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
        CustomImageView(
          imagePath: ImageConstant.imgVectorGray9000111x6,
          height: 11.v,
          width: 6.h,
          margin: EdgeInsets.symmetric(vertical: 7.v),
        ),
      ],
    );
  }

  Future<void> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('data clearrrerererererererererre');
  }
}
