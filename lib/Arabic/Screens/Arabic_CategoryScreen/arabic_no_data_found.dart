import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';

class NoProductFound extends StatefulWidget {
  const NoProductFound({Key? key}) : super(key: key);

  @override
  State<NoProductFound> createState() => _NoProductFoundState();
}

class _NoProductFoundState extends State<NoProductFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(
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
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                    child: Image.asset(
                  'assets/images/no_product.png',
                  color: Color(0xffff8300),
                  width: 200,
                  height: 200,
                )),
              ),
              Center(
                child: Text(
                  "We're currently working behind the scenes",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
