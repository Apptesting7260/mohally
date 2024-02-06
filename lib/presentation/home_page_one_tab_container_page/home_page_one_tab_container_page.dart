// ignore_for_file: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/Notifications/no_more_notification.dart';
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
      List<String> title = [
  'All',
  'Women',
  'Men',
  'Kids',
  "Jewelry",
];
 PageController _pageController = PageController();

  int selectedTabIndex=0;

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
                child: Center(
                  child: Stack(
                    children: [
                      CustomSearchView(
                        readOnly: true,
                        enableTap: true,
                        controller: searchController,
                        hintText: "search",
                      ),
                        Positioned(
                  top: 20,
                  left: 240,
                  child: GestureDetector(
                    onTap: (){
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
                                          openCameraa(ImageSource.camera);
                                        },
                                      ),
                                      SizedBox(width: 80),
                                      GestureDetector(
                                        child: Text("Gallery"),
                                        onTap: () {
                                          openCameraa(ImageSource.gallery);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                    },
                    
                    child: Image.asset('assets/images/greycamera.png'))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 27.v),
             _buildTabview(context),
             
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
      leading: 
      
      
      GestureDetector(
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

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return
    Column(
      children: [
        Container(
              height: Get.height * .05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: title.length,
                itemBuilder: (context, index) {
             bool isSelected = index == selectedTabIndex; // Assuming you have a variable to track the selected tab index
            
            return GestureDetector(
             onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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
                          color: isSelected ? Colors.orange : Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontFamily:  'Almarai',
                        ),
                      ),
                      SizedBox(height: Get.height*.005,),
                      if (isSelected)
                      Container(
                    width: 60,
                    height: 2,
                    decoration:     BoxDecoration(
                borderRadius: BorderRadius.circular(30), 
                color: Color(0xffff8300))
                    ),
                        SizedBox(width: Get.width*.2,),
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
                    Container(
                      child:  HomePageOnePage(),
                    ),
                     Container(
                      child:  HomePageOnePage()
                    ),
                      Container(
                      child:  HomePageOnePage(),
                    ),
                    Container(
                      child:  HomePageOnePage(),
                    ),
                      Container(
                      child:  HomePageOnePage(),
                    ),
                    // Add more pages as needed
                  ],
                ),
              ),
      ],
    );
       

  }
}
