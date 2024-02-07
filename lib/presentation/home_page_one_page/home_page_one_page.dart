// ignore_for_file: unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/category_page.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/single_page_screen/single_page_screen.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      bool isProductAddedToWishlist = false;
      List<bool> isButtonTappedList = List.generate(100, (index) => false);
    bool  isButtonTapped =false;

  EnglishSingleProductViewController singleProductViewController =EnglishSingleProductViewController();
  HomeView_controller_English homeView_controller = HomeView_controller_English();
  HomeBanner_controller homeBanner_controller = HomeBanner_controller();
  EnglishAdd_remove_wishlistController englishAddRemoveWishlistController =EnglishAdd_remove_wishlistController();
  List<Widget> carouselItems = [
  //  Image.network(homeBanner_controller.userList.value.homeBanner!.bannerUrl![0].s0.toString()),
  Image.asset("assets/images/banner 1.png"),
  Image.asset("assets/images/banner 1.png")
  ];
  @override
  void initState() {
    // homeBanner_controller.homeBanner_apihit();
    // TODO: implement initState
    super.initState();
    homeView_controller.homeview_apihit();
   // loadStatus();
  }
   @override
  void dispose() {
   // saveStatus(); // Save the status when the widget is disposed
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);
    return
        Obx(() {
     
     if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
      // else if (homeBanner_controller.error.value == 'No internet') {
      //   return Scaffold(
      //     body: Center(
      //         child: InterNetExceptionWidget(
      //       onPress: () {},
      //     )),
      //   );}
        else{
       return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //sSizedBox(height: 20.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                       CarouselSlider(
  items: carouselItems,
  // List.generate(
  //   homeBanner_controller.userList.value.homeBanner?.bannerUrl == null
  //       ? 0
  //       : homeBanner_controller.userList.value.homeBanner!.bannerUrl!.length,
  //   (index) => Image.network(
  //     homeBanner_controller.userList.value.homeBanner?.bannerUrl?[index].toString() ?? "",
  //   ),
  // ),
  options: CarouselOptions(
    autoPlay: true,
    aspectRatio: 2.0,
    enlargeCenterPage: true,
  ),
                        ),
                        // _buildBannerSection(context),
                        SizedBox(height: 5.v),
                        Padding(
                          padding: const EdgeInsets.only(right:15),
                          child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                                               
                                     Container(
                                                 height: Get.height*.1,
                                                 width: Get.width*.4,
                                                
                                                 decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)
                                                 ),
                                    color: Color.fromARGB(136, 235, 215, 215),
                                                 ),
                                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     Image.asset( "assets/images/return.png",),
                                     SizedBox(width: Get.width*.01,),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text('Free shipping', style: 
                                         TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,fontFamily: 'League Spartan'),),
                                          Text('Time Limited Offer',style: 
                                         TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey,fontFamily: 'League Spartan'),),
                                     
                                       ],
                                     )
                                   ],
                                                 ),
                                                ),
                                                SizedBox(width: Get.width*.05,),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 3),
                                       child: Container(
                                                   height: Get.height*.1,
                                                   width: Get.width*.4,
                                                  
                                                   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)
                                                   ),
                                                                          color: Color.fromARGB(135, 236, 213, 213),
                                                   ),
                                                   child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                          children: [
                                       Image.asset( "assets/images/ship.png",),
                                       SizedBox(width: Get.width*.01,),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Text('Free Returns', style: 
                                           TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,fontFamily: 'League Spartan'),),
                                            Text('Within 90 days',style: 
                                           TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey,fontFamily: 'League Spartan'),),
                                       
                                         ],
                                       )
                                                                          ],
                                                   ),
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
                          
                        //   gridDelegate:
                        //       SliverGridDelegateWithFixedCrossAxisCount(
                        //     // mainAxisExtent: 90.v,
                        //     crossAxisCount: 4,
                        //     mainAxisSpacing: 10.h,
                        //     crossAxisSpacing: 10.h,
                            
                        //    mainAxisExtent: Get.height * .2

                        //   ),
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
                        homeView_controller.userList.value.categoryData ==  null ||
                                    homeView_controller.userList.value
                                            .categoryData?.length ==
                                        0
                                ? Center(child:  Text('Error: ${homeView_controller.error.value}'))
                                : Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: Get.height*.2,
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 17.h,
                                        crossAxisSpacing: 15.h,
                                      ),
                                      physics: BouncingScrollPhysics(),
                                      itemCount: 8,
                                      // homeView_controller
                                      //     .userList.value.categoryData?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(38.0),
                                              child: Image.network(
                                                "${homeView_controller.userList.value.categoryData?[index].imageUrl.toString()}",
                                                height: 68,
                                                width: 68,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(height: 5.v),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                                style:
                                                TextStyle(color: Color(0xFF272727),
fontSize: 12,
fontFamily: 'Almarai',
fontWeight: FontWeight.w500,)
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
                      SizedBox(height: 20.v),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );}
        }
        );
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
      padding: EdgeInsets.only(right: 40),
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
              onTap: (){
                Get.to(   Get.to(CategoryScreen()));
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
  // Widget _buildRecommendedSection(BuildContext context) {
  //   return SizedBox(
  //     height: 28.v,
  //     child: ListView.separated(

  //       scrollDirection: Axis.horizontal,
  //       separatorBuilder: (
  //         context,
  //         index,
  //       ) {
  //         return SizedBox(
  //           width: 20.h,
  //         );
  //       },
  //       itemCount: 3,
  //       itemBuilder: (context, index) {
  //         return RecommendedsectionItemWidget();
  //       },
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildHomePageSection(BuildContext context) {
    //  super.build(context);
    return Padding(
       padding: const EdgeInsets.only(right:20),
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: Get.height*.4,
               crossAxisCount: 2,
                  // mainAxisSpacing: 2,
                 crossAxisSpacing: 10.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: homeView_controller.userList.value.recommendedProduct?.length,
          itemBuilder: (context, index) {
            return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(                       
                       width: Get.width,padding: EdgeInsets.only(left: 10),
                    //    width: 170.adaptSize,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                  onTap: () {
                      Englishproductid =
                     homeView_controller.userList.value.recommendedProduct![index].id!.toString();
            setState(() {
                    Englishproductid;
            });
                      Get.to(SinglePageScreen(), 
                      );
                    },
                     fit: BoxFit.cover,
                  imagePath:"${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
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
                  child:
                   CustomIconButton(
                    onTap: () {
                   
                          Add_remove_productidd =
                        homeView_controller.userList.value.recommendedProduct![index].id!.toString();
                        EnglishAdd_remove_wishlistController().AddRemoveWishlish_apihit();
                       
                        setState(() {
                          // Add_remove_productidd;
                          //  isButtonTapped = !isButtonTapped;
                           isButtonTappedList[index] =!isButtonTappedList[index];
                       });
            
                        },
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.fillWhiteA,
                    alignment: Alignment.topRight,
                    child:CustomImageView(
                    imagePath:  isButtonTappedList[index]
            ? ImageConstant. imgGroup239531// Change this to your tapped image
            :  ImageConstant.imgSearch,    // Default image
                  ),
                  )
                 
            
                                  
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
                       
                       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Color.fromARGB(71, 228, 193, 204),
                       ),
                       child: Center(child: Text("10% Off", style: TextStyle(
              fontSize: 8, color: Color(0xffff8300),fontWeight: FontWeight.w600,
              // fontFamily: 'Almarai'
                       ),),),
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
                            "4.8",
                            style: theme.textTheme.labelMedium,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: CustomRatingBar(
                              ignoreGestures: true,
                              initialRating: 0,
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
                            text:  "${homeView_controller.userList.value.recommendedProduct?[index].pricee.toString()}",
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
                  child: 
                  CustomIconButton(
                                                     
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
                      ),
                    ],
            );
           
          },
        ),
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
