// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/cart_page/cart_page.dart';
import 'package:mohally/presentation/category_page/category_page.dart';
import 'package:mohally/presentation/home_page/home_page.dart';
import 'package:mohally/presentation/home_page_one_tab_container_page/home_page_one_tab_container_page.dart';
import 'package:mohally/presentation/my_profile_page/my_profile_page.dart';
import 'package:mohally/presentation/wishlist_page/wishlist_page.dart';
import 'package:mohally/widgets/custom_bottom_bar.dart';
import 'package:mohally/widgets/custom_search_view.dart';

class HomePageTabContainerScreen extends StatefulWidget {
  const HomePageTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageTabContainerScreenState createState() =>
      HomePageTabContainerScreenState();
}

class HomePageTabContainerScreenState extends State<HomePageTabContainerScreen>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
   // setInitialLocale();
  }
  // void setInitialLocale() {
  //   if (Get.locale == null || Get.locale?.languageCode == 'ar') {
  //     Get.updateLocale(Locale('ar', 'DZ'));
  //   } else {
  //     Get.updateLocale(Locale('en', 'US'));
  //   }
  // }

  // @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // SizedBox(height: 20.v),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.h),
              //   child: CustomSearchView(
              //     controller: searchController,
              //     hintText: "Search",
              //   ),
              // ),
              // SizedBox(height: 25.v),
              // _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 1026.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      HomePageOneTabContainerPage(),
                      // HomePageOneTabContainerPage(),
                      // HomePageOneTabContainerPage(),
                      // HomePageOneTabContainerPage(),
                      // HomePageOneTabContainerPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 25.v,
      width: 311.h,
      margin: EdgeInsets.only(left: 26.h),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: appTheme.gray50001,
        unselectedLabelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
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
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      }, bottomTapped: (){}, bottomSelectedIndex: 0,
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePageOneTabContainerPage;
      case BottomBarEnum.Category:
        return AppRoutes.categoryPage;
      case BottomBarEnum.Wishlist:
        return AppRoutes.wishlistPage;
      case BottomBarEnum.Cart:
        return AppRoutes.cartPage;
      case BottomBarEnum.Profile:
        return AppRoutes.myProfilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageOneTabContainerPage:
        return Container();
      case AppRoutes.categoryPage:
        return CategoryPage();
      case AppRoutes.wishlistPage:
        return WishlistPage();
      case AppRoutes.cartPage:
        return CartPage();
      case AppRoutes.myProfilePage:
        return MyProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
