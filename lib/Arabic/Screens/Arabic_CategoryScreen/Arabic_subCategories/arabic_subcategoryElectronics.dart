import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_productbycategoryListController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryMensScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ElectronicsSubCategoryView/subcategoryAllElectronicsProduct.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ElectronicsSubCategoryView/subcategoryCameraView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ElectronicsSubCategoryView/subcategoryHeadphonesview.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ElectronicsSubCategoryView/subcategoryLaptopsModel.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ElectronicsSubCategoryView/subcategorySmartphonesView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ElectronicsSubCategoryView/subcategorywearableview.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';

class arabic_subcategory_ElectronicsScreen extends StatefulWidget {
  const arabic_subcategory_ElectronicsScreen({Key? key}) : super(key: key);

  @override
  State<arabic_subcategory_ElectronicsScreen> createState() =>
      _arabic_subcategory_ElectronicsScreenState();
}

class _arabic_subcategory_ElectronicsScreenState
    extends State<arabic_subcategory_ElectronicsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryByName.SeeAll_apiHit();
  }

  PageController _pageController =
      PageController(initialPage: -1); // Set initial page to 0
  bool showPageView = false;
  int selectedTabIndex = 0;
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
              return _categoryByName
                              .electronics_userlist.value.seeAllMainCategory ==
                          null ||
                      _categoryByName.electronics_userlist.value
                              .seeAllMainCategory?.length ==
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
                            "الصفحة غير موجودة",
                            style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                fontFamily: 'Almarai'),
                          ),
                        ],
                      ),
                    ))
                  : Column(
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
                                // arabicsubmainCatId = '134';

                                setState(() {
                                  showPageView = false;
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
                          child: Container(
                            color: Colors.white,
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                      mainAxisExtent: Get.height * .17),
                              itemCount: _categoryByName.electronics_userlist
                                      .value.seeAllMainCategory?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        arabicsubmainCatId = _categoryByName
                                            .electronics_userlist
                                            .value
                                            .seeAllMainCategory![index]
                                            .id
                                            .toString();

                                        setState(() {
                                          arabicproductbyCatId =
                                              arabicsubmainCatId;
                                          showPageView = true;
                                        });
                                        print("$arabicproductbyCatId==");
                                        if (arabicsubmainCatId == "166") {
                                          _pageController.animateToPage(index,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease);
                                        } else if (arabicsubmainCatId ==
                                            "170") {
                                          _pageController.animateToPage(index,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease);
                                        } else if (arabicsubmainCatId ==
                                            "171") {
                                          _pageController.animateToPage(index,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease);
                                        } else if (arabicsubmainCatId ==
                                            "172") {
                                          _pageController.animateToPage(index,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease);
                                        } else if (arabicsubmainCatId ==
                                            "173") {
                                          _pageController.animateToPage(index,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease);
                                        } else {
                                          Utils.snackBar(context, 'Sorry!',
                                              "We're currently working behind the scenes");
                                        }
                                      },
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
                                        "${_categoryByName.electronics_userlist.value.seeAllMainCategory?[index].aCategoryName.toString()}",
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
                        ),
                        Container(
                          height: Get.height * .4,
                          child: PageView(
                            controller: _pageController,
                            physics: NeverScrollableScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {
                                selectedTabIndex = index;
                              });
                            },
                            children: [
                              if (!showPageView)
                                Allelectronics_productview(), // Display MensAllProduct initially
                              Container(
                                  child: arabicSubCat_Electronics_smartphone()),
                              Container(
                                  child: arabicSubCat_Electronics_laptops()),
                              Container(
                                  child: arabicSubCat_Electronics_headphones()),
                              Container(
                                  child: arabic_SubCat_Electronics_camera()),
                              Container(
                                  child: arabicSubCat_Electronics_wearable()),
                            ],
                          ),
                        ),
                      ],
                    );
            }
          }),
        ),
      ),
    );
  }
}
