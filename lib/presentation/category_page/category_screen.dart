// ignore_for_file: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_mensclothing.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_onMenscategoryTap.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/widgets/category_mensClothing.dart';
import 'package:mohally/presentation/category_page/widgets/mens_clothing.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/theme/app_decoration.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/CategoryController/CategoriesController.dart';
import 'package:mohally/widgets/app_bar/appbar_title.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:mohally/widgets/custom_search_view.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
     List<String> featured_text = [
  'ALL',
  'Mens Clothing',
 'Womens Clothing',
 'Mens Shoes',
 'Womens Shoes',
  'Womens Clothing',
 'Mens Shoes',
 'Womens Shoes',
  'Mens Shoes',
 'Womens Shoes',
  'Womens Clothing',
 'Mens Shoes',
 'Womens Shoes',
];
     CategoriesControllerEnglish categories_controller = CategoriesControllerEnglish();

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

  @override
  void initState() {
    super.initState();
    categories_controller.SeeAll_apiHit();
        setInitialLocale();
  }

   void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }
  TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;
  PageController pagecontroller = PageController();
  int pagesCount = 10;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Obx((){
       if (categories_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }  else {
 return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(context),
          body: ListView(
            physics: NeverScrollableScrollPhysics(),
         
            children: [
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
                        _buildOncameraclick(context);
                      },
                      
                      child: Image.asset('assets/images/greycamera.png'))),
                      ],
                    ),
                  ),
                ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Featured",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Shop By Category",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: height ,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: ListView.separated(
                          itemCount: pagesCount,
                          itemBuilder: (context, int index) {
                            return SizedBox(
                              height: 5,
                            );
                          },
                          separatorBuilder: (context, int index) {
                            return GestureDetector(
                              onTap: () {
                                
                                pagecontroller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      height: (selectedIndex == index) ? 50 : 0,
                                      color: Color(0xffFF8300),
                                    ),
                                    Expanded(
                                        child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      height: 50,
                                      alignment: Alignment.center,
                                      color: (selectedIndex == index)
                                          ? Colors.orange.shade200
                                              .withOpacity(0.2)
                                          : Colors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 5),
                                        child: Text( featured_text[index]),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    
                         categories_controller.userList.value.seeAllMainCategory ==  null ||
                                      categories_controller.userList.value
                                              .seeAllMainCategory?.length ==
                                          0
                                  ? Center(child:  Text('Error: ${categories_controller.error.value}'))
                                  :  Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: PageView(
                                physics: NeverScrollableScrollPhysics(),
                                controller: pagecontroller,
                                onPageChanged: (index) {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                children: [
                                //  for (var i = 0; i <= pagesCount; i++)
                                    Container(
                                      color: Colors.white,
                                      child: Center(
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            mainAxisExtent: Get.height*.2
                                          ),
                                          itemCount: 18,
                                          itemBuilder: (context, index) {
                                            return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                              onTap: () {
                                                  _navigateaftertapped(context ,index);
                                                },
                                                
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(38.0),
                                                  child: Image.network(
                                                    "${categories_controller.userList.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                                    height: 68,
                                                    width: 68,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5.v),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${categories_controller.userList.value.seeAllMainCategory?[index].categoryName.toString()}",
                                                  style:
                                                  TextStyle(color: Color(0xFF272727),
      fontSize: 12,
      fontFamily: 'League Spartan',
      fontWeight: FontWeight.w500,)
                                                 
                                                ),
                                              )
                                            ],
                                          );

                                          },
                                        ),
                                     
                                      ),
                                    ),
                                   MensClothing_english(),
                                    NoProductFound(),
                                    NoProductFound(),
                                    NoProductFound(),
                                    NoProductFound(),
                                    NoProductFound(),
                                    NoProductFound(),
                                     NoProductFound(),
                           
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            
      
              
            ],
          ),
        ),
      );
    }
    }
    );
  }
void _navigateaftertapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
      case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
       case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
       case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
       case 5:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
       case 6:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
       case 7:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
      case 8:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoProductFound02()),
      );
      break;
    // Add more cases for other indices and screens
    // ...
  }
}
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "Categories",
        margin: EdgeInsets.only(left: 20),
      ),
    );
  }

  Widget buildGridView(String category) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 70,
                width: 70,
                child: Image.asset(
                  "assets/images/img_mask_group_60x56.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 2.v),
            Center(
                child: Text(
              "Electronics",
              style: theme.textTheme.bodySmall,
            ))
          ],
        );
      },
    );
  }
  Future _buildOncameraclick(BuildContext context){
  return showModalBottomSheet(
     context: context,
              builder: (BuildContext context) {
      return Container(
 width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 17.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
       child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMaskGroup24x24,
            height: 24.adaptSize,
            width: 24.adaptSize,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 20.h),
            onTap: () {
              Get.back();
            },
          ),
          SizedBox(height: 17.v),
          Divider(
            thickness: 0.5,
            color: Colors.grey
          ),
          SizedBox(height: 15.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath:"assets/images/blackcamera.png",
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 6.h,
                  top: 3.v,
                ),
                child: GestureDetector(
                  onTap: () {
                        showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Color(0xFFFF8300),
                                  title: Text("Choose" ,style: TextStyle( fontFamily: 'League Spartan', color: Colors.black, fontWeight: FontWeight.w400),),
                                  content: Row(
                                    children: [
                                      GestureDetector(
                                        child: Text("Camera", style: TextStyle( fontFamily: 'League Spartan', color: Colors.white,fontSize:18),),
                                        onTap: () {
                                          openCameraa(ImageSource.camera);
                                        },
                                      ),
                                      SizedBox(width: 80),
                                      GestureDetector(
                                        child: Text("Gallery", style: TextStyle( fontFamily: 'League Spartan', color: Colors.white, fontSize:18)),
                                        onTap: () {
                                          openCameraa(ImageSource.gallery);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                              );
                  },
                  child: Text(
                    "Take photo",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 19.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: "assets/images/blackvideo.png",
                height: 16.adaptSize,
                width: 16.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.h),
                child: Text(
                  "Select from album",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 22.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath:  "assets/images/clock.png",
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 6.h,
                  top: 3.v,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(SearchScreen());
                  },
                  child: Text(
                    "Search history",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 17.v),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: CustomTextStyles.titleMediumPrimaryMedium,
            ),
          ),
        ],
      ));}
      );
}
}
