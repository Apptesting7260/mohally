import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/MyOrder_Widgets/my_orders_page.dart';
import 'package:mohally/presentation/my_orders_one_page/my_orders_one_page.dart';
import 'package:mohally/presentation/my_orders_two_page/my_orders_two_page.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';

class MyOrdersTabContainerScreen extends StatefulWidget {
  const MyOrdersTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersTabContainerScreenState createState() =>
      MyOrdersTabContainerScreenState();
}

class MyOrdersTabContainerScreenState extends State<MyOrdersTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22.v),
              _buildTabview(context),
              SizedBox(
                height: 658.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    MyOrdersPage(),
                    MyOrdersOnePage(),
                    MyOrdersTwoPage(),
                  ],
                ),
              ),
            ],
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
        text: "My Orders",
        margin: EdgeInsets.only(left: 16.h),
      ),
      // actions: [
      //   Container(
      //     height: 90.v,
      //     width: 90.h,
      //     child: AppbarTrailingIconbuttonOne(
      //       imagePath: ImageConstant.imgSearchGray90001,
      //       margin: EdgeInsets.symmetric(
      //         horizontal: 10.h,
      //         vertical: 8.v,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 30.v,
      width: 320.h,
      margin: EdgeInsets.only(left: 20.h),
      child: TabBar(
        controller: tabviewController,
        // labelPadding: EdgeInsets.only(left: 5,right: 5),
        labelColor: appTheme.whiteA70002,
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
        ),

        unselectedLabelColor: appTheme.gray90001,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            30.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Delivered",
            ),
          ),
          Tab(
            child: Text(
              "Processing",
            ),
          ),
          Tab(
            child: Text(
              "Cancelled",
            ),
          ),
        ],
      ),
    );
  }
}
