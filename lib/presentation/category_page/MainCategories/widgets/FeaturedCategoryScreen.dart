import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLivingBeddingProductScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';

// String? submainCatId;

class FeaturedCategoryScreen extends StatefulWidget {
  const FeaturedCategoryScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedCategoryScreen> createState() => _FeaturedCategoryScreenState();
}

class _FeaturedCategoryScreenState extends State<FeaturedCategoryScreen> {
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
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
      body: Container(
        height: Get.height,
        child: Obx(() {
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
            return _categoryByName.featured_userlist.value.seeAllMainCategory ==
                        null ||
                    _categoryByName.featured_userlist.value.seeAllMainCategory
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
                          // height: Get.height,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                // crossAxisSpacing: 8.0,
                                // mainAxisSpacing: 3.0,
                                mainAxisExtent: Get.height * .14,
                              ),
                              itemCount: _categoryByName.featured_userlist.value
                                      .seeAllMainCategory?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        submainCatId = _categoryByName
                                            .featured_userlist
                                            .value
                                            .seeAllMainCategory![index]
                                            .id
                                            .toString();

                                        EnglishproductbyCatId = submainCatId;

                                        print("$EnglishsubMainCatId==");
                                        if (submainCatId == "133") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "156") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "154") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "157") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "155") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "174") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "153") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "134") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "172") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "171") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "170") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "166") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "173") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "175") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "176") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "177") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "178") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "179") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "180") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "181") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "182") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "183") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "184") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "185") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "186") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "187") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "223") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "224") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "225") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "226") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "227") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "228") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "217") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "218") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "219") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "220") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "221") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "222") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "211") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "212") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "213") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "214") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "215") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "216") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "205") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "206") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "207") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "208") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "209") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "210") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "200") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "201") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "202") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "203") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "204") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "199") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "205") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "274") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "275") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "276") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "193") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "194") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "195") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "196") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "197") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "198") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "188") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "189") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "190") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "191") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "192") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "199") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "200") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "201") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "202") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "203") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "204") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else {
                                          Get.to(NoProductFound(
                                            showAppBar: true,
                                          ));
                                        }
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(38.0),
                                        child: Image.network(
                                          "${_categoryByName.featured_userlist.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                          height: 68,
                                          width: 68,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Center(
                                      child: Text(
                                        "${_categoryByName.featured_userlist.value.seeAllMainCategory?[index].categoryName.toString()}",
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
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }
        }),
      ),
    );
  }
}
