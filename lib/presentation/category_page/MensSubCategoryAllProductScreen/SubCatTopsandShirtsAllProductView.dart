import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ShirtAndTopsSingleView.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

// String? allmainCatId;
// String? allProductId;
String? subMainCat;
String? color;
String? size1;

class SubCat_Mens_ShirtsView extends StatefulWidget {
  const SubCat_Mens_ShirtsView({Key? key}) : super(key: key);

  @override
  State<SubCat_Mens_ShirtsView> createState() => _SubCat_Mens_ShirtsViewState();
}

class _SubCat_Mens_ShirtsViewState extends State<SubCat_Mens_ShirtsView> {
  List<bool> tappedList = List.generate(200, (index) => false);
  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
  final AddToCartcontrollerin = Get.put(AddToCartcontroller());
  RxInt selectedImageIndex = 0.obs;
  RxString selectedImageUrl = ''.obs;
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productbycatid_controller.ProductByCatId_apiHit();
  }

  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  ProductsByCatIdListControllerEnglish _productbycatid_controller =
      ProductsByCatIdListControllerEnglish();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.only(
      //       top: 15,
      //     ),
      //     child: GestureDetector(
      //       onTap: () {
      //         Get.back();
      //       },
      //       child: Container(
      //           width: Get.width * .07,
      //           height: Get.height * .03,
      //           decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: const Color.fromARGB(90, 158, 158, 158)),
      //           child: Icon(
      //             Icons.arrow_back,
      //           )),
      //     ),
      //   ),
      // ),
      body: Obx(() {
        if (_productbycatid_controller.rxRequestStatus.value ==
            Status.LOADING) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (_productbycatid_controller.rxRequestStatus.value ==
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
          return _productbycatid_controller
                          .ShirtandTops_userlist.value.productByCategory ==
                      null ||
                  _productbycatid_controller.ShirtandTops_userlist.value
                          .productByCategory?.length ==
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
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 20),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: Get.height * .4,
                          crossAxisCount: 2,
                          // mainAxisSpacing: 2,
                          crossAxisSpacing: 10.h,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: _productbycatid_controller
                                .ShirtandTops_userlist
                                .value
                                .productByCategory
                                ?.length ??
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
                                        mainCatId = _productbycatid_controller
                                            .ShirtandTops_userlist
                                            .value
                                            .productByCategory?[index]
                                            .mainCategoryId!
                                            .toString();
                                        String? productId =
                                            _productbycatid_controller
                                                .ShirtandTops_userlist
                                                .value
                                                .productByCategory?[index]
                                                .id!
                                                .toString();

                                        setState(() {
                                          Englishproductid = productId;
                                          EnglishMainCatId = mainCatId;
                                        });
                                        print("$Englishproductid==");
                                        if (mainCatId == "153") {
                                          Get.to(ShirtsandTopsSingleView());
                                        }
                                      },
                                      fit: BoxFit.cover,
                                      imagePath:
                                          "${_productbycatid_controller.ShirtandTops_userlist.value.productByCategory?[index].imageUrl.toString()}",
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
                                                _productbycatid_controller
                                                    .ShirtandTops_userlist
                                                    .value
                                                    .productByCategory![index]
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
                                    "${_productbycatid_controller.ShirtandTops_userlist.value.productByCategory?[index].title.toString()}",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${_productbycatid_controller.ShirtandTops_userlist.value.productByCategory?[index].averageRating.toString()}",
                                                // "4.8",
                                                style:
                                                    theme.textTheme.labelMedium,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3.h),
                                                child: CustomRatingBar(
                                                  ignoreGestures: true,
                                                  initialRating:
                                                      _productbycatid_controller
                                                          .ShirtandTops_userlist
                                                          .value
                                                          .productByCategory?[
                                                              index]
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
                                                    "${_productbycatid_controller.ShirtandTops_userlist.value.productByCategory?[index].price.toString()}",
                                                //"99 ",
                                                style: CustomTextStyles
                                                    .titleMediumPrimary_2,
                                              ),
                                              TextSpan(
                                                text: "2k+ sold",
                                                style:
                                                    theme.textTheme.bodySmall,
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
                                          mainCatId = _productbycatid_controller
                                              .ShirtandTops_userlist
                                              .value
                                              .productByCategory?[index]
                                              .mainCategoryId
                                              .toString();
                                          String? productId =
                                              _productbycatid_controller
                                                  .ShirtandTops_userlist
                                                  .value
                                                  .productByCategory?[index]
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
                                                      context,
                                                      mainCatId,
                                                      productId);
                                                });
                                          }
                                        },
                                        height: 30.adaptSize,
                                        width: 30.adaptSize,
                                        padding: EdgeInsets.all(6.h),
                                        child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgGroup239533,
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
                  ],
                );
        }
      }),
    );
  }

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

  Widget _buildAddtocartmensShirt(
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
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
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
                                                    '${productviewcontroller.ShirtandTops_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              color = productviewcontroller
                                  .ShirtandTops_userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details?[index]
                                  .Color
                                  .toString();
                              if (color == "null") {
                                return Text('');
                              }
                              return Column(
                                children: [
                                  // SizedBox(height: 11.v),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.only(left: 10),
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
                                  ),
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
                                            String selectedcolorname =
                                                productviewcontroller
                                                        .ShirtandTops_userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details?[index]
                                                        .Color
                                                        .toString() ??
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
                                                  colorId =
                                                      productviewcontroller
                                                          .ShirtandTops_userlist
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
                                                        color: selectedcolorIndex
                                                                    .value ==
                                                                index
                                                            ? Color(0xffff8300)
                                                            : const Color
                                                                .fromARGB(111,
                                                                158, 158, 158),

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
                                      selectedImageUrl.value = imageUrl;
                                      selectedImageIndex.value = index;
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
                              size1 = productviewcontroller
                                  .ShirtandTops_userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details?[index]
                                  .Size;

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
                                                  sizeid = productviewcontroller
                                                      .ShirtandTops_userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details?[index]
                                                      .SizeId
                                                      .toString();
                                                  // print(selectedSizeIndex);
                                                },
                                                child: Obx(
                                                  () => Center(
                                                    child: Container(
                                                      width: 70.h,
                                                      decoration: BoxDecoration(
                                                        color: selectedSizeIndex
                                                                    .value ==
                                                                index
                                                            ? Color(0xffff8300)
                                                            : const Color
                                                                .fromARGB(111,
                                                                158, 158, 158),
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
                        ),
                        // Container(
                        //   height: Get.height * .06,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (color == null || size1 == null) {
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
                        //                       .ShirtandTops_userlist
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
                        // SizedBox(
                        //   height: Get.height * .04,
                        // ),
                        Container(
                          height: Get.height * .1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    if (color != null && size1 != null) {
                                      if (colorId == null) {
                                        Utils.snackBar(context, 'Failed',
                                            'Please Select Color');
                                      } else if (sizeid == null) {
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
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        EnglishAddtocartSize =
                                            sizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        color = null;
                                        size1 = null;
                                        colorId = null;
                                        sizeid = null;
                                        // selectedcolored.value = "null";
                                        selectedcolorIndex.value = -1;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (size1 != null) {
                                      if (sizeid == null) {
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
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        EnglishAddtocartSize =
                                            sizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        size1 = null;
                                        sizeid = null;

                                        selectedSizeIndex.value = -1;
                                      }
                                    } else if (color != null) {
                                      if (colorId == null) {
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
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        EnglishAddtocartSize =
                                            sizeid.toString();
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);
                                        color = null;
                                        colorId = null;
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
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .ShirtandTops_userlist
                                              .value
                                              .productView
                                              ?.productDetails
                                              ?.details?[index]
                                              .price
                                              .toString();
                                      EnglishAddtocartSize = sizeid.toString();
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
                        // Add this variable in your state

                        // SizedBox(height: Get.height * .04),
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
