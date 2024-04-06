// ignore_for_file: unused_import
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/app_exceptions.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Singe_Product_ViewModel/Home_living_view_model/home_living_view_Model.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/AllProductView.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategoriesMens.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategories_Womens.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/MainCategory_Kids.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/Maincategories_ElectronicScreen.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishWomensHomeSceen/homeWomensScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/AudioSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/CameraSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/LaptopsSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/SmartPhonesSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/WearableSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/KidsSingleView/KidsBabyClothingSingleView.dart';
import 'package:mohally/presentation/single_page_screen/KidsSingleView/KidsBoysSingleview.dart';
import 'package:mohally/presentation/single_page_screen/KidsSingleView/KidsGirlsSingleView.dart';
import 'package:mohally/presentation/single_page_screen/KidsSingleView/KidsShoesSingleView.dart';
import 'package:mohally/presentation/single_page_screen/KidsSingleView/KidsToysSingleView.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ActivewearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/Bottoms_single_view.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/JacketandOutwearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/MensShoesSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/SuitsandFormalsSingleVoewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ShirtAndTopsSingleView.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensBottomSingleView.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensDressSingleView.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensJacketSingleView.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensSleepwearSingleView.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensTopsSingleViewScreen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/Cart/EnglishViewCartController.dart';
import 'package:mohally/view_models/controller/Cart/ProductQtyUpdateController/cartproductqtyUpdateController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
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
String? sizeid;
String? colorId;
String? color;
String? size1;
RxString updatedprice = ''.obs;

class EnglishHomeScreen extends StatefulWidget {
  const EnglishHomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EnglishHomeScreenState createState() => EnglishHomeScreenState();
}

class EnglishHomeScreenState extends State<EnglishHomeScreen>
    with AutomaticKeepAliveClientMixin<EnglishHomeScreen> {
  int selectedTabIndex = 0;
  PageController _pageController = PageController();

  int _currentIndex = 0;
  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
  List<bool> tappedList = List.generate(200, (index) => false);
  final AddToCartcontrollerin = Get.put(AddToCartcontroller());

  // EnglishViewCart _viewcartcontroller = EnglishViewCart();

  int selectedImageIndex = 0;
  String selectedImageUrl = "";
  HomeLivingModel homeLivingModel = HomeLivingModel();
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  // int selectedIndex = 0; // Initialize with -1 to indicate no selection

  // EnglishSingleProductViewController _productview =
  //     EnglishSingleProductViewController();
  bool isProductAddedToWishlist = false;
  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  bool isButtonTapped = false;

  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  HomeBanner_controller homeBanner_controller = HomeBanner_controller();
  EnglishAdd_remove_wishlistController englishAddRemoveWishlistController =
      EnglishAdd_remove_wishlistController();
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;

  // int selectedIndex = -1;
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
        if (homeView_controller.error.value == 'No internet') {
          return InterNetExceptionWidget(onPress: () {});
        } else {
          return GeneralExceptionWidget(onPress: () {});
        }
      } else {
        return Scaffold(
          // backgroundColor: Colors.white,
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
                        return Container(
                          width: Get.width,
                          child: CarouselSlider(
                            items:
                                //carouselItems,
                                List.generate(
                              homeBanner_controller.userList.value.homeBanner
                                          ?.bannerUrl ==
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
                              // aspectRatio: 2.0,
                              // enlargeCenterPage: true,
                            ),
                          ),
                        );
                      }
                    }),
                    // _buildBannerSection(context),
                    SizedBox(height: 5.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: Get.height * .08,
                          width: Get.width * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(136, 235, 215, 215),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/return.png",
                              ),
                              // SizedBox(
                              //   width: Get.width * .01,
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                        // SizedBox(
                        //   width: Get.width * .05,
                        // ),
                        Container(
                          height: Get.height * .08,
                          width: Get.width * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(135, 236, 213, 213),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/ship.png",
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 29.v),
                    Padding(
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
                              // onTap: () {
                              //   Get.to(CategoryScreen(
                              //     showAppBar: true,
                              //     FromHomeToCat: true,
                              //     selectedTabIndex: 0,
                              //   ));
                              // },
                              onTap: () {
                                selectedTabIndex = 0;
                                print(selectedTabIndex);

                                mainCatId = homeView_controller
                                    .userList.value.categoryData?[0].id!
                                    .toString();

                                setState(() {
                                  EnglishsubMainCatId = mainCatId;
                                });
                                print("$EnglishsubMainCatId==");
                                Get.to(CategoryScreen(
                                    showAppBar: true,
                                    FromHomeToCat: true,
                                    selectedTabIndex: selectedTabIndex));
                              },
                              child: Text(
                                "See All",
                                style: CustomTextStyles.bodyMediumPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // _buildCategorySection(context),
                    SizedBox(height: 19.v),

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
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: Get.height * .14,
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
                                bool isSelected = index == selectedTabIndex;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectedTabIndex = index;
                                        print(selectedTabIndex);

                                        mainCatId = homeView_controller.userList
                                            .value.categoryData?[index].id!
                                            .toString();

                                        setState(() {
                                          EnglishsubMainCatId = mainCatId;
                                        });
                                        print("$EnglishsubMainCatId==");
                                        Get.to(CategoryScreen(
                                            showAppBar: true,
                                            FromHomeToCat: true,
                                            selectedTabIndex:
                                                selectedTabIndex));
                                        print(
                                            "RRRRRRRRRRRRRRR$selectedTabIndex");
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(38.0),
                                        child: Image.network(
                                          "${homeView_controller.userList.value.categoryData?[index].imageUrl}",
                                          height: 68,
                                          width: 68,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Text(
                                      "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                      style: TextStyle(
                                        color: Color(0xFF272727),
                                        fontSize: 12,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      // theme.textTheme.bodySmall,
                                      // overflow: TextOverflow.ellipsis,
                                      // maxLines: 1,
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
                Get.to(CategoryScreen(
                  showAppBar: true,
                  FromHomeToCat: true,
                  selectedTabIndex: 0,
                ));
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
                        } else if (mainCatId == "176") {
                          Get.to(Womens_Dress_SingleView());
                        } else if (mainCatId == "177") {
                          Get.to(Womens_Tops_SingleView());
                        } else if (mainCatId == "178") {
                          Get.to(Womens_bottoms_SingleView());
                        } else if (mainCatId == "179") {
                          Get.to(Womens_Jacket_SingleView());
                        } else if (mainCatId == "180") {
                          Get.to(Womens_SleepWear_SingleView());
                        } else if (mainCatId == "182") {
                          Get.to(KidsClothing_SingleView());
                        } else if (mainCatId == "183") {
                          Get.to(KidsBoys_gSingleView());
                        } else if (mainCatId == "184") {
                          Get.to(KidsGirls_SingleView());
                        } else if (mainCatId == "186") {
                          Get.to(Kidstoys_SingleView());
                        } else if (mainCatId == "185") {
                          Get.to(Kidsshoes_SingleView());
                        } else {
                          Get.to(NoProductFound(
                            showAppBar: true,
                          ));
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
                    maxLines: 1,
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

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensShirt(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "154") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensBottoms(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "155") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensJacket(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "156") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensActiveWear(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "157") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensFormals(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "174") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensShoes_view(
                                          context, mainCatId, productId);
                                    });
                              }
                              //  else if (mainCatId == "166") {
                              //   productviewcontroller.Single_ProductApiHit(
                              //       context);

                              //   showModalBottomSheet(
                              //       context: context,
                              //       isScrollControlled: true,
                              //       builder: (context) {
                              //         return _buildAddtocartelectronicsPhone(
                              //             context, mainCatId, productId);
                              //       });
                              // } else if (mainCatId == "170") {
                              //   productviewcontroller.Single_ProductApiHit(
                              //       context);

                              //   showModalBottomSheet(
                              //       context: context,
                              //       isScrollControlled: true,
                              //       builder: (context) {
                              //         return _buildAddtocartelectronicsLaptop(
                              //             context, mainCatId, productId);
                              //       });
                              // } else if (mainCatId == "171") {
                              //   productviewcontroller.Single_ProductApiHit(
                              //       context);

                              //   showModalBottomSheet(
                              //       context: context,
                              //       isScrollControlled: true,
                              //       builder: (context) {
                              //         return _buildAddtocartelectronicsHeadphones(
                              //             context, mainCatId, productId);
                              //       });
                              // } else if (mainCatId == "172") {
                              //   productviewcontroller.Single_ProductApiHit(
                              //       context);

                              //   showModalBottomSheet(
                              //       context: context,
                              //       isScrollControlled: true,
                              //       builder: (context) {
                              //         return _buildAddtocartelectronicsCamera(
                              //             context, mainCatId, productId);
                              //       });
                              // }
                              else if (mainCatId == "173") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartelectronicsWarable(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "176") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartWomensDress(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "177") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartwomensTop(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "178") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartwomensBottom(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "179") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartWomensJacket(
                                          context, mainCatId, productId);
                                    });
                              } else if (mainCatId == "180") {
                                productviewcontroller.Single_ProductApiHit(
                                    context);

                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartwomensSleepwear(
                                          context, mainCatId, productId);
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

  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Size", style: theme.textTheme.titleMedium),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 2.v),
            //   child: Text("Size Guide",
            //       style: theme.textTheme.titleMedium
            //           ?.copyWith(color: Colors.grey)),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonOneHundredTen(
      BuildContext context, int totalImages, int selectedIndex) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 20.v,
            width: 41.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: const Color.fromARGB(127, 0, 0, 0),
            ),
            child: Center(
              child: Text(
                '${selectedIndex + 1}/$totalImages',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddtocartWomensDress(
    BuildContext context,
    String? mainCatId,
    String? productId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.womensDress_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .womensDress_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .womensDress_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.womensDress_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.womensDress_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productviewcontroller
                                              .womensDress_userlist
                                              .value
                                              .productView
                                              ?.galleryUrl
                                              ?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.womensDress_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .womensDress_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .womensDress_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .womensDress_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                            "${productviewcontroller.womensDress_userlist.value.productView?.title.toString()}",
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
                            "${productviewcontroller.womensDress_userlist.value.productView?.description.toString()}",
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.womensDress_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.womensDress_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .womensDress_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .womensDress_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .womensDress_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .womensDress_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .womensDress_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .womensDress_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.womensDress_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .womensDress_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .womensDress_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .womensDress_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .womensDress_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.womensDress_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.womensDress_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensDress_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensDress_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensDress_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensDress_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensDress_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensDress_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .womensDress_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartwomensTop(
    BuildContext context,
    String? mainCatId,
    String? productId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.womenstops_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .womenstops_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .womenstops_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.womenstops_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.womenstops_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productviewcontroller
                                              .womenstops_userlist
                                              .value
                                              .productView
                                              ?.galleryUrl
                                              ?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.womenstops_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .womenstops_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .womenstops_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .womenstops_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                            "${productviewcontroller.womenstops_userlist.value.productView?.title.toString()}",
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
                            "${productviewcontroller.womenstops_userlist.value.productView?.description.toString()}",
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.womenstops_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.womenstops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .womenstops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .womenstops_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .womenstops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .womenstops_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .womenstops_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .womenstops_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.womenstops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .womenstops_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .womenstops_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .womenstops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .womenstops_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.womenstops_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.womenstops_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womenstops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womenstops_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womenstops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womenstops_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womenstops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womenstops_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .womenstops_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartWomensJacket(
    BuildContext context,
    String? mainCatId,
    String? productId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller
                                          .womensJacket_userlist
                                          .value
                                          .productView
                                          ?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .womensJacket_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.womensJacket_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.womensJacket_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productviewcontroller
                                              .womensJacket_userlist
                                              .value
                                              .productView
                                              ?.galleryUrl
                                              ?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.womensJacket_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .womensJacket_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .womensJacket_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .womensJacket_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                            "${productviewcontroller.womensJacket_userlist.value.productView?.title.toString()}",
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
                            "${productviewcontroller.womensJacket_userlist.value.productView?.description.toString()}",
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.womensJacket_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.womensJacket_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womensJacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .womensJacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .womensJacket_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .womensJacket_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .womensJacket_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .womensJacket_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .womensJacket_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.womensJacket_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womensJacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .womensJacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .womensJacket_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid = productviewcontroller
                                                        .womensJacket_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.size?[index]
                                                        .id
                                                        .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .womensJacket_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.womensJacket_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.womensJacket_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .womensJacket_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensJacket_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .womensJacket_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womensJacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensJacket_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartwomensBottom(
    BuildContext context,
    String? mainCatId,
    String? productId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.womenBottom_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .womenBottom_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.womenBottom_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.womenBottom_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productviewcontroller
                                              .womenBottom_userlist
                                              .value
                                              .productView
                                              ?.galleryUrl
                                              ?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.womenBottom_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .womenBottom_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .womenBottom_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .womenBottom_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                            "${productviewcontroller.womenBottom_userlist.value.productView?.title.toString()}",
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
                            "${productviewcontroller.womenBottom_userlist.value.productView?.description.toString()}",
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.womenBottom_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.womenBottom_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womenBottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .womenBottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .womenBottom_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .womenBottom_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .womenBottom_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .womenBottom_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .womenBottom_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.womenBottom_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womenBottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .womenBottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .womenBottom_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .womenBottom_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .womenBottom_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.womenBottom_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.womenBottom_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .womenBottom_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womenBottom_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .womenBottom_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womenBottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenBottom_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartwomensSleepwear(
    BuildContext context,
    String? mainCatId,
    String? productId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller
                                          .womensSleepware_userlist
                                          .value
                                          .productView
                                          ?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .womensSleepware_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.womensSleepware_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.womensSleepware_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productviewcontroller
                                              .womensSleepware_userlist
                                              .value
                                              .productView
                                              ?.galleryUrl
                                              ?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.womensSleepware_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .womensSleepware_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .womensSleepware_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .womensSleepware_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                            "${productviewcontroller.womensSleepware_userlist.value.productView?.title.toString()}",
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
                            "${productviewcontroller.womensSleepware_userlist.value.productView?.description.toString()}",
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.womensSleepware_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.womensSleepware_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womensSleepware_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .womensSleepware_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .womensSleepware_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .womensSleepware_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .womensSleepware_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .womensSleepware_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .womensSleepware_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.womensSleepware_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womensSleepware_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .womensSleepware_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .womensSleepware_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid = productviewcontroller
                                                        .womensSleepware_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.size?[index]
                                                        .id
                                                        .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .womensSleepware_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.womensSleepware_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.womensSleepware_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .womensSleepware_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .womensSleepware_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .womensSleepware_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womensSleepware_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensSleepware_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensShirt(
    BuildContext context,
    String? mainCatId,
    String? productId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller
                                          .ShirtandTops_userlist
                                          .value
                                          .productView
                                          ?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .ShirtandTops_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.ShirtandTops_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.ShirtandTops_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
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
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.ShirtandTops_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .ShirtandTops_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .ShirtandTops_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .ShirtandTops_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.ShirtandTops_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.ShirtandTops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .ShirtandTops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .ShirtandTops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .ShirtandTops_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .ShirtandTops_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .ShirtandTops_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.ShirtandTops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .ShirtandTops_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
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
                                                        ?.details
                                                        ?.size?[index]
                                                        .id
                                                        .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .ShirtandTops_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.ShirtandTops_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.ShirtandTops_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .ShirtandTops_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.Bottom_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .Bottom_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.Bottom_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.Bottom_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
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
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.Bottom_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .Bottom_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .Bottom_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .Bottom_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.Bottom_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.Bottom_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .Bottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .Bottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .Bottom_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .Bottom_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .Bottom_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .Bottom_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.Bottom_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .Bottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .Bottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .Bottom_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
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
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid =
                                                          productviewcontroller
                                                              .Bottom_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.Bottom_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.Bottom_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .Bottom_userlist.value.productView!.inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .Bottom_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.jacket_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .jacket_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.jacket_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.jacket_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
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
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.jacket_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .jacket_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .jacket_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .jacket_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.jacket_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.jacket_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .jacket_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .jacket_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .jacket_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .jacket_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.jacket_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .jacket_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
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
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid =
                                                          productviewcontroller
                                                              .jacket_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.jacket_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.jacket_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .jacket_userlist.value.productView!.inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .jacket_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.activewear_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .activewear_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.activewear_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.activewear_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
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
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.activewear_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .activewear_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .activewear_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .activewear_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.activewear_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.activewear_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .activewear_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .activewear_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .activewear_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .activewear_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.activewear_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .activewear_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
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
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .activewear_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.activewear_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.activewear_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .activewear_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.formal_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .formal_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.formal_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.formal_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
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
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.formal_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .formal_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .formal_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .formal_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.formal_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.formal_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .formal_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .formal_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .formal_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .formal_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .formal_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .formal_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.formal_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .formal_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .formal_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .formal_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
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
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid =
                                                          productviewcontroller
                                                              .formal_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.formal_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.formal_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .formal_userlist.value.productView!.inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .formal_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.mensshoes_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .mensshoes_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.mensshoes_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.mensshoes_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
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
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.mensshoes_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .mensshoes_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .mensshoes_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .mensshoes_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.mensshoes_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.mensshoes_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .mensshoes_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .mensshoes_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .mensshoes_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .mensshoes_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .mensshoes_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.mensshoes_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .mensshoes_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
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
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid = productviewcontroller
                                                          .mensshoes_userlist
                                                          .value
                                                          .productView
                                                          ?.id
                                                          .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.mensshoes_userlist.value
                                .productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller.mensshoes_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .mensshoes_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(maxHeight: 400),
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
                    Center(
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
                    ))
                  ])));
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
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "null";
                          selectedcolorIndex.value = -1;
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          size1 = null;
                          sizeid = null;
                          // selectedcolored.value = 'null';
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
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.wearable_userlist
                                          .value.productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .wearable_userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.wearable_userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.wearable_userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
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
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.wearable_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .wearable_userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .wearable_userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.wearable_userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
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
                        if (productviewcontroller.wearable_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .16,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolored
                                                            .value.isNotEmpty
                                                        ? selectedcolored.value
                                                        : "",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
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
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: Get.height * .13,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
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
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .wearable_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .wearable_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .wearable_userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        if (sizeid != null &&
                                                            colorId != null) {
                                                          print(sizeid);
                                                          pid = productviewcontroller
                                                              .wearable_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .totalQuantity
                                                                  .toString();
                                                        }

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller.wearable_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
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
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .wearable_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
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
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    if (sizeid != null &&
                                                        colorId != null) {
                                                      print(sizeid);
                                                      pid =
                                                          productviewcontroller
                                                              .wearable_userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      // quantity = counter;
                                                      productSize =
                                                          sizeid.toString();
                                                      print(pid);
                                                      print(productColor);
                                                      print(productSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
                                                    }
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: selectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                              },
                            ),
                          ),
                        if (productviewcontroller.wearable_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0 &&
                            productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (colorId != null &&
                                                  sizeid != null) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please Select Color and Size Both');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        if (productviewcontroller.wearable_userlist.value
                                .productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView!
                                    .inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice =
                                                productviewcontroller
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            colorId = null;
                                            sizeid = null;
                                            quantity = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .wearable_userlist
                                        .value
                                        .productView
                                        ?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        // Update flag
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
