import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
import 'package:mohally/core/app_export.dart';
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
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/home_page_one_page.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';

String? submainCatId;

class subcategory_MensScreen extends StatefulWidget {
  const subcategory_MensScreen({Key? key}) : super(key: key);

  @override
  State<subcategory_MensScreen> createState() => _subcategory_MensScreenState();
}

class _subcategory_MensScreenState extends State<subcategory_MensScreen> {
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryByName.SeeAll_apiHit();
  }

  CategoriesByNameControllerEnglish _categoryByName =
      CategoriesByNameControllerEnglish();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                width: Get.width * .07,
                height: Get.height * .03,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(90, 158, 158, 158)),
                child: Icon(
                  Icons.arrow_back,
                )),
          ),
        ),
      ),
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
          return _categoryByName.userList.value.seeAllMainCategory == null ||
                  _categoryByName.userList.value.seeAllMainCategory?.length == 0
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
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Container(
                        color: Colors.white,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  mainAxisExtent: Get.height * .2),
                          itemCount: _categoryByName
                                  .userList.value.seeAllMainCategory?.length ??
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
                                    });
                                    print("$EnglishproductbyCatId==");
                                    if (submainCatId == "153") {
                                      Get.to(SubCat_Mens_ShirtsView());
                                      print(
                                          "$submainCatId===========Mens Appearl main category id ");
                                    } else if (submainCatId == "154") {
                                      Get.to(SubCat_Mens_Bottoms());
                                    } else if (submainCatId == "155") {
                                      Get.to(SubCat_Mens_jacket());
                                    } else if (submainCatId == "156") {
                                      Get.to(SubCat_Mens_activewear());
                                    } else if (submainCatId == "157") {
                                      Get.to(SubCat_Mens_formals());
                                    } else if (submainCatId == "174") {
                                      Get.to(SubCat_Mens_shoes());
                                    } else if (submainCatId == "166") {
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
                                      print('not found ');
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(38.0),
                                    child: Image.network(
                                      "${_categoryByName.userList.value.seeAllMainCategory?[index].imageUrl.toString()}",
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
                                      "${_categoryByName.userList.value.seeAllMainCategory?[index].categoryName.toString()}",
                                      style: TextStyle(
                                        color: Color(0xFF272727),
                                        fontSize: 12,
                                        fontFamily: 'League Spartan',
                                        fontWeight: FontWeight.w500,
                                      )),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
        }
      }),
    );
  }
}
