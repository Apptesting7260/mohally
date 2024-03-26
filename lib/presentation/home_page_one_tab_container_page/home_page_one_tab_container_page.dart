import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/Notifications/no_more_notification.dart';
import 'package:mohally/presentation/cart_page/cart_page.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/category_page/widgets/SubCategoriesMens.dart';
import 'package:mohally/presentation/category_page/widgets/subCategories_Womens.dart';
import 'package:mohally/presentation/category_page/widgets/subcategories_ElectronicScreen.dart';
import 'package:mohally/presentation/drawer_draweritem/drawer_draweritem.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/my_profile_page/my_profile_page.dart';
import 'package:mohally/presentation/wishlist_page/wishlist_page.dart';
import 'package:mohally/routes/app_routes.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_bottom_bar.dart';
import 'package:mohally/widgets/custom_search_view.dart';

class HomePageOneTabContainerPage extends StatefulWidget {
  const HomePageOneTabContainerPage({Key? key}) : super(key: key);

  @override
  State<HomePageOneTabContainerPage> createState() =>
      _HomePageOneTabContainerPageState();
}

class _HomePageOneTabContainerPageState
    extends State<HomePageOneTabContainerPage> {
  List<String> title = [
    'All',
    'Men',
    'Electronics',
    'Womens',
    // "Jewelry",
  ];
  PageController _pageController = PageController();

  int selectedTabIndex = 0;

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

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late TabController tabviewController;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: DrawerDraweritem(),
      appBar: _buildAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        CustomSearchView(
                          readOnly: true,
                          enableTap: true,
                          controller: searchController,
                          hintText: "search",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
                Container(
                  height: Get.height * .07,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      bool isSelected = index == selectedTabIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (index == 1) {
                              mainCatId = "133";
                            } else if (index == 2) {
                              mainCatId = "134";
                            } else if (index == 3) {
                              mainCatId = "175";
                            }
                            selectedTabIndex = index;
                            EnglishsubMainCatId = mainCatId;
                          });
                          if (index == 1) {
                            Get.to(subcategory_MensScreen());
                            setState(() {
                              selectedTabIndex = 0;
                            });
                          } else if (index == 2) {
                            Get.to(subcategoryElectronicsScreen());
                            setState(() {
                              selectedTabIndex = 0;
                            });
                          } else if (index == 3) {
                            Get.to(subcategoryWomensScreen());
                            setState(() {
                              selectedTabIndex = 0;
                            });
                          } else {
                            // Navigate to the All screen
                            _pageController.animateToPage(index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width * .3,
                              child: Text(
                                title[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      isSelected ? Colors.orange : Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Almarai',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (isSelected)
                              Container(
                                width: 60,
                                height: 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xffff8300),
                                ),
                              ),
                            // SizedBox(
                            //   width: Get.width * .2,
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: Get.height * 0.6,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                    children: [
                      Container(child: EnglishHomeScreen()),
                      // Container(child: HomePageMensSectionView()),
                      // Container(child: WomensHomeScreen()),
                      // Container(child: WomensHomeScreen()),
                      // Container(child: WomensHomeScreen()),
                      // Add more pages as needed
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
      bottomTapped: () {},
      bottomSelectedIndex: 0,
    );
  }

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

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageOneTabContainerPage:
        return Container();
      case AppRoutes.categoryPage:
        return CategoryScreen();
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
                onTap: () {
                  Get.to(No_More_Notifications());
                },
                margin: EdgeInsets.all(10.h),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
