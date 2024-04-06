import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryCameraView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryHeadphonesview.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategoryLaptopsModel.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorySmartphonesView.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/subcategorywearableview.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/FurnitureAllproducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureLivingRoomProducts.dart';
import 'package:mohally/presentation/category_page/GrocerySubCatProducts/GroceryAllProductScreen.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/healthandwellnessAllProducts.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLivingBeddingProductScreen.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLiving_FurnitureProductView.dart';
import 'package:mohally/presentation/category_page/KidsSubCategoryView/KidsclothingProductsView.dart';
import 'package:mohally/presentation/category_page/KidsSubCategoryView/kidsBoysApparel.dart';
import 'package:mohally/presentation/category_page/KidsSubCategoryView/kidsGirlsProductsView.dart';
import 'package:mohally/presentation/category_page/KidsSubCategoryView/kidsShoesProductsView.dart';
import 'package:mohally/presentation/category_page/KidsSubCategoryView/kidsToysProductView.dart';
import 'package:mohally/presentation/category_page/KitchenwareSubCatProducts/KitchenAllProducts.dart';
import 'package:mohally/presentation/category_page/KitchenwareSubCatProducts/KitchenCookwareProducts.dart';
import 'package:mohally/presentation/category_page/KitchenwareSubCatProducts/KitchenDiningProducts.dart';
import 'package:mohally/presentation/category_page/KitchenwareSubCatProducts/KitchenGadgetsProducts.dart';
import 'package:mohally/presentation/category_page/KitchenwareSubCatProducts/KitchenLargeAppliances.dart';
import 'package:mohally/presentation/category_page/KitchenwareSubCatProducts/KitchenSmallAppliancesProducts.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatActivewearView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatBottomsView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatFormalsView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatJacketView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatShoesView.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/SubCatTopsandShirtsAllProductView.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/WomensSubCatBottomProducts.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/WomensSubCatJacketProducts.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/WomensSubCatSleepWareProducts.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/womensSubCatTopProductView.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/womensSubcatDressProductView.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/presentation/category_page/ElectronicsSubCategoryView/ElectronicsAllProductView.dart';
import 'package:mohally/presentation/category_page/HomeLivingSubCatProductsScreen/HomeLivingAllProductsView.dart';
import 'package:mohally/presentation/category_page/KidsSubCategoryView/kidsAllproductsScreen.dart';
import 'package:mohally/presentation/category_page/MensSubCategoryAllProductScreen/MensAllProduct.dart';
import 'package:mohally/presentation/category_page/WomensSubCategoryProductView/WomensAllProductView.dart';
import 'package:mohally/presentation/category_page/GrocerySubCatProducts/GrocerySubCatNaturalsProducts.dart';
import 'package:mohally/presentation/category_page/GrocerySubCatProducts/GrocerySubCatPantryProductsScreen.dart';
import 'package:mohally/presentation/category_page/GrocerySubCatProducts/GrocerySubcatSnacksProductsscreen.dart';
import 'package:mohally/presentation/category_page/GrocerySubCatProducts/Grocery_FreshproduceproductsScreen.dart';
import 'package:mohally/presentation/category_page/GrocerySubCatProducts/GrocerysubcatBevergesProducts.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/Health_vitaminsSubcatProducts.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/healthandWellnessFittnessProducts.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/healthandWellnessSubCatHealthuidesProducts.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/healthandWellnessSubCatProducts.dart';
import 'package:mohally/presentation/category_page/HealthAndWellnessSubcategoriesScreen/healthandwellnessSubCatwellnessGuides.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureCarpetProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureHomedecorProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureLightProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furnitureLivingRoomProducts.dart';
import 'package:mohally/presentation/category_page/FurnitureSubCatProducts/furniture_bedroomProducts.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';

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
                                          Get.to(MensAllProduct());
                                        } else if (submainCatId == "156") {
                                          Get.to(SubCat_Mens_activewear());
                                        } else if (submainCatId == "154") {
                                          Get.to(SubCat_Mens_Bottoms());
                                        } else if (submainCatId == "157") {
                                          Get.to(SubCat_Mens_formals());
                                        } else if (submainCatId == "155") {
                                          Get.to(SubCat_Mens_jacket());
                                        } else if (submainCatId == "174") {
                                          Get.to(SubCat_Mens_shoes());
                                        } else if (submainCatId == "153") {
                                          Get.to(SubCat_Mens_ShirtsView());
                                        } else if (submainCatId == "134") {
                                          Get.to(ElectronicsAllProduct());
                                        } else if (submainCatId == "172") {
                                          Get.to(SubCat_Electronics_camera());
                                        } else if (submainCatId == "171") {
                                          Get.to(
                                              SubCat_Electronics_headphones());
                                        } else if (submainCatId == "170") {
                                          Get.to(SubCat_Electronics_laptops());
                                        } else if (submainCatId == "166") {
                                          Get.to(
                                              SubCat_Electronics_smartphone());
                                        } else if (submainCatId == "173") {
                                          Get.to(SubCat_Electronics_wearable());
                                        } else if (submainCatId == "175") {
                                          Get.to(WomensAllProduct());
                                        } else if (submainCatId == "176") {
                                          Get.to(SubCat_Womens_Dresses());
                                        } else if (submainCatId == "177") {
                                          Get.to(SubCat_Womens_Tops());
                                        } else if (submainCatId == "178") {
                                          Get.to(
                                              Womens_SubCatBottomsProducts());
                                        } else if (submainCatId == "179") {
                                          Get.to(
                                              Womens_SubCatJacketsProducts());
                                        } else if (submainCatId == "180") {
                                          Get.to(
                                              Womens_SubCatSleepwareProducts());
                                        } else if (submainCatId == "183") {
                                          Get.to(SubCat_kids_boysApparel());
                                        } else if (submainCatId == "182") {
                                          Get.to(SubCat_kids_babyclothing());
                                        } else if (submainCatId == "181") {
                                          Get.to(KidsAllProductsScreen());
                                        } else if (submainCatId == "182") {
                                          Get.to(SubCat_kids_babyclothing());
                                        } else if (submainCatId == "183") {
                                          Get.to(SubCat_kids_boysApparel());
                                        } else if (submainCatId == "184") {
                                          Get.to(SubCat_kids_GirlsApparel());
                                        } else if (submainCatId == "185") {
                                          Get.to(SubCat_kids_shoes());
                                        } else if (submainCatId == "186") {
                                          Get.to(SubCat_kids_Toys());
                                        } else if (submainCatId == "188") {
                                          Get.to(HomeLivingFurnitureProducts());
                                        } else if (submainCatId == "189") {
                                          Get.to(HomeLivingBeddingProducts());
                                        } else if (submainCatId == "187") {
                                          Get.to(HomeLivingAllProducts());
                                        } else if (submainCatId == "223") {
                                          Get.to(GroceryAllProducts());
                                        } else if (submainCatId == "224") {
                                          Get.to(
                                              GrocerySubCatProduceProducts());
                                        } else if (submainCatId == "225") {
                                          Get.to(GrocerySubCatPantryProducts());
                                        } else if (submainCatId == "226") {
                                          Get.to(GrocerySubCatSnacksProducts());
                                        } else if (submainCatId == "227") {
                                          Get.to(
                                              GrocerySubCatBevergesProducts());
                                        } else if (submainCatId == "228") {
                                          Get.to(
                                              GrocerySubatNaturalsProducts());
                                        } else if (submainCatId == "217") {
                                          Get.to(
                                              HealthandWellnessAllProducts());
                                        } else if (submainCatId == "218") {
                                          Get.to(
                                              SubCat_Health_VitaminsProductScreen());
                                        } else if (submainCatId == "219") {
                                          Get.to(
                                              SubCat_Health_FittnessProductScreen());
                                        } else if (submainCatId == "220") {
                                          Get.to(
                                              SubCat_Health_personalProductScreen());
                                        } else if (submainCatId == "221") {
                                          Get.to(
                                              SubCat_Health_healthGuideProductScreen());
                                        } else if (submainCatId == "222") {
                                          Get.to(
                                              SubCat_Health_wellnessGuideProductScreen());
                                        } else if (submainCatId == "211") {
                                          Get.to(FurnitureAllProducts());
                                        } else if (submainCatId == "212") {
                                          Get.to(FurnitureLivingRoomProducts());
                                        } else if (submainCatId == "213") {
                                          Get.to(FurnitureBedRoomProducts());
                                        } else if (submainCatId == "214") {
                                          Get.to(FurnitureHomedecorProducts());
                                        } else if (submainCatId == "215") {
                                          Get.to(FurnitureLightsProducts());
                                        } else if (submainCatId == "216") {
                                          Get.to(FurniturecarpetsProducts());
                                        } else if (submainCatId == "205") {
                                          Get.to(KitchenAllProducts());
                                        } else if (submainCatId == "206") {
                                          Get.to(
                                              Kitchen_smallAppliancesProducts());
                                        } else if (submainCatId == "207") {
                                          Get.to(Kitchen_cookwareProducts());
                                        } else if (submainCatId == "208") {
                                          Get.to(Kitchen_GadgetsProducts());
                                        } else if (submainCatId == "209") {
                                          Get.to(
                                              Kitchen_LargeAppliancesProducts());
                                        } else if (submainCatId == "210") {
                                          Get.to(Kitchen_DiningProducts());
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
