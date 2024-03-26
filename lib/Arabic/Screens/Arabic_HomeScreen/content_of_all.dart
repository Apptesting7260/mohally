import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_ProductPrceChnageByAttribute.dart';
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
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicWomensSingleViewScreens/arabicWomenDressSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicWomensSingleViewScreens/arabicWomensTopsSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryElectronics.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryWomensCategory.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryMensScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_category.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

String? arabicMainCatId;
String? sizeid;
String? colorId;
String? color;
String? size1;

class content_of_all extends StatefulWidget {
  const content_of_all({Key? key}) : super(key: key);
  @override
  State<content_of_all> createState() => _content_of_allState();
}

class _content_of_allState extends State<content_of_all> {
  ArabicProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ArabicProductPriceChngeByAttribute();
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

  RxInt selectedImageIndex = 0.obs;
  RxString selectedImageUrl = ''.obs;
  @override
  void initState() {
    super.initState();
    //homeBanner_controller.homeBanner_apihit();
    homeBanner_controller.homeBanner_apihit();
    homeView_controller.homeview_apihit();
    // productviewcontroller.Single_ProductApiHit();
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
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
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
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error2.png',
            ),
            Center(
              child: Text(
                "عفوا! تواجه خوادمنا مشكلة في الاتصال.\nيرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى",
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0),
                    fontSize: 12,
                    fontFamily: 'Almarai'),
              ),
            ),
          ],
        ));
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: Get.height * .14,
                          crossAxisCount: 4,
                          // mainAxisSpacing: 17.h,
                          // crossAxisSpacing: 15.h,
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
                                  } else if (arabicMainCatId == "175") {
                                    Get.to(arabic_subcategory_womensCategory());
                                  } else {
                                    NoProductFound();
                                  }
                                },
                                child: Center(
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
                              ),
                              SizedBox(height: 5.v),
                              Center(
                                child: Text(
                                  "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                  style: TextStyle(
                                    color: Color(0xFF272727),
                                    fontSize: 12,
                                    fontFamily: 'Almarai',
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
              SizedBox(
                height: Get.height * .05,
              ),

              _buildHomePageSection(context),
            ]),
          ),
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
                            } else if (arabicMainCatId == "176") {
                              Get.to(ArabicWomensDressSingleShViewScreen());
                            } else if (arabicMainCatId == "177") {
                              Get.to(ArabicWomensTopSingleShViewScreen());
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
                //       theme.textTheme.labelSmall!.copyWith(color: Colors.white).copyWith(backgroundلون: Color.fromARGB(214, 252, 204, 220)),
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
                          arabicMainCatId = homeView_controller.userList.value
                              .recommendedProduct?[index].mainCategoryId
                              .toString();
                          String? arproductId = homeView_controller
                              .userList.value.recommendedProduct?[index].id
                              ?.toString();

                          setState(() {
                            MainCatId = arabicMainCatId;
                            productid = arproductId;
                          });
                          print("$productid==");
                          print("$arabicMainCatId==");
                          if (arabicMainCatId == "153") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensShirt(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "154") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensBottoms(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "155") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensJacket(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "156") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensActiveWear(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "157") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensFormals(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "174") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartmensShoes_view(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "166") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsPhone(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "170") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsLaptop(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "171") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsHeadphones(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "172") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsCamera(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "173") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartelectronicsWarable(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "176") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartwomensDress_view(
                                      context, arabicMainCatId, arproductId);
                                });
                          } else if (arabicMainCatId == "177") {
                            productviewcontroller.Single_ProductApiHit();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return _buildAddtocartwomensTop_view(
                                      context, arabicMainCatId, arproductId);
                                });
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

  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("مقاس", style: theme.textTheme.titleMedium),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text("دليل المقاسات",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.grey)),
            ),
          ],
        ),
      ),
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .ShirtandTops_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.ShirtandTops_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.ShirtandTops_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.ShirtandTops_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .ShirtandTops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .ShirtandTops_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .ShirtandTops_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .ShirtandTops_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .ShirtandTops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .ShirtandTops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid = productviewcontroller
                                                          .ShirtandTops_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details?[index]
                                                          .SizeId
                                                          .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .ShirtandTops_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .ShirtandTops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
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
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .jacket_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.jacket_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.jacket_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.jacket_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .jacket_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .jacket_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .jacket_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .jacket_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .jacket_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .SizeId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .jacket_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .jacket_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
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
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .activewear_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.activewear_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.activewear_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.activewear_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .activewear_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .activewear_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .activewear_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .activewear_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .activewear_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .SizeId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .activewear_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .activewear_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
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
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .formal_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.formal_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.formal_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.formal_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .formal_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .formal_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .formal_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .formal_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .formal_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .formal_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .formal_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .SizeId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .formal_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .formal_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
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
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .wearable_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.wearable_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.wearable_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.wearable_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .wearable_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .wearable_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .wearable_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .wearable_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Model ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .wearable_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .ModelId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .wearable_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .smartphone_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.smartphone_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.smartphone_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.smartphone_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .smartphone_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .smartphone_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .smartphone_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .smartphone_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .smartphone_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .smartphone_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Model ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .smartphone_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .ModelId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .smartphone_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .smartphone_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .smartphone_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .smartphone_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .smartphone_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .smartphone_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .smartphone_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .camera_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.camera_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.camera_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.camera_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .camera_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .camera_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .camera_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .camera_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .camera_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .camera_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Model ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .camera_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .ModelId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .camera_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .camera_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .camera_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .camera_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .camera_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .camera_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .camera_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .headphones_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.headphones_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.headphones_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.headphones_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .headphones_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .headphones_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .headphones_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .headphones_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .headphones_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .headphones_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Model ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .headphones_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .ModelId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .headphones_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .headphones_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .headphones_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .headphones_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .headphones_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .headphones_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .headphones_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .headphones_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .headphones_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .laptops_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.laptops_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.laptops_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.laptops_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .laptops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .laptops_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .laptops_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .laptops_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .laptops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .laptops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Model ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .laptops_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .ModelId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .laptops_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .laptops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .laptops_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .laptops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .laptops_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .laptops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .laptops_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartModelId =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .laptops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .laptops_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .Bottom_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.Bottom_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                                        '${productviewcontroller.Bottom_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.Bottom_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .Bottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .Bottom_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .Bottom_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .Bottom_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .Bottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .Bottom_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .Bottom_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .SizeId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .Bottom_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .Bottom_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
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
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .mensshoes_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.mensshoes_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                "${productviewcontroller.mensshoes_userlist.value.productView?.aDescription.toString()}",
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
                                                        '${productviewcontroller.mensshoes_userlist.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.mensshoes_userlist.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .mensshoes_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .mensshoes_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .mensshoes_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .mensshoes_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .mensshoes_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .mensshoes_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .mensshoes_userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .SizeId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .mensshoes_userlist
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .mensshoes_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
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
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartwomensDress_view(
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .womens_dressSingleView
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.womens_dressSingleView.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                "${productviewcontroller.womens_dressSingleView.value.productView?.aTitle.toString()}",
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
                                "${productviewcontroller.womens_dressSingleView.value.productView?.aDescription.toString()}",
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
                                                        '${productviewcontroller.womens_dressSingleView.value.productView!.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.womens_dressSingleView.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .womens_dressSingleView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .womens_dressSingleView
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder: (
                                                  context,
                                                  index,
                                                ) {
                                                  return SizedBox(
                                                    width: 10.h,
                                                  );
                                                },
                                                itemCount: productviewcontroller
                                                        .womens_dressSingleView
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details!
                                                        .length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .womens_dressSingleView
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .womens_dressSingleView
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                            .womens_dressSingleView
                                            .value
                                            .productView
                                            ?.galleryUrl
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      String imageUrl = productviewcontroller
                                              .womens_dressSingleView
                                              .value
                                              .productView
                                              ?.galleryUrl?[index] ??
                                          '';
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .womens_dressSingleView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                      .womens_dressSingleView
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .womens_dressSingleView
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid = productviewcontroller
                                                          .womens_dressSingleView
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details?[index]
                                                          .SizeId
                                                          .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .womens_dressSingleView
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .womens_dressSingleView
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .womens_dressSingleView
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartSize =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .womens_dressSingleView
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .womens_dressSingleView
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartSize =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .womens_dressSingleView
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .womens_dressSingleView
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartSize =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .womens_dressSingleView
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .womens_dressSingleView
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartSize =
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartwomensTop_view(
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
                            "أضف إلى السلة",
                            style: theme.textTheme.titleMedium?.copyWith(),
                          ),
                        ),
                        CustomImageView(
                          onTap: () {
                            Get.back();
                            setState(() {
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
                              selectedcolorIndex.value = -1;
                              selectedSizeIndex.value = -1;
                            });
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Obx(
                            //   () => Padding(
                            //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            //     child: Container(
                            //       height: Get.height * .4,
                            //       width: Get.width,
                            //       child: CustomImageView(
                            //         fit: BoxFit.cover,
                            //         imagePath: selectedImageUrl.value.isNotEmpty
                            //             ? selectedImageUrl.value
                            //             : "${productviewcontroller.womens_topView.value.productView!.imageUrl.toString()}",
                            //         height: 504.v,
                            //         width: Get.width,
                            //         alignment: Alignment.center,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()
                                  // physics: ScrollPhysics(),
                                  itemCount: productviewcontroller
                                          .womens_topView
                                          .value
                                          .productView
                                          ?.galleryUrl
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
                                          : "${productviewcontroller.womens_topView.value.productView?.galleryUrl?[index] ?? ''}",
                                      height: 504.v,
                                      width: Get.width,
                                      alignment: Alignment.center,
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
                                "${productviewcontroller.womens_topView.value.productView?.aTitle.toString()}",
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
                                "${productviewcontroller.womens_topView.value.productView?.aDescription.toString()}",
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
                                                        '${productviewcontroller.womens_topView.value.productView?.productDetails!.details?[index].price}',
                                                    style: CustomTextStyles
                                                        .titleLargePrimary,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        // '${productviewcontroller.womens_topView.value.productView!.productDetails!.details?[index].productPrice}',
                                                        " \$120",
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
                              height: Get.height * .1,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .womens_topView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
                                    return Text('');
                                  } else {
                                    return Column(
                                      children: [
                                        // SizedBox(height: 11.v),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "لون: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedcolored
                                                              .value.isNotEmpty
                                                          ? selectedcolored
                                                              .value
                                                          : productviewcontroller
                                                              .womens_topView
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),

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
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder: (
                                                  context,
                                                  index,
                                                ) {
                                                  return SizedBox(
                                                    width: 10.h,
                                                  );
                                                },
                                                itemCount: productviewcontroller
                                                        .womens_topView
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details!
                                                        .length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  String selectedcolorname =
                                                      productviewcontroller
                                                              .womens_topView
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .Color ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // setState(() {
                                                        selectedcolored.value =
                                                            selectedcolorname;
                                                        selectedcolorIndex
                                                            .value = index;
                                                        colorId =
                                                            productviewcontroller
                                                                .womens_topView
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details?[
                                                                    index]
                                                                .ColorId
                                                                .toString();
                                                        // selectedIndex = index;
                                                        // selectedColor = selectedcolor;
                                                        // });
                                                        print(
                                                            selectedcolorIndex);
                                                      },
                                                      child: Obx(
                                                        () => Center(
                                                          child: Container(
                                                            width: 70.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Color(
                                                                      0xffff8300)
                                                                  : Color
                                                                      .fromARGB(
                                                                          111,
                                                                          158,
                                                                          158,
                                                                          158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20), // Adjust the border radius as needed
                                                            ),
                                                            padding: EdgeInsets.all(
                                                                8), // Adjust the padding as needed
                                                            child: Center(
                                                              child: Text(
                                                                '$selectedcolorname',
                                                                style:
                                                                    TextStyle(
                                                                  color: selectedcolorIndex
                                                                              .value ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
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
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * .04),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 60.v,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      //right: 10.h,
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
                                            .womens_topView
                                            .value
                                            .productView
                                            ?.galleryUrl
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      String imageUrl = productviewcontroller
                                              .womens_topView
                                              .value
                                              .productView
                                              ?.galleryUrl?[index] ??
                                          '';
                                      return GestureDetector(
                                        onTap: () {
                                          selectedImageUrl.value = imageUrl;
                                          selectedImageIndex.value = index;
                                          print(selectedImageIndex);
                                        },
                                        child: SizedBox(
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .womens_topView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

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
                                                      .womens_topView
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedsizename =
                                                    productviewcontroller
                                                            .womens_topView
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .Size ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          index;
                                                      sizeid =
                                                          productviewcontroller
                                                              .womens_topView
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details?[index]
                                                              .SizeId
                                                              .toString();
                                                      // print(selectedSizeIndex);
                                                    },
                                                    child: Center(
                                                      child: Obx(
                                                        () => Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedSizeIndex
                                                                        .value ==
                                                                    index
                                                                ? Color(
                                                                    0xffff8300)
                                                                : Color
                                                                    .fromARGB(
                                                                        111,
                                                                        158,
                                                                        158,
                                                                        158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Adjust the border radius as needed
                                                          ),
                                                          padding: EdgeInsets.all(
                                                              8), // Adjust the padding as needed
                                                          child: Center(
                                                            child: Text(
                                                              '$selectedsizename',
                                                              style: TextStyle(
                                                                color: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: Get.height * .06,
                            //   child: ListView.builder(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       if (color == null || size1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (color != null && size1 != null) {
                            //                 if (colorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (sizeid == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Size');
                            //                 } else {
                            //                   arabicpid = productviewcontroller
                            //                       .womens_topView
                            //                       .value
                            //                       .productView
                            //                       ?.id
                            //                       .toString();
                            //                   arabicproductColor =
                            //                       colorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       sizeid.toString();
                            //                   _productpricechangebyattributecontroller
                            //                       .ProductPriceChangeByAttribute(
                            //                           context);
                            //                 }
                            //               }
                            //             },
                            //             child: Padding(
                            //               padding: const EdgeInsets.fromLTRB(
                            //                   110, 0, 110, 0),
                            //               child: Center(
                            //                 child: Container(
                            //                   height: Get.height * .05,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(35),
                            //                       border: Border.all(
                            //                         color: Color(0xffff8300),
                            //                         width: 2,
                            //                       ),
                            //                       color: Color(0xffff8300)),
                            //                   child: _productpricechangebyattributecontroller
                            //                               .loading.value ==
                            //                           false
                            //                       ? Center(
                            //                           child: Text(
                            //                             "Check Combination",
                            //                             style: TextStyle(
                            //                                 fontSize: 14,
                            //                                 color:
                            //                                     Colors.white),
                            //                           ),
                            //                         )
                            //                       : Center(
                            //                           child:
                            //                               CircularProgressIndicator(
                            //                           color: Colors.white,
                            //                         )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (color != null && size1 != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .womens_topView
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .womens_topView
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartSize =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .womens_topView
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .womens_topView
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartSize =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else {
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .womens_topView
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
                                            ArabicAddtocartprice =
                                                productviewcontroller
                                                    .womens_topView
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details?[index]
                                                    .price
                                                    .toString();
                                            ArabicAddtocartSize =
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
                                            selectedcolorIndex.value = -1;
                                          }
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .womens_topView
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .womens_topView
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartSize =
                                              sizeid.toString();
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
                                                color: Color(0xffff8300),
                                                width: 2,
                                              ),
                                              color: Color(0xffff8300)),
                                          child: arabic_addtocart_controller()
                                                      .loading
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "أضف إلى السلة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
