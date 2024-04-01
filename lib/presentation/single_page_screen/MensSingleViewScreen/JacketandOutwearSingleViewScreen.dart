import 'dart:async';

import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ShirtAndTopsSingleView.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/SuitsandFormalsSingleVoewScreen.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensDressSingleView.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensTopsSingleViewScreen.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/AudioSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/CameraSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/LaptopsSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/SmartPhonesSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/WearableSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ActivewearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/Bottoms_single_view.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/JacketandOutwearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/MensShoesSingleviewScreen.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';

String? Singlesizeid;
String? Singlecolor;
String? SinglecolorId;
String? Singlesize1;

class SinglePageScreen_mens_Jacket extends StatefulWidget {
  const SinglePageScreen_mens_Jacket({Key? key})
      : super(
          key: key,
        );

  @override
  State<SinglePageScreen_mens_Jacket> createState() =>
      _SinglePageScreen_mens_JacketState();
}

class _SinglePageScreen_mens_JacketState
    extends State<SinglePageScreen_mens_Jacket> {
  bool SeeAllImage = false;
  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();

  final AddToCartcontrollerin = Get.put(AddToCartcontroller());
  PageController _pageController = PageController();
  int _currentIndex = 0;
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  RxInt AselectedImageIndex = 0.obs;
  RxString AselectedImageUrl = ''.obs;
  RxString Aselectedcolored = "".obs;
  RxInt AselectedcolorIndex = (-1).obs;
  RxInt AselectedSizeIndex = (-1).obs;
  int selectedImageIndex = 0;
  String selectedImageUrl = '';
  bool LikeisActive = false;

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
              child: productviewcontroller.jacket_userlist.value.productView ==
                      null
                  // productviewcontroller.jacket_userlist.value
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
                              "${productviewcontroller.jacket_userlist.value.productView?.title.toString()}",
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
                              "${productviewcontroller.jacket_userlist.value.productView?.slug.toString()}",
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
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 15.h),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.h),
                                      child: Text(
                                        "${productviewcontroller.jacket_userlist.value.productReview?.productAverageReview.toString()}",
                                        // "4.8",
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(
                                                fontFamily: 'Almarai',
                                                fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomRatingBar(
                                        itemSize: 18,
                                        ignoreGestures: true,
                                        initialRating: productviewcontroller
                                            .jacket_userlist
                                            .value
                                            .productReview
                                            ?.productAverageReview
                                            ?.toDouble()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 14.v),
                        Container(
                          height: Get.height * .05,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                                    '${productviewcontroller.jacket_userlist.value.productView!.price}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text:
                                              //       '${productviewcontroller.jacket_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                          _buildColors(context),

                        _buildListRectangle(context),

                        if (productviewcontroller.jacket_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          _buildsize(context),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (color == null && size1 == null) {
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
                        //                   pid = productviewcontroller
                        //                       .jacket_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor = colorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = sizeid.toString();
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
                        //                                 color: Colors.white),
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
                        // Padding(
                        //   padding: EdgeInsets.only(left: 15.h),
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
                        // SizedBox(height: 10.v),
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
                            //     // _buildShoppingSecurity(
                            //     //   context,
                            //     //   image: ImageConstant.imgMaskGroup4,
                            //     //   securityMessage:"Shipping",
                            //     // ),
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

                        // // if (productviewcontroller
                        // //         .jacket_userlist.value.productReview !=
                        // //     null)
                        // //   _buildReview(context),
                        // // SizedBox(height: 30.v),
                        // // // _buildRowFollow(context),
                        SizedBox(height: 27.v),

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
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: productviewcontroller
                                  .jacket_userlist
                                  .value
                                  .productView
                                  ?.productCatgories
                                  ?.tags
                                  ?.item
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var materialTags = productviewcontroller
                                .jacket_userlist
                                .value
                                .productView
                                ?.productCatgories
                                ?.tags
                                ?.item;
                            var tagValue =
                                (materialTags?[index].value as List).join(', ');
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
                                          text: " $tagValue",
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

                        SizedBox(height: 30.v),
                        CustomImageView(
                          imagePath:
                              "${productviewcontroller.jacket_userlist.value.productView?.imageUrl.toString()}",
                          height: Get.height * .4,
                          width: 335.h,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 5.v),
                        if (SeeAllImage) _buildGridRectangle(context),

                        SizedBox(height: 18.v),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              SeeAllImage = !SeeAllImage;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "See All",
                                style:
                                    CustomTextStyles.titleMediumPrimaryMedium,
                              ),
                              Icon(
                                SeeAllImage
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 20,
                                color: Color(0xffff8300),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 17.v),
                        _buildAddToCart(context),
                        // SizedBox(height: 37.v),
                        // _buildListRecommended(context),
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

  /// Section Widget
  Widget _buildStackSixtyNine(BuildContext context) {
    return Container(
      height: 502.v,
      width: double.maxFinite,
      decoration: AppDecoration.fillGray10003,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: productviewcontroller
                    .jacket_userlist.value.productView?.galleryUrl?.length ??
                0,
            itemBuilder: (BuildContext context, int index) {
              return CustomImageView(
                fit: BoxFit.fill,
                imagePath: selectedImageUrl.isNotEmpty
                    ? selectedImageUrl
                    : "${productviewcontroller.jacket_userlist.value.productView?.galleryUrl?[index] ?? ''}",
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
                        InkWell(
                          onTap: () {
                            Get.to(SearchScreen());
                          },
                          child: Container(
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
                        ),
                      ],
                    )),
                SizedBox(height: 371.v),
                _buildButtonOneHundredTen(
                  context,
                  productviewcontroller.jacket_userlist.value.productView
                          ?.galleryUrl?.length ??
                      0,
                  _currentIndex, // Pass the current index
                ),
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
          physics: NeverScrollableScrollPhysics(),
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
                  .jacket_userlist.value.productView?.galleryUrl?.length ??
              0,
          itemBuilder: (context, index) {
            String imageUrl = productviewcontroller
                    .jacket_userlist.value.productView?.galleryUrl?[index] ??
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
            Text("Size",
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 20)),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 2.v),
            //   child: Text("Size Guide",
            //       style: theme.textTheme.titleMedium
            //           ?.copyWith(color: Colors.grey, fontSize: 20)),
            // ),
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
            // physics: NeverScrollableScrollPhysics(),
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
            child: InkWell(
              onTap: () {
                setState(() {
                  PrizeAdjustmentisExpanded = !PrizeAdjustmentisExpanded;
                });
              },
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
                  Icon(
                    PrizeAdjustmentisExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios,
                    size: PrizeAdjustmentisExpanded ? 20 : 10,
                  )
                ],
              ),
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
                .jacket_userlist.value.productView?.galleryUrl?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          String imageUrl = productviewcontroller
                  .jacket_userlist.value.productView?.galleryUrl?[index] ??
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
    );
  }

  /// Section Widget

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

  Widget _buildShoppingSecurity(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  ShoppingSecurityisExpanded = !ShoppingSecurityisExpanded;
                });
              },
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
                  Icon(
                    ShoppingSecurityisExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios,
                    size: ShoppingSecurityisExpanded ? 20 : 10,
                  )
                ],
              ),
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

  Widget _buildReview(BuildContext context) {
    return Container(
      height: Get.height * .5,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productviewcontroller.jacket_userlist.value.productReview
                ?.productReviewDetails?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          String imageUrl = productviewcontroller.jacket_userlist.value
                  .productReview?.productReviewDetails?[index].userImage ??
              '';
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
                      "${productviewcontroller.jacket_userlist.value.productReview?.productAverageReview?.toString()}",
                      style: CustomTextStyles.titleMediumInter,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 2.v,
                        bottom: 2.v,
                      ),
                      child: CustomRatingBar(
                        initialRating: productviewcontroller.jacket_userlist
                            .value.productReview?.productAverageReview
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
                        imagePath: "$imageUrl",
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
                            "${productviewcontroller.jacket_userlist.value.productReview?.productReviewDetails?[index].userName.toString()}",
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
                                  "${productviewcontroller.jacket_userlist.value.productReview?.productReviewDetails?[index].reviewDate.toString()}",
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
                  initialRating: productviewcontroller.jacket_userlist.value
                      .productReview?.productReviewDetails?[index].ratting
                      ?.toDouble(),
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
                    "${productviewcontroller.jacket_userlist.value.productReview?.productReviewDetails?[index].description.toString()}",
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
                  itemCount: productviewcontroller.jacket_userlist.value
                          .productReview?.productReviewDetails?.length ??
                      0,
                  itemBuilder: (context, index) {
                    if (productviewcontroller
                            .jacket_userlist
                            .value
                            .productReview
                            ?.productReviewDetails?[index]
                            .galleryUrl ==
                        null) {
                      return Text("");
                    } else {
                      return SizedBox(
                        height: 80.adaptSize,
                        width: 80.adaptSize,
                        child: CustomImageView(
                          imagePath:
                              "${productviewcontroller.jacket_userlist.value.productReview?.productReviewDetails?[index].galleryUrl.toString()}",
                          height: 80.adaptSize,
                          width: 80.adaptSize,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      );
                    }
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
                          "Helpful(${productviewcontroller.jacket_userlist.value.productReview?.productReviewDetails?[index].helpful.toString()})",
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
                        color: LikeisActive ? Colors.black : Color(0xffff8300),
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
                    mainAxisExtent: Get.height * .35,
                    crossAxisCount: 2,
                    // mainAxisSpacing: 20.h,
                    // crossAxisSpacing: 35.h,
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
                                    Get.to(
                                        SinglePageScreen_Electronics_Smartphones());
                                  } else if (mainCatId == "170") {
                                    Get.to(
                                        SinglePageScreen_Electronics_Laptops());
                                  } else if (mainCatId == "171") {
                                    Get.to(
                                        SinglePageScreen_Electronics_AudioHeadphones());
                                  } else if (mainCatId == "172") {
                                    Get.to(
                                        SinglePageScreen_Electronics_Camera());
                                  } else if (mainCatId == "173") {
                                    Get.to(
                                        SinglePageScreen_Electronics_wearable());
                                  } else if (mainCatId == "176") {
                                    Get.to(Womens_Dress_SingleView());
                                  } else if (mainCatId == "177") {
                                    Get.to(Womens_Tops_SingleView());
                                  } else {
                                    print('not found ');
                                  }
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
                                  onTap: () {
                                    mainCatId = homeView_controller
                                        .userList
                                        .value
                                        .recommendedProduct?[index]
                                        .mainCategoryId
                                        .toString();
                                    String? productId = homeView_controller
                                        .userList
                                        .value
                                        .recommendedProduct?[index]
                                        .id
                                        ?.toString();

                                    setState(() {
                                      mainCatId;
                                      productId;
                                      Englishproductid = productId;
                                      EnglishMainCatId = mainCatId;
                                    });

                                    if (mainCatId == "153") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartmensShirt(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "154") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartmensBottoms(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "155") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartmensJacket(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "156") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartmensActiveWear(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "157") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartmensFormals(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "174") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartmensShoes_view(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "166") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartelectronicsPhone(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "170") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartelectronicsLaptop(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "171") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartelectronicsHeadphones(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "172") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartelectronicsCamera(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "173") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartelectronicsWarable(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "176") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartWomensDress(
                                                context, mainCatId, productId);
                                          });
                                    } else if (mainCatId == "177") {
                                      productviewcontroller
                                          .Single_ProductApiHit(context);

                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return _buildAddtocartwomensTop(
                                                context, mainCatId, productId);
                                          });
                                    }
                                    print(mainCatId.toString());
                                  },
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

  _buildColors(BuildContext context) {
    return Container(
      height: Get.height * .09,
      child: ListView.builder(
          itemCount: 1,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            color = productviewcontroller.jacket_userlist.value.productView
                ?.productDetails?.details?.color?[index].value
                .toString();

            return Column(
              children: [
                // SizedBox(height: 11.v),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Colors: ",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: Aselectedcolored.value.isNotEmpty
                                  ? Aselectedcolored.value
                                  : color = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString(),
                              style: theme.textTheme.titleMedium?.copyWith(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 158, 158, 158),
                                  fontWeight: FontWeight.normal),
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
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                .color
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          String Aselectedcolorname = color =
                              productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value ??
                                  "";

                          return SizedBox(
                            width: 70.h,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Aselectedcolored.value = Aselectedcolorname;
                                });

                                AselectedcolorIndex.value = index;
                                colorId = color = productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color?[index]
                                    .id
                                    .toString();
                                // print(selectedSizeIndex);
                              },
                              child: Obx(
                                () => Center(
                                  child: Container(
                                    width: 70.h,
                                    decoration: BoxDecoration(
                                      color: AselectedcolorIndex.value == index
                                          ? Color(0xffff8300)
                                          : Color.fromARGB(111, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(
                                          20), // Adjust the border radius as needed
                                    ),
                                    padding: EdgeInsets.all(
                                        8), // Adjust the padding as needed
                                    child: Center(
                                      child: Text(
                                        '$Aselectedcolorname',
                                        style: TextStyle(
                                          color:
                                              AselectedcolorIndex.value == index
                                                  ? Colors.white
                                                  : Colors.black,
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
          }),
    );
  }

  Widget _buildsize(BuildContext context) {
    return Container(
      height: Get.height * .12,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          size1 = productviewcontroller.jacket_userlist.value.productView
              ?.productDetails?.details?.size?[index].value;

          return Column(
            children: [
              SizedBox(height: 15.v),
              _buildRowSize(context),
              SizedBox(height: 5.v),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        String Aselectedsizename = productviewcontroller
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
                              AselectedSizeIndex.value = index;
                              sizeid = productviewcontroller
                                  .jacket_userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.size?[index]
                                  .id
                                  .toString();
                            },
                            child: Obx(
                              () => Center(
                                child: Container(
                                  width: 70.h,
                                  decoration: BoxDecoration(
                                    color: AselectedSizeIndex.value == index
                                        ? Color(0xffff8300)
                                        : Color.fromARGB(111, 158, 158, 158),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      '$Aselectedsizename',
                                      style: TextStyle(
                                        color: AselectedSizeIndex.value == index
                                            ? Colors.white
                                            : Colors.black,
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
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    bool isInCart = false; // Flag to track if the product is in the cart

    return Container(
      height: Get.height * .1,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => InkWell(
              onTap: () {
                if (isInCart) {
                  // If already in cart, show message and change container color to green
                  Utils.snackBar(context, 'Failed', 'Product already in cart');
                } else {
                  if (color != null && size1 != null) {
                    if (colorId == null) {
                      Utils.snackBar(context, 'Failed', 'Please Select Color');
                    } else if (sizeid == null) {
                      Utils.snackBar(context, 'Failed', 'Please Select Size');
                    } else {
                      Englishcartproductid = productviewcontroller
                          .jacket_userlist.value.productView?.id
                          .toString();
                      EnglishAddtocartColor = colorId.toString();
                      EnglishAddtocartprice = productviewcontroller
                          .jacket_userlist.value.productView?.price
                          .toString();

                      EnglishAddtocartSize = sizeid.toString();
                      AddToCartcontrollerin.addtocart_Apihit(context);
                      isInCart = true; // Update flag
                    }
                  } else if (size1 != null) {
                    if (sizeid == null) {
                      Utils.snackBar(context, 'Failed', 'Please Select Size');
                    } else {
                      Englishcartproductid = productviewcontroller
                          .jacket_userlist.value.productView?.id
                          .toString();
                      EnglishAddtocartColor = colorId.toString();
                      EnglishAddtocartprice = productviewcontroller
                          .jacket_userlist.value.productView?.price
                          .toString();

                      EnglishAddtocartSize = sizeid.toString();
                      AddToCartcontrollerin.addtocart_Apihit(context);
                      isInCart = true; // Update flag
                    }
                  } else if (color != null) {
                    if (colorId == null) {
                      Utils.snackBar(context, 'Failed', 'Please Select Color');
                    } else {
                      Englishcartproductid = productviewcontroller
                          .jacket_userlist.value.productView?.id
                          .toString();
                      EnglishAddtocartColor = colorId.toString();
                      EnglishAddtocartprice = productviewcontroller
                          .jacket_userlist.value.productView?.price
                          .toString();

                      EnglishAddtocartSize = sizeid.toString();
                      AddToCartcontrollerin.addtocart_Apihit(context);
                      isInCart = true; // Update flag
                    }
                  } else {
                    Englishcartproductid = productviewcontroller
                        .jacket_userlist.value.productView?.id
                        .toString();
                    EnglishAddtocartColor = colorId.toString();
                    EnglishAddtocartprice = productviewcontroller
                        .jacket_userlist.value.productView?.price
                        .toString();

                    EnglishAddtocartSize = sizeid.toString();
                    AddToCartcontrollerin.addtocart_Apihit(context);
                    isInCart = true; // Update flag
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Container(
                  height: Get.height * .06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: isInCart ? Colors.green : Color(0xffff8300),
                      width: 2,
                    ),
                    color: isInCart ? Colors.green : Color(0xffff8300),
                  ),
                  child: AddToCartcontrollerin.loading.value == false
                      ? Center(
                          child: Text(
                            isInCart ? "Already in cart" : "Add to cart",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

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
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color?[index]
                                    .value;

                                return Column(
                                  children: [
                                    // SizedBox(height: 11.v),
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .ShirtandTops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .ShirtandTops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.ShirtandTops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .ShirtandTops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .ShirtandTops_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .ShirtandTops_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .ShirtandTops_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.jacket_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .jacket_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .jacket_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.jacket_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .jacket_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .jacket_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller.jacket_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.jacket_userlist
                                              .value.productView?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

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
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color?[index]
                                    .value;

                                return Column(
                                  children: [
                                    // SizedBox(height: 11.v),
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .activewear_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .activewear_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.activewear_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .activewear_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .activewear_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .activewear_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .activewear_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.formal_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .formal_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .formal_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.formal_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .formal_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .formal_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .formal_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .formal_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller.formal_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.formal_userlist
                                              .value.productView?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.wearable_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .wearable_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .wearable_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.wearable_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .model
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                print(
                                    "==============================mod ${productviewcontroller.wearable_userlist.value.productView?.productDetails?.details!.model}");
                                Singlesize1 = productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .model![index]
                                    .value;

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
                                                    .model
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
                                                          ?.model?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .wearable_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.model?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .wearable_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .wearable_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .wearable_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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

  Widget _buildAddtocartelectronicsPhone(
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

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
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                                                    '${productviewcontroller.smartphone_userlist.value.productView?.price.toString()}',
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
                        if (productviewcontroller.smartphone_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color?[index]
                                    .value;

                                return Column(
                                  children: [
                                    // SizedBox(height: 11.v),
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .smartphone_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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
                                                    .color
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedcolorname =
                                                  productviewcontroller
                                                          .smartphone_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.color?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .smartphone_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.smartphone_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .model
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value;

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
                                                    ?.details
                                                    ?.model
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .smartphone_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.model?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .smartphone_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.model?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .smartphone_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .smartphone_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .smartphone_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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

  Widget _buildAddtocartelectronicsCamera(
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.camera_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                                                    '${productviewcontroller.camera_userlist.value.productView?.price.toString()}',
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
                        if (productviewcontroller.camera_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .camera_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
                                    .camera_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color?[index]
                                    .value;

                                return Column(
                                  children: [
                                    // SizedBox(height: 11.v),
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .camera_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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
                                                    .color
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedcolorname =
                                                  productviewcontroller
                                                          .camera_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.color?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .camera_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.camera_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .camera_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .model
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .camera_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value;

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
                                                    .model
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .camera_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.model?[index]
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .camera_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.model?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .camera_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller.camera_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.camera_userlist
                                              .value.productView?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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

  Widget _buildAddtocartelectronicsHeadphones(
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

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
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                                                    '${productviewcontroller.headphones_userlist.value.productView?.price.toString()}',
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
                        if (productviewcontroller.headphones_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .headphones_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
                                    .headphones_userlist
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .headphones_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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
                                                    .color
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedcolorname =
                                                  productviewcontroller
                                                          .headphones_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.color?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .headphones_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.headphones_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .model
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .headphones_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value;

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
                                                    .model
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .headphones_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.model?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .headphones_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.model?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .headphones_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .headphones_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .headphones_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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

  Widget _buildAddtocartelectronicsLaptop(
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.laptops_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                                                    '${productviewcontroller.laptops_userlist.value.productView?.price.toString()}',
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
                        // Check if color value is not null and not "null"
                        if (productviewcontroller.laptops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .laptops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .color
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
                                    .laptops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color?[index]
                                    .value;
                                return Column(
                                  children: [
                                    // SizedBox(height: 11.v),
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .laptops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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
                                                    .color
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedcolorname =
                                                  productviewcontroller
                                                          .laptops_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.color?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .laptops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.laptops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .laptops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .model
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .laptops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value;

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
                                                    .model
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .laptops_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.model?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .laptops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.model?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .laptops_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller.laptops_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.laptops_userlist
                                              .value.productView?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.Bottom_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .Bottom_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .Bottom_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.Bottom_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .Bottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .Bottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .Bottom_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .Bottom_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller.Bottom_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.Bottom_userlist
                                              .value.productView?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

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
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .mensshoes_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .mensshoes_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.mensshoes_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .mensshoes_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .mensshoes_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .mensshoes_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .mensshoes_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller
                                      .womensDress_userlist
                                      .value
                                      .productView
                                      ?.galleryUrl
                                      ?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
                                      : "${productviewcontroller.womensDress_userlist.value.productView?.galleryUrl?[index] ?? ''}",
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .womensDress_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .womensDress_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                        .womensDress_userlist
                                        .value
                                        .productView
                                        ?.galleryUrl
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  String imageUrl = productviewcontroller
                                          .womensDress_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl?[index] ??
                                      '';
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.womensDress_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .womensDress_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .womensDress_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .womensDress_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .womensDress_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
                          Singlesizeid = null;
                          Singlecolor = null;
                          SinglecolorId = null;
                          Singlesize1 = null;
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
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller
                                      .womenstops_userlist
                                      .value
                                      .productView
                                      ?.galleryUrl
                                      ?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: AselectedImageUrl.value.isNotEmpty
                                      ? AselectedImageUrl.value
                                      : "${productviewcontroller.womenstops_userlist.value.productView?.galleryUrl?[index] ?? ''}",
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
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlecolor = productviewcontroller
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
                                    Obx(
                                      () => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Color: ",
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
                                                        : productviewcontroller
                                                            .womenstops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value,
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

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    selectedcolored.value =
                                                        selectedcolorname;
                                                    selectedcolorIndex.value =
                                                        index;
                                                    SinglecolorId =
                                                        productviewcontroller
                                                            .womenstops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .id
                                                            .toString();

                                                    // selectedIndex = index;
                                                    // selectedColor = selectedcolor;
                                                    // });
                                                    print(selectedcolorIndex);
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
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20), // Adjust the border radius as needed
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            8), // Adjust the padding as needed
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedcolorname',
                                                            style: TextStyle(
                                                              color: selectedcolorIndex
                                                                          .value ==
                                                                      index
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        Obx(
                          () => Align(
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
                                        .womenstops_userlist
                                        .value
                                        .productView
                                        ?.galleryUrl
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  String imageUrl = productviewcontroller
                                          .womenstops_userlist
                                          .value
                                          .productView
                                          ?.galleryUrl?[index] ??
                                      '';
                                  return GestureDetector(
                                    onTap: () {
                                      AselectedImageUrl.value = imageUrl;
                                      AselectedImageIndex.value = index;
                                      print(AselectedImageIndex);
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
                        if (productviewcontroller.womenstops_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details!
                                    .size
                                    ?.length !=
                                0)
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Singlesize1 = productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

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
                                                    Singlesizeid =
                                                        productviewcontroller
                                                            .womenstops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();
                                                    // print(selectedSizeIndex);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Color(
                                                                  0xffff8300)
                                                              : const Color
                                                                  .fromARGB(
                                                                  111,
                                                                  158,
                                                                  158,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.circular(
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
                                                                  ? Colors.white
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
                              },
                            ),
                          ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (Singlecolor == null && Singlesize1 == null) {
                        //         return Text('');
                        //       } else {
                        //         return Obx(
                        //           () => InkWell(
                        //             onTap: () {
                        //               if (Singlecolor != null &&
                        //                   Singlesize1 != null) {
                        //                 if (SinglecolorId == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Color');
                        //                 } else if (Singlesizeid == null) {
                        //                   Utils.snackBar(context, 'Failed',
                        //                       'Please Select Size');
                        //                 } else {
                        //                   pid = productviewcontroller
                        //                       .womenstops_userlist
                        //                       .value
                        //                       .productView
                        //                       ?.id
                        //                       .toString();
                        //                   productColor =
                        //                       SinglecolorId.toString();
                        //                   // quantity = counter;
                        //                   productSize = Singlesizeid.toString();
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
                        //                                 color: Colors.white),
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
                          height: Get.height * .03,
                        ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (Singlecolor != null &&
                                        Singlesize1 != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        Singlesize1 = null;
                                        SinglecolorId = null;
                                        Singlesizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlesize1 != null) {
                                      if (Singlesizeid == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Size');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlesize1 = null;
                                        Singlesizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (Singlecolor != null) {
                                      if (SinglecolorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else {
                                        Englishcartproductid =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            SinglecolorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.price
                                                .toString();

                                        EnglishAddtocartSize =
                                            Singlesizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        Singlecolor = null;
                                        SinglecolorId = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;
                                      }
                                    } else {
                                      Englishcartproductid =
                                          productviewcontroller
                                              .womenstops_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          SinglecolorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .womenstops_userlist
                                              .value
                                              .productView
                                              ?.price
                                              .toString();

                                      EnglishAddtocartSize =
                                          Singlesizeid.toString();
                                      AddToCartcontrollerin.addtocart_Apihit(
                                          context);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 0, 45, 0),
                                    child: Container(
                                      // width: Get.width * .4,
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color:
                                                // tappedList[index]
                                                // ?
                                                Color(0xffff8300),
                                            // : Colors.black,
                                            width: 2,
                                          ),
                                          color:
                                              //tappedList[index]
                                              //?
                                              Color(0xffff8300)
                                          // : Colors.transparent,
                                          ),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
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
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
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
