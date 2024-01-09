import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/home_page_one_page/home_page_one_page.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_search_view.dart';

import '../drawer_draweritem/drawer_draweritem.dart';

// ignore_for_file: must_be_immutable
class HomePageOneTabContainerPage extends StatefulWidget {
  const HomePageOneTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageOneTabContainerPageState createState() =>
      HomePageOneTabContainerPageState();
}

class HomePageOneTabContainerPageState
    extends State<HomePageOneTabContainerPage> with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerDraweritem(),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 22.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "search".tr,
                ),
              ),
              SizedBox(height: 27.v),
              _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 1417.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      HomePageOnePage(),
                      HomePageOnePage(),
                      HomePageOnePage(),
                      HomePageOnePage(),
                      HomePageOnePage(),
                      HomePageOnePage(),
                    ],
                  ),
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
      leading: GestureDetector(
        onTap: () {
          if (_scaffoldKey.currentState!.isDrawerOpen) {
            _scaffoldKey.currentState!.openEndDrawer();
          } else {
            _scaffoldKey.currentState!.openDrawer();
          }
        },
        child: Container(
          height: 30.adaptSize,
          width: 30.adaptSize,
          child: Image.asset(
            "assets/images/Menu.png",
          ),
          margin: EdgeInsets.only(
            left: 20.h,
            top: 8.v,
            bottom: 8.v,
          ),
        ),
      ),
      // Container( height: 30.adaptSize,
      //   width: 30.adaptSize,
      //   child: AppbarLeadingIconbutton(
      //     imagePath: ImageConstant.menu,
      //     margin: EdgeInsets.only(
      //       left: 20.h,
      //       top: 8.v,
      //       bottom: 8.v,
      //     ),
      //   ),
      // ),
      actions: [
        Container(
          height: 40.adaptSize,
          width: 40.adaptSize,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 8.v,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup239397,
                height: 40.adaptSize,
                width: 40.adaptSize,
                alignment: Alignment.center,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgNotification1Primary,
                height: 20.adaptSize,
                width: 20.adaptSize,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.h),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 23.v,
      width: 355.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 18.fSize,
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.gray50001,
        unselectedLabelStyle: TextStyle(
          fontSize: 18.fSize,
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: theme.colorScheme.primary,
        tabs: [
          Tab(
            child: Text(
              "All",
            ),
          ),
          Tab(
            child: Text(
              "Women",
            ),
          ),
          Tab(
            child: Text(
              "Men",
            ),
          ),
          Tab(
            child: Text(
              "kids",
            ),
          ),
          Tab(
            child: Text(
              "Jewelry",
            ),
          ),
          Tab(
            child: Text(
              "Bags",
            ),
          ),
        ],
      ),
    );
  }
}
