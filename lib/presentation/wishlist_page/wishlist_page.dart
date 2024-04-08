import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/English_Viewwishlist_Controller/english_view_wishlistController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

String? sizeid;
String? colorId;
String? color;
String? size1;

// ignore_for_file: must_be_immutable
class WishlistPage extends StatefulWidget {
  final bool showAppBar;

  const WishlistPage({Key? key, this.showAppBar = false})
      : super(
          key: key,
        );

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<bool> tappedList = List.generate(200, (index) => false);
  final AddToCartcontrollerin = Get.put(AddToCartcontroller());
  // EnglishViewCart _viewcartcontroller = EnglishViewCart();

  RxInt selectedImageIndex = 0.obs;
  RxString selectedImageUrl = ''.obs;
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  int selectedIndex = 0; // Initialize with -1 to indicate no selection

  // EnglishSingleProductViewController _productview =
  //     EnglishSingleProductViewController();
  bool isProductAddedToWishlist = false;
  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  bool isButtonTapped = false;

  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  EnglishAdd_remove_wishlistController englishAddRemoveWishlistController =
      EnglishAdd_remove_wishlistController();
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  // int selectedIndex = -1;
  EnglishViewwishlist viewWishlistcontroller = EnglishViewwishlist();
  EnglishAdd_remove_wishlistController add_remove_wishlistController =
      EnglishAdd_remove_wishlistController();
  @override
  void initState() {
    super.initState();
    //add_remove_wishlistController.AddRemoveWishlish_apihit();
    viewWishlistcontroller.ViewWishlish_apihit();
    homeView_controller.homeview_apihit();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Obx(() {
      if (viewWishlistcontroller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
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
      } else if (viewWishlistcontroller.rxRequestStatus.value == Status.ERROR) {
        return Scaffold(
            body: SafeArea(
          child: Center(
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
          )),
        ));
      } else {
        return Scaffold(
          appBar: widget.showAppBar
              ? AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: CustomIconButton(
                        onTap: () {
                          Get.back();
                        },
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        decoration: IconButtonStyleHelper.fillGrayTL20,
                        child: Center(
                            child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ))),
                  ),
                )
              : null,
          body: SmartRefresher(
            enablePullDown: true,
            onRefresh: () async {
              viewWishlistcontroller.ViewWishlish_apihit();
            },
            enablePullUp: false,
            controller: _refreshController,
            child: SingleChildScrollView(
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
                      // SizedBox(height: 25.v),
                      _buildEdit(context),
                      SizedBox(height: 27.v),
                      _buildWishlistGrid(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
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

  /// Section Widget
  // Widget _buildEditButton(BuildContext context) {
  //   return CustomElevatedButton(
  //     height: 35.v,
  //     width: 65.h,
  //     text: "Edit".tr,
  //     margin: EdgeInsets.only(bottom: 2.v),
  //     leftIcon: Container(
  //       margin: EdgeInsets.only(right: 5.h),
  //       child: CustomImageView(
  //         imagePath: ImageConstant.imgEdit,
  //         height: 15.adaptSize,
  //         width: 15.adaptSize,
  //       ),
  //     ),
  //     buttonStyle: CustomButtonStyles.fillGray,
  //     buttonTextStyle: CustomTextStyles.bodyMediumGray9000115,
  //   );
  // }

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
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${viewWishlistcontroller.userList.value.wishlistViewList!.length.toString()} Items",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 6.v),
              Text(
                "in wishlist",
                style: CustomTextStyles.bodyLargeGray50001_3,
              ),
            ],
          ),
          // _buildEditButton(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWishlistGrid(BuildContext context) {
    return viewWishlistcontroller.userList.value.wishlistViewList == null ||
            viewWishlistcontroller.userList.value.wishlistViewList!.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/wishlist.png',
                  width: 100,
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                Center(
                  child: Text(
                    "Your wishlist is empty!",
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.normal, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Center(
                  child: Text(
                    "Explore More and shortlist some items",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Color.fromARGB(73, 0, 0, 0)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
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
                        // width: Get.width, padding: EdgeInsets.only(left: 10),
                        //    width: 170.adaptSize,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            CustomImageView(
                              onTap: () {
                                mainCatId =
                                    wishlistProduct.categoryId.toString();
                                String? productId =
                                    wishlistProduct.id.toString();

                                setState(() {
                                  Englishproductid = productId;
                                  EnglishMainCatId = mainCatId;
                                });
                                print("$Englishproductid==");
                                if (mainCatId == "153") {
                                  Get.to(SingleProductView());
                                  print(
                                      "$mainCatId===========Mens Appearl main category id ");
                                } else if (mainCatId == "154") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "155") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "156") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "157") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "174") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "166") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "170") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "171") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "172") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "173") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "176") {
                                  Get.to(SingleProductView());
                                } else if (mainCatId == "177") {
                                  Get.to(SingleProductView());
                                } else {
                                  print('not found ');
                                }
                              },
                              fit: BoxFit.cover,
                              imagePath:
                                  "${wishlistProduct.imageUrl.toString()}",
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
                                    Add_remove_productidd =
                                        wishlistProduct.id!.toString();
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
                                              .imgSearch // Change this to your tapped image
                                          : ImageConstant
                                              .imgGroup239531 // Default image
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
                          wishlistProduct.Title.toString(),
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
                              onTap: () {
                                mainCatId =
                                    wishlistProduct.categoryId.toString();
                                String? productId =
                                    wishlistProduct.id?.toString();

                                setState(() {
                                  mainCatId;
                                  productId;
                                  Englishproductid = productId;
                                  EnglishMainCatId = mainCatId;
                                });

                                // if (mainCatId == "153") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartmensShirt(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "154") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartmensBottoms(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "155") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartmensJacket(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "156") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartmensActiveWear(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "157") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartmensFormals(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "174") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartmensShoes_view(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "166") {
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
                                //   // }
                                //   // });
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
                                //   // }
                                //   // });
                                // } else if (mainCatId == "173") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartelectronicsWarable(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "176") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartWomensDress(
                                //             context, mainCatId, productId);
                                //       });
                                // } else if (mainCatId == "177") {
                                //   productviewcontroller.Single_ProductApiHit(
                                //       context);

                                //   showModalBottomSheet(
                                //       context: context,
                                //       isScrollControlled: true,
                                //       builder: (context) {
                                //         return _buildAddtocartwomensTop(
                                //             context, mainCatId, productId);
                                //       });
                                // }
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
}
