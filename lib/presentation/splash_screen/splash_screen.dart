import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer; // Store the Timer reference
  var x;
  @override
  void initState() {
    getToken();
    print('printingggggxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(x);

    _timer = Timer(Duration(milliseconds: 3000), () {
      x == '' ? Get.to(WelcomeScreen()) : Get.off(TabScreen(index: 0));
    });
    super.initState();
  }

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    x = await prefs.getString('token') ??
        ''; // Returns the token or an empty string if it doesn't exist.
  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    _timer?.cancel();
    super.dispose();
  }

  // void initState() {
  //   Timer(
  //       Duration(seconds: 3),
  //           () => Navigator.of(context).pushReplacement(MaterialPageRoute(
  //           builder: (BuildContext context) =>WelcomeScreen() )));
  //
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          height: mediaQueryData.size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage2023110,
                height: 375.adaptSize,
                width: 375.adaptSize,
                alignment: Alignment.center,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgImage2023111,
                height: 375.adaptSize,
                width: 375.adaptSize,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
