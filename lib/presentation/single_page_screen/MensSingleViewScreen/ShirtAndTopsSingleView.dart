import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/home_page_one_page.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class ShirtsandTopsSingleView extends StatefulWidget {
  const ShirtsandTopsSingleView({Key? key})
      : super(
          key: key,
        );

  @override
  State<ShirtsandTopsSingleView> createState() =>
      _ShirtsandTopsSingleViewState();
}

class _ShirtsandTopsSingleViewState extends State<ShirtsandTopsSingleView> {
  int selectedImageIndex = 0;
  String selectedImageUrl = '';
  bool LikeisActive = false;
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  int counter = 1;
  bool PrizeAdjustmentisExpanded = false;
  bool ShoppingSecurityisExpanded = false;

  int selectedIndex = 0;
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  int selectedTabIndex = 0;
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  List<String> recomemded_text = [
    'Recommended',
    'Men\'s clothing',
    'Recommended',
    'Men\'s clothing',
    'Recommended',
  ];
  @override
  void initState() {
    super.initState();
    productviewcontroller.Single_ProductApiHit(context);
    homeView_controller.homeview_apihit();
    // homeView_controller.homeview_apihit();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Obx(() {
      if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
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
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: Get.width,
              height: Get.height,
              child: productviewcontroller
                          .ShirtandTops_userlist.value.productView ==
                      null
                  // productviewcontroller.ShirtandTops_userlist.value
                  //         .productView?.length ==
                  //     0
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
                  : ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStackSixtyNine(context),
                        SizedBox(height: 26.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                              "${productviewcontroller.ShirtandTops_userlist.value.productView?.title.toString()}",
                              // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan')),
                        ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                              "${productviewcontroller.ShirtandTops_userlist.value.productView?.slug.toString()}",
                              // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan')),
                        ),

                        SizedBox(height: 13.v),
                        Container(
                          height: Get.height * .03,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 15.h),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.h),
                                      child: Text(
                                        "${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()}",
                                        // "4.8",
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(
                                                fontFamily: 'Almarai',
                                                fontSize: 16),
                                      ),
                                    ),
                                    CustomRatingBar(
                                        itemSize: 18,
                                        ignoreGestures: true,
                                        initialRating: homeView_controller
                                            .userList
                                            .value
                                            .recommendedProduct?[index]
                                            .averageRating
                                            ?.toDouble()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 14.v),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 15.h),
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
                                        SizedBox(
                                          width: Get.width * .02,
                                        ),
                                        Container(
                                          width: 63,
                                          height: 16,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Color.fromARGB(
                                                  36, 206, 117, 147)),
                                          child: Center(
                                            child: Text(
                                              "-20% off",
                                              style: TextStyle(
                                                  color: Color(0xffff8300),
                                                  fontSize: 9,
                                                  fontFamily: 'League Spartan'),
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

                        _buildColors(context),

                        _buildListRectangle(context),

                        _buildsize(context),

                        Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 13.v,
                                  bottom: 9.v,
                                ),
                                child: Text(
                                  "Qty",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  width: 100.h,
                                  height: Get.height * .05,
                                  margin: EdgeInsets.only(left: 14.h),
                                  padding: EdgeInsets.symmetric(vertical: 10.v),
                                  decoration:
                                      AppDecoration.fillPrimary.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomImageView(
                                        onTap: () {
                                          setState(() {
                                            // Increment the counter when "+" is pressed
                                            counter++;
                                          });
                                        },
                                        imagePath: ImageConstant
                                            .imgGroup239412WhiteA70002,
                                        height: 13.adaptSize,
                                        width: 13.adaptSize,
                                        margin: EdgeInsets.only(
                                          top: 2.v,
                                          bottom: 3.v,
                                        ),
                                      ),
                                      Text(
                                        counter.toString(),
                                        style: CustomTextStyles
                                            .titleLargeWhiteA7000220,
                                      ),
                                      CustomImageView(
                                        onTap: () {
                                          setState(() {
                                            // Decrement the counter when "-" is pressed
                                            if (counter > 1) {
                                              counter--;
                                            }
                                          });
                                        },
                                        imagePath: ImageConstant.imgLine1,
                                        height: 13.adaptSize,
                                        width: 13.adaptSize,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 9.v),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/img_mask_group_4.png',
                                  width: 16,
                                ),
                                SizedBox(
                                  width: Get.width * .03,
                                ),
                                Text(
                                  'shipping',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'League Spartan',
                                      color: Colors.black),
                                )
                              ],
                            )
                            // _buildShoppingSecurity(
                            //   context,
                            //   image: ImageConstant.imgMaskGroup4,
                            //   securityMessage:"Shipping",
                            // ),
                            ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: _buildRowDescription(context),
                        ),
                        SizedBox(height: 35.v),
                        _buildRowReturnOne(context),
                        SizedBox(height: 29.v),
                        _buildShoppingSecurity(context),

                        _buildReview(context),
                        // SizedBox(height: 30.v),
                        // // _buildRowFollow(context),
                        // SizedBox(height: 27.v),

                        Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: Text("Product Details",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'League Spartan',
                                  color: Colors.black)),
                        ),
                        SizedBox(height: 14.v),
                        // Obx(() {
                        // var materialTags = productviewcontroller.userList
                        //     .value.productView?.productCatgories?.tags;
                        // var materialsubTags = productviewcontroller.userList
                        //     .value.productView?.productCatgories?.subtags;
                        //   return
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: productviewcontroller
                                  .ShirtandTops_userlist
                                  .value
                                  .productView
                                  ?.productCatgories
                                  ?.tags
                                  ?.item
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var materialTags = productviewcontroller
                                .ShirtandTops_userlist
                                .value
                                .productView
                                ?.productCatgories
                                ?.tags
                                ?.item;

                            return Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${materialTags?[index].key}:",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'League Spartan',
                                              color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: "${materialTags?[index].value}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'League Spartan',
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: Get.height * .02,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        // Container(
                        //   height: Get.height * 0.6,
                        //   child: PageView(
                        //     controller: _pageController,
                        //     onPageChanged: (index) {
                        //       setState(() {
                        //         selectedTabIndex = index;
                        //       });
                        //     },
                        //     children: [
                        //       _buildcontentofimg1(context),
                        //       Container(child: Text("22222222")),
                        //       Container(child: test()),
                        //       Container(child: test()),
                        //       Container(child: test()),
                        //       // Add more pages as needed
                        //     ],
                        //   ),
                        // ),

                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: Text("See All",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan',
                                  color: Color(0xffff8300))),
                        ),
                        SizedBox(height: 30.v),
                        CustomImageView(
                          imagePath:
                              "${productviewcontroller.ShirtandTops_userlist.value.productView?.imageUrl.toString()}",
                          height: Get.height * .4,
                          width: 335.h,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 5.v),
                        _buildGridRectangle(context),
                        SizedBox(height: 5.v),
                        CustomImageView(
                          imagePath:
                              "${productviewcontroller.ShirtandTops_userlist.value.productView?.imageUrl.toString()}",
                          height: Get.height * .4,
                          width: 335.h,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 18.v),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "See all",
                                style:
                                    CustomTextStyles.titleMediumPrimaryMedium,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xffff8300),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 17.v),
                        _buildAddToCart(context),
                        SizedBox(height: 37.v),
                        _buildListRecommended(context),
                        SizedBox(height: 15.v),
                        _buildHomePageSection(context),
                        SizedBox(height: 15.v),
                      ],
                    ),
            ),
          ),
        );
      }
    });
  }

  /// Section Widget
  Widget _buildButtonOneHundredTen(
      BuildContext context, int selectedIndex, int totalImages) {
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

  /// Section Widget
  Widget _buildStackSixtyNine(BuildContext context) {
    return Container(
      height: 504.v,
      width: double.maxFinite,
      decoration: AppDecoration.fillGray10003,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            fit: BoxFit.cover,
            imagePath: selectedImageUrl.isNotEmpty
                ? selectedImageUrl
                : "${productviewcontroller.ShirtandTops_userlist.value.productView?.imageUrl.toString()}",
            height: 504.v,
            width: Get.width,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: Get.width * .09,
                            height: Get.height * .05,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                ))),
                        Container(
                            margin: EdgeInsets.only(
                              left: 20.h,
                            ),
                            width: Get.width * .09,
                            height: Get.height * .05,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(
                              'assets/images/search.png',
                            )),
                      ],
                    )),
                SizedBox(height: 371.v),
                _buildButtonOneHundredTen(
                    context,
                    selectedImageIndex,
                    productviewcontroller.ShirtandTops_userlist.value
                            .productView?.galleryUrl?.length ??
                        0),
                SizedBox(height: 10.v),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 10.v,
                    ),
                    decoration: AppDecoration.fillPrimary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgMaskGroup1,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 6.h,
                            top: 3.v,
                          ),
                          child: Text("Free shipping for you",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'League Spartan')),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.v,
                            bottom: 2.v,
                          ),
                          child: Text("Limited time offer",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'League Spartan')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildListRectangle(BuildContext context) {
    return Align(
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
          itemCount: productviewcontroller.ShirtandTops_userlist.value
                  .productView?.galleryUrl?.length ??
              0,
          itemBuilder: (context, index) {
            String imageUrl = productviewcontroller.ShirtandTops_userlist.value
                    .productView?.galleryUrl?[index] ??
                '';
            return GestureDetector(
              onTap: () {
                // Set the selected image URL when an image is clicked
                setState(() {
                  selectedImageUrl = imageUrl;
                  selectedImageIndex = index;
                });
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
    );
  }

  /// Section Widget
  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
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

  /// Section Widget

  /// Section Widget
  Widget _buildRowDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
        width: 300,
        height: 119,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Center(
                  child: IntrinsicWidth(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                    Expanded(
                      child: Container(
                        width: 300,
                        height: 119,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                          vertical: 9.v,
                        ),
                        decoration: AppDecoration.fillGray10003.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5.v),
                            Text(
                              "Standard: Free for all orders",
                              style: TextStyle(
                                color: Color(0xffff8300),
                                fontFamily: 'League Spartan',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  "delivery",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "November 15-23, 73.9% ≥ 8 days",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: Get.height*.01,),

                            Text(
                              "Get £5.00 credit for late delivery",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'League Spartan',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  'Courier company:',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ' Royal Mail, Yodel, etc',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .06,
                    )
                  ])));
            }),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowReturnOne(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgReturn1,
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text(
                    "Free Returns",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'League Spartan',
                        color: Colors.black),
                  ),
                ),
                // SizedBox(width:Get.width*.02),
                Container(
                  height: 4.adaptSize,
                  width: 4.adaptSize,
                  margin: EdgeInsets.only(
                      //   left: 8.h,
                      top: 10.v,
                      bottom: 8.h),
                  decoration: BoxDecoration(
                    color: appTheme.gray90001,
                    borderRadius: BorderRadius.circular(
                      2.h,
                    ),
                  ),
                ),
                //SizedBox(width:Get.width*.02),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "Price Adjusments",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      PrizeAdjustmentisExpanded = !PrizeAdjustmentisExpanded;
                    });
                  },
                  child: Icon(
                    PrizeAdjustmentisExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios,
                    size: 10,
                  ),
                )
              ],
            )),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Safe Payment Options"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Secure Logistics"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Secure Privacy "),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Purchase protection "),
      ],
    );
  }

  /// Section Widget
  Widget _buildRowItemsReviewsAnd(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          children: [
            Text("item reviews",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'League Spartan',
                    color: Colors.black)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => ReviewsScreen());
              },
              child: Text("Show all",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'League Spartan',
                      color: Color(0xffff8300))),
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => ReviewsScreen());
                },
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Color(0xffff8300),
                ))
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListRectangle1(BuildContext context) {
    return SizedBox(
      height: 80.v,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 20.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: Get.width * .04,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 80.adaptSize,
            width: 80.adaptSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath:
                      "${productviewcontroller.ShirtandTops_userlist.value.productView?.imageUrl.toString()}",
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                  radius: BorderRadius.circular(
                    8.h,
                  ),
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath:
                      "${productviewcontroller.ShirtandTops_userlist.value.productView?.imageUrl.toString()}",
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                  radius: BorderRadius.circular(
                    5.h,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          );

          // Listrectangle1ItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFollow(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        height: 36.v,
        text: "Follow ",
        margin: EdgeInsets.only(right: 5.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleSmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildShopAllItems(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        height: 36.v,
        text: "Shop all items",
        margin: EdgeInsets.only(left: 5.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleSmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowFollow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray10003,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse88944x44,
            height: 44.adaptSize,
            width: 44.adaptSize,
            radius: BorderRadius.circular(
              22.h,
            ),
            margin: EdgeInsets.only(bottom: 52.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 2.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ZLNZ ",
                    style: CustomTextStyles.titleMediumMedium16,
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(right: 23.h),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "1.2K+ ",
                                style: CustomTextStyles.titleMediumMedium,
                              ),
                              TextSpan(
                                text: "Followers ",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "100K+ ",
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                                TextSpan(
                                  text: "Sold",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "144 ",
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                                TextSpan(
                                  text: "Items",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFollow(context),
                      _buildShopAllItems(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGridRectangle(BuildContext context) {
    return SizedBox(
      //  height: Get.height * .2,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: productviewcontroller
                .ShirtandTops_userlist.value.productView?.galleryUrl?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          String imageUrl = productviewcontroller.ShirtandTops_userlist.value
                  .productView?.galleryUrl?[index] ??
              '';
          return SizedBox(
            height: Get.height * .1,
            //  width: 80.adaptSize,
            child: CustomImageView(
              imagePath: "$imageUrl",
              height: 150.adaptSize,
              width: 150.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
              alignment: Alignment.center,
            ),
          );
        },
      ),

      // ListView.separated(
      //   padding: EdgeInsets.only(
      //     left: 20.h,
      //     right: 20.h,
      //   ),
      //   scrollDirection: Axis.vertical,
      //   separatorBuilder: (
      //     context,
      //     index,
      //   ) {
      //     return SizedBox(
      //       width: Get.width * .04,
      //     );
      //   },
      //   itemCount: productviewcontroller
      //           .userList.value.productView?.galleryUrl?.length ??
      //       0,
      //   itemBuilder: (context, index) {
      //     return SizedBox(
      //       height: 80.adaptSize,
      //       width: 80.adaptSize,
      //       child: CustomImageView(
      //         imagePath:
      //             "${productviewcontroller.userList.value.productView?.imageUrl.toString()}",
      //         height: 80.adaptSize,
      //         width: 80.adaptSize,
      //         radius: BorderRadius.circular(
      //           8.h,
      //         ),
      //         alignment: Alignment.center,
      //       ),
      //     );

      //     // Listrectangle1ItemWidget();
      //   },
      // ),
    );
  }

  /// Section Widget
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
                  .ShirtandTops_userlist.value.productView?.id
                  .toString();
              EnglishAddtocartColor = productviewcontroller
                  .ShirtandTops_userlist
                  .value
                  .productView
                  ?.productDetails
                  ?.details?[0]
                  .ColorId
                  .toString();
              EnglishAddtocartprice = productviewcontroller
                  .ShirtandTops_userlist
                  .value
                  .productView
                  ?.productDetails
                  ?.details?[index]
                  .price
                  .toString();
              EnglishAddtocartSize = productviewcontroller.ShirtandTops_userlist
                  .value.productView?.productDetails?.details?[0].Size
                  .toString();
              AddToCartcontroller().addtocart_Apihit(context);
            },
          );
        },
      ),
    );
  }

  Widget _buildHomePageSection(BuildContext context) {
    return Obx(() {
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return homeView_controller.userList.value.categoryData == null ||
                homeView_controller.userList.value.categoryData?.length == 0
            ? Center(child: Text('Error: ${homeView_controller.error.value}'))
            : Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: Get.height * .4,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 35.h,
                  ),
                  physics: BouncingScrollPhysics(),
                  itemCount: homeView_controller
                          .userList.value.recommendedProduct?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: Get.width,
                          // padding: EdgeInsets.only(left: 20),
                          height: 170.adaptSize,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CustomImageView(
                                fit: BoxFit.cover,
                                onTap: () {
                                  mainCatId = homeView_controller
                                      .userList
                                      .value
                                      .recommendedProduct?[index]
                                      .mainCategoryId!
                                      .toString();
                                  String? productId = homeView_controller
                                      .userList
                                      .value
                                      .recommendedProduct?[index]
                                      .id!
                                      .toString();

                                  setState(() {
                                    Englishproductid = productId;
                                    EnglishMainCatId = mainCatId;
                                  });
                                  print("$Englishproductid==");
                                  if (mainCatId == "133") {
                                    Get.to(ShirtsandTopsSingleView());
                                    print(
                                        "$mainCatId===========Mens Appearl main category id ");
                                  }
                                  // else if (mainCatId == "134") {
                                  //   Get.to(
                                  //       ShirtsandTopsSingleView_Electronics());
                                  // } else if (mainCatId == "135") {
                                  //   Get.to(
                                  //       ShirtsandTopsSingleView_HomeLiving());
                                  // } else if (mainCatId == "136") {
                                  //   Get.to(
                                  //       ShirtsandTopsSingleView_healthwellness());
                                  // } else {
                                  //   print('not found ');
                                  // }
                                },
                                imagePath:
                                    "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                                // ImageConstant.imgRectangle569,
                                height: 160.adaptSize,
                                width: 160.adaptSize,
                                radius: BorderRadius.circular(
                                  10.h,
                                ),
                                alignment: Alignment.center,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.v,
                                  right: 20.h,
                                ),
                                child: CustomIconButton(
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: IconButtonStyleHelper.fillWhiteA,
                                  alignment: Alignment.topRight,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSearch,
                                  ),
                                ),
                              ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(71, 228, 193, 204),
                            ),
                            child: Center(
                              child: Text(
                                "10% Off",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xffff8300),
                                  fontWeight: FontWeight.w600,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${homeView_controller.userList.value.recommendedProduct?[index].averageRating?.toString()}",
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
                                          style: CustomTextStyles
                                              .titleMediumPrimary_2,
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
                                  onTap: () {},
                                  height: 25.adaptSize,
                                  width: 25.adaptSize,
                                  padding: EdgeInsets.all(6.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup239533,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                    //HomepagesectionItemWidget();
                  },
                ),
              );
      }
    });
  }

  /// Section Widget
  Widget _buildListRecommended(BuildContext context) {
    return Container(
      height: Get.height * .05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recomemded_text.length,
        itemBuilder: (context, index) {
          bool isSelected = index ==
              selectedTabIndex; // Assuming you have a variable to track the selected tab index

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    recomemded_text[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w400,
                      fontFamily: 'League Spartan',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  // Widget _buildGridTenOff(BuildContext context) {
  //   return Expanded(
  //     child: Align(
  //       alignment: Alignment.center,
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 20.h),
  //         child: GridView.builder(
  //           shrinkWrap: true,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             mainAxisExtent: 265.v,
  //             crossAxisCount: 2,
  //             mainAxisSpacing: 15.h,
  //             crossAxisSpacing: 15.h,
  //           ),
  //           physics: BouncingScrollPhysics(),
  //           itemCount: 12,
  //           itemBuilder: (context, index) {
  //             return GridtenoffItemWidget();
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Common widget
  Widget _buildShoppingSecurity(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMaskGroup16x16,
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text(
                    "Shopping Security",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Almarai',
                        color: Colors.black),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ShoppingSecurityisExpanded = !ShoppingSecurityisExpanded;
                    });
                  },
                  child: Icon(
                    ShoppingSecurityisExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios,
                    size: 10,
                  ),
                )
              ],
            )),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Safe Payment Options"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Secure Logistics"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Secure Privacy "),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Purchase protection "),
      ],
    );
  }

  Widget _buildAdditionalInformation(String text) {
    return Column(
      children: [
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.only(left: 27.h),
          child: Row(
            children: [
              Container(
                height: Get.height * 0.01,
                width: Get.width * 0.02,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: Get.width * 0.03),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Almarai',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common widget

  // Widget _buildHomePageSection(BuildContext context) {
  //   return GridView.builder(
  //     shrinkWrap: true,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       mainAxisExtent: Get.height*.4,
  //       crossAxisCount: 2,
  //       // mainAxisSpacing: 2,
  //       crossAxisSpacing: 10.h,

  //     ),
  //     physics: BouncingScrollPhysics(),
  //     itemCount: 6,
  //     itemBuilder: (context, index) {
  //       return HomepagesectionItemWidget();
  //     },
  //   );
  // }
  Widget _buildcontentofimg1(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Text("Product Details",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'League Spartan',
                  color: Colors.black)),
        ),
        SizedBox(height: 14.v),
        // Obx(() {
        // var materialTags = productviewcontroller.userList
        //     .value.productView?.productCatgories?.tags;
        // var materialsubTags = productviewcontroller.userList
        //     .value.productView?.productCatgories?.subtags;
        //   return
        ListView.builder(
          shrinkWrap: true,
          itemCount: productviewcontroller.ShirtandTops_userlist.value
                  .productView?.productCatgories?.tags?.item?.length ??
              0,
          itemBuilder: (context, index) {
            var materialTags = productviewcontroller.ShirtandTops_userlist.value
                .productView?.productCatgories?.tags?.item;

            return Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${materialTags?[index].key}:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'League Spartan',
                              color: Colors.grey),
                        ),
                        TextSpan(
                          text: "${materialTags?[index].value}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'League Spartan',
                              color: Colors.black),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildReview(BuildContext context) {
    if (productviewcontroller.ShirtandTops_userlist.value.productReview ==
            null ||
        productviewcontroller.ShirtandTops_userlist.value.productReview!
                .productReviewDetails ==
            null ||
        productviewcontroller.ShirtandTops_userlist.value.productReview!
            .productReviewDetails!.isEmpty) {
      // Return an empty container or null if no reviews are available
      return Text("");
    }
    return Container(
      height: Get.height * .5,
      child: ListView.builder(
        itemCount: productviewcontroller.ShirtandTops_userlist.value
                .productReview?.productReviewDetails?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * .04,
              ),
              _buildRowItemsReviewsAnd(context),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${productviewcontroller.ShirtandTops_userlist.value.productReview?.productAverageReview?.toString()}",
                      style: CustomTextStyles.titleMediumInter,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 2.v,
                        bottom: 2.v,
                      ),
                      child: CustomRatingBar(
                        initialRating: productviewcontroller
                            .ShirtandTops_userlist
                            .value
                            .productReview
                            ?.productAverageReview
                            ?.toDouble(),
                        itemSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 60.adaptSize,
                      width: 60.adaptSize,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      // AppDecoration.fillBlueGray.copyWith(
                      //   borderRadius: BorderRadiusStyle.circleBorder20,
                      // ),
                      child: CustomImageView(
                        imagePath:
                            "${productviewcontroller.ShirtandTops_userlist.value.productReview?.productReviewDetails?[index].userImage.toString()}",
                        height: 60.adaptSize,
                        width: 60.adaptSize,
                        radius: BorderRadius.circular(
                          30.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${productviewcontroller.ShirtandTops_userlist.value.productReview?.productReviewDetails?[index].userName.toString()}",
                            style: TextStyle(
                                fontFamily: 'League Spartan',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        SizedBox(height: 8.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgClock,
                              height: 15.adaptSize,
                              width: 15.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.h,
                                bottom: 2.v,
                              ),
                              child: Text(
                                  "${productviewcontroller.ShirtandTops_userlist.value.productReview?.productReviewDetails?[index].reviewDate.toString()}",
                                  style: TextStyle(
                                      fontFamily: 'League Spartan',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: CustomRatingBar(
                  initialRating: productviewcontroller.ShirtandTops_userlist
                      .value.productReview?.productReviewDetails?[index].ratting
                      ?.toDouble(), // Convert int? to double?
                  itemSize: 14,
                ),
              ),
              SizedBox(height: 4.v),
              Container(
                width: 322.h,
                margin: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                ),
                child: Text(
                    "${productviewcontroller.ShirtandTops_userlist.value.productReview?.productReviewDetails?[index].description.toString()}",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'League Spartan',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: 13.v),
              //_buildListRectangle1(context),
              Container(
                height: Get.height * .1,
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                  ),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: Get.width * .04,
                    );
                  },
                  itemCount: productviewcontroller.ShirtandTops_userlist.value
                          .productReview?.productReviewDetails?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 80.adaptSize,
                      width: 80.adaptSize,
                      child: CustomImageView(
                        imagePath:
                            "${productviewcontroller.ShirtandTops_userlist.value.productReview?.productReviewDetails?[index].galleryUrl.toString()}",
                        height: 80.adaptSize,
                        width: 80.adaptSize,
                        radius: BorderRadius.circular(
                          8.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 190.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text('Share',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'League Spartan',
                              color: Colors.black)),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgShare1,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                    SizedBox(
                      width: Get.width * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                          "Helpful(${productviewcontroller.ShirtandTops_userlist.value.productReview?.productReviewDetails?[index].helpful.toString()})",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'League Spartan',
                              color: Colors.black)),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          LikeisActive =
                              !LikeisActive; // Toggle isActive state on tap
                        });
                      },
                      child: CustomImageView(
                        imagePath: LikeisActive
                            ? ImageConstant.imgLike1
                            : ImageConstant.imgLike1,
                        color: LikeisActive ? Colors.black : Colors.orange,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(left: 10.h),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup239583,
                      height: 15.v,
                      width: 3.h,
                      margin: EdgeInsets.only(left: 10.h),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 20.v),
              Center(
                child: Divider(
                  color: Color.fromARGB(40, 39, 39, 39),
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildColors(BuildContext context) {
    return Container(
      height: Get.height * .04,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          var color = productviewcontroller.ShirtandTops_userlist.value
              .productView?.productDetails?.details?[index].Color;
          if (color == null) {
            return Text('');
          }
          return Column(
            children: [
              SizedBox(height: 11.v),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Color:",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: "  ",
                          ),
                          TextSpan(
                            text: '$color',
                            style: theme.textTheme.titleMedium
                                ?.copyWith(fontSize: 18, color: Colors.grey),
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
    );
  }

  Widget _buildsize(BuildContext context) {
    return Container(
      height: Get.height * .09,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          var size1 = productviewcontroller.ShirtandTops_userlist.value
              .productView?.productDetails?.details?[index].Size;
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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

                        bool isSelected = index == selectedIndex;
                        return SizedBox(
                          width: 70.h,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 70.0, // Adjust this width as needed
                                padding: EdgeInsets.symmetric(
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
                                          ? Color(0xffff8300)
                                          : Colors.black),
                                  borderRadius: BorderRadius.circular(20.0),
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
              SizedBox(height: 27.v),
            ],
          );
        },
      ),
    );
  }
}
