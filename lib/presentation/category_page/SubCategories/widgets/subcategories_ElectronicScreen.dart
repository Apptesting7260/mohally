import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryCameraView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryHeadphonesview.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryLaptopsModel.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorySmartphonesView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorywearableview.dart';
import 'package:mohally/presentation/category_page/SubCategories/widgets/SubCategoriesMens.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';

class subcategoryElectronicsScreen extends StatefulWidget {
  const subcategoryElectronicsScreen({Key? key}) : super(key: key);

  @override
  State<subcategoryElectronicsScreen> createState() =>
      _subcategoryElectronicsScreenState();
}

class _subcategoryElectronicsScreenState
    extends State<subcategoryElectronicsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryByName.SeeAll_apiHit();
  }

  PageController _pageController =
      PageController(initialPage: 0); // Set initial page to 0
  bool showPageView = false;
  int selectedTabIndex = 0;
  CategoriesByNameControllerEnglish _categoryByName =
      CategoriesByNameControllerEnglish();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.only(top: 11, left: 10),
      //     child: CustomIconButton(
      //         onTap: () {
      //           Get.back();
      //         },
      //         height: 40.adaptSize,
      //         width: 40.adaptSize,
      //         decoration: IconButtonStyleHelper.fillGrayTL20,
      //         child: Center(
      //             child: Icon(
      //           Icons.arrow_back,
      //           color: Colors.black,
      //         ))),
      //   ),
      //   title: Padding(
      //       padding: const EdgeInsets.only(
      //         top: 11,
      //       ),
      //       child: Text(
      //         "Electronics",
      //         style: TextStyle(
      //           color: Color.fromARGB(255, 0, 0, 0),
      //           // fontSize: 12,
      //           fontFamily: 'Almarai',
      //           fontWeight: FontWeight.w500,
      //         ),
      //         maxLines: 2,
      //         textAlign: TextAlign.center,
      //         // theme.textTheme.bodySmall,
      //         // overflow: TextOverflow.ellipsis,
      //         // maxLines: 1,
      //       )),
      // ),
      body: Obx(() {
        if (_categoryByName.rxRequestStatus.value == Status.LOADING) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (_categoryByName.rxRequestStatus.value == Status.ERROR) {
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
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
              ),
            ],
          )));
        } else {
          return _categoryByName
                          .electronics_userlist.value.seeAllMainCategory ==
                      null ||
                  _categoryByName.electronics_userlist.value.seeAllMainCategory
                          ?.length ==
                      0
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/no_product.png',
                        color: Color(0xffff8300),
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      Text(
                        "Page Not Found",
                        style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                    ],
                  ),
                ))
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            color: Colors.white,
                            child: GridView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                      mainAxisExtent: Get.height * .14),
                              itemCount: _categoryByName.electronics_userlist
                                      .value.seeAllMainCategory?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    submainCatId = _categoryByName
                                        .electronics_userlist
                                        .value
                                        .seeAllMainCategory![index]
                                        .id
                                        .toString();

                                    setState(() {
                                      EnglishproductbyCatId = submainCatId;
                                      showPageView = true;
                                    });
                                    print("$EnglishproductbyCatId==");
                                    if (submainCatId == "166") {
                                      Get.to(SubCat_Electronics_smartphone());
                                    } else if (submainCatId == "170") {
                                      Get.to(SubCat_Electronics_laptops());
                                    } else if (submainCatId == "171") {
                                      Get.to(SubCat_Electronics_headphones());
                                    } else if (submainCatId == "172") {
                                      Get.to(SubCat_Electronics_camera());
                                    } else if (submainCatId == "173") {
                                      Get.to(SubCat_Electronics_wearable());
                                    } else {
                                      Get.to(NoProductFound());
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(38.0),
                                          child: Image.network(
                                            "${_categoryByName.electronics_userlist.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                            height: 68,
                                            width: 68,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.v),
                                      Center(
                                        child: Text(
                                          "${_categoryByName.electronics_userlist.value.seeAllMainCategory?[index].categoryName.toString()}",
                                          style: TextStyle(
                                            color: Color(0xFF272727),
                                            fontSize: 12,
                                            fontFamily: 'League Spartan',
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: Get.height * 0.6,
                      //   child: PageView(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     controller: _pageController,
                      //     onPageChanged: (index) {
                      //       setState(() {
                      //         selectedTabIndex = index;
                      //       });
                      //     },
                      //     children: [
                      //       if (!showPageView)
                      //         ElectronicsAllProduct(), // Display MensAllProduct initially
                      //       Container(
                      //           child: SubCat_Electronics_smartphone(
                      //               showAppBar: false)),
                      //       Container(
                      //           child: SubCat_Electronics_laptops(
                      //               showAppBar: false)),
                      //       Container(
                      //           child: SubCat_Electronics_headphones(
                      //               showAppBar: false)),
                      //       Container(
                      //           child: SubCat_Electronics_camera(
                      //               showAppBar: false)),
                      //       Container(
                      //           child: SubCat_Electronics_wearable(
                      //               showAppBar: false)),
                      //       // Container(child: SubCat_Mens_shoes()),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
        }
      }),
    );
  }
}
