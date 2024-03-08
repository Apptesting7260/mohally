import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';

class NoProductFound02 extends StatefulWidget {
  const NoProductFound02({Key? key}) : super(key: key);

  @override
  State<NoProductFound02> createState() => _NoProductFound02State();
}

class _NoProductFound02State extends State<NoProductFound02> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppBar(context),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                      child: Image.asset(
                    'assets/images/no_product.png',
                    color: Color(0xffff8300),
                    width: Get.width * .7,
                  )),
                ),
                Center(
                  child: Text(
                    "No Product Found ",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                )
              ],
            ),
          )),
    );
  }

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
      // title: AppbarSubtitle(
      //   text: "Order Confirmed",
      //   margin: EdgeInsets.only(left: 16.h),
      // ),
    );
  }
}
