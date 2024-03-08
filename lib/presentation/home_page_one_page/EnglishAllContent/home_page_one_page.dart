// ignore_for_file: unused_import
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Home_living_view_model/home_living_view_Model.dart';
import 'package:mohally/presentation/category_page/category_page.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/category_page/widgets/SubCategoriesMens.dart';
import 'package:mohally/presentation/category_page/widgets/subCategories_Healthandwellness.dart';
import 'package:mohally/presentation/category_page/widgets/subCategories_homeLiving.dart';
import 'package:mohally/presentation/category_page/widgets/subcategories_ElectronicScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/AudioSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/CameraSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/LaptopsSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/SmartPhonesSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/WearableSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ActivewearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/Bottoms_single_view.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/JacketandOutwearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/MensShoesSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/SuitsandFormalsSingleVoewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ShirtAndTopsSingleView.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/Cart/EnglishViewCartController.dart';
import 'package:mohally/view_models/controller/Cart/ProductQtyUpdateController/cartproductqtyUpdateController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/homepagesection_item_widget.dart';
import '../widgets/recommendedsection_item_widget.dart';
import '../widgets/shippingsection_item_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

String? mainCatId;

class HomePageOnePage extends StatefulWidget {
  const HomePageOnePage({Key? key})
      : super(
          key: key,
        );
  @override
  HomePageOnePageState createState() => HomePageOnePageState();
}

class HomePageOnePageState extends State<HomePageOnePage>
    with AutomaticKeepAliveClientMixin<HomePageOnePage> {
  List<bool> tappedList = List.generate(200, (index) => false);

  EnglishViewCart _viewcartcontroller = EnglishViewCart();

  int selectedImageIndex = 0;
  String selectedImageUrl = '';
  HomeLivingModel homeLivingModel = HomeLivingModel();
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  int selectedIndex = 0;

  EnglishSingleProductViewController _productview =
      EnglishSingleProductViewController();
  bool isProductAddedToWishlist = false;
  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  bool isButtonTapped = false;

  EnglishSingleProductViewController singleProductViewController =
      EnglishSingleProductViewController();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  HomeBanner_controller homeBanner_controller = HomeBanner_controller();
  EnglishAdd_remove_wishlistController englishAddRemoveWishlistController =
      EnglishAdd_remove_wishlistController();

  List<Widget> carouselItems = [
    //  Image.network(homeBanner_controller.userList.value.homeBanner!.bannerUrl![0].s0.toString()),
    Image.asset("assets/images/banner 1.png"),
    Image.asset("assets/images/banner 1.png")
  ];
  int counter = 1;
  @override
  void initState() {
    super.initState();
    homeBanner_controller.homeBanner_apihit();
    homeView_controller.homeview_apihit();

    // loadStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);
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
              "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
              style: theme.textTheme.headlineMedium
                  ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
            ),
          ],
        )));
      } else {
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //sSizedBox(height: 20.v),
                    Obx(() {
                      if (homeView_controller.rxRequestStatus.value ==
                          Status.LOADING) {
                        return const Scaffold(
                          body: Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        return CarouselSlider(
                          items:
                              //carouselItems,
                              List.generate(
                            homeBanner_controller
                                        .userList.value.homeBanner?.bannerUrl ==
                                    null
                                ? 0
                                : homeBanner_controller.userList.value
                                    .homeBanner!.bannerUrl!.length,
                            (index) => Image.network(
                              homeBanner_controller.userList.value.homeBanner
                                      ?.bannerUrl?[index]
                                      .toString() ??
                                  "",
                            ),
                          ),
                          options: CarouselOptions(
                            // enableInfiniteScroll: false,
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                        );
                      }
                    }),
                    // _buildBannerSection(context),
                    SizedBox(height: 5.v),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: Get.height * .1,
                            width: Get.width * .4,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                                      'Free shipping',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'League Spartan'),
                                    ),
                                    Text(
                                      'Time Limited Offer',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                          fontFamily: 'League Spartan'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * .05,
                          ),
                          Container(
                            height: Get.height * .1,
                            width: Get.width * .4,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                                      'Free Returns',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'League Spartan'),
                                    ),
                                    Text(
                                      'Within 90 days',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                          fontFamily: 'League Spartan'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 29.v),
                    _buildCategorySection(context),
                    SizedBox(height: 19.v),
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       // mainAxisExtent: 90.v,
                    //       crossAxisCount: 4,
                    //       mainAxisSpacing: 10.h,
                    //       crossAxisSpacing: 10.h,
                    //       mainAxisExtent: Get.height * .2),
                    //   physics: BouncingScrollPhysics(),
                    //   itemCount: 8,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Container(
                    //             height: 70,
                    //             width: 70,
                    //             child: Image.asset(
                    //               "assets/images/img_mask_group_60x56.png",
                    //               fit: BoxFit.cover,
                    //             )),
                    //         SizedBox(height: 2.v),
                    //         Center(
                    //             child: Text(
                    //           "Electronics",
                    //           style: theme.textTheme.bodySmall,
                    //         ))
                    //       ],
                    //     );
                    //   },
                    // ),
                    homeView_controller.userList.value.categoryData == null ||
                            homeView_controller
                                    .userList.value.categoryData?.length ==
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
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                ),
                              ],
                            ),
                          ))
                        : Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                                      onTap: () {
                                        mainCatId = homeView_controller.userList
                                            .value.categoryData?[index].id!
                                            .toString();

                                        setState(() {
                                          EnglishsubMainCatId = mainCatId;
                                        });
                                        print("$EnglishsubMainCatId==");
                                        if (mainCatId == "133") {
                                          Get.to(subcategory_MensScreen());
                                        } else if (mainCatId == "134") {
                                          Get.to(
                                              subcategoryElectronicsScreen());
                                        } else if (mainCatId == "135") {
                                          Get.to(subcategoryHomeLivingScreen());
                                        } else if (mainCatId == "136") {
                                          Get.to(
                                              subcategoryHealthAndWellnessScreen());
                                        } else {
                                          NoProductFound();
                                        }
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(38.0),
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
                                          )
                                          // theme.textTheme.bodySmall,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),

                    SizedBox(height: 20.v),
                    _buildHomePageSection(context),
                    SizedBox(height: 10.v),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  /// Section Widget
  Widget _buildShippingSection(BuildContext context) {
    return SizedBox(
      height: 60.v,
      child: ListView.separated(
        padding: EdgeInsets.only(right: 20.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 15.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return ShippingsectionItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCategorySection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: theme.textTheme.titleMedium,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: GestureDetector(
              onTap: () {
                Get.to(Get.to(CategoryScreen()));
              },
              child: Text(
                "See All",
                style: CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHomePageSection(BuildContext context) {
    //  super.build(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
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
            homeView_controller.userList.value.recommendedProduct?.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width, padding: EdgeInsets.only(left: 10),
                //    width: 170.adaptSize,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      onTap: () {
                        mainCatId = homeView_controller.userList.value
                            .recommendedProduct?[index].mainCategoryId!
                            .toString();
                        String? productId = homeView_controller
                            .userList.value.recommendedProduct?[index].id!
                            .toString();

                        setState(() {
                          Englishproductid = productId;
                          EnglishMainCatId = mainCatId;
                        });
                        print("$Englishproductid==");
                        if (mainCatId == "153") {
                          Get.to(ShirtsandTopsSingleView());
                          print(
                              "$mainCatId===========Mens Appearl main category id ");
                        } else if (mainCatId == "154") {
                          Get.to(SinglePageScreen_Bottoms());
                        } else if (mainCatId == "155") {
                          Get.to(SinglePageScreen_mens_Jacket());
                        } else if (mainCatId == "156") {
                          Get.to(SinglePageScreen_mens_activewear());
                        } else if (mainCatId == "157") {
                          Get.to(SinglePageScreen_Mens_Formals());
                        } else if (mainCatId == "174") {
                          Get.to(SinglePageScreen_Mens_Shoes());
                        } else if (mainCatId == "166") {
                          Get.to(SinglePageScreen_Electronics_Smartphones());
                        } else if (mainCatId == "170") {
                          Get.to(SinglePageScreen_Electronics_Laptops());
                        } else if (mainCatId == "171") {
                          Get.to(
                              SinglePageScreen_Electronics_AudioHeadphones());
                        } else if (mainCatId == "172") {
                          Get.to(SinglePageScreen_Electronics_Camera());
                        } else if (mainCatId == "173") {
                          Get.to(SinglePageScreen_Electronics_wearable());
                        } else {
                          print('not found ');
                        }
                      },
                      fit: BoxFit.cover,
                      imagePath:
                          "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                      // ImageConstant.imgRectangle569,
                      height: 190.adaptSize,
                      width: 190.adaptSize,
                      radius: BorderRadius.circular(
                        10.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: 10.v,
                          right: 10.h,
                        ),
                        child: CustomIconButton(
                          onTap: () {
                            Add_remove_productidd = homeView_controller
                                .userList.value.recommendedProduct![index].id!
                                .toString();
                            EnglishAdd_remove_wishlistController()
                                .AddRemoveWishlish_apihit();

                            setState(() {
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 16.v,
                  width: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(71, 228, 193, 204),
                  ),
                  child: Center(
                    child: Text(
                      "10% Off",
                      style: TextStyle(
                        fontSize: 8, color: Color(0xffff8300),
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'Almarai'
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 131.h,
                  child: Text(
                    "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
                    //  "Luxury Rhinestone Quartz Watch Ladies Rome...",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge!.copyWith(
                      height: 1.33,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()}",
                                // "4.8",
                                style: theme.textTheme.labelMedium,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: CustomRatingBar(
                                  ignoreGestures: true,
                                  initialRating: homeView_controller
                                      .userList
                                      .value
                                      .recommendedProduct?[index]
                                      .averageRating
                                      ?.toDouble(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.v),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${homeView_controller.userList.value.recommendedProduct?[index].price.toString()}",
                                //"99 ",
                                style: CustomTextStyles.titleMediumPrimary_2,
                              ),
                              TextSpan(
                                text: "2k+ sold",
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 35.h,
                        top: 5.v,
                      ),
                      child: CustomIconButton(
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          padding: EdgeInsets.all(6.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup239533,
                            onTap: () {
                              mainCatId = homeView_controller.userList.value
                                  .recommendedProduct?[index].mainCategoryId
                                  .toString();
                              String? productId = homeView_controller
                                  .userList.value.recommendedProduct?[index].id
                                  ?.toString();

                              setState(() {
                                mainCatId;
                                productId;
                                Englishproductid = productId;
                                EnglishMainCatId = mainCatId;
                              });

                              if (mainCatId == "153") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartmensShirt(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "154") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartmensBottoms(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "155") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartmensJacket(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "156") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartmensActiveWear(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "157") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartmensFormals(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "174") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartmensShoes_view(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "166") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartelectronicsPhone(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "170") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartelectronicsLaptop(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "171") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartelectronicsHeadphones(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "172") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartelectronicsCamera(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              } else if (mainCatId == "173") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);
                                Timer(Duration(seconds: 2), () {
                                  if (productviewcontroller
                                          .rxRequestStatus.value ==
                                      Status.COMPLETED) {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return _buildAddtocartelectronicsWarable(
                                              context, mainCatId, productId);
                                        });
                                  }
                                });
                              }
                              print(mainCatId.toString());
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAddtocartmensShirt(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemBuilder: (BuildContext context, int index) {
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
                            "${productviewcontroller.ShirtandTops_userlist.value.productView?.title.toString()}",
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
                            "${productviewcontroller.ShirtandTops_userlist.value.productView?.description.toString()}",
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .ShirtandTops_userlist
                                        .value
                                        .productView
                                        ?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .ShirtandTops_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .ShirtandTops_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .ShirtandTops_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartmensJacket(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemCount: productviewcontroller.jacket_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                              itemCount: productviewcontroller.jacket_userlist
                                      .value.productView?.galleryUrl?.length ??
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .jacket_userlist.value.productView?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .jacket_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .jacket_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .jacket_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartmensActiveWear(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .activewear_userlist
                                        .value
                                        .productView
                                        ?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .activewear_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .activewear_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .activewear_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartmensFormals(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemCount: productviewcontroller.formal_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                              itemCount: productviewcontroller.formal_userlist
                                      .value.productView?.galleryUrl?.length ??
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .formal_userlist.value.productView?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .formal_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .formal_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .formal_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartelectronicsWarable(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemCount: productviewcontroller.wearable_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                              itemCount: productviewcontroller.wearable_userlist
                                      .value.productView?.galleryUrl?.length ??
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .wearable_userlist.value.productView?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .wearable_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .wearable_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    // EnglishAddtocartSize = productviewcontroller
                                    //     .wearable_userlist
                                    //     .value
                                    //     .productView
                                    //     ?.productDetails
                                    //     ?.details?[0]
                                    //     .SizeId
                                    //     .toString();
                                    EnglishAddtocartModelId =
                                        productviewcontroller
                                            .wearable_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ModelId
                                            .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartelectronicsPhone(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .smartphone_userlist
                                        .value
                                        .productView
                                        ?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .smartphone_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .smartphone_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .smartphone_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    EnglishAddtocartModelId =
                                        productviewcontroller
                                            .smartphone_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ModelId
                                            .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartelectronicsCamera(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemCount: productviewcontroller.camera_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                              itemCount: productviewcontroller.camera_userlist
                                      .value.productView?.galleryUrl?.length ??
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .camera_userlist.value.productView?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .camera_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .camera_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    // EnglishAddtocartSize = productviewcontroller
                                    //     .camera_userlist
                                    //     .value
                                    //     .productView
                                    //     ?.productDetails
                                    //     ?.details?[0]
                                    //     .SizeId
                                    //     .toString();
                                    EnglishAddtocartModelId =
                                        productviewcontroller
                                            .camera_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ModelId
                                            .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartelectronicsHeadphones(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .headphones_userlist
                                        .value
                                        .productView
                                        ?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .headphones_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .headphones_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    // EnglishAddtocartSize = productviewcontroller
                                    //     .headphones_userlist
                                    //     .value
                                    //     .productView
                                    //     ?.productDetails
                                    //     ?.details?[0]
                                    //     .SizeId
                                    //     .toString();
                                    EnglishAddtocartModelId =
                                        productviewcontroller
                                            .headphones_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ModelId
                                            .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartelectronicsLaptop(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemCount: productviewcontroller.laptops_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                              itemCount: productviewcontroller.laptops_userlist
                                      .value.productView?.galleryUrl?.length ??
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .laptops_userlist.value.productView?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .laptops_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .laptops_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .laptops_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    EnglishAddtocartModelId =
                                        productviewcontroller
                                            .laptops_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ModelId
                                            .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartmensBottoms(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemCount: productviewcontroller.Bottom_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                              itemCount: productviewcontroller.Bottom_userlist
                                      .value.productView?.galleryUrl?.length ??
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .Bottom_userlist.value.productView?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .Bottom_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .Bottom_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .Bottom_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartmensShoes_view(
    BuildContext context,
    String? mainCatId,
    String? productId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
                              itemBuilder: (BuildContext context, int index) {
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
                            "${productviewcontroller.mensshoes_userlist.value.productView?.title.toString()}",
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
                            "${productviewcontroller.mensshoes_userlist.value.productView?.description.toString()}",
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                                    Englishcartproductid = productviewcontroller
                                        .mensshoes_userlist
                                        .value
                                        .productView
                                        ?.id
                                        .toString();
                                    EnglishAddtocartColor =
                                        productviewcontroller
                                            .mensshoes_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[0]
                                            .ColorId
                                            .toString();
                                    EnglishAddtocartprice =
                                        productviewcontroller
                                            .mensshoes_userlist
                                            .value
                                            .productView
                                            ?.productDetails
                                            ?.details?[index]
                                            .price
                                            .toString();
                                    EnglishAddtocartSize = productviewcontroller
                                        .mensshoes_userlist
                                        .value
                                        .productView
                                        ?.productDetails
                                        ?.details?[0]
                                        .SizeId
                                        .toString();
                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                  child: Container(
                                    // width: Get.width * .4,
                                    height: Get.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color:
                                              // tappedList[index]
                                              // ?
                                              Colors.orange,
                                          // : Colors.black,
                                          width: 2,
                                        ),
                                        color:
                                            //tappedList[index]
                                            //?
                                            Colors.orange
                                        // : Colors.transparent,
                                        ),
                                    child: Center(
                                      child: Text(
                                        // tappedList[index]
                                        // ?
                                        "Add to cart",
                                        // : "Already in cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                // tappedList[index]
                                                //  ?
                                                Colors.white
                                            // : Colors.black,
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
      );
    }
  }

  Widget _buildAddtocartwearableTechnology_view(
    BuildContext context,
    String? mainCatId,
    String? productId,
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
                              itemCount: productviewcontroller.wearable_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
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
                                                fontFamily: 'League Spartan',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                              itemCount: productviewcontroller.wearable_userlist
                                      .value.productView?.galleryUrl?.length ??
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 35.v,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(left: 20.h),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          17.0, // Adjust this padding as needed
                                                      vertical:
                                                          8.0, // Adjust this padding as needed
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Color(0xffff8300)
                                                          : Colors.grey[10003],
                                                      border: Border.all(
                                                          color: isSelected
                                                              ? Color(
                                                                  0xffff8300)
                                                              : Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '$size1',
                                                        style: TextStyle(
                                                          color: isSelected
                                                              ? Colors.white
                                                              : Colors.black,
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
                              return CustomOutlinedButton(
                                text: "Add to Cart",
                                margin: EdgeInsets.symmetric(horizontal: 30.h),
                                buttonStyle:
                                    CustomButtonStyles.outlinePrimaryTL25,
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA70002,
                                alignment: Alignment.center,
                                onPressed: () {
                                  Englishcartproductid = productviewcontroller
                                      .wearable_userlist.value.productView?.id
                                      .toString();
                                  EnglishAddtocartColor = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[0]
                                      .ColorId
                                      .toString();
                                  EnglishAddtocartprice = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .price
                                      .toString();
                                  EnglishAddtocartModelId =
                                      productviewcontroller
                                          .wearable_userlist
                                          .value
                                          .productView
                                          ?.productDetails
                                          ?.details?[0]
                                          .ModelId
                                          .toString();
                                  AddToCartcontroller()
                                      .addtocart_Apihit(context);
                                },
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
      );
    }
  }

  /// Common widget
  Widget _buildWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse1,
          height: 60.adaptSize,
          width: 60.adaptSize,
          radius: BorderRadius.circular(
            30.h,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgMaskGroup60x56,
          height: 60.v,
          width: 56.h,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgEllipse3,
          height: 60.adaptSize,
          width: 60.adaptSize,
          radius: BorderRadius.circular(
            30.h,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgEllipse4,
          height: 60.adaptSize,
          width: 60.adaptSize,
          radius: BorderRadius.circular(
            30.h,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildElectronics(
    BuildContext context, {
    required String electronicsText,
    required String womenSClothingText,
    required String menSClothingText,
    required String curvePlusText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 19.v),
          child: Text(
            electronicsText,
            style: theme.textTheme.labelLarge!.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        Spacer(
          flex: 33,
        ),
        SizedBox(
          width: 45.h,
          child: Text(
            womenSClothingText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge!.copyWith(
              color: appTheme.gray90001,
              height: 1.33,
            ),
          ),
        ),
        Spacer(
          flex: 37,
        ),
        SizedBox(
          width: 43.h,
          child: Text(
            menSClothingText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge!.copyWith(
              color: appTheme.gray90001,
              height: 1.33,
            ),
          ),
        ),
        Spacer(
          flex: 28,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 19.v),
          child: Text(
            curvePlusText,
            style: theme.textTheme.labelLarge!.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
      ],
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

  // Widget _buildsize(BuildContext context) {
  //   return Container(
  //     height: Get.height * .15,
  //     child: ListView.builder(
  //       itemCount: 1,
  //       itemBuilder: (BuildContext context, int index) {
  //         var size1 = productviewcontroller.userList.value.productView
  //             ?.productDetails?.details?[index].Clothssize;
  //         // var size2 = productviewcontroller.userList.value
  //         //     .productView?.productDetails?.details?[index].Size;
  //         if (size1 == null) {
  //           return Text('');
  //         }
  //         return Column(
  //           children: [
  //             SizedBox(height: 27.v),
  //             _buildRowSize(context),
  //             SizedBox(height: 11.v),
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //               child: Align(
  //                 alignment: Alignment.centerRight,
  //                 child: SizedBox(
  //                   height: 35.v,
  //                   child: ListView.separated(
  //                     padding: EdgeInsets.only(left: 20.h),
  //                     scrollDirection: Axis.horizontal,
  //                     separatorBuilder: (
  //                       context,
  //                       index,
  //                     ) {
  //                       return SizedBox(
  //                         width: 10.h,
  //                       );
  //                     },
  //                     itemCount: productviewcontroller
  //                             .home_living_userlist
  //                             .value
  //                             .productView
  //                             ?.productDetails
  //                             ?.details!
  //                             .length ??
  //                         0,
  //                     itemBuilder: (context, index) {
  //                       if (index < 0 ||
  //                           index >=
  //                               (productviewcontroller
  //                                       .home_living_userlist
  //                                       .value
  //                                       .productView!
  //                                       .productDetails
  //                                       ?.details!
  //                                       .length ??
  //                                   0)) {
  //                         // Check if index is out of bounds
  //                         return Container(); // Return an empty container or any other widget as needed
  //                       }

  //                       bool isSelected = index == selectedIndex;
  //                       return SizedBox(
  //                         width: 70.h,
  //                         child: GestureDetector(
  //                           onTap: () {
  //                             setState(() {
  //                               selectedIndex = index;
  //                             });
  //                           },
  //                           child: Align(
  //                             alignment: Alignment.centerRight,
  //                             child: Container(
  //                               width: 70.0, // Adjust this width as needed
  //                               padding: EdgeInsets.symmetric(
  //                                 horizontal:
  //                                     17.0, // Adjust this padding as needed
  //                                 vertical:
  //                                     8.0, // Adjust this padding as needed
  //                               ),
  //                               decoration: BoxDecoration(
  //                                 color: isSelected
  //                                     ? Color(0xffff8300)
  //                                     : Colors.grey[10003],
  //                                 border: Border.all(
  //                                     color: isSelected
  //                                         ? Color(0xffff8300)
  //                                         : Colors.black),
  //                                 borderRadius: BorderRadius.circular(20.0),
  //                               ),
  //                               child: Center(
  //                                 child: Text(
  //                                   '$size1',
  //                                   style: TextStyle(
  //                                     color: isSelected
  //                                         ? Colors.white
  //                                         : Colors.black,
  //                                     fontSize: 10.0,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             // SizedBox(height: 27.v),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildAddToCart(BuildContext context) {
    return Container(
      height: Get.height * .1,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return CustomOutlinedButton(
            text: "Add to Cart",
            margin: EdgeInsets.symmetric(horizontal: 30.h),
            buttonStyle: CustomButtonStyles.outlinePrimaryTL25,
            buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
            alignment: Alignment.center,
            onPressed: () {
              Englishcartproductid = productviewcontroller
                  .mensshoes_userlist.value.productView?.id
                  .toString();
              EnglishAddtocartColor = productviewcontroller.mensshoes_userlist
                  .value.productView?.productDetails?.details?[0].ColorId
                  .toString();
              EnglishAddtocartprice = productviewcontroller.mensshoes_userlist
                  .value.productView?.productDetails?.details?[index].price
                  .toString();
              EnglishAddtocartSize = productviewcontroller.mensshoes_userlist
                  .value.productView?.productDetails?.details?[0].SizeId
                  .toString();
              AddToCartcontroller().addtocart_Apihit(context);
            },
          );
        },
      ),
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

  // Widget _buildListRectangle(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.center,
  //     child: SizedBox(
  //       height: 60.v,
  //       child: ListView.separated(
  //         padding: EdgeInsets.only(
  //           left: 20.h,
  //           right: 23.h,
  //         ),
  //         scrollDirection: Axis.horizontal,
  //         separatorBuilder: (
  //           context,
  //           index,
  //         ) {
  //           return SizedBox(
  //             width: 8.h,
  //           );
  //         },
  //         itemCount: productviewcontroller
  //                 .home_living_userlist.value.productView?.galleryUrl?.length ??
  //             0,
  //         itemBuilder: (context, index) {
  //           String imageUrl = productviewcontroller.home_living_userlist.value
  //                   .productView?.galleryUrl?[index] ??
  //               '';
  //           return SizedBox(
  //             width: 60.h,
  //             child: Align(
  //               alignment: Alignment.center,
  //               child: CustomImageView(
  //                 fit: BoxFit.cover,
  //                 imagePath: "$imageUrl",
  //                 height: 60.adaptSize,
  //                 width: 60.adaptSize,
  //                 radius: BorderRadius.circular(
  //                   6.h,
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  // _buildColors(BuildContext context) {
  //   return Container(
  //     height: Get.height * .03,
  //     child: ListView.builder(
  //       itemCount: 1,
  //       itemBuilder: (BuildContext context, int index) {
  //         var color = productviewcontroller.home_living_userlist.value
  //             .productView?.productDetails?.details?[index].Color;
  //         if (color == null) {
  //           return Text('');
  //         }
  //         return Column(
  //           children: [
  //             // SizedBox(height: 11.v),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 10),
  //               child: Row(
  //                 children: [
  //                   RichText(
  //                     text: TextSpan(
  //                       children: [
  //                         TextSpan(
  //                           text: "Color:",
  //                           style: theme.textTheme.titleMedium?.copyWith(
  //                             fontSize: 20,
  //                           ),
  //                         ),
  //                         TextSpan(
  //                           text: "  ",
  //                         ),
  //                         TextSpan(
  //                           text: '$color',
  //                           style: theme.textTheme.titleMedium
  //                               ?.copyWith(fontSize: 18, color: Colors.grey),
  //                         ),
  //                       ],
  //                     ),
  //                     textAlign: TextAlign.left,
  //                   )
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: 11.v),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: CupertinoActivityIndicator(), // Circular progress indicator
        );
      },
    );
  }
}
