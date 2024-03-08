import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_addtocartController.dart';
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
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

String? arabicMainCatId;

class content_of_all extends StatefulWidget {
  const content_of_all({Key? key}) : super(key: key);
  @override
  State<content_of_all> createState() => _content_of_allState();
}

class _content_of_allState extends State<content_of_all> {
  List<bool> tappedList = List.generate(200, (index) => false);

  int selectedIndex = 0;
  HomeBanner_controller homeBanner_controller = HomeBanner_controller();
  List<bool> isButtonTappedList = List.generate(20, (index) => false);
  Add_remove_wishlistController add_remove_wishlistController =
      Add_remove_wishlistController();
  // HomeBanner_controller homeBanner_controller = HomeBanner_controller();
  HomeView_controller homeView_controller = HomeView_controller();
  SingleProductViewController productviewcontroller =
      SingleProductViewController();
  @override
  void initState() {
    super.initState();
    //homeBanner_controller.homeBanner_apihit();
    homeBanner_controller.homeBanner_apihit();
    homeView_controller.homeview_apihit();
    productviewcontroller.Single_ProductApiHit();
  }

  // int _currentPage = 0;
  List<String> category = [
    'إلكترونيات',
    'للنساءملابس',
    'مِلك الرجالملابس',
    'منحنى وزائد'
  ];
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
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //   if (homeBanner_controller.rxRequestStatus.value == Status.LOADING) {
      //   return const Scaffold(
      //     body: Center(child: CircularProgressIndicator()),
      //   );
      // }
      //  else if (homeBanner_controller.error.value == 'No internet') {
      //   return Scaffold(
      //     body: Center(
      //         child: InterNetExceptionWidget(
      //       onPress: () {},
      //     )),
      //   );
      // }
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
        // }
        // else if (homeBanner_controller.error.value == 'No internet') {
        //   return Scaffold(
        //     body: Center(
        //         child: InterNetExceptionWidget(
        //       onPress: () {},
        //     )),
        //   );
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
        return Container(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: Get.height * .02,
              ),
              // CarouselSlider(
              //   items: carouselImages.map((String imageUrl) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return Container(
              //           width: MediaQuery.of(context).size.width,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //             image: DecorationImage(
              //               image: AssetImage(imageUrl),
              //               fit: BoxFit.fill,
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   }).toList(),
              //   options: CarouselOptions(
              //     autoPlay: true,
              //     aspectRatio: 2.0,
              //     enlargeCenterPage: true,
              //   ),
              // ),

              CarouselSlider(
                items:
                    //carouselItems,
                    List.generate(
                  homeBanner_controller.userList.value.homeBanner?.bannerUrl ==
                          null
                      ? 0
                      : homeBanner_controller
                          .userList.value.homeBanner!.bannerUrl!.length,
                  (index) => Image.network(
                    homeBanner_controller
                            .userList.value.homeBanner?.bannerUrl?[index]
                            .toString() ??
                        "",
                  ),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),

              //           CarouselSlider(
              //             items: carouselImages.map((String imageUrl) {
              //        return Builder(
              //          builder: (BuildContext context) {
              //            return Container(
              //              width: MediaQuery.of(context).size.width,

              //              decoration: BoxDecoration(
              //               borderRadius: BorderRadius.all(Radius.circular(10)
              //               ),
              //               image: DecorationImage(image: AssetImage(  imageUrl,),
              //                fit: BoxFit.fill,
              //               )
              //              ),

              //            );
              //          },
              //        );
              //      }).toList(),
              //         // items: List.generate(
              //         //   homeBanner_controller.userList.value.homeBanner?.bannerUrl == null
              //         //       ? 0
              //         //       : homeBanner_controller.userList.value.homeBanner!.bannerUrl!.length,
              //         //   (index) => Image.network(
              //         //     homeBanner_controller.userList.value.homeBanner?.bannerUrl?[index].toString() ?? "",
              //         //   ),
              //         // ),
              //         options: CarouselOptions(
              // autoPlay: true,
              // aspectRatio: 2.0,
              // enlargeCenterPage: true,

              // reverse: false

              //         ),

              //             ),

              SizedBox(
                height: Get.height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: Get.height * .1,
                    width: Get.width * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(136, 235, 215, 215),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/return.png",
                        ),
                        SizedBox(
                          width: Get.width * .01,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'إرجاع مجاني',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Almarai'),
                            ),
                            Text(
                              'في غضون 90 يوما',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: 'Almarai'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * .1,
                    width: Get.width * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(135, 236, 213, 213),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/ship.png",
                        ),
                        SizedBox(
                          width: Get.width * .01,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ًالشحن مجانا',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Almarai'),
                            ),
                            Text(
                              'وقت محدود العرض',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: 'Almarai'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
                      homeView_controller.userList.value.categoryData?.length ==
                          0
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
                                    Get.to(
                                        arabic_subcategory_homelivingScreen());
                                  } else if (arabicMainCatId == "136") {
                                    Get.to(
                                        arabic_subcategory_healthandwellnessScreen());
                                  } else {
                                    NoProductFound();
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
              //    Container(
              //     height: Get.height * .05,
              //     child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: title.length,
              //   itemBuilder: (context, index) {
              //  bool isSelected = index == selectedTabIndex; // Assuming you have a variable to track the selected tab index

              //     return Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 8.0),
              //       child: Center(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Text(
              //               recomemded_text[index],
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 color: isSelected ? Colors.black : Colors.grey,
              //                 fontWeight: isSelected ? FontWeight.bold:FontWeight.w400 ,
              //                 fontFamily:  'Almarai',
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              //     ),
              //   )
              //  Padding(
              //    padding: const EdgeInsets.only(right:20),
              //    child: arabic_HomepagesectionItemWidget()

              //  ),
              _buildHomePageSection(context),
            ]),
          ),
        );
      }
    });
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
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoProductFound02()),
        );
        break;
      // Add more cases for other indices and screens
      // ...
    }
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
                        onTap: () async {
                          String? arMainCatId = homeView_controller.userList
                              .value.recommendedProduct?[index].mainCategoryId
                              .toString();
                          String? arproductId = homeView_controller
                              .userList.value.recommendedProduct?[index].id
                              ?.toString();

                          setState(() {
                            MainCatId = arMainCatId;
                            productid = arproductId;
                          });
                          print("$productid==");
                          print("$arMainCatId==");
                          if (arMainCatId == "153") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensShirt(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "154") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensBottoms(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "155") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensJacket(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "156") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensActiveWear(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "174") {
                            // Call the API before showing the modal bottom sheet
                            productviewcontroller.Single_ProductApiHit();
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return _buildAddtocartmensShoes_view(
                                    context, arMainCatId, arproductId);
                              },
                            );
                          }
                          // else if (arMainCatId == "174") {
                          //   // Call the API without awaiting it
                          //   SingleProductViewController()
                          //       .Single_ProductApiHit();

                          //   // Show the modal bottom sheet after a delay to ensure the API call has finished
                          //   Future.delayed(Duration(seconds: 2), () {
                          //     showModalBottomSheet(
                          //       context: context,
                          //       isScrollControlled: true,
                          //       builder: (context) {
                          //         return _buildAddtocartmensShoes_view(
                          //             context, arMainCatId, arproductId);
                          //       },
                          //     );
                          //   });
                          // }
                          else if (arMainCatId == "166") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsPhone(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "170") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsLaptop(
                                      context, arMainCatId, arproductId);
                                });

                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "171") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsHeadphones(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "172") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsCamera(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          } else if (arMainCatId == "173") {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsWarable(
                                      context, arMainCatId, arproductId);
                                });
                            productviewcontroller.Single_ProductApiHit();
                          }
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

  Widget buildAvatarColumn() {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            "assets/images/img_ellipse_1.png",
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Text(
          "إلكترونيات",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Almarai',
          ),
        ),
      ],
    );
  }

  Widget _buildAddtocartmensShirt(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .ShirtandTops_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .ShirtandTops_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.ShirtandTops_userlist.value.productView?.aTitle.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.ShirtandTops_userlist.value.productView?.aDescription.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.ShirtandTops_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .ShirtandTops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .ShirtandTops_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .ShirtandTops_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .ShirtandTops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.ShirtandTops_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .ShirtandTops_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .ShirtandTops_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),

                            // Container(
                            //   height: Get.height * .1,
                            //   child: ListView.builder(
                            //     itemCount: _viewcartcontroller
                            //             .userList.value.viewCart?.length ??
                            //         0,
                            //     itemBuilder: (BuildContext context, int index) {
                            //        _viewcartcontroller.userList.value
                            //               .viewCart![index].totalQty.value =
                            //           _viewcartcontroller.userList.value
                            //               .viewCart![index].totalQuantity;
                            //       return Row(
                            //         children: [
                            //           Padding(
                            //             padding: EdgeInsets.only(
                            //               top: 13.v,
                            //               bottom: 9.v,
                            //             ),
                            //             child: Text(
                            //               "Qty",
                            //               style: theme.textTheme.titleMedium,
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding: const EdgeInsets.only(right: 15),
                            //             child: Container(
                            //               width: Get.width * .2,
                            //               height: Get.height * .04,
                            //               decoration:
                            //                   AppDecoration.fillPrimary.copyWith(
                            //                 borderRadius:
                            //                     BorderRadiusStyle.circleBorder30,
                            //               ),
                            //               child: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceAround,
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.center,
                            //                 children: [
                            //                   GestureDetector(
                            //                     onTap: () {
                            //                       CartId = _viewcartcontroller
                            //                           .userList
                            //                           .value
                            //                           .viewCart![index]
                            //                           .id
                            //                           .toString();
                            //                       // Decrement the counter when "-" is pressed
                            //                       _viewcartcontroller
                            //                           .userList
                            //                           .value
                            //                           .viewCart![index]
                            //                           .totalQty
                            //                           .value -= 1;
                            //                       print(_viewcartcontroller
                            //                           .userList
                            //                           .value
                            //                           .viewCart![index]
                            //                           .totalQty
                            //                           .value);

                            //                       CartProductQtyIncrementCartcontroller()
                            //                           .addtocart_Apihit(context,
                            //                               index, "decrement");
                            //                     },
                            //                     child: Icon(
                            //                       Icons.remove,
                            //                       color: Colors.white,
                            //                       size: 15,
                            //                     ),
                            //                   ),
                            //                   Center(
                            //                       child: Text(
                            //                     _viewcartcontroller.userList.value
                            //                         .viewCart![index].totalQty.value
                            //                         .toString(),
                            //                     style: theme.textTheme.bodyMedium
                            //                         ?.copyWith(color: Colors.white),
                            //                   )),
                            //                   GestureDetector(
                            //                     onTap: () {
                            //                       CartId = _viewcartcontroller
                            //                           .userList
                            //                           .value
                            //                           .viewCart![index]
                            //                           .id
                            //                           .toString();
                            //                       // Increment the counter when "+" is pressed
                            //                       _viewcartcontroller
                            //                           .userList
                            //                           .value
                            //                           .viewCart![index]
                            //                           .totalQty
                            //                           .value += 1;
                            //                       print(_viewcartcontroller
                            //                           .userList
                            //                           .value
                            //                           .viewCart![index]
                            //                           .totalQty
                            //                           .value);

                            //                       CartProductQtyIncrementCartcontroller()
                            //                           .addtocart_Apihit(context,
                            //                               index, "increment");
                            //                     },
                            //                     child: Icon(
                            //                       Icons.add,
                            //                       color: Colors.white,
                            //                       size: 15,
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           )
                            //         ],
                            //       );
                            //     },
                            //   ),
                            // ),

                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensJacket(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .jacket_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .jacket_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.jacket_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.jacket_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.jacket_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .jacket_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .jacket_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.jacket_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .jacket_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .jacket_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensActiveWear(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .activewear_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .activewear_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.activewear_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.activewear_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.activewear_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .activewear_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .activewear_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.activewear_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .activewear_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .activewear_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensFormals(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .formal_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .formal_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.formal_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.formal_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.formal_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .formal_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .formal_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .formal_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .formal_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.formal_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .formal_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .formal_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsWarable(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .wearable_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .wearable_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.wearable_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.wearable_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.wearable_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .wearable_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .wearable_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;
                                  // var size2 = productviewcontroller.wearable_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .wearable_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .wearable_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        //ArabicAddtocartSize = productviewcontroller
                                        //     .wearable_userlist
                                        //     .value
                                        //     .productView
                                        //     ?.productDetails
                                        //     ?.details?[0]
                                        //     .SizeId
                                        //     .toString();
                                        ArabicAddtocartModelId =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ModelId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsPhone(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .smartphone_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .smartphone_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.smartphone_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.smartphone_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.smartphone_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .smartphone_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .smartphone_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .smartphone_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .smartphone_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.smartphone_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .smartphone_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .smartphone_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        ArabicAddtocartModelId =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ModelId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsCamera(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .camera_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .camera_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.camera_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.camera_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.camera_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .camera_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .camera_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .camera_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .camera_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;
                                  // var size2 = productviewcontroller.camera_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .camera_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .camera_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        //ArabicAddtocartSize = productviewcontroller
                                        //     .camera_userlist
                                        //     .value
                                        //     .productView
                                        //     ?.productDetails
                                        //     ?.details?[0]
                                        //     .SizeId
                                        //     .toString();
                                        ArabicAddtocartModelId =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ModelId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsHeadphones(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .headphones_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .headphones_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.headphones_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.headphones_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.headphones_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .headphones_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .headphones_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .headphones_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .headphones_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;
                                  // var size2 = productviewcontroller.headphones_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .headphones_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .headphones_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        //ArabicAddtocartSize = productviewcontroller
                                        //     .headphones_userlist
                                        //     .value
                                        //     .productView
                                        //     ?.productDetails
                                        //     ?.details?[0]
                                        //     .SizeId
                                        //     .toString();
                                        ArabicAddtocartModelId =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ModelId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsLaptop(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .laptops_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .laptops_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.laptops_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.laptops_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.laptops_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .laptops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .laptops_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .laptops_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .laptops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.laptops_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .laptops_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .laptops_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        ArabicAddtocartModelId =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ModelId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensBottoms(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .Bottom_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .Bottom_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.Bottom_userlist.value.productView?.title.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.Bottom_userlist.value.productView?.description.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.Bottom_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .Bottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .Bottom_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .Bottom_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .Bottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.Bottom_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .Bottom_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .Bottom_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.h),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 13.v,
                            //           bottom: 9.v,
                            //         ),
                            //         child: Text(
                            //           "Qty",
                            //           style: theme.textTheme.titleMedium,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 15),
                            //         child: Container(
                            //           width: 100.h,
                            //           height: Get.height * .05,
                            //           margin: EdgeInsets.only(left: 14.h),
                            //           padding: EdgeInsets.symmetric(vertical: 10.v),
                            //           decoration:
                            //               AppDecoration.fillPrimary.copyWith(
                            //             borderRadius:
                            //                 BorderRadiusStyle.circleBorder30,
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Increment the counter when "+" is pressed
                            //                     counter++;
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant
                            //                     .imgGroup239412WhiteA70002,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin: EdgeInsets.only(
                            //                   top: 2.v,
                            //                   bottom: 3.v,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 counter.toString(),
                            //                 style: CustomTextStyles
                            //                     .titleLargeWhiteA7000220,
                            //               ),
                            //               CustomImageView(
                            //                 onTap: () {
                            //                   setState(() {
                            //                     // Decrement the counter when "-" is pressed
                            //                     if (counter > 1) {
                            //                       counter--;
                            //                     }
                            //                   });
                            //                 },
                            //                 imagePath: ImageConstant.imgLine1,
                            //                 height: 13.adaptSize,
                            //                 width: 13.adaptSize,
                            //                 margin:
                            //                     EdgeInsets.symmetric(vertical: 9.v),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensShoes_view(
    BuildContext context,
    String? arMainCatId,
    String? arproductId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
        ],
      )));
    } else {
      return Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Expanded(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productviewcontroller
                                          .mensshoes_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imageUrl = productviewcontroller
                                            .mensshoes_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return Row(
                                      children: [
                                        Container(
                                          height: Get.height * .4,
                                          width: Get.width,
                                          child: CustomImageView(
                                            fit: BoxFit.cover,
                                            imagePath: "$imageUrl",
                                            height: 504.v,
                                            width: Get.width,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * .04,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.mensshoes_userlist.value.productView?.aTitle.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                //  "${productviewcontroller.mensshoes_userlist.value.productView?.aDescription.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                            ),
                            SizedBox(height: 14.v),
                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${productviewcontroller.mensshoes_userlist.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text: " \$120",
                                                    style: CustomTextStyles
                                                        .titleMediumGray50001
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(width: Get.width * .02),
                                            Container(
                                              width: 63,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    36, 206, 117, 147),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-20% off",
                                                  style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'League Spartan',
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: Get.height * .03,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var color = productviewcontroller
                                      .mensshoes_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color:",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "  ",
                                                  ),
                                                  TextSpan(
                                                    text: '$color',
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60.v,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    right: 23.h,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(
                                      width: 8.h,
                                    );
                                  },
                                  itemCount: productviewcontroller
                                          .mensshoes_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String imageUrl = productviewcontroller
                                            .mensshoes_userlist
                                            .value
                                            .productView
                                            ?.galleryUrl?[index] ??
                                        '';
                                    return SizedBox(
                                      width: 60.h,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
                                          imagePath: "$imageUrl",
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          radius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  var size1 = productviewcontroller
                                      .mensshoes_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;
                                  // var size2 = productviewcontroller.mensshoes_userlist.value
                                  //     .productView?.productDetails?.details?[index].Size;
                                  if (size1 == null) {
                                    return Text('');
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(height: 27.v),
                                      _buildRowSize(context),
                                      SizedBox(height: 11.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .mensshoes_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                if (index < 0 ||
                                                    index >=
                                                        (productviewcontroller
                                                                .mensshoes_userlist
                                                                .value
                                                                .productView!
                                                                .productDetails
                                                                ?.details!
                                                                .length ??
                                                            0)) {
                                                  // Check if index is out of bounds
                                                  return Container(); // Return an empty container or any other widget as needed
                                                }

                                                bool isSelected =
                                                    index == selectedIndex;
                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width:
                                                            70.0, // Adjust this width as needed
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              17.0, // Adjust this padding as needed
                                                          vertical:
                                                              8.0, // Adjust this padding as needed
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors
                                                                  .grey[10003],
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '$size1',
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 27.v),
                                    ],
                                  );
                                },
                              ),
                            ),

                            Container(
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedList[index] = !tappedList[
                                            index]; // Toggle tapped state for this item
                                      });
                                      if (tappedList[index]) {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .ColorId
                                                .toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[0]
                                                .SizeId
                                                .toString();
                                        arabic_addtocart_controller()
                                            .addtocart_Apihit(context);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        // width: Get.width * .4,
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: tappedList[index]
                                                ? Colors.orange
                                                : Colors.black,
                                            width: 2,
                                          ),
                                          color: tappedList[index]
                                              ? Colors.orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            tappedList[index]
                                                ? "Already in cart"
                                                : "Add to cart",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: tappedList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // SizedBox(height: Get.height * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Size", style: theme.textTheme.titleMedium),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text("Size Guide",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
