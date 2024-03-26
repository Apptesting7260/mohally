import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_productbycategoryListController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryMensScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/WomensSubcategoryView/SubCatWomensDresses.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/WomensSubcategoryView/SubCatWomensTopsView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';

class arabic_subcategory_womensCategory extends StatefulWidget {
  const arabic_subcategory_womensCategory({Key? key}) : super(key: key);

  @override
  State<arabic_subcategory_womensCategory> createState() =>
      _arabic_subcategory_womensCategoryState();
}

class _arabic_subcategory_womensCategoryState
    extends State<arabic_subcategory_womensCategory> {
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
      body: Directionality(
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
            return _categoryByName.womens_userlist.value.seeAllMainCategory ==
                        null ||
                    _categoryByName
                            .womens_userlist.value.seeAllMainCategory?.length ==
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
                            itemCount: _categoryByName.womens_userlist.value
                                    .seeAllMainCategory?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      arabicsubmainCatId = _categoryByName
                                          .womens_userlist
                                          .value
                                          .seeAllMainCategory![index]
                                          .id
                                          .toString();

                                      setState(() {
                                        arabicproductbyCatId =
                                            arabicsubmainCatId;
                                      });
                                      print("$arabicproductbyCatId==");
                                      if (arabicsubmainCatId == "176") {
                                        Get.to(arabicSubCat_Womens_Dresses());
                                      } else if (arabicsubmainCatId == "177") {
                                        Get.to(arabicSubCat_Womens_Tops());
                                      } else {
                                        Get.to(NoProductFound02());
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(38.0),
                                      child: Image.network(
                                        "${_categoryByName.womens_userlist.value.seeAllMainCategory?[index].imageUrl.toString()}",
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
                                        "${_categoryByName.womens_userlist.value.seeAllMainCategory?[index].categoryName.toString()}",
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
      ),
    );
  }

  void _navigateaftertapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );

        break;
      // Add more cases for other indices and screens
      // ...
    }
  }
}
