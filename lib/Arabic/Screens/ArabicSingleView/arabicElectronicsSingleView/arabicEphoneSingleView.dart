import 'dart:async';

import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_ProductPrceChnageByAttribute.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_addtocartController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEcameraview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEheadphonesView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicElaptopview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEwearableView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBootsSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBottomSingleview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMFormalSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMJacketSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMShirtSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMactivewearView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicWomensSingleViewScreens/arabicWomenDressSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicWomensSingleViewScreens/arabicWomensTopsSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/Arabic/Screens/ReviewScreen/arabic_review.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_searchHome_histroy_page.dart';

String? ARsizeid;
String? ARcolorId;
String? ARcolor;
String? ARsize1;

class ArabicElectronicsPhoneSingleShViewScreen extends StatefulWidget {
  const ArabicElectronicsPhoneSingleShViewScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ArabicElectronicsPhoneSingleShViewScreen> createState() =>
      _ArabicElectronicsPhoneSingleShViewScreenState();
}

class _ArabicElectronicsPhoneSingleShViewScreenState
    extends State<ArabicElectronicsPhoneSingleShViewScreen> {
  ArabicProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ArabicProductPriceChngeByAttribute();
  bool SeeAllImage = false;

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
  List<bool> tappedList = List.generate(200, (index) => false);

  List<bool> isButtonTappedList = List.generate(20, (index) => false);

  bool LikeisActive = false;
  int counter = 1;
  bool PrizeAdjustmentisExpanded = false;
  bool ShoppingSecurityisExpanded = false;
  int selectedIndex = 0;
  SingleProductViewController productviewcontroller =
      SingleProductViewController();
  int selectedTabIndex = 0;
  HomeView_controller homeView_controller = HomeView_controller();
  List<String> recomemded_text = [
    'مُستَحسَن',
    'ملابس رجالية',
    'الصحة و الجمال',
    'الصحة و الجمال',
    "الصحة و الجمال"
  ];
  void initState() {
    super.initState();
    productviewcontroller.Single_ProductApiHit();
    homeView_controller.homeview_apihit();
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
        return Center(
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
        ));
      } else {
        return SafeArea(
          child: Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: productviewcontroller
                          .smartphone_userlist.value.productView ==
                      null
                  // productviewcontroller.smartphone_userlist.value
                  //         .productView?.length ==
                  //     0
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
                  : SizedBox(
                      width: double.maxFinite,
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStackSixtyNine(context),
                          SizedBox(height: 26.v),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                                "${productviewcontroller.smartphone_userlist.value.productView?.title.toString()}",
                                // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Almarai')),
                          ),
                          SizedBox(height: 12.v),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, left: 10),
                            child: Text(
                                "${productviewcontroller.smartphone_userlist.value.productView?.description.toString()}",
                                // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Almarai')),
                          ),
                          // Text(
                          //                       "${productviewcontroller.smartphone_userlist.value.productView?.productDetails.toString()}",
                          //                     // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                          //                     maxLines: 2,
                          //                     overflow: TextOverflow.ellipsis,
                          //                     style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Almarai')
                          //                   ),
                          SizedBox(height: 13.v),
                          Container(
                            height: Get.height * .03,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: Row(
                                    children: [
                                      CustomRatingBar(
                                        itemSize: 18,
                                        ignoreGestures: true,
                                        initialRating: homeView_controller
                                            .userList
                                            .value
                                            .recommendedProduct?[index]
                                            .rating
                                            ?.toDouble(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.h),
                                        child: Text(
                                          "${homeView_controller.userList.value.recommendedProduct?[index].rating.toString()}",
                                          // "4.8",
                                          style: theme.textTheme.labelLarge
                                              ?.copyWith(
                                                  fontFamily: 'Almarai',
                                                  fontSize: 16),
                                        ),
                                      ),
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
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${productviewcontroller.smartphone_userlist.value.productView!.productDetails!.details?[index].price.toString()}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      "${productviewcontroller.smartphone_userlist.value.productView!.productDetails!.details?[index].productPrice.toString()}",
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
                                                    54, 206, 117, 147)),
                                            child: Center(
                                              child: Text(
                                                "-20% خصم",
                                                style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily: 'Almarai'),
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
                          // SizedBox(height: 32.v),
                          _buildColors(context),
                          SizedBox(height: 27.v),
                          _buildListRectangle(context),
                          _buildSize(context),

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
                          //                             "التحقق من الجمع",
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
                          // SizedBox(height: 30.v),
                          // Padding(
                          //   padding: EdgeInsets.only(right: 15.h),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(
                          //           top: 13.v,
                          //           bottom: 9.v,
                          //         ),
                          //         child: Text(
                          //           "كمية",
                          //           style: theme.textTheme.titleMedium,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(right: 20),
                          //         child: Container(
                          //           width: 100.h,
                          //           height: Get.height * .05,
                          //           margin: EdgeInsets.only(left: 14.h),
                          //           padding:
                          //               EdgeInsets.symmetric(vertical: 10.v),
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
                          //                 margin: EdgeInsets.symmetric(
                          //                     vertical: 9.v),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
                                    'شحن',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Almarai',
                                        color: Colors.black),
                                  )
                                ],
                              )),
                          SizedBox(height: 12.v),
                          _buildRowDescription(context),
                          SizedBox(height: 35.v),
                          _buildRowReturnOne(context),

                          SizedBox(height: 29.v),

                          _buildShoppingSecurity(context),
                          _buildReview(context),
                          Padding(
                            padding: EdgeInsets.only(right: 15.h),
                            child: Text("تفاصيل المنتجات",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Almarai',
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 14.v),
                          // Obx(() {
                          // var materialTags = productviewcontroller.smartphone_userlist
                          //     .value.productView?.productCatgories?.tags;
                          // var materialsubTags = productviewcontroller.smartphone_userlist
                          //     .value.productView?.productCatgories?.subtags;
                          //   return
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productCatgories
                                    ?.tags
                                    ?.item
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              var materialTags = productviewcontroller
                                  .smartphone_userlist
                                  .value
                                  .productView
                                  ?.productCatgories
                                  ?.tags
                                  ?.item;

                              return Padding(
                                padding: EdgeInsets.only(right: 15.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "${materialTags?[index].key}:",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Almarai',
                                                color: Colors.grey),
                                          ),
                                          TextSpan(
                                            text:
                                                "${materialTags?[index].value}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Almarai',
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
                          // CustomImageView(
                          //   imagePath:
                          //       "${productviewcontroller.smartphone_userlist.value.productView?.imageUrl.toString()}",
                          //   height: Get.height * .4,
                          //   width: 335.h,
                          //   alignment: Alignment.center,
                          // ),
                          // SizedBox(height: 5.v),
                          // if (SeeAllImage) _buildGridRectangle(context),

                          // SizedBox(height: 18.v),

                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       SeeAllImage = !SeeAllImage;
                          //     });
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         "اظهار الكل",
                          //         style:
                          //             CustomTextStyles.titleMediumPrimaryMedium,
                          //       ),
                          //       Icon(
                          //         SeeAllImage
                          //             ? Icons.keyboard_arrow_up
                          //             : Icons.keyboard_arrow_down,
                          //         size: 20,
                          //         color: Color(0xffff8300),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // SizedBox(height: Get.height * .08),
                          _buildAddToCart(context),
                          SizedBox(height: 37.v),
                          // _buildListRecommended(context),
                          // SizedBox(height: 15.v),
                          _buildHomePageSection(context),
                          SizedBox(height: 15.v),
                        ],
                      ),
                    ),
            ),
          ),
        );
      }
    });
  }

  Widget _buildAdditionalInformation(String text) {
    return Column(
      children: [
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.only(right: 27.h),
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

  /// Section Widget
  Widget _buildButtonOneHundredTen(
      BuildContext contextint, int selectedIndex, int totalImages) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      //AppDecoration.fillGray10003,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            // Remove the physics property or set it to ScrollPhysics()
            // physics: ScrollPhysics(),
            itemCount: productviewcontroller.smartphone_userlist.value
                    .productView?.galleryUrl?.length ??
                0,
            itemBuilder: (BuildContext context, int index) {
              return CustomImageView(
                fit: BoxFit.fill,
                imagePath: selectedImageUrl.isNotEmpty
                    ? selectedImageUrl
                    : "${productviewcontroller.smartphone_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                height: 502.v,
                width: Get.width,
                alignment: Alignment.center,
              );
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
                        GestureDetector(
                          onTap: () {
                            Get.to(SearchHistoryArabic());
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
                // _buildButtonOneHundredTen(
                //     context,
                //     selectedImageIndex,
                //     productviewcontroller.smartphone_userlist.value
                //             .productView?.galleryUrl?.length ??
                //         0),
                SizedBox(height: 30.v),
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
                          child: Text("شحن مجاني لك",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Almarai')),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.v,
                            bottom: 2.v,
                          ),
                          child: Text("عرض لفترة محدودة",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Almarai')),
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
    //
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 60.v,
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            left: 20.h,
            right: 15.h,
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
                  .smartphone_userlist.value.productView?.galleryUrl?.length ??
              0,
          itemBuilder: (context, index) {
            String imageUrl = productviewcontroller.smartphone_userlist.value
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

  //   );
  // }

  /// Section Widget
  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "مقاس",
              style:
                  theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
                "دليل المقاسات",
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontFamily: 'Almarai', color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildsize(BuildContext context) {
    return Container(
      height: Get.height * .1,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          var size = productviewcontroller.smartphone_userlist.value.productView
              ?.productDetails?.details?[index].Model
              .toString();
          if (size == null) {
            return Text('');
          }
          return Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "مقاس",
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontFamily: 'Almarai'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.v),
                        child: Text(
                          "دليل المقاسات",
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontFamily: 'Almarai', color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              _buildListWidget(context)
            ],
          );
        },
      ),
    );
  }

  Widget _buildListWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 35.v,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
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
            itemCount: productviewcontroller.smartphone_userlist.value
                    .productView?.productDetails?.details!.length ??
                0,
            itemBuilder: (context, index) {
              if (index < 0 ||
                  index >=
                      (productviewcontroller.smartphone_userlist.value
                              .productView!.productDetails?.details!.length ??
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
                        horizontal: 17.0, // Adjust this padding as needed
                        vertical: 8.0, // Adjust this padding as needed
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Color(0xffff8300) : Colors.grey[10003],
                        border: Border.all(
                            color:
                                isSelected ? Color(0xffff8300) : Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          '${productviewcontroller.smartphone_userlist.value.productView?.productDetails?.details?[index].Model.toString()}',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
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
    );
  }

  /// Section Widget
//   Widget _buildListWidget(BuildContext context) {
// //List<ProductDetails>? productDetails = productviewcontroller.smartphone_userlist.value.productView?.productDetails;

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: SizedBox(
//           height: 40.v,
//           child: ListView.separated(
  //  physics: ScrollPhysics(),
//             padding: EdgeInsets.only(left: 20.h),
//             scrollDirection: Axis.horizontal,
//             separatorBuilder: (
//               context,
//               index,
//             ) {
//               return SizedBox(
//                 width: 10.h,
//               );
//             },
//             itemCount: productviewcontroller
//                     .smartphone_userlist.value.productView?.productDetails?.length ??
//                 0,
//             itemBuilder: (context, index) {
//               if (index < 0 ||
//                   index >=
//                       (productviewcontroller.smartphone_userlist.value.productView
//                               ?.productDetails?.length ??
//                           0)) {
//                 // Check if index is out of bounds
//                 return Container(); // Return an empty container or any other widget as needed
//               }

//               bool isSelected = index == selectedIndex;

//               // Access the sizeCapacity from your data model
//               String sizeCapacity = productviewcontroller.smartphone_userlist.value
//                   .productView?.productDetails![index].sizecapicity;

//               return SizedBox(
//                 width: 70.h,
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedIndex = index;
//                     });
//                   },
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Container(
//                       width: 70.0, // Adjust this width as needed
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 17.0, // Adjust this padding as needed
//                         vertical: 8.0, // Adjust this padding as needed
//                       ),
//                       decoration: BoxDecoration(
//                         color:
//                             isSelected ? Color(0xffff8300) : Colors.grey[10003],
//                         border: Border.all(
//                             color:
//                                 isSelected ? Color(0xffff8300) : Colors.black),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: Text(
//                           sizeCapacity,
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

  /// Section Widget
  Widget _buildRowDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
        width: 300,
        height: 119,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
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
                              "قياسي: مجاني لجميع الطلبات",
                              style: TextStyle(
                                color: Color(0xffff8300),
                                fontFamily: 'Almarai',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  "توصيل",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Almarai',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "15-23 نوفمبر, 73.9% ≥ 8 أيام",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Almarai',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: Get.height*.01,),

                            Text(
                              "احصل على رصيد بقيمة 5.00 جنيه إسترليني للتسليم المتأخر",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Almarai',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  'شركة البريد السريع: ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Almarai',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ' Royal Mail, Yodel, etc',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Almarai',
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
                  padding: EdgeInsets.only(right: 7.h),
                  child: Text(
                    "عودة مجانية",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Almarai',
                        color: Colors.black),
                  ),
                ),
                SizedBox(width: Get.width * .02),
                Container(
                  height: 4.adaptSize,
                  width: 4.adaptSize,
                  margin: EdgeInsets.only(left: 8.h, top: 10.v, bottom: 8.h),
                  decoration: BoxDecoration(
                    color: appTheme.gray90001,
                    borderRadius: BorderRadius.circular(
                      2.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "تعديل السعر",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Almarai',
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
          _buildAdditionalInformation("خيارات الدفع الآمنة"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("الخدمات اللوجستية الآمنة"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("تأمين الخصوصية"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("حماية المشتريات"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("مراجعات العناصر",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Almarai',
                    color: Colors.black)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => ReviewsScreen_arabic());
              },
              child: Text("اظهار الكل",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Almarai',
                      color: Color(0xffff8300))),
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => ReviewsScreen_arabic());
                },
                child: Icon(
                  Icons.keyboard_arrow_left_outlined,
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
        physics: NeverScrollableScrollPhysics(),
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
        itemCount: productviewcontroller
                .smartphone_userlist.value.productView?.galleryUrl?.length ??
            0,
        itemBuilder: (context, index) {
          String imageUrl = productviewcontroller
                  .smartphone_userlist.value.productView?.galleryUrl?[index] ??
              '';
          return SizedBox(
            height: 80.adaptSize,
            width: 80.adaptSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: "$imageUrl",
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                  radius: BorderRadius.circular(
                    8.h,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          );
          //Listrectangle1ItemWidget();
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
                .smartphone_userlist.value.productView?.galleryUrl?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          String imageUrl = productviewcontroller
                  .smartphone_userlist.value.productView?.galleryUrl?[index] ??
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
      //  physics: ScrollPhysics(),
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
      //           .smartphone_userlist.value.productView?.galleryUrl?.length ??
      //       0,
      //   itemBuilder: (context, index) {
      //     return SizedBox(
      //       height: 80.adaptSize,
      //       width: 80.adaptSize,
      //       child: CustomImageView(
      //         imagePath:
      //             "${productviewcontroller.smartphone_userlist.value.productView?.imageUrl.toString()}",
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

  Widget _buildListRecommended(BuildContext context) {
    return Container(
      height: Get.height * .05,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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
                      fontFamily: 'Almarai',
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
                  padding: EdgeInsets.only(right: 7.h),
                  child: Text(
                    "أمن التسوق",
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
          _buildAdditionalInformation("خيارات الدفع الآمنة"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("الخدمات اللوجستية الآمنة"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("تأمين الخصوصية"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("حماية المشتريات"),
      ],
    );
  }

  /// Common widget
  Widget _buildReview(BuildContext context) {
    if (productviewcontroller.smartphone_userlist.value.productReview == null ||
        productviewcontroller.smartphone_userlist.value.productReview!
                .productReviewDetails ==
            null ||
        productviewcontroller.smartphone_userlist.value.productReview!
            .productReviewDetails!.isEmpty) {
      // Return an empty container or null if no reviews are available
      return Text("");
    }
    return Container(
      height: Get.height * .5,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productviewcontroller.smartphone_userlist.value.productReview
                ?.productReviewDetails?.length ??
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
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 2.v,
                        bottom: 2.v,
                      ),
                      child: CustomRatingBar(
                        initialRating: productviewcontroller.smartphone_userlist
                            .value.productReview?.productAverageReview
                            ?.toDouble(),
                        itemSize: 16,
                      ),
                    ),
                    Text(
                      "${productviewcontroller.smartphone_userlist.value.productReview?.productAverageReview?.toString()}",
                      style: CustomTextStyles.titleMediumInter,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 60.adaptSize,
                      width: 60.adaptSize,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      // AppDecoration.fillBlueGray.copyWith(
                      //   borderRadius: BorderRadiusStyle.circleBorder20,
                      // ),
                      child: CustomImageView(
                        imagePath:
                            "${productviewcontroller.smartphone_userlist.value.productReview?.productReviewDetails?[index].userImage.toString()}",
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
                    padding: EdgeInsets.only(right: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${productviewcontroller.smartphone_userlist.value.productReview?.productReviewDetails?[index].userName.toString()}",
                            style: TextStyle(
                                fontFamily: 'Almarai',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        SizedBox(height: 8.v),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.h,
                                bottom: 2.v,
                              ),
                              child: Text(
                                  "${productviewcontroller.smartphone_userlist.value.productReview?.productReviewDetails?[index].reviewDate.toString()}",
                                  style: TextStyle(
                                      fontFamily: 'Almarai',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgClock,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                              ),
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
                padding: EdgeInsets.only(right: 20.h),
                child: CustomRatingBar(
                  initialRating: productviewcontroller.smartphone_userlist.value
                      .productReview?.productReviewDetails?[index].ratting
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
                    "${productviewcontroller.smartphone_userlist.value.productReview?.productReviewDetails?[index].description.toString()}",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: 13.v),
              // Obx(() {
              //   if (productviewcontroller.smartphone_userlist.value
              //           .productReview?.productReviewDetails?[index].galleryUrl
              //           .toString() ==
              //       null) {
              //     return Text("");
              //   } else {
              //     return CustomImageView(
              //       imagePath:
              //           "${productviewcontroller.smartphone_userlist.value.productReview?.productReviewDetails?[index].galleryUrl.toString()}",
              //       height: 80.adaptSize,
              //       width: 80.adaptSize,
              //       radius: BorderRadius.circular(
              //         8.h,
              //       ),
              //       alignment: Alignment.center,
              //     );
              //   }
              // }),
              // _buildListRectangle1(context),
              // Container(
              //   height: Get.height * .1,
              //   child: ListView.separated(
              //  physics: ScrollPhysics(),
              //     padding: EdgeInsets.only(
              //       left: 20.h,
              //       right: 20.h,
              //     ),
              //     scrollDirection: Axis.horizontal,
              //     separatorBuilder: (
              //       context,
              //       index,
              //     ) {
              //       return SizedBox(
              //         width: Get.width * .04,
              //       );
              //     },
              //     itemCount: productviewcontroller.smartphone_userlist.value
              //             .productReview?.productReviewDetails?.length ??
              //         0,
              //     itemBuilder: (context, index) {
              //       return SizedBox(
              //         height: 80.adaptSize,
              //         width: 80.adaptSize,
              // child: CustomImageView(
              //   imagePath:
              //       "${productviewcontroller.smartphone_userlist.value.productReview?.productReviewDetails?[index].galleryUrl.toString()}",
              //   height: 80.adaptSize,
              //   width: 80.adaptSize,
              //   radius: BorderRadius.circular(
              //     8.h,
              //   ),
              //   alignment: Alignment.center,
              // ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text('يشارك',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Almarai',
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
                          "مفيد(${productviewcontroller.smartphone_userlist.value.productReview?.productReviewDetails?[index].helpful.toString()})",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Almarai',
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
                        color: LikeisActive ? Color(0xffff8300) : Colors.black,
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
                                  return _buildAddtocartWomensDress(
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

  _buildColors(BuildContext context) {
    return Container(
      height: Get.height * .1,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          color = productviewcontroller.smartphone_userlist.value.productView
              ?.productDetails?.details?[index].Color;
          if (color == null) {
            return Text('');
          } else {
            return Column(
              children: [
                // SizedBox(height: 11.v),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "لون: ",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: Aselectedcolored.value.isNotEmpty
                                  ? Aselectedcolored.value
                                  : productviewcontroller
                                      .smartphone_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color,
                              style: theme.textTheme.titleMedium?.copyWith(
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
                  padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 35.v,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
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
                                .smartphone_userlist
                                .value
                                .productView
                                ?.productDetails
                                ?.details!
                                .length ??
                            0,
                        itemBuilder: (context, index) {
                          String Aselectedcolorname = productviewcontroller
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
                                Aselectedcolored.value = Aselectedcolorname;
                                AselectedcolorIndex.value = index;
                                colorId = productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details?[index]
                                    .ColorId
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
          }
        },
      ),
    );
  }

  Widget _buildSize(BuildContext context) {
    return Container(
      height: Get.height * .15,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          size1 = productviewcontroller.smartphone_userlist.value.productView
              ?.productDetails?.details?[index].Model;

          if (size1 == null) {
            return Text('');
          }
          return Column(
            children: [
              SizedBox(height: 27.v),
              _buildRowSize(context),
              SizedBox(height: 11.v),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 35.v,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
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
                      itemCount: productviewcontroller.smartphone_userlist.value
                              .productView?.productDetails?.details!.length ??
                          0,
                      itemBuilder: (context, index) {
                        String Aselectedsizename = productviewcontroller
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
                              AselectedSizeIndex.value = index;
                              sizeid = productviewcontroller
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
                                  decoration: BoxDecoration(
                                    color: AselectedSizeIndex.value == index
                                        ? Color(0xffff8300)
                                        : const Color.fromARGB(
                                            111, 158, 158, 158),
                                    borderRadius: BorderRadius.circular(
                                        20), // Adjust the border radius as needed
                                  ),
                                  padding: EdgeInsets.all(
                                      8), // Adjust the padding as needed
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
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    return Container(
      height: Get.height * .07,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                if (color != null && size1 != null) {
                  if (colorId == null) {
                    Utils.snackBar(context, 'Failed', 'Please Select Color');
                  } else if (sizeid == null) {
                    Utils.snackBar(context, 'Failed', 'Please Select Size');
                  } else {
                    Arabiccartproductid = productviewcontroller
                        .smartphone_userlist.value.productView?.id
                        .toString();
                    ArabicAddtocartColor = colorId.toString();
                    ArabicAddtocartprice = productviewcontroller
                        .smartphone_userlist
                        .value
                        .productView
                        ?.productDetails
                        ?.details?[index]
                        .price
                        .toString();
                    ArabicAddtocartSize = sizeid.toString();
                    arabic_addtocart_controller().addtocart_Apihit(context);
                  }
                } else if (size1 != null) {
                  if (sizeid == null) {
                    Utils.snackBar(context, 'Failed', 'Please Select Color');
                  } else {
                    Arabiccartproductid = productviewcontroller
                        .smartphone_userlist.value.productView?.id
                        .toString();
                    ArabicAddtocartColor = colorId.toString();
                    ArabicAddtocartprice = productviewcontroller
                        .smartphone_userlist
                        .value
                        .productView
                        ?.productDetails
                        ?.details?[index]
                        .price
                        .toString();
                    ArabicAddtocartSize = sizeid.toString();
                    arabic_addtocart_controller().addtocart_Apihit(context);
                  }
                } else if (color != null) {
                  if (colorId == null) {
                    Utils.snackBar(context, 'Failed', 'Please Select Color');
                  } else {
                    Arabiccartproductid = productviewcontroller
                        .smartphone_userlist.value.productView?.id
                        .toString();
                    ArabicAddtocartColor = colorId.toString();
                    ArabicAddtocartprice = productviewcontroller
                        .smartphone_userlist
                        .value
                        .productView
                        ?.productDetails
                        ?.details?[index]
                        .price
                        .toString();
                    ArabicAddtocartSize = sizeid.toString();
                    arabic_addtocart_controller().addtocart_Apihit(context);
                  }
                } else {
                  Arabiccartproductid = productviewcontroller
                      .smartphone_userlist.value.productView?.id
                      .toString();
                  ArabicAddtocartColor = colorId.toString();
                  ArabicAddtocartprice = productviewcontroller
                      .smartphone_userlist
                      .value
                      .productView
                      ?.productDetails
                      ?.details?[index]
                      .price
                      .toString();
                  ArabicAddtocartSize = sizeid.toString();
                  arabic_addtocart_controller().addtocart_Apihit(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Container(
                  // width: Get.width * .4,
                  height: Get.height * .06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                        color: Color(0xffff8300),
                        width: 2,
                      ),
                      color: Color(0xffff8300)),
                  child: arabic_addtocart_controller().loading.value == false
                      ? Center(
                          child: Text(
                            "أضف إلى السلة",
                            style: TextStyle(fontSize: 18, color: Colors.white),
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  // Remove the physics property or set it to ScrollPhysics()

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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .ShirtandTops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .ShirtandTops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
                                                          productviewcontroller
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .jacket_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .formal_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .formal_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .wearable_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .smartphone_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .smartphone_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .camera_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .camera_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .headphones_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .headphones_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .laptops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .laptops_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Model;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                              height: Get.height * .1,
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .Bottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .Bottom_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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

  Widget _buildAddtocartWomensDress(
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
                                          ? AselectedImageUrl.value
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
                                                        '${productviewcontroller.womens_dressSingleView.value.productView?.productDetails!.details?[index].price}',
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .womens_dressSingleView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .womens_dressSingleView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
                                                          productviewcontroller
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  physics: NeverScrollableScrollPhysics(),
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
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
                                          ? AselectedImageUrl.value
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .womens_topView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .womens_topView
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
                              ARcolor = null;
                              ARsize1 = null;
                              ARcolorId = null;
                              ARsizeid = null;
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomImageView(
                                      fit: BoxFit.fill,
                                      imagePath: AselectedImageUrl
                                              .value.isNotEmpty
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARcolor = productviewcontroller
                                      .mensshoes_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (ARcolor == null) {
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
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
                                                        ARcolorId =
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                          AselectedImageUrl.value = imageUrl;
                                          AselectedImageIndex.value = index;
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  ARsize1 = productviewcontroller
                                      .mensshoes_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Size;

                                  if (ARsize1 == null) {
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                                                      ARsizeid =
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
                                                                : const Color
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
                            //       if (ARcolor == null || ARsize1 == null) {
                            //         return Text('');
                            //       } else {
                            //         return Obx(
                            //           () => InkWell(
                            //             onTap: () {
                            //               if (ARcolor != null &&
                            //                   ARsize1 != null) {
                            //                 if (ARcolorId == null) {
                            //                   Utils.snackBar(context, 'Failed',
                            //                       'Please Select Color');
                            //                 } else if (ARsizeid == null) {
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
                            //                       ARcolorId.toString();
                            //                   // quantity = counter;
                            //                   arabicproductSize =
                            //                       ARsizeid.toString();
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
                            //                             "التحقق من الجمع",
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
                            // SizedBox(
                            //   height: Get.height * .04,
                            // ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (ARcolor != null &&
                                            ARsize1 != null) {
                                          if (ARcolorId == null) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          } else if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARsize1 = null;
                                            ARcolorId = null;
                                            ARsizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARsize1 != null) {
                                          if (ARsizeid == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARsize1 = null;

                                            ARsizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (ARcolor != null) {
                                          if (ARcolorId == null) {
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
                                                ARcolorId.toString();
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
                                                ARsizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            ARcolor = null;
                                            ARcolorId = null;
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
                                              ARcolorId.toString();
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
                                              ARsizeid.toString();
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
