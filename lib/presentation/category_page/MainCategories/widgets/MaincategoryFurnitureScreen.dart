import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureCarpetProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureHomedecorProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureLightProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureLivingRoomProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furniture_bedroomProducts.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';

class MaincategoryFurnitureScreen extends StatefulWidget {
  const MaincategoryFurnitureScreen({Key? key}) : super(key: key);

  @override
  State<MaincategoryFurnitureScreen> createState() =>
      _MaincategoryFurnitureScreenState();
}

class _MaincategoryFurnitureScreenState
    extends State<MaincategoryFurnitureScreen> {
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
          return _categoryByName.furniture_userlist.value.seeAllMainCategory ==
                      null ||
                  _categoryByName.furniture_userlist.value.seeAllMainCategory
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
                              itemCount: _categoryByName.furniture_userlist
                                      .value.seeAllMainCategory?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    submainCatId = _categoryByName
                                        .furniture_userlist
                                        .value
                                        .seeAllMainCategory![index]
                                        .id
                                        .toString();

                                    setState(() {
                                      EnglishproductbyCatId = submainCatId;
                                      showPageView = true;
                                    });
                                    print("$EnglishproductbyCatId==");
                                    if (submainCatId == "212") {
                                      Get.to(FurnitureLivingRoomProducts());
                                    } else if (submainCatId == "213") {
                                      Get.to(FurnitureBedRoomProducts());
                                    } else if (submainCatId == "214") {
                                      Get.to(FurnitureHomedecorProducts());
                                    } else if (submainCatId == "215") {
                                      Get.to(FurnitureLightsProducts());
                                    } else if (submainCatId == "216") {
                                      Get.to(FurniturecarpetsProducts());
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
                                            "${_categoryByName.furniture_userlist.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                            height: 68,
                                            width: 68,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.v),
                                      Center(
                                        child: Text(
                                          "${_categoryByName.furniture_userlist.value.seeAllMainCategory?[index].categoryName.toString()}",
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
                    ],
                  ),
                );
        }
      }),
    );
  }
}
