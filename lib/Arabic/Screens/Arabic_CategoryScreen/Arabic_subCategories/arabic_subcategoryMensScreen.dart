import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_productbycategoryListController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/MensSubCategoryAllProductScreen/ArabicAllMensProduct.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/MensSubCategoryAllProductScreen/SubCatActivewearView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/MensSubCategoryAllProductScreen/SubCatBottomsView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/MensSubCategoryAllProductScreen/SubCatFormalsView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/MensSubCategoryAllProductScreen/SubCatJacketView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/MensSubCategoryAllProductScreen/SubCatShoesView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/MensSubCategoryAllProductScreen/SubCatTopsandShirtsAllProductView.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';

String? arabicsubmainCatId;

class arabic_subcategory_MensScreen extends StatefulWidget {
  const arabic_subcategory_MensScreen({Key? key}) : super(key: key);

  @override
  State<arabic_subcategory_MensScreen> createState() =>
      _arabic_subcategory_MensScreenState();
}

class _arabic_subcategory_MensScreenState
    extends State<arabic_subcategory_MensScreen> {
  PageController _pageController =
      PageController(initialPage: 0); // Set initial page to 0
  bool showPageView = false;
  int selectedTabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryByName.SeeAll_apiHit();
  }

  categorybyNameController _categoryByName = categorybyNameController();
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
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
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
                    "عفوا! تواجه خوادمنا مشكلة في الاتصال.\nيرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى",
                    style: theme.textTheme.headlineMedium?.copyWith(
                        color: Color.fromARGB(73, 0, 0, 0),
                        fontSize: 12,
                        fontFamily: 'Almarai'),
                  ),
                ],
              )));
            } else {
              if (_categoryByName.userList.value.seeAllMainCategory == null ||
                  _categoryByName.userList.value.seeAllMainCategory?.length ==
                      0) {
                return Center(
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
                        "الصفحة غير موجودة",
                        style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            fontFamily: 'Almarai'),
                      ),
                    ],
                  ),
                ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showPageView =
                                  false; // Set showPageView to false to show GridView instead of PageView
                            });
                            _pageController.jumpToPage(
                                0); // Jump to the first page (MensAllProduct())
                          },
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(38.0),
                                child: Image.asset(
                                  "assets/images/viewall.png",
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5.v),
                              Text(
                                "عرض الكل",
                                style: TextStyle(
                                  color: Color(0xFF272727),
                                  fontSize: 12,
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            mainAxisExtent: Get.height * .15),
                        itemCount: _categoryByName
                                .userList.value.seeAllMainCategory?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  arabicsubmainCatId = _categoryByName.userList
                                      .value.seeAllMainCategory![index].id
                                      .toString();

                                  setState(() {
                                    arabicproductbyCatId = arabicsubmainCatId;
                                    showPageView = true;
                                  });
                                  print("$arabicproductbyCatId==");
                                  if (arabicsubmainCatId == "153") {
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                    // Get.to(SubCat_Mens_Bottoms());
                                  } else if (arabicsubmainCatId == "154") {
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                    // Get.to(SubCat_Mens_jacket());
                                  } else if (arabicsubmainCatId == "155") {
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                    // Get.to(SubCat_Mens_activewear());
                                  } else if (arabicsubmainCatId == "156") {
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                    // Get.to(SubCat_Mens_formals());
                                  } else if (arabicsubmainCatId == "157") {
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                    // Get.to(SubCat_Mens_shoes());
                                  } else if (arabicsubmainCatId == "174") {
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                    // Get.to(SubCat_Mens_shoes());
                                  } else {
                                    Utils.snackBar(context, 'Sorry!',
                                        "We're currently working behind the scenes");
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
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: Get.height * .5,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        children: [
                          if (!showPageView)
                            ArabicMensAllProduct(), // Display MensAllProduct initially
                          Container(child: arabicSubCat_Mens_ShirtsView()),
                          Container(child: arabicSubCat_Mens_Bottoms()),
                          Container(child: arabicSubCat_Mens_jacket()),
                          Container(child: arabicSubCat_Mens_activewear()),
                          Container(child: arabicSubCat_Mens_formals()),
                          Container(child: arabicSubCat_Mens_shoes()),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }
          }),
        ),
      ),
    );
  }
}
