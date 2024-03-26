import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_addtocartController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_productbycategoryListController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEcameraview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEheadphonesView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicElaptopview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEphoneSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEwearableView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBootsSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBottomSingleview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMFormalSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMJacketSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMShirtSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMactivewearView.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

// String? allmainCatId;
// String? allProductId;
String? sizeid;
String? colorId;
String? color;
String? size1;

class arabicSubCat_Mens_activewear extends StatefulWidget {
  const arabicSubCat_Mens_activewear({Key? key}) : super(key: key);

  @override
  State<arabicSubCat_Mens_activewear> createState() =>
      _arabicSubCat_Mens_activewearState();
}

class _arabicSubCat_Mens_activewearState
    extends State<arabicSubCat_Mens_activewear> {
  RxInt selectedImageIndex = 0.obs;
  RxString selectedImageUrl = ''.obs;
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  SingleProductViewController productviewcontroller =
      SingleProductViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productbycatid_controller.ProductByCatId_apiHit();
  }

  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  ProductsByCatIdListControllerarabic _productbycatid_controller =
      ProductsByCatIdListControllerarabic();
  HomeView_controller homeView_controller = HomeView_controller();
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
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
                            .activewear_userlist.value.productByCategory ==
                        null ||
                    _productbycatid_controller.activewear_userlist.value
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
                      itemCount: _productbycatid_controller.activewear_userlist
                              .value.productByCategory?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.only(left: 20),
                              // height: 160.adaptSize,
                              // width: 160.adaptSize,
                              // height: Get.height*.2,
                              // width: Get.width*.3,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: CustomImageView(
                                      fit: BoxFit.cover,
                                      imagePath:
                                          "${_productbycatid_controller.activewear_userlist.value.productByCategory?[index].imageUrl.toString()}",
                                      onTap: () {
                                        arabicMainCatId =
                                            _productbycatid_controller
                                                .activewear_userlist
                                                .value
                                                .productByCategory![index]
                                                .mainCategoryId!
                                                .toString();
                                        String? ProductId =
                                            _productbycatid_controller
                                                .activewear_userlist
                                                .value
                                                .productByCategory![index]
                                                .id!
                                                .toString();

                                        setState(() {
                                          MainCatId = arabicMainCatId;
                                          productid = ProductId;
                                        });
                                        print("$productid==");
                                        print("$arabicMainCatId==");
                                        if (arabicMainCatId == "156") {
                                          Get.to(
                                              ArabicMensActivewearSingleShViewScreen());
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
                                          Arabic_Add_remove_productid =
                                              homeView_controller
                                                  .userList
                                                  .value
                                                  .recommendedProduct![index]
                                                  .id!
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
                            Container(
                              height: 16.v,
                              width: 48.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                            //       theme.textTheme.labelSmall!.copyWith(color: Colors.white).copyWith(backgroundColor: Color.fromARGB(214, 252, 204, 220)),
                            // ),
                            SizedBox(height: 5.v),
                            SizedBox(
                              width: 131.h,
                              child: Text(
                                "${_productbycatid_controller.activewear_userlist.value.productByCategory?[index].aTitle.toString()}",

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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 3.h),
                                            child: CustomRatingBar(
                                              ignoreGestures: true,
                                              initialRating:
                                                  _productbycatid_controller
                                                      .activewear_userlist
                                                      .value
                                                      .productByCategory?[index]
                                                      .averageRating
                                                      ?.toDouble(),
                                            ),
                                          ),
                                          Text(
                                            "${_productbycatid_controller.activewear_userlist.value.productByCategory?[index].averageRating.toString()}",
                                            // "4.8",
                                            style: theme.textTheme.labelMedium
                                                ?.copyWith(
                                                    fontFamily: 'Almarai'),
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
                                          "${_productbycatid_controller.activewear_userlist.value.productByCategory?[index].price.toString()}",
                                          //"\$99 ",
                                          style: CustomTextStyles
                                              .titleMediumPrimary_2
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
                                      arabicMainCatId =
                                          _productbycatid_controller
                                              .activewear_userlist
                                              .value
                                              .productByCategory?[index]
                                              .mainCategoryId
                                              .toString();
                                      String? arproductId =
                                          _productbycatid_controller
                                              .activewear_userlist
                                              .value
                                              .productByCategory?[index]
                                              .id
                                              ?.toString();

                                      setState(() {
                                        MainCatId = arabicMainCatId;
                                        productid = arproductId;
                                      });
                                      print("$productid==");
                                      print("$arabicMainCatId==");
                                      if (arabicMainCatId == "156") {
                                        productviewcontroller
                                            .Single_ProductApiHit();

                                        showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return _buildAddtocartmensActiveWear(
                                                  context,
                                                  arabicMainCatId,
                                                  arproductId);
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
                  );
          }
        }),
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
                              color = null;
                              size1 = null;
                              colorId = null;
                              sizeid = null;
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
                                      imagePath: selectedImageUrl
                                              .value.isNotEmpty
                                          ? selectedImageUrl.value
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
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .activewear_userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details?[index]
                                      .Color;
                                  if (color == null) {
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
                                                        colorId =
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
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  size1 = productviewcontroller
                                      .activewear_userlist
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
                                                      sizeid =
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
                            //                   arabicpid = productviewcontroller
                            //                       .activewear_userlist
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
                            //                             "Check Combination",
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
                            SizedBox(
                              height: Get.height * .04,
                            ),
                            Container(
                              height: Get.height * .07,
                              child: ListView.builder(
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
                                            Arabiccartproductid =
                                                productviewcontroller
                                                    .activewear_userlist
                                                    .value
                                                    .productView
                                                    ?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            colorId = null;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (size1 != null) {
                                          if (sizeid == null) {
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
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            size1 = null;
                                            sizeid = null;
                                            selectedSizeIndex.value = -1;
                                          }
                                        } else if (color != null) {
                                          if (colorId == null) {
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
                                                colorId.toString();
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
                                                sizeid.toString();
                                            arabic_addtocart_controller()
                                                .addtocart_Apihit(context);
                                            color = null;
                                            colorId = null;
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
                                              colorId.toString();
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
                                              sizeid.toString();
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
