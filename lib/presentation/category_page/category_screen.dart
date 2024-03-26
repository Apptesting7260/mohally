// ignore_for_file: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryCameraView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryHeadphonesview.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryLaptopsModel.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorySmartphonesView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorywearableview.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatActivewearView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatBottomsView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatFormalsView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatJacketView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatShoesView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatTopsandShirtsAllProductView.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/womensSubCatTopProductView.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/womensSubcatDressProductView.dart';
import 'package:mohally/presentation/category_page/widgets/AllProductView.dart';
import 'package:mohally/presentation/category_page/widgets/category_mensClothing.dart';
import 'package:mohally/presentation/category_page/widgets/SubCategoriesMens.dart';
import 'package:mohally/presentation/category_page/widgets/subCategories_Womens.dart';
import 'package:mohally/presentation/category_page/widgets/subcategories_ElectronicScreen.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/presentation/search_screen/widgets/categorysearchScreen.dart';
import 'package:mohally/theme/app_decoration.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/AllSubCategoryController/AllSubCategoryController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/EnglishSearchController/EnglishCategorySearch.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
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
  EnglishCategorySearchController _searchcontroller =
      EnglishCategorySearchController();
  CategoriesByNameControllerEnglish _categoryByName =
      CategoriesByNameControllerEnglish();
  List<String> featured_text = [
    'ALL',
    'Men\'s Apparel',
    'Electronics',
    'Women\'s Fashion',
    // 'Womens Clothing',
    // 'Kids Clothing',
    // 'Jewelery',
    // 'Womens Shoes',
    // 'Mens Shoes',
    // 'Womens Clothing',
    // 'Mens Shoes',
    // 'Womens Shoes',
  ];
  // HomeView_controller_English _allcategory =
  //     HomeView_controller_English();
  EnglishAllSubCategory _allcategory = EnglishAllSubCategory();
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

  // @override
  // void initState() {
  //   super.initState();
  //   _allcategory.homeview_apihit();
  //   setInitialLocale();
  //   _categoryByName.SeeAll_apiHit();
  // }
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // _allcategory.homeview_apihit();
      _allcategory.AllSubCat();
      _categoryByName.SeeAll_apiHit();
      setInitialLocale();
    });
    super.initState();
  }

  void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }

  TextEditingController searchController = TextEditingController();

  int selectedTabIndex = 0;
  PageController pagecontroller = PageController();
  int pagesCount = 5;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Obx(() {
      if (_allcategory.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (_allcategory.rxRequestStatus.value == Status.ERROR) {
        return Scaffold(
            body: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error2.png',
            ),
            Text(
              "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
              style: theme.textTheme.headlineMedium
                  ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
            ),
          ],
        )));
      } else {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(context),
          body: SafeArea(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Center(
                    child: Stack(
                      children: [
                        // CustomSearchView(
                        //   readOnly: true,
                        //   enableTap: true,
                        //   controller: searchController,
                        //   hintText: "search",
                        // ),
                        SizedBox(
                          width: Get.width * .9,
                          //  width ?? double.maxFinite,
                          child: TextFormField(
                            onTap: () {
                              Get.to(CategorySearch());
                            },
                            style: CustomTextStyles.bodyLargeOnError_1,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: CustomTextStyles.bodyLargeOnError_1,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(
                                  15.h,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 50.v,
                              ),
                              suffixIcon: Container(
                                padding: EdgeInsets.all(15.h),
                                margin: EdgeInsets.only(
                                  left: 30.h,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(
                                      55.h,
                                    ),
                                  ),
                                ),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgSearchWhiteA70002,
                                  height: 30.adaptSize,
                                  width: 20.adaptSize,
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                maxHeight: 60.v,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.only(
                                left: 16.h,
                                top: 17.v,
                                bottom: 17.v,
                              ),
                              fillColor: appTheme.gray100,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.h),
                                borderSide: BorderSide(
                                  color: appTheme.gray300,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.h),
                                borderSide: BorderSide(
                                  color: appTheme.gray300,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.h),
                                borderSide: BorderSide(
                                  color: appTheme.gray300,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //     top: 20,
                        //     left: 240,
                        //     child: GestureDetector(
                        //         onTap: () {
                        //           _buildOncameraclick(context);
                        //         },
                        //         child: Image.asset(
                        //             'assets/images/greycamera.png'))),
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
                  height: height,
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
                                  }
                                  pagecontroller.animateToPage(index,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        height: (selectedTabIndex == index)
                                            ? 50
                                            : 0,
                                        color: Color(0xffFF8300),
                                      ),
                                      Expanded(
                                          child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        height: 50,
                                        alignment: Alignment.center,
                                        color: (selectedTabIndex == index)
                                            ? Colors.orange.shade200
                                                .withOpacity(0.2)
                                            : Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 5),
                                          child: Text(featured_text[index]),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        _allcategory.userlist.value.searchMainCat == null ||
                                _allcategory
                                        .userlist.value.searchMainCat?.length ==
                                    0
                            ? Center(child: NoProductFound())
                            : Expanded(
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: PageView(
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: pagecontroller,
                                    onPageChanged: (index) {
                                      setState(() {
                                        selectedTabIndex = index;
                                      });
                                    },
                                    children: [
                                      //  for (var i = 0; i <= pagesCount; i++)
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: Get.height * .7,
                                              child: GridView.builder(
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 8.0,
                                                    mainAxisSpacing: 8.0,
                                                    mainAxisExtent:
                                                        Get.height * .2,
                                                  ),
                                                  itemCount: (_allcategory
                                                          .userlist
                                                          .value
                                                          .searchMainCat
                                                          ?.length ??
                                                      0),
                                                  //  + 1, // Add 1 for the "All" widget
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            mainCatId = _allcategory
                                                                .userlist
                                                                .value
                                                                .searchMainCat?[
                                                                    index]
                                                                .id!
                                                                .toString();
                                                            submainCatId =
                                                                _allcategory
                                                                    .userlist
                                                                    .value
                                                                    .searchMainCat![
                                                                        index]
                                                                    .id
                                                                    .toString();
                                                            setState(() {
                                                              EnglishsubMainCatId =
                                                                  mainCatId;
                                                              EnglishproductbyCatId =
                                                                  submainCatId;
                                                            });
                                                            print(
                                                                "$EnglishsubMainCatId==");
                                                            if (mainCatId ==
                                                                "133") {
                                                              Get.to(
                                                                  subcategory_MensScreen());
                                                            } else if (mainCatId ==
                                                                "134") {
                                                              Get.to(
                                                                  subcategoryElectronicsScreen());
                                                            } else if (mainCatId ==
                                                                "175") {
                                                              Get.to(
                                                                  subcategoryWomensScreen());
                                                            } else if (submainCatId ==
                                                                "153") {
                                                              Get.to(
                                                                  SubCat_Mens_ShirtsView());
                                                            } else if (submainCatId ==
                                                                "154") {
                                                              Get.to(
                                                                  SubCat_Mens_Bottoms());
                                                            } else if (submainCatId ==
                                                                "155") {
                                                              Get.to(
                                                                  SubCat_Mens_jacket());
                                                            } else if (submainCatId ==
                                                                "156") {
                                                              Get.to(
                                                                  SubCat_Mens_activewear());
                                                            } else if (submainCatId ==
                                                                "157") {
                                                              Get.to(
                                                                  SubCat_Mens_formals());
                                                            } else if (submainCatId ==
                                                                "174") {
                                                              Get.to(
                                                                  SubCat_Mens_shoes());
                                                            } else if (submainCatId ==
                                                                "166") {
                                                              Get.to(
                                                                  SubCat_Electronics_smartphone());
                                                            } else if (submainCatId ==
                                                                "170") {
                                                              Get.to(
                                                                  SubCat_Electronics_laptops());
                                                            } else if (submainCatId ==
                                                                "171") {
                                                              Get.to(
                                                                  SubCat_Electronics_headphones());
                                                            } else if (submainCatId ==
                                                                "172") {
                                                              Get.to(
                                                                  SubCat_Electronics_camera());
                                                            } else if (submainCatId ==
                                                                "173") {
                                                              Get.to(
                                                                  subcategoryWomensScreen());
                                                            } else if (submainCatId ==
                                                                "176") {
                                                              Get.to(
                                                                  SubCat_Womens_Dresses());
                                                            } else if (submainCatId ==
                                                                "177") {
                                                              Get.to(
                                                                  SubCat_Womens_Tops());
                                                            } else {
                                                              Get.to(
                                                                  NoProductFound());
                                                            }
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        38.0),
                                                            child:
                                                                Image.network(
                                                              "${_allcategory.userlist.value.searchMainCat![index].imageUrl.toString()}",
                                                              height: 68,
                                                              width: 68,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5.v),
                                                        Text(
                                                          "${_allcategory.userlist.value.searchMainCat![index].aCategoryName.toString()}",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF272727),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'League Spartan',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      ],
                                                    );
                                                  }
                                                  //},
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
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
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "Categories",
        margin: EdgeInsets.only(left: 20),
      ),
    );
  }

  Future _buildOncameraclick(BuildContext context) {
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
                  Divider(thickness: 0.5, color: Colors.grey),
                  SizedBox(height: 15.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "assets/images/blackcamera.png",
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
                                    title: Text(
                                      "Choose",
                                      style: TextStyle(
                                          fontFamily: 'League Spartan',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    content: Row(
                                      children: [
                                        GestureDetector(
                                          child: Text(
                                            "Camera",
                                            style: TextStyle(
                                                fontFamily: 'League Spartan',
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          onTap: () {
                                            openCameraa(ImageSource.camera);
                                          },
                                        ),
                                        SizedBox(width: 80),
                                        GestureDetector(
                                          child: Text("Gallery",
                                              style: TextStyle(
                                                  fontFamily: 'League Spartan',
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          onTap: () {
                                            openCameraa(ImageSource.gallery);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
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
                        imagePath: "assets/images/clock.png",
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
              ));
        });
  }
}
