import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/EnglishAllproductviewController/english_allproductviewcontroller.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_allProductviewEnglish.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

String? engallmainCatId;
// String? allProductId;
String? sizeid;
String? colorId;
String? color;
String? size1;

class AllProductViewEnglish extends StatefulWidget {
  const AllProductViewEnglish({Key? key}) : super(key: key);

  @override
  State<AllProductViewEnglish> createState() => _AllProductViewEnglishState();
}

class _AllProductViewEnglishState extends State<AllProductViewEnglish> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allProduct_controller.allProductView_apihit();
  }

  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
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

  EnglishSingleProductViewController singleProductViewController =
      EnglishSingleProductViewController();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  EnglishAdd_remove_wishlistController englishAddRemoveWishlistController =
      EnglishAdd_remove_wishlistController();
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  // List<bool> isButtonTappedList = List.generate(200, (index) => false);
  AllProduct_controller _allProduct_controller = AllProduct_controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Obx(() {
        if (_allProduct_controller.rxRequestStatus.value == Status.LOADING) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (_allProduct_controller.rxRequestStatus.value ==
            Status.ERROR) {
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
        } else {
          return _allProduct_controller.userList.value.allProductList == null ||
                  _allProduct_controller
                          .userList.value.allProductList?.length ==
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
                      "Page Not Found",
                      style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ],
                ))
              : Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: Get.height * .4,
                      crossAxisCount: 2,
                      // mainAxisSpacing: 2,
                      crossAxisSpacing: 10.h,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemCount: _allProduct_controller
                            .userList.value.allProductList?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.only(left: 10),
                            //    width: 170.adaptSize,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                CustomImageView(
                                  onTap: () {
                                    mainCatId = _allProduct_controller
                                        .userList
                                        .value
                                        .allProductList?[index]
                                        .mainCategoryId!
                                        .toString();
                                    String? allProductId =
                                        _allProduct_controller.userList.value
                                            .allProductList?[index].id!
                                            .toString();

                                    setState(() {
                                      EnglishAllproductid = allProductId;
                                      EnglishAllMainCatId = mainCatId;
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
                                      Get.to(NoProductFound(
                                        showAppBar: true,
                                      ));
                                    }
                                  },

                                  fit: BoxFit.cover,
                                  imagePath:
                                      "${_allProduct_controller.userList.value.allProductList?[index].imageUrl.toString()}",
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
                                            _allProduct_controller
                                                .userList
                                                .value
                                                .allProductList![index]
                                                .id!
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
                                      decoration:
                                          IconButtonStyleHelper.fillWhiteA,
                                      alignment: Alignment.topRight,
                                      child: CustomImageView(
                                        imagePath: isButtonTappedList[index]
                                            ? ImageConstant
                                                .imgGroup239531 // Change this to your tapped image
                                            : ImageConstant
                                                .imgSearch, // Default image
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                "${_allProduct_controller.userList.value.allProductList?[index].title.toString()}",
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
                                            "${_allProduct_controller.userList.value.allProductList?[index].averageRating.toString()}",
                                            // "4.8",
                                            style: theme.textTheme.labelMedium,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 3.h),
                                            child: CustomRatingBar(
                                              ignoreGestures: true,
                                              initialRating:
                                                  _allProduct_controller
                                                      .userList
                                                      .value
                                                      .allProductList?[index]
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
                                                "${_allProduct_controller.userList.value.allProductList?[index].price.toString()}",
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
                                      mainCatId = _allProduct_controller
                                          .userList
                                          .value
                                          .allProductList?[index]
                                          .mainCategoryId!
                                          .toString();

                                      String? allProductId =
                                          _allProduct_controller.userList.value
                                              .allProductList?[index].id!
                                              .toString();

                                      setState(() {
                                        mainCatId;
                                        allProductId;
                                        Englishproductid = allProductId;
                                        EnglishMainCatId = mainCatId;
                                      });

                                      // if (mainCatId == "153") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartmensShirt(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "154") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartmensBottoms(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "155") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartmensJacket(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "156") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartmensActiveWear(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "157") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartmensFormals(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "174") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartmensShoes_view(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "166") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartelectronicsPhone(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "170") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartelectronicsLaptop(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "171") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartelectronicsHeadphones(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      //   // }
                                      //   // });
                                      // } else if (mainCatId == "172") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartelectronicsCamera(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      //   // }
                                      //   // });
                                      // } else if (mainCatId == "173") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartelectronicsWarable(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "176") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartWomensDress(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // } else if (mainCatId == "177") {
                                      //   productviewcontroller
                                      //       .Single_ProductApiHit(context);

                                      //   showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       builder: (context) {
                                      //         return _buildAddtocartwomensTop(
                                      //             context,
                                      //             mainCatId,
                                      //             allProductId);
                                      //       });
                                      // }
                                      print(mainCatId.toString());
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
                          ),
                        ],
                      );
                    },
                  ),
                );
        }
      }),
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
}
