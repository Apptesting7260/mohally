import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLivingBeddingProductScreen.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';

String? submainCatId;

class Maincategory_MensScreen extends StatefulWidget {
  const Maincategory_MensScreen({Key? key}) : super(key: key);

  @override
  State<Maincategory_MensScreen> createState() =>
      _Maincategory_MensScreenState();
}

class _Maincategory_MensScreenState extends State<Maincategory_MensScreen> {
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
            return _categoryByName.userList.value.seeAllMainCategory == null ||
                    _categoryByName.userList.value.seeAllMainCategory?.length ==
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
                              itemCount: _categoryByName.userList.value
                                      .seeAllMainCategory?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        submainCatId = _categoryByName.userList
                                            .value.seeAllMainCategory![index].id
                                            .toString();

                                        setState(() {
                                          EnglishproductbyCatId = submainCatId;
                                          showPageView = true;
                                        });
                                        print("$EnglishproductbyCatId==");
                                        if (submainCatId == "153") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "154") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "155") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "156") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "157") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "174") {
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
                                          "${_categoryByName.userList.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                          height: 68,
                                          width: 68,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Center(
                                      child: Text(
                                        "${_categoryByName.userList.value.seeAllMainCategory?[index].categoryName.toString()}",
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
