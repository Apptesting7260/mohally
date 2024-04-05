// ignore_for_file: unused_import
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
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
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/ElectronicsAllProductView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryCameraView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryHeadphonesview.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryLaptopsModel.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorySmartphonesView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorywearableview.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/Health_vitaminsSubcatProducts.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/healthandwellnessAllProducts.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLivingAllProductsView.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLivingBeddingProductScreen.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLiving_FurnitureProductView.dart';
import 'package:mohally/presentation/category_page/KidsSubCategoryView/kidsAllproductsScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/MainCatGroceryandPantry.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/FeaturedCategoryScreen.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/MensAllProduct.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatActivewearView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatBottomsView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatFormalsView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatJacketView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatShoesView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatTopsandShirtsAllProductView.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategorySportsScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MaincategoryFurnitureScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MaincategoryKitchenScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MaincategoryBeautyScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MaincategoryHealthAndWellnessScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategory_Kids.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MaincategoryHomeandLivingScreen.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/WomensAllProductView.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/womensSubCatTopProductView.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/womensSubcatDressProductView.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/AllProductView.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/category_mensClothing.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategories_Womens.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/Maincategories_ElectronicScreen.dart';
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
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:mohally/widgets/custom_search_view.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

bool isFeaturedSelected = true;
int selectedTabIndex = 0;

class CategoryScreen extends StatefulWidget {
  // final int initialPage;
  final bool showAppBar;
  final int selectedTabIndex;
  final bool FromHomeToCat;
  const CategoryScreen(
      {Key? key,
      this.showAppBar = false,
      required this.selectedTabIndex,
      this.FromHomeToCat = false})
      : super(key: key);

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
    'Women\'s \nFashion',
  ];
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
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
  // _categoryByName.SeeAll_apiHit();
  // }
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      pagecontroller = PageController(initialPage: selectedTabIndex);

      _allcategory.AllSubCat();
      // _categoryByName.SeeAll_apiHit();
      homeView_controller.homeview_apihit();

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

  PageController pagecontroller = PageController();

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  // int pagesCount = homeView_controller.userList.value.categoryData!.length;
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
          appBar: widget.showAppBar
              ? AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: CustomIconButton(
                        onTap: () {
                          Get.back();
                        },
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        decoration: IconButtonStyleHelper.fillGrayTL20,
                        child: Center(
                            child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ))),
                  ),
                )
              : _buildAppBar(context),
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
                              // prefixIcon: Padding(
                              //   padding: EdgeInsets.all(
                              //     15.h,
                              //   ),
                              //   child: Icon(
                              //     Icons.search,
                              //     color: Colors.grey.shade600,
                              //   ),
                              // ),
                              // prefixIconConstraints: BoxConstraints(
                              //   maxHeight: 50.v,
                              // ),
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
                        Positioned(
                            top: 20,
                            left: 240,
                            child: GestureDetector(
                                onTap: () {
                                  _buildOncameraclick(context);
                                },
                                child: Image.asset(
                                    'assets/images/greycamera.png'))),
                      ],
                    ),
                  ),
                ),
                Gap(15),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Shop By Category",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                // SizedBox(
                //   height: Get.height * .02,
                // ),

                Obx(
                  () => Container(
                    width: double.infinity,
                    height: widget.FromHomeToCat ? Get.height : height * .7,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Container(
                            color: const Color.fromARGB(36, 158, 158, 158),
                            width: 120,
                            child:

                                // GestureDetector(
                                //   onTap: () {
                                //     print('tpp');
                                //     setState(() {
                                //       isFeaturedSelected = true;
                                //       mainCatId = null;
                                //       // widget.FromHomeToCat
                                //       //     ? isFeaturedSelected = false
                                //       //     : isFeaturedSelected = true;
                                //       widget.FromHomeToCat
                                //           ? widget.selectedTabIndex
                                //           : selectedTabIndex = -1;
                                //       print("-------------------${mainCatId}");
                                //     });
                                //   },
                                //   child: Container(
                                //     height: 60,
                                //     width: 120,
                                //     color:
                                //         //  widget.FromHomeToCat
                                //         //     ? null
                                //         //     :
                                //         isFeaturedSelected
                                //             ? Colors.white
                                //             : const Color.fromARGB(36, 158, 158,
                                //                 158), // Change this to your condition
                                //     child: Row(
                                //       children: [
                                //         Container(
                                //           height: 60,
                                //           width: 4,
                                //           color:
                                //               // widget.FromHomeToCat
                                //               //     ? null
                                //               //     :
                                //               isFeaturedSelected
                                //                   ? Color(0xffFF8300)
                                //                   : null, // Change this to your condition
                                //         ),
                                //         Container(
                                //           width: 100,
                                //           child: Padding(
                                //             padding:
                                //                 const EdgeInsets.only(left: 5),
                                //             child: Text(
                                //               "Featured",
                                //               style:
                                //                   theme.textTheme.titleMedium,
                                //             ),
                                //           ),
                                //           // textAlign: TextAlign.center,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                Container(
                              height: widget.FromHomeToCat
                                  ? Get.height
                                  : Get.height * .7,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: homeView_controller
                                        .userList.value.categoryData?.length ??
                                    0,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // isFeaturedSelected = false;
                                      mainCatId = homeView_controller.userList
                                          .value.categoryData?[index].id!
                                          .toString();

                                      setState(() {
                                        // isFeaturedSelected =
                                        //     false; // Update isFeaturedSelected
                                        widget.FromHomeToCat
                                            ? widget.selectedTabIndex
                                            : selectedTabIndex =
                                                index; // Update selectedTabIndex
                                        EnglishsubMainCatId = mainCatId;
                                      });
                                      print(selectedTabIndex);

                                      print(mainCatId);
                                      print(EnglishsubMainCatId);
                                      _categoryByName.SeeAll_apiHit();
                                      pagecontroller.animateToPage(
                                          selectedTabIndex,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Obx(
                                      () => Container(
                                          child: Row(children: [
                                        Container(
                                          height: 60,
                                          width: 120,
                                          color: widget.FromHomeToCat
                                              ? widget.selectedTabIndex == index
                                                  ? Colors.white
                                                  : Color.fromARGB(
                                                      36, 158, 158, 158)
                                              : selectedTabIndex == index
                                                  ? Colors.white
                                                  : Color.fromARGB(
                                                      36, 158, 158, 158),
                                          // ),
                                          child: Row(
                                            children: [
                                              Container(
                                                  height: 60,
                                                  width: 4,
                                                  color: widget.FromHomeToCat
                                                      ? (widget.selectedTabIndex ==
                                                              index
                                                          ? Colors.orange
                                                          : Colors.white)
                                                      : selectedTabIndex ==
                                                              index
                                                          ? Colors.orange
                                                          : Colors.white),
                                              // ),
                                              // SizedBox(
                                              //   width: Get.width * .03,
                                              // ),
                                              Container(
                                                // height: 60,
                                                width: 100,
                                                child: Text(
                                                  "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                                  style: TextStyle(
                                                    color: Color(0xFF272727),
                                                    fontSize: 12,
                                                    fontFamily: 'Almarai',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  maxLines: 3,
                                                  textAlign: TextAlign.center,
                                                  // theme.textTheme.bodySmall,
                                                  // overflow: TextOverflow.ellipsis,
                                                  // maxLines: 1,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ])),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: PageView(
                                physics: NeverScrollableScrollPhysics(),
                                controller: pagecontroller,
                                onPageChanged: (index) {
                                  setState(() {
                                    widget.FromHomeToCat
                                        ? selectedTabIndex
                                        : selectedTabIndex = index;
                                  });
                                },
                                children: [
                                  //  for (var i = 0; i <= pagesCount; i++)

                                  // if (isFeaturedSelected && mainCatId == null)
                                  //   Container(
                                  //     height: Get.height * .65,
                                  //     child: GridView.builder(
                                  //         shrinkWrap: true,
                                  //         gridDelegate:
                                  //             SliverGridDelegateWithFixedCrossAxisCount(
                                  //           crossAxisCount: 3,
                                  //           // crossAxisSpacing: 8.0,
                                  //           // mainAxisSpacing: 3.0,
                                  //           mainAxisExtent: Get.height * .14,
                                  //         ),
                                  //         itemCount: (_allcategory
                                  //                 .userlist
                                  //                 .value
                                  //                 .searchMainCat
                                  //                 ?.length ??
                                  //             0),
                                  //         //  + 1, // Add 1 for the "All" widget
                                  //         itemBuilder: (context, index) {
                                  //           return Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.start,
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.center,
                                  //             children: [
                                  //               GestureDetector(
                                  //                 onTap: () {
                                  // mainCatId = _allcategory
                                  //     .userlist
                                  //     .value
                                  //     .searchMainCat?[index]
                                  //     .id!
                                  //     .toString();
                                  // submainCatId = _allcategory
                                  //     .userlist
                                  //     .value
                                  //     .searchMainCat![index]
                                  //     .id
                                  //     .toString();
                                  //                   setState(() {
                                  // EnglishsubMainCatId =
                                  //     mainCatId;
                                  // EnglishproductbyCatId =
                                  //     submainCatId;
                                  //                   });
                                  //                   print(
                                  //                       "$EnglishsubMainCatId==");
                                  //                   if (mainCatId == "133") {
                                  //                     Get.to(MensAllProduct());
                                  //                   } else if (mainCatId ==
                                  //                       "134") {
                                  //                     Get.to(
                                  //                         ElectronicsAllProduct());
                                  //                   } else if (mainCatId ==
                                  //                       "175") {
                                  //                     Get.to(
                                  //                         WomensAllProduct());
                                  //                   } else if (mainCatId ==
                                  //                       "181") {
                                  //                     Get.to(
                                  //                         KidsAllProductsScreen());
                                  //                   } else if (mainCatId ==
                                  //                       "217") {
                                  //                     Get.to(
                                  //                         HealthandWellnessAllProducts());
                                  //                   } else if (mainCatId ==
                                  //                       "187") {
                                  //                     Get.to(
                                  //                         HomeLivingAllProducts());
                                  //                   }
                                  //                   //  else if (mainCatId ==
                                  //                   //     "211") {
                                  //                   //   Get.to(
                                  //                   //       MaincategoryFurnitureScreen());
                                  //                   // } else if (mainCatId ==
                                  //                   //     "205") {
                                  //                   //   Get.to(
                                  //                   //       MaincategoryKitchenScreen());
                                  //                   // } else if (mainCatId ==
                                  //                   //     "199") {
                                  //                   //   Get.to(
                                  //                   //       MaincategorySportsScreen());
                                  //                   // } else if (mainCatId ==
                                  //                   //     "193") {
                                  //                   //   Get.to(
                                  //                   //       MaincategoryBeautyScreen());
                                  //                   // }

                                  //                   // else if (mainCatId ==
                                  //                   //     "223") {
                                  //                   //   Get.to(
                                  //                   //       MaincategoryGroceryandPantryScreen());
                                  //                   // }
                                  //                   else if (submainCatId ==
                                  //                       "153") {
                                  //                     Get.to(
                                  //                         SubCat_Mens_ShirtsView(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "154") {
                                  //                     Get.to(
                                  //                         SubCat_Mens_Bottoms(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "155") {
                                  //                     Get.to(SubCat_Mens_jacket(
                                  //                         showAppBar: true));
                                  //                   } else if (submainCatId ==
                                  //                       "156") {
                                  //                     Get.to(
                                  //                         SubCat_Mens_activewear(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "157") {
                                  //                     Get.to(
                                  //                         SubCat_Mens_formals(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "174") {
                                  //                     Get.to(SubCat_Mens_shoes(
                                  //                         showAppBar: true));
                                  //                   } else if (submainCatId ==
                                  //                       "166") {
                                  //                     Get.to(
                                  //                         SubCat_Electronics_smartphone(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "170") {
                                  //                     Get.to(
                                  //                         SubCat_Electronics_laptops(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "171") {
                                  //                     Get.to(
                                  //                         SubCat_Electronics_headphones(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "172") {
                                  //                     Get.to(
                                  //                         SubCat_Electronics_camera(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "173") {
                                  //                     Get.to(
                                  //                         SubCat_Electronics_wearable());
                                  //                   } else if (submainCatId ==
                                  //                       "175") {
                                  //                     Get.to(
                                  //                         MaincategoryWomensScreen());
                                  //                   } else if (submainCatId ==
                                  //                       "176") {
                                  //                     Get.to(
                                  //                         SubCat_Womens_Dresses(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "177") {
                                  //                     Get.to(SubCat_Womens_Tops(
                                  //                         showAppBar: true));
                                  //                   } else if (submainCatId ==
                                  //                       "218") {
                                  //                     Get.to(
                                  //                         SubCat_Health_VitaminsProductScreen());
                                  //                   } else if (submainCatId ==
                                  //                       "191") {
                                  //                     Get.to(
                                  //                         HomeLivingFurnitureProducts(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else if (submainCatId ==
                                  //                       "192") {
                                  //                     Get.to(
                                  //                         HomeLivingBeddingProducts(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                   } else {
                                  //                     Get.to(NoProductFound());
                                  //                   }
                                  //                 },
                                  //                 child: ClipRRect(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           38.0),
                                  //                   child: Image.network(
                                  //                     "${_allcategory.userlist.value.searchMainCat![index].imageUrl.toString()}",
                                  //                     height: 68,
                                  //                     width: 68,
                                  //                     fit: BoxFit.cover,
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //               SizedBox(height: 5.v),
                                  //               Text(
                                  //                 "${_allcategory.userlist.value.searchMainCat![index].aCategoryName.toString()}",
                                  //                 style: TextStyle(
                                  //                   color: Color(0xFF272727),
                                  //                   fontSize: 12,
                                  //                   fontFamily:
                                  //                       'League Spartan',
                                  //                   fontWeight: FontWeight.w500,
                                  //                 ),
                                  //                 textAlign: TextAlign.center,
                                  //               )
                                  //             ],
                                  //           );
                                  //         }
                                  //         //},
                                  //         ),
                                  //   ),
                                  if (mainCatId == "id_for_all_cat")
                                    Container(
                                      child: Center(
                                          child: FeaturedCategoryScreen()),
                                    ),

                                  if (mainCatId == "133")
                                    Container(
                                      child: Center(
                                          child: Maincategory_MensScreen()),
                                    ),

                                  if (mainCatId == "134")
                                    Container(
                                      child: Center(
                                          child:
                                              MaincategoryElectronicsScreen()),
                                    ),
                                  if (mainCatId == "175")
                                    Container(
                                      child: Center(
                                          child: MaincategoryWomensScreen()),
                                    ),
                                  if (mainCatId == "181")
                                    Container(
                                      child: Center(
                                          child: MaincategoryKidsScreen()),
                                    ),
                                  if (mainCatId == "217")
                                    Container(
                                      child: Center(
                                          child:
                                              MaincategoryHealthAndWellness()),
                                    ),
                                  if (mainCatId == "211")
                                    Container(
                                      child: Center(
                                          child: MaincategoryFurnitureScreen()),
                                    ),
                                  if (mainCatId == "205")
                                    Container(
                                      child: Center(
                                          child: MaincategoryKitchenScreen()),
                                    ),
                                  if (mainCatId == "199")
                                    Container(
                                      child: Center(
                                          child: MaincategorySportsScreen()),
                                    ),
                                  if (mainCatId == "193")
                                    Container(
                                      child: Center(
                                          child: MaincategoryBeautyScreen()),
                                    ),
                                  if (mainCatId == "187")
                                    Container(
                                      child: Center(
                                          child:
                                              MaincategoryHomeandLivingScreen()),
                                    ),
                                  if (mainCatId == "223")
                                    Container(
                                      child: Center(
                                          child:
                                              MaincategoryGroceryandPantryScreen()),
                                    ),

                                  // if (mainCatId == "228")
                                  //   Container(
                                  //     child: Center(
                                  //         child:
                                  //             MaincategoryGroceryandPantryScreen()),
                                  //   ),

                                  // Container(
                                  //   color: Colors.white,
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     // mainAxisAlignment:
                                  //     //     MainAxisAlignment.center,
                                  //     children: [
                                  //       Container(
                                  //         height: Get.height * .65,
                                  //         child: GridView.builder(
                                  //             shrinkWrap: true,
                                  //             gridDelegate:
                                  //                 SliverGridDelegateWithFixedCrossAxisCount(
                                  // crossAxisCount: 3,
                                  // // crossAxisSpacing: 8.0,
                                  // // mainAxisSpacing: 3.0,
                                  // mainAxisExtent:
                                  //     Get.height * .14,
                                  //             ),
                                  //             itemCount: (_allcategory
                                  //                     .userlist
                                  //                     .value
                                  //                     .searchMainCat
                                  //                     ?.length ??
                                  //                 0),
                                  //             //  + 1, // Add 1 for the "All" widget
                                  //             itemBuilder:
                                  //                 (context, index) {
                                  //               return Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .start,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment
                                  //                         .center,
                                  //                 children: [
                                  //                   GestureDetector(
                                  //                     onTap: () {
                                  //                       mainCatId = _allcategory
                                  //                           .userlist
                                  //                           .value
                                  //                           .searchMainCat?[
                                  //                               index]
                                  //                           .id!
                                  //                           .toString();
                                  //                       submainCatId =
                                  //                           _allcategory
                                  //                               .userlist
                                  //                               .value
                                  //                               .searchMainCat![
                                  //                                   index]
                                  //                               .id
                                  //                               .toString();
                                  //                       setState(() {
                                  //                         EnglishsubMainCatId =
                                  //                             mainCatId;
                                  //                         EnglishproductbyCatId =
                                  //                             submainCatId;
                                  //                       });
                                  //                       print(
                                  //                           "$EnglishsubMainCatId==");
                                  //                       if (mainCatId ==
                                  //                           "133") {
                                  //                         Get.to(
                                  //                             subcategory_MensScreen());
                                  //                       } else if (mainCatId ==
                                  //                           "134") {
                                  //                         Get.to(
                                  //                             subcategoryElectronicsScreen());
                                  //                       } else if (mainCatId ==
                                  //                           "175") {
                                  //                         Get.to(
                                  //                             subcategoryWomensScreen());
                                  //                       } else if (submainCatId ==
                                  //                           "153") {
                                  //                         Get.to(SubCat_Mens_ShirtsView(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "154") {
                                  //                         Get.to(SubCat_Mens_Bottoms(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "155") {
                                  //                         Get.to(SubCat_Mens_jacket(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "156") {
                                  //                         Get.to(SubCat_Mens_activewear(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "157") {
                                  //                         Get.to(SubCat_Mens_formals(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "174") {
                                  //                         Get.to(SubCat_Mens_shoes(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "166") {
                                  //                         Get.to(SubCat_Electronics_smartphone(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "170") {
                                  //                         Get.to(SubCat_Electronics_laptops(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "171") {
                                  //                         Get.to(SubCat_Electronics_headphones(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "172") {
                                  //                         Get.to(SubCat_Electronics_camera(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "173") {
                                  //                         Get.to(
                                  //                             SubCat_Electronics_wearable());
                                  //                       } else if (submainCatId ==
                                  //                           "175") {
                                  //                         Get.to(
                                  //                             subcategoryWomensScreen());
                                  //                       } else if (submainCatId ==
                                  //                           "176") {
                                  //                         Get.to(SubCat_Womens_Dresses(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else if (submainCatId ==
                                  //                           "177") {
                                  //                         Get.to(SubCat_Womens_Tops(
                                  //                             showAppBar:
                                  //                                 true));
                                  //                       } else {
                                  //                         Get.to(
                                  //                             NoProductFound());
                                  //                       }
                                  //                     },
                                  //                     child: ClipRRect(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(
                                  //                                   38.0),
                                  //                       child:
                                  //                           Image.network(
                                  //                         "${_allcategory.userlist.value.searchMainCat![index].imageUrl.toString()}",
                                  //                         height: 68,
                                  //                         width: 68,
                                  //                         fit: BoxFit
                                  //                             .cover,
                                  //                       ),
                                  //                     ),
                                  //                   ),
                                  //                   SizedBox(height: 5.v),
                                  //                   Text(
                                  //                     "${_allcategory.userlist.value.searchMainCat![index].aCategoryName.toString()}",
                                  //                     style: TextStyle(
                                  //                       color: Color(
                                  //                           0xFF272727),
                                  //                       fontSize: 12,
                                  //                       fontFamily:
                                  //                           'League Spartan',
                                  //                       fontWeight:
                                  //                           FontWeight
                                  //                               .w500,
                                  //                     ),
                                  //                     textAlign: TextAlign
                                  //                         .center,
                                  //                   )
                                  //                 ],
                                  //               );
                                  //             }
                                  //             //},
                                  //             ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  //Mens Categoryyyyyyyyyyyyyyyyy
                                  // Obx(() {
                                  //   if (_categoryByName
                                  //           .rxRequestStatus.value ==
                                  //       Status.LOADING) {
                                  //     return const Scaffold(
                                  //       body: Center(
                                  //           child:
                                  //               CircularProgressIndicator()),
                                  //     );
                                  //   } else {
                                  //     return Container(
                                  //       height: Get.height * .7,
                                  //       child: GridView.builder(
                                  //           shrinkWrap: true,
                                  //           gridDelegate:
                                  //               SliverGridDelegateWithFixedCrossAxisCount(
                                  //             crossAxisCount: 3,
                                  //             // crossAxisSpacing: 8.0,
                                  //             // mainAxisSpacing: 3.0,
                                  //             mainAxisExtent:
                                  //                 Get.height * .14,
                                  //           ),
                                  //           itemCount: _categoryByName
                                  //                   .userList
                                  //                   .value
                                  //                   .seeAllMainCategory
                                  //                   ?.length ??
                                  //               0,
                                  //           itemBuilder:
                                  //               (context, index) {
                                  //             return Column(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment
                                  //                       .start,
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment
                                  //                       .center,
                                  //               children: [
                                  //                 GestureDetector(
                                  //                   onTap: () {
                                  //                     submainCatId =
                                  //                         _categoryByName
                                  //                             .userList
                                  //                             .value
                                  //                             .seeAllMainCategory![
                                  //                                 index]
                                  //                             .id
                                  //                             .toString();

                                  //                     setState(() {
                                  //                       EnglishproductbyCatId =
                                  //                           submainCatId;
                                  //                     });
                                  //                     print(
                                  //                         "$EnglishproductbyCatId==");
                                  //                     if (submainCatId ==
                                  //                         "153") {
                                  //                       Get.to(
                                  //                           SubCat_Mens_ShirtsView());
                                  //                     } else if (submainCatId ==
                                  //                         "154") {
                                  //                       Get.to(
                                  //                           SubCat_Mens_Bottoms());
                                  //                     } else if (submainCatId ==
                                  //                         "155") {
                                  //                       Get.to(
                                  //                           SubCat_Mens_jacket());
                                  //                     } else if (submainCatId ==
                                  //                         "156") {
                                  //                       Get.to(
                                  //                           SubCat_Mens_activewear());
                                  //                     } else if (submainCatId ==
                                  //                         "157") {
                                  //                       Get.to(
                                  //                           SubCat_Mens_formals());
                                  //                     } else if (submainCatId ==
                                  //                         "174") {
                                  //                       Get.to(
                                  //                           SubCat_Mens_shoes());
                                  //                     } else {
                                  //                       Get.to(
                                  //                           NoProductFound());
                                  //                     }
                                  //                   },
                                  //                   child: ClipRRect(
                                  //                     borderRadius:
                                  //                         BorderRadius
                                  //                             .circular(
                                  //                                 38.0),
                                  //                     child:
                                  //                         Image.network(
                                  //                       "${_categoryByName.userList.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                  //                       height: 68,
                                  //                       width: 68,
                                  //                       fit: BoxFit.cover,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(height: 5.v),
                                  //                 Text(
                                  //                   "${_categoryByName.userList.value.seeAllMainCategory?[index].categoryName.toString()}",
                                  //                   style: TextStyle(
                                  //                     color: Color(
                                  //                         0xFF272727),
                                  //                     fontSize: 12,
                                  //                     fontFamily:
                                  //                         'League Spartan',
                                  //                     fontWeight:
                                  //                         FontWeight.w500,
                                  //                   ),
                                  //                   textAlign:
                                  //                       TextAlign.center,
                                  //                   maxLines: 2,
                                  //                 )
                                  //               ],
                                  //             );
                                  //           }
                                  //           //},
                                  //           ),
                                  //     );
                                  //   }
                                  // }),

                                  // //Electronics Categoryyyyyyyyyyy
                                  // // _categoryByName
                                  // //                 .electronics_userlist
                                  // //                 .value
                                  // //                 .seeAllMainCategory ==
                                  // //             null ||
                                  // //         _categoryByName
                                  // //                 .electronics_userlist
                                  // //                 .value
                                  // //                 .seeAllMainCategory
                                  // //                 ?.length ==
                                  // //             0
                                  // //     ? Center(
                                  // //         child: Padding(
                                  // //         padding: const EdgeInsets.only(
                                  // //             top: 150),
                                  // //         child: Column(
                                  // //           children: [
                                  // //             Image.asset(
                                  // //               'assets/images/no_product.png',
                                  // //               color: Color(0xffff8300),
                                  // //             ),
                                  // //             SizedBox(
                                  // //               height: Get.height * .03,
                                  // //             ),
                                  // //             Text(
                                  // //               "Page Not Found",
                                  // //               style: theme.textTheme
                                  // //                   .headlineSmall
                                  // //                   ?.copyWith(
                                  // //                       fontWeight:
                                  // //                           FontWeight
                                  // //                               .normal,
                                  // //                       fontSize: 18),
                                  // //             ),
                                  // //           ],
                                  // //         ),
                                  // //       ))
                                  // //     :
                                  // Container(
                                  //   height: Get.height * .7,
                                  //   child: GridView.builder(
                                  //       shrinkWrap: true,
                                  //       gridDelegate:
                                  //           SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 3,
                                  //         // crossAxisSpacing: 8.0,
                                  //         // mainAxisSpacing: 3.0,
                                  //         mainAxisExtent:
                                  //             Get.height * .14,
                                  //       ),
                                  //       itemCount: _categoryByName
                                  //               .electronics_userlist
                                  //               .value
                                  //               .seeAllMainCategory
                                  //               ?.length ??
                                  //           0,
                                  //       itemBuilder: (context, index) {
                                  //         return Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.center,
                                  //           children: [
                                  //             GestureDetector(
                                  //               onTap: () {
                                  //                 submainCatId = _categoryByName
                                  //                     .electronics_userlist
                                  //                     .value
                                  //                     .seeAllMainCategory![
                                  //                         index]
                                  //                     .id
                                  //                     .toString();

                                  //                 setState(() {
                                  //                   EnglishproductbyCatId =
                                  //                       submainCatId;
                                  //                 });
                                  //                 print(
                                  //                     "$EnglishproductbyCatId==");
                                  //                 if (submainCatId ==
                                  //                     "166") {
                                  //                   Get.to(
                                  //                       SubCat_Electronics_smartphone());
                                  //                 } else if (submainCatId ==
                                  //                     "170") {
                                  //                   Get.to(
                                  //                       SubCat_Electronics_laptops());
                                  //                 } else if (submainCatId ==
                                  //                     "171") {
                                  //                   Get.to(
                                  //                       SubCat_Electronics_headphones());
                                  //                 } else if (submainCatId ==
                                  //                     "172") {
                                  //                   Get.to(
                                  //                       SubCat_Electronics_camera());
                                  //                 } else if (submainCatId ==
                                  //                     "173") {
                                  //                   Get.to(
                                  //                       SubCat_Electronics_wearable());
                                  //                 } else {
                                  //                   Get.to(
                                  //                       NoProductFound());
                                  //                 }
                                  //               },
                                  //               child: ClipRRect(
                                  //                 borderRadius:
                                  //                     BorderRadius
                                  //                         .circular(38.0),
                                  //                 child: Image.network(
                                  //                   "${_categoryByName.electronics_userlist.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                  //                   height: 68,
                                  //                   width: 68,
                                  //                   fit: BoxFit.cover,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //             SizedBox(height: 5.v),
                                  //             Text(
                                  //               "${_categoryByName.electronics_userlist.value.seeAllMainCategory?[index].categoryName.toString()}",
                                  //               style: TextStyle(
                                  //                 color:
                                  //                     Color(0xFF272727),
                                  //                 fontSize: 12,
                                  //                 fontFamily:
                                  //                     'League Spartan',
                                  //                 fontWeight:
                                  //                     FontWeight.w500,
                                  //               ),
                                  //               textAlign:
                                  //                   TextAlign.center,
                                  //               maxLines: 2,
                                  //             )
                                  //           ],
                                  //         );
                                  //       }
                                  //       //},
                                  //       ),
                                  // ),

                                  //Womens Category
                                  // _categoryByName.Womens_userlist.value
                                  //                 .seeAllMainCategory ==
                                  //             null ||
                                  //         _categoryByName
                                  //                 .Womens_userlist
                                  //                 .value
                                  //                 .seeAllMainCategory
                                  //                 ?.length ==
                                  //             0
                                  //     ? Center(
                                  //         child: Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             top: 150),
                                  //         child: Column(
                                  //           children: [
                                  //             Image.asset(
                                  //               'assets/images/no_product.png',
                                  //               color: Color(0xffff8300),
                                  //             ),
                                  //             SizedBox(
                                  //               height: Get.height * .03,
                                  //             ),
                                  //             Text(
                                  //               "Page Not Found",
                                  //               style: theme.textTheme
                                  //                   .headlineSmall
                                  //                   ?.copyWith(
                                  //                       fontWeight:
                                  //                           FontWeight
                                  //                               .normal,
                                  //                       fontSize: 18),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ))
                                  // :
                                  // Container(
                                  //   height: Get.height * .7,
                                  //   child: GridView.builder(
                                  //       shrinkWrap: true,
                                  //       gridDelegate:
                                  //           SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 3,
                                  //         // crossAxisSpacing: 8.0,
                                  //         // mainAxisSpacing: 3.0,
                                  //         mainAxisExtent:
                                  //             Get.height * .14,
                                  //       ),
                                  //       itemCount: _categoryByName
                                  //               .Womens_userlist
                                  //               .value
                                  //               .seeAllMainCategory
                                  //               ?.length ??
                                  //           0,
                                  //       itemBuilder: (context, index) {
                                  //         return Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.center,
                                  //           children: [
                                  //             GestureDetector(
                                  //               onTap: () {
                                  //                 submainCatId =
                                  //                     _categoryByName
                                  //                         .Womens_userlist
                                  //                         .value
                                  //                         .seeAllMainCategory![
                                  //                             index]
                                  //                         .id
                                  //                         .toString();

                                  //                 setState(() {
                                  //                   EnglishproductbyCatId =
                                  //                       submainCatId;
                                  //                 });
                                  //                 print(
                                  //                     "$EnglishproductbyCatId==");
                                  //                 if (submainCatId ==
                                  //                     "176") {
                                  //                   Get.to(
                                  //                       SubCat_Womens_Dresses());
                                  //                 } else if (submainCatId ==
                                  //                     "177") {
                                  //                   Get.to(
                                  //                       SubCat_Womens_Tops());
                                  //                 } else {
                                  //                   Get.to(
                                  //                       NoProductFound());
                                  //                 }
                                  //               },
                                  //               child: ClipRRect(
                                  //                 borderRadius:
                                  //                     BorderRadius
                                  //                         .circular(38.0),
                                  //                 child: Image.network(
                                  //                   "${_categoryByName.Womens_userlist.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                  //                   height: 68,
                                  //                   width: 68,
                                  //                   fit: BoxFit.cover,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //             SizedBox(height: 5.v),
                                  //             Text(
                                  //               "${_categoryByName.Womens_userlist.value.seeAllMainCategory?[index].categoryName.toString()}",
                                  //               style: TextStyle(
                                  //                 color:
                                  //                     Color(0xFF272727),
                                  //                 fontSize: 12,
                                  //                 fontFamily:
                                  //                     'League Spartan',
                                  //                 fontWeight:
                                  //                     FontWeight.w500,
                                  //               ),
                                  //               textAlign:
                                  //                   TextAlign.center,
                                  //               maxLines: 2,
                                  //             )
                                  //           ],
                                  //         );
                                  //       }
                                  //       //},
                                  //       ),
                                  // ),
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
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
