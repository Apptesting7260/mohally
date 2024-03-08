import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_women.dart';
import 'package:mohally/Arabic/Screens/Myprofile/Notifications/arabic_notifications.dart';
import 'package:mohally/Arabic/Screens/widgets/arabic_customSearchView.dart';
import 'package:mohally/Arabic/Screens/widgets/custom_arabic_drawer.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/cart_page/cart_page.dart';
import 'package:mohally/presentation/category_page/category_page.dart';
import 'package:mohally/presentation/my_profile_page/my_profile_page.dart';
import 'package:mohally/presentation/wishlist_page/wishlist_page.dart';
import 'package:mohally/routes/app_routes.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_bottom_bar.dart';

class arabic_HomeScreen extends StatefulWidget {
  const arabic_HomeScreen({Key? key}) : super(key: key);

  @override
  State<arabic_HomeScreen> createState() => _arabic_HomeScreenState();
}

class _arabic_HomeScreenState extends State<arabic_HomeScreen> {
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

  PageController _pageController = PageController();

  int selectedTabIndex = 0;
  List<String> title = [
    'الجميع',
    'نحيف',
    'رجال',
    'أطفال',
    "مجوهرات",
  ];

  TextEditingController searchController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // @override
  // void initState() {
  //   super.initState();
  //   // tabviewController = TabController(length: 5, );
  //      // setInitialLocale();
  // }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: DrawerDraweritem_arabic(),
      appBar: _buildAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .04,
              ),
              Center(
                  child: Stack(children: [
                CustomSearchView_arabic(
                  hintText: 'يبحث',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                  readOnly: true,
                  enableTap: true,
                ),
                Positioned(
                    top: 20,
                    right: 240,
                    child: GestureDetector(
                        onTap: () {
                          File imgFile = File("");

                          final imgPicker = ImagePicker();
                          void openCamera(abc) async {
                            var imgCamera =
                                await imgPicker.pickImage(source: abc);
                            setState(() {
                              imgFile = File(imgCamera!.path);
                            });
                            Navigator.of(context).pop();
                          }

                          //open camera
                          void openCameraa(abc) async {
                            var imgCamera =
                                await imgPicker.pickImage(source: abc);
                            setState(() {
                              imgFile = File(imgCamera!.path);
                            });
                            Navigator.of(context).pop();
                          }
                        },
                        child: Image.asset('assets/images/greycamera.png'))),
              ])),
              SizedBox(
                height: Get.height * .04,
              ),
              Container(
                height: Get.height * .05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index ==
                        selectedTabIndex; // Assuming you have a variable to track the selected tab index

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                        });
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      isSelected ? Colors.orange : Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Almarai',
                                ),
                              ),
                              SizedBox(
                                height: Get.height * .005,
                              ),
                              if (isSelected)
                                Container(
                                    width: 60,
                                    height: 2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xffff8300))),
                              SizedBox(
                                width: Get.width * .2,
                              ),
                            ],
                          ),
                        ),
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
                    Container(child: content_of_all()),
                    Container(child: content_of_women()),
                    Container(child: content_of_women()),
                    Container(child: content_of_women()),
                    Container(child: content_of_women()),
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      actions: [
        GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            height: 40.adaptSize,
            width: 40.adaptSize,
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
      ],
      leadingWidth: 80.h,
      leading: Container(
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
                Get.to(NotificationsOneScreen_arabic());
              },
            ),
          ],
        ),
      ),
    );
  }
}
