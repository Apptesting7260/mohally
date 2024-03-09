import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEcameraview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEheadphonesView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicElaptopview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEphoneSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEwearableView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBootsSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBottomSingleview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMFormalSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMJacketSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMShirtSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMactivewearView.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryElectronics.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryHealthandWellness.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryHomeliving.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryMensScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_category.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeControllerPage2Controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class content_of_women extends StatefulWidget {
  const content_of_women({Key? key}) : super(key: key);

  @override
  State<content_of_women> createState() => _content_of_womenState();
}

class _content_of_womenState extends State<content_of_women> {
  List<bool> isButtonTappedList = List.generate(20, (index) => false);

  int selectedTabIndex = 0;
  List<String> title = ['الجميع', 'نحيف', 'رجال', 'أطفال', "مجوهرات"];
  List<String> recomemded_text = [
    'مُستَحسَن',
    'ملابس رجالية',
    'الصحة و الجمال',
    'الصحة و الجمال',
    "الصحة و الجمال"
  ];
  List<String> carouselImages = [
    "assets/images/arabic_banner.png",
    "assets/images/arabic_banner.png",
  ];
  List<String> categoriesImages = [
    "assets/images/img_ellipse_1.png",
    "assets/images/img_ellipse_1.png",
    "assets/images/img_ellipse_1.png",
    "assets/images/img_ellipse_1.png",
    "assets/images/img_ellipse_1.png",
    "assets/images/img_ellipse_1.png",
    "assets/images/img_ellipse_1.png",
    "assets/images/img_ellipse_1.png",
  ];
  ArabicHomeView_controllerpage2 homeView_controller =
      ArabicHomeView_controllerpage2();
  @override
  void initState() {
    super.initState();
    homeView_controller.homeview_apihit();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (homeView_controller.rxRequestStatus.value == Status.ERROR) {
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
        return SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: Get.height * .04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'فئات',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Almarai'),
                ),
                SizedBox(
                  width: Get.width * .4,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(CategoryScreen_arabic());
                  },
                  child: Text(
                    'اظهار الكل',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffff8300),
                        fontFamily: 'Almarai'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * .04,
            ),
            homeView_controller.userList.value.categoryData == null ||
                    homeView_controller.userList.value.categoryData?.length == 0
                ? Center(
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
                  ))
                : Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: Get.height * .2,
                        crossAxisCount: 4,
                        mainAxisSpacing: 17.h,
                        crossAxisSpacing: 15.h,
                      ),
                      physics: BouncingScrollPhysics(),
                      itemCount: homeView_controller
                              .userList.value.categoryData?.length ??
                          0,
                      // homeView_controller
                      //     .userList.value.categoryData?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              // onTap: () {
                              //   _navigateaftertapped(context, index);
                              // },
                              onTap: () {
                                arabicMainCatId = homeView_controller
                                    .userList.value.categoryData?[index].id!
                                    .toString();

                                setState(() {
                                  arabicid = arabicMainCatId;
                                });
                                print("$arabicid==");
                                if (arabicMainCatId == "133") {
                                  Get.to(arabic_subcategory_MensScreen());
                                } else if (arabicMainCatId == "134") {
                                  Get.to(
                                      arabic_subcategory_ElectronicsScreen());
                                } else if (arabicMainCatId == "135") {
                                  Get.to(arabic_subcategory_homelivingScreen());
                                } else if (arabicMainCatId == "136") {
                                  Get.to(
                                      arabic_subcategory_healthandwellnessScreen());
                                } else {
                                  print("notfound");
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(38.0),
                                child: Image.network(
                                  "${homeView_controller.userList.value.categoryData?[index].imageUrl.toString()}",
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
                                  "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                  style: TextStyle(
                                    color: Color(0xFF272727),
                                    fontSize: 12,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w500,
                                  )),
                            )
                          ],
                        );
                      },
                    ),
                  ),
            SizedBox(
              height: Get.height * .05,
            ),
            _buildHomePageSection(context),
          ]),
        );
      }
    });
  }

  Widget _buildHomePageSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: Get.height * .4,
            crossAxisCount: 2,
            // mainAxisSpacing: 2,
            crossAxisSpacing: 10.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount:
              homeView_controller.userList.value.recommendedProduct?.length ??
                  0,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width, padding: EdgeInsets.only(left: 20),
                  // height: 160.adaptSize,
                  // width: 160.adaptSize,
                  // height: Get.height*.2,
                  // width: Get.width*.3,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: CustomImageView(
                          fit: BoxFit.cover,
                          imagePath:
                              "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                          onTap: () {
                            arabicMainCatId = homeView_controller.userList.value
                                .recommendedProduct![index].mainCategoryId!
                                .toString();
                            String? ProductId = homeView_controller
                                .userList.value.recommendedProduct![index].id!
                                .toString();

                            setState(() {
                              MainCatId = arabicMainCatId;
                              productid = ProductId;
                            });
                            print("$productid==");
                            print("$arabicMainCatId==");
                            if (arabicMainCatId == "153") {
                              Get.to(ArabicMensSingleShirtViewScreen());
                              print(
                                  "$arabicMainCatId===========Mens Appearl main category id ");
                            } else if (arabicMainCatId == "154") {
                              Get.to(ArabicMensBottomSingleShViewScreen());
                            } else if (arabicMainCatId == "155") {
                              Get.to(ArabicMensJacketSingleShViewScreen());
                            } else if (arabicMainCatId == "156") {
                              Get.to(ArabicMensActivewearSingleShViewScreen());
                            } else if (arabicMainCatId == "157") {
                              Get.to(ArabicMensFormalsSingleShViewScreen());
                            } else if (arabicMainCatId == "174") {
                              Get.to(ArabicMensShoesSingleShViewScreen());
                            } else if (arabicMainCatId == "166") {
                              Get.to(
                                  ArabicElectronicsPhoneSingleShViewScreen());
                            } else if (arabicMainCatId == "170") {
                              Get.to(
                                  ArabicElectronicsLaptopsSingleShViewScreen());
                            } else if (arabicMainCatId == "171") {
                              Get.to(
                                  ArabicElectronicsHeadphonesSingleShViewScreen());
                            } else if (arabicMainCatId == "172") {
                              Get.to(
                                  ArabicElectronicsCameraSingleShViewScreen());
                            } else if (arabicMainCatId == "173") {
                              Get.to(
                                  ArabicElectronicswearableSingleShViewScreen());
                            } else {
                              print('not found ');
                            }
                          },
                          height: 190.adaptSize,
                          width: 190.adaptSize,
                          radius: BorderRadius.circular(
                            10.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            right: 10.h,
                          ),
                          child: CustomIconButton(
                            onTap: () {
                              //
                              Arabic_Add_remove_productid = homeView_controller
                                  .userList.value.recommendedProduct![index].id!
                                  .toString();
                              ArabicAdd_remove_wishlistController()
                                  .AddRemoveWishlish_apihit();

                              setState(() {
                                // Add_remove_productidd;
                                //  isButtonTapped = !isButtonTapped;
                                isButtonTappedList[index] =
                                    !isButtonTappedList[index];
                              });
                            },
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            padding: EdgeInsets.all(5.h),
                            decoration: IconButtonStyleHelper.fillWhiteA,
                            alignment: Alignment.topRight,
                            child: CustomImageView(
                              imagePath: isButtonTappedList[index]
                                  ? ImageConstant
                                      .imgGroup239531 // Change this to your tapped image
                                  : ImageConstant.imgSearch, // Default image
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),
                Container(
                  height: 16.v,
                  width: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(71, 228, 193, 204),
                  ),
                  child: Center(
                    child: Text(
                      'خصم 10',
                      style: TextStyle(
                          fontSize: 8,
                          color: Color(0xffff8300),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                ),
                // CustomElevatedButton(
                //   height: 16.v,
                //   width: 48.h,
                //   text: "10% Off",
                //   buttonTextStyle:
                //       theme.textTheme.labelSmall!.copyWith(color: Colors.white).copyWith(backgroundColor: Color.fromARGB(214, 252, 204, 220)),
                // ),
                SizedBox(height: 5.v),
                SizedBox(
                  width: 131.h,
                  child: Text(
                    "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
                    // "ساعة كوارتز حجر الراين الفاخرة السيدات روما...",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge!
                        .copyWith(
                          height: 1.33,
                        )
                        .copyWith(fontFamily: 'Almarai'),
                  ),
                ),
                SizedBox(height: 3.v),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: CustomRatingBar(
                                  ignoreGestures: true,
                                  initialRating: homeView_controller.userList
                                      .value.recommendedProduct?[index].rating
                                      ?.toDouble(),
                                ),
                              ),
                              Text(
                                "${homeView_controller.userList.value.recommendedProduct?[index].rating.toString()}",
                                // "4.8",
                                style: theme.textTheme.labelMedium
                                    ?.copyWith(fontFamily: 'Almarai'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.v),
                        Row(
                          children: [
                            Text(
                              "2k+ مُباع  ",
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(fontFamily: 'Almarai'),
                            ),
                            Text(
                              "${homeView_controller.userList.value.recommendedProduct?[index].pricee.toString()}",
                              //"\$99 ",
                              style: CustomTextStyles.titleMediumPrimary_2
                                  .copyWith(fontFamily: 'Almarai'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 58.h,
                        top: 3.v,
                      ),
                      child: CustomIconButton(
                        onTap: () {
                          Add_remove_Arabic_id = homeView_controller
                              .userList.value.recommendedProduct![index].id!
                              .toString();
                          Add_remove_wishlistController()
                              .AddRemoveWishlish_apihit();
                          setState(() {
                            isButtonTappedList[index] =
                                !isButtonTappedList[index];
                          });

                          // Get.to(WishlistPage_arabic(),
                          // );
                        },
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        padding: EdgeInsets.all(6.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroup239533,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildAvatarColumn(String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(categoriesImages[0]),
        ),
        SizedBox(
          height: Get.height * .01,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Almarai'),
        ),
      ],
    );
  }

  Widget buildAvatarRow(List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: texts.map((text) => buildAvatarColumn(text)).toList(),
    );
  }
}
