import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ShirtAndTopsSingleView.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/English_Viewwishlist_Controller/english_view_wishlistController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

// ignore_for_file: must_be_immutable
class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<bool> isButtonTappedList = List.generate(8, (index) => false);
  bool isButtonTapped = false;
  EnglishViewwishlist viewWishlistcontroller = EnglishViewwishlist();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  EnglishAdd_remove_wishlistController add_remove_wishlistController =
      EnglishAdd_remove_wishlistController();
  @override
  void initState() {
    super.initState();
    //add_remove_wishlistController.AddRemoveWishlish_apihit();
    viewWishlistcontroller.ViewWishlish_apihit();
    homeView_controller.homeview_apihit();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Obx(() {
        if (viewWishlistcontroller.rxRequestStatus.value == Status.LOADING) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (homeView_controller.rxRequestStatus.value ==
            Status.LOADING) {
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
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
              ),
            ],
          )));
        } else if (viewWishlistcontroller.rxRequestStatus.value ==
            Status.ERROR) {
          return Scaffold(
              body: Center(
                  child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
          )));
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    children: [
                      SizedBox(height: 25.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Wishlist",
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(height: 25.v),
                      _buildEdit(context),
                      SizedBox(height: 27.v),
                      _buildWishlistGrid(context),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  /// Section Widget
  Widget _buildEditButton(BuildContext context) {
    return CustomElevatedButton(
      height: 35.v,
      width: 65.h,
      text: "Edit".tr,
      margin: EdgeInsets.only(bottom: 2.v),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEdit,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: CustomTextStyles.bodyMediumGray9000115,
    );
  }

  /// Section Widget
  Widget _buildEdit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Align(
              //   alignment: Alignment.center,
              //   child: Text(
              //     "20 Items",
              //     style: theme.textTheme.titleMedium,
              //   ),
              // ),
              // SizedBox(height: 6.v),
              // Text(
              //   "in wishlist".tr,
              //   style: CustomTextStyles.bodyLargeGray50001_3,
              // ),
            ],
          ),
          _buildEditButton(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWishlistGrid(BuildContext context) {
    return viewWishlistcontroller.userList.value.wishlistViewList == null ||
            viewWishlistcontroller.userList.value.wishlistViewList!.isEmpty
        ? Center(
            child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/wishlist.png',
                  width: 100,
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                Text(
                  "Your wishlist is empty!",
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Text(
                  "Explore More and shortlist some items",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(73, 0, 0, 0)),
                ),
              ],
            ),
          ))
        : Padding(
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
                itemCount: viewWishlistcontroller
                    .userList.value.wishlistViewList!.length,
                itemBuilder: (context, index) {
                  final wishlistProduct = viewWishlistcontroller
                      .userList.value.wishlistViewList![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),

                        width: Get.width, padding: EdgeInsets.only(left: 20),
                        //    width: 170.adaptSize,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            CustomImageView(
                              onTap: () {
                                Englishproductid = homeView_controller.userList
                                    .value.recommendedProduct![index].id!
                                    .toString();

                                setState(() {
                                  Englishproductid;
                                });
                                Get.to(
                                  ShirtsandTopsSingleView(),
                                );
                              },
                              fit: BoxFit.cover,
                              imagePath: wishlistProduct.imageUrl.toString(),
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
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: IconButtonStyleHelper.fillWhiteA,
                                  alignment: Alignment.topRight,
                                  child: CustomImageView(
                                      imagePath: ImageConstant
                                          .imgGroup239531 // Change this to your tapped image
                                      // :  ImageConstant.imgSearch,    // Default image
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
                            "10% Off",
                            style: TextStyle(
                              fontSize: 8, color: Color(0xffff8300),
                              fontWeight: FontWeight.w600,
                              // fontFamily: 'Almarai'
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.v),
                      SizedBox(
                        width: 131.h,
                        child: Text(
                          wishlistProduct.title.toString(),
                          //  "Luxury Rhinestone Quartz Watch Ladies Rome...",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge!.copyWith(
                            height: 1.33,
                          ),
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
                                      text: wishlistProduct.price.toString(),
                                      //"99 ",
                                      style:
                                          CustomTextStyles.titleMediumPrimary_2,
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
}
