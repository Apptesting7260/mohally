import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';

import '../home_page_one_page/widgets/homepagesection_item_widget.dart';
import '../home_page_one_page/widgets/recommendedsection_item_widget.dart';
import '../home_page_one_page/widgets/shippingsection_item_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
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
  HomeBanner_controller homeBanner_controller = HomeBanner_controller();
  List<Widget> carouselItems = [
    // Image.network(homeBanner_controller.userList.value.homeBanner!.bannerUrl![0].s0.toString()),
    Image.asset("assets/images/banner 1.png"),
    Image.asset("assets/images/banner 1.png")
  ];
  @override
  void initState() {
    // homeBanner_controller.homeBanner_apihit();
    // TODO: implement initState
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return
        // Obx(() {
        // if (homeBanner_controller.rxRequestStatus.value == Status.LOADING) {
        //   return const Scaffold(
        //     body: Center(child: CircularProgressIndicator()),
        //   );
        // } else if (homeBanner_controller.error.value == 'No internet') {
        //   return Scaffold(
        //     body: Center(
        //         child: InterNetExceptionWidget(
        //       onPress: () {},
        //     )),
        //   );
        // }
        // else{

        SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          items: carouselItems,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.97,
                          ),
                        ),
                        // _buildBannerSection(context),
                        SizedBox(height: 5.v),
                        // _buildShippingSection(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 5.h),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 65,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/images/ship.png"),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Free Shipping",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text("Time-limited offer",
                                            style: theme.textTheme.subtitle2!
                                                .copyWith(color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15.h),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 65,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/images/return.png"),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Free Shipping",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text("Time-limited offer",
                                            style: theme.textTheme.subtitle2!
                                                .copyWith(color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 29.v),
                        _buildCategorySection(context),
                        SizedBox(height: 19.v),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 90.v,
                            crossAxisCount: 4,
                            mainAxisSpacing: 15.h,
                            crossAxisSpacing: 15.h,
                          ),
                          physics: BouncingScrollPhysics(),
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 70,
                                    width: 70,
                                    child: Image.asset(
                                      "assets/images/img_mask_group_60x56.png",
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(height: 2.v),
                                Center(
                                    child: Text(
                                  "Electronics",
                                  style: theme.textTheme.bodySmall,
                                ))
                              ],
                            );
                          },
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(right: 29.h),
                        //   child: _buildWidget(context),
                        // ),
                        // SizedBox(height: 7.v),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     left: 3.h,
                        //     right: 26.h,
                        //   ),
                        //   child: _buildElectronics(
                        //     context,
                        //     electronicsText: "Electronics",
                        //     womenSClothingText: "Women’s\nClothing",
                        //     menSClothingText: "Men’s\nClothing",
                        //     curvePlusText: "Curve &  Plus",
                        //   ),
                        // ),
                        // SizedBox(height: 14.v),
                        // Padding(
                        //   padding: EdgeInsets.only(right: 29.h),
                        //   child: _buildWidget(context),
                        //  ),
                        // SizedBox(height: 7.v),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     left: 3.h,
                        //     right: 26.h,
                        //   ),
                        //   child: _buildElectronics(
                        //     context,
                        //     electronicsText: "Electronics",
                        //     womenSClothingText: "Women’s\nClothing",
                        //     menSClothingText: "Men’s\nClothing",
                        //     curvePlusText: "Curve &  Plus",
                        //   ),
                        // ),
                        SizedBox(height: 20.v),
                        _buildRecommendedSection(context),
                        SizedBox(height: 20.v),
                        _buildHomePageSection(context),
                      ],
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

  /// Section Widget
  // Widget _buildBannerSection(BuildContext context) {
  //   // final height = MediaQuery.of(context).size.height;
  //   // final width = MediaQuery.of(context).size.width;
  //
  //   // return SingleChildScrollView(
  //   //   scrollDirection: Axis.horizontal,
  //   //   child:
  //   //   IntrinsicWidth(
  //   //     child: Row(
  //   //       mainAxisAlignment: MainAxisAlignment.center,
  //   //       children: [
  //   //         Card(
  //   //           clipBehavior: Clip.antiAlias,
  //   //           elevation: 0,
  //   //           margin: EdgeInsets.all(0),
  //   //           color: appTheme.yellow50,
  //   //           shape: RoundedRectangleBorder(
  //   //             borderRadius: BorderRadiusStyle.roundedBorder8,
  //   //           ),
  //   //           child: Container(
  //   //             height: 144.v,
  //   //             width: 304.h,
  //   //             decoration: AppDecoration.fillYellow.copyWith(
  //   //               borderRadius: BorderRadiusStyle.roundedBorder8,
  //   //             ),
  //   //             child: Stack(
  //   //               alignment: Alignment.topRight,
  //   //               children: [
  //   //                 Align(
  //   //                   alignment: Alignment.topRight,
  //   //                   child: Container(
  //   //                     height: 108.v,
  //   //                     width: 165.h,
  //   //                     decoration: BoxDecoration(
  //   //                       color: theme.colorScheme.primary,
  //   //                       borderRadius: BorderRadius.circular(
  //   //                         82.h,
  //   //                       ),
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.topRight,
  //   //                   child: DottedBorder(
  //   //                     color: theme.colorScheme.primary,
  //   //                     padding: EdgeInsets.only(
  //   //                       left: 2.h,
  //   //                       top: 2.v,
  //   //                       right: 2.h,
  //   //                       bottom: 2.v,
  //   //                     ),
  //   //                     strokeWidth: 2.h,
  //   //                     radius: Radius.circular(85),
  //   //                     borderType: BorderType.RRect,
  //   //                     dashPattern: [
  //   //                       7,
  //   //                       7,
  //   //                     ],
  //   //                     child: Container(
  //   //                       height: 116.v,
  //   //                       width: 171.h,
  //   //                       decoration: BoxDecoration(
  //   //                         borderRadius: BorderRadius.circular(
  //   //                           85.h,
  //   //                         ),
  //   //                       ),
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.topLeft,
  //   //                   child: Padding(
  //   //                     padding: EdgeInsets.only(
  //   //                       left: 25.h,
  //   //                       top: 17.v,
  //   //                     ),
  //   //                     child: Text(
  //   //                       "SALE",
  //   //                       style: CustomTextStyles.bodySmallInterPrimary,
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.bottomLeft,
  //   //                   child: Padding(
  //   //                     padding: EdgeInsets.only(
  //   //                       left: 28.h,
  //   //                       bottom: 21.v,
  //   //                     ),
  //   //                     child: Text(
  //   //                       "School Collections",
  //   //                       style: CustomTextStyles.bodySmallInterErrorContainer,
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.topLeft,
  //   //                   child: Container(
  //   //                     width: 111.h,
  //   //                     margin: EdgeInsets.only(
  //   //                       left: 25.h,
  //   //                       top: 33.v,
  //   //                     ),
  //   //                     child: RichText(
  //   //                       text: TextSpan(
  //   //                         children: [
  //   //                           TextSpan(
  //   //                             text: "UPTO\n",
  //   //                             style: CustomTextStyles
  //   //                                 .headlineSmallInterErrorContainer,
  //   //                           ),
  //   //                           TextSpan(
  //   //                             text: "60% OFF",
  //   //                             style:
  //   //                                 CustomTextStyles.headlineSmallInterPrimary,
  //   //                           ),
  //   //                         ],
  //   //                       ),
  //   //                       textAlign: TextAlign.left,
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.centerRight,
  //   //                   child: Container(
  //   //                     height: 123.v,
  //   //                     width: 112.h,
  //   //                     margin: EdgeInsets.only(right: 8.h),
  //   //                     child: Stack(
  //   //                       alignment: Alignment.centerLeft,
  //   //                       children: [
  //   //                         Opacity(
  //   //                           opacity: 0.7,
  //   //                           child: CustomImageView(
  //   //                             imagePath: ImageConstant.imgShadow,
  //   //                             height: 123.v,
  //   //                             width: 112.h,
  //   //                             alignment: Alignment.center,
  //   //                           ),
  //   //                         ),
  //   //                         Align(
  //   //                           alignment: Alignment.centerLeft,
  //   //                           child: Row(
  //   //                             crossAxisAlignment: CrossAxisAlignment.start,
  //   //                             children: [
  //   //                               CustomImageView(
  //   //                                 imagePath: ImageConstant.imgMain,
  //   //                                 height: 123.v,
  //   //                                 width: 84.h,
  //   //                               ),
  //   //                               CustomImageView(
  //   //                                 imagePath: ImageConstant.imgVector1,
  //   //                                 height: 19.v,
  //   //                                 width: 16.h,
  //   //                                 margin: EdgeInsets.only(
  //   //                                   left: 2.h,
  //   //                                   top: 40.v,
  //   //                                   bottom: 64.v,
  //   //                                 ),
  //   //                               ),
  //   //                             ],
  //   //                           ),
  //   //                         ),
  //   //                       ],
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 CustomImageView(
  //   //                   imagePath: ImageConstant.imgVector2,
  //   //                   height: 25.adaptSize,
  //   //                   width: 25.adaptSize,
  //   //                   alignment: Alignment.topRight,
  //   //                   margin: EdgeInsets.only(
  //   //                     top: 39.v,
  //   //                     right: 7.h,
  //   //                   ),
  //   //                 ),
  //   //               ],
  //   //             ),
  //   //           ),
  //   //         ),
  //   //         Card(
  //   //           clipBehavior: Clip.antiAlias,
  //   //           elevation: 0,
  //   //           margin: EdgeInsets.only(left: 15.h),
  //   //           shape: RoundedRectangleBorder(
  //   //             borderRadius: BorderRadiusStyle.roundedBorder8,
  //   //           ),
  //   //           child: Container(
  //   //             height: 144.v,
  //   //             width: 304.h,
  //   //             decoration: AppDecoration.gradientCyanToIndigo.copyWith(
  //   //               borderRadius: BorderRadiusStyle.roundedBorder8,
  //   //             ),
  //   //             child: Stack(
  //   //               alignment: Alignment.bottomLeft,
  //   //               children: [
  //   //                 Align(
  //   //                   alignment: Alignment.bottomRight,
  //   //                   child: Container(
  //   //                     height: 11.v,
  //   //                     width: 90.h,
  //   //                     margin: EdgeInsets.only(
  //   //                       right: 50.h,
  //   //                       bottom: 25.v,
  //   //                     ),
  //   //                     decoration: BoxDecoration(
  //   //                       color:
  //   //                           theme.colorScheme.errorContainer.withOpacity(0.2),
  //   //                       borderRadius: BorderRadius.circular(
  //   //                         45.h,
  //   //                       ),
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.bottomLeft,
  //   //                   child: Container(
  //   //                     height: 68.v,
  //   //                     width: 93.h,
  //   //                     decoration: BoxDecoration(
  //   //                       color: appTheme.whiteA70002.withOpacity(0.1),
  //   //                       borderRadius: BorderRadius.circular(
  //   //                         46.h,
  //   //                       ),
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.topLeft,
  //   //                   child: Padding(
  //   //                     padding: EdgeInsets.only(
  //   //                       left: 25.h,
  //   //                       top: 22.v,
  //   //                     ),
  //   //                     child: Text(
  //   //                       "ELECTRONIC DAY",
  //   //                       style: CustomTextStyles.bodySmallInterWhiteA70002,
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.bottomLeft,
  //   //                   child: Padding(
  //   //                     padding: EdgeInsets.only(
  //   //                       left: 25.h,
  //   //                       bottom: 26.v,
  //   //                     ),
  //   //                     child: Text(
  //   //                       "40% OFF",
  //   //                       style: CustomTextStyles
  //   //                           .titleMediumInterWhiteA70002ExtraBold,
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Align(
  //   //                   alignment: Alignment.topLeft,
  //   //                   child: Container(
  //   //                     width: 144.h,
  //   //                     margin: EdgeInsets.only(
  //   //                       left: 25.h,
  //   //                       top: 42.v,
  //   //                     ),
  //   //                     child: Text(
  //   //                       "GET YOUR DREAM DEVICE",
  //   //                       maxLines: 2,
  //   //                       overflow: TextOverflow.ellipsis,
  //   //                       style: CustomTextStyles.titleMediumInterWhiteA70002,
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 CustomImageView(
  //   //                   imagePath: ImageConstant.imgMain105x111,
  //   //                   height: 105.v,
  //   //                   width: 111.h,
  //   //                   alignment: Alignment.topRight,
  //   //                   margin: EdgeInsets.only(
  //   //                     top: 11.v,
  //   //                     right: 7.h,
  //   //                   ),
  //   //                 ),
  //   //                 CustomImageView(
  //   //                   imagePath: ImageConstant.imgMain93x62,
  //   //                   height: 93.v,
  //   //                   width: 62.h,
  //   //                   alignment: Alignment.bottomRight,
  //   //                   margin: EdgeInsets.only(bottom: 7.v),
  //   //                 ),
  //   //               ],
  //   //             ),
  //   //           ),
  //   //         ),
  //   //       ],
  //   //     ),
  //   //   ),
  //   // );
  //   return CarouselSlider(
  //     items: carouselItems,
  //     options: CarouselOptions(
  //       enlargeCenterPage: true,
  //       autoPlay: true,
  //       aspectRatio: 16 / 9,
  //       autoPlayCurve: Curves.fastOutSlowIn,
  //       enableInfiniteScroll: true,
  //       autoPlayAnimationDuration: Duration(milliseconds: 800),
  //       viewportFraction: 0.97,
  //     ),
  //   );
  // }

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
      padding: EdgeInsets.only(right: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: theme.textTheme.titleMedium,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "See All",
              style: CustomTextStyles.bodyMediumPrimary,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRecommendedSection(BuildContext context) {
    return SizedBox(
      height: 18.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 20.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return RecommendedsectionItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHomePageSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 265.v,
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.h,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return HomepagesectionItemWidget();
        },
      ),
    );
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
}
