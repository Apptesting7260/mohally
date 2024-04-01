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
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/MensAllProductController/EngMensAllProductController.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
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
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/SuitsandFormalsSingleVoewScreen.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensDressSingleView.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensTopsSingleViewScreen.dart';

// String? allmainCatId;
// String? allProductId;
String? subMainCat;
String? color;
String? size1;

class MensAllProduct extends StatefulWidget {
  final bool showAppBar;

  const MensAllProduct({Key? key, this.showAppBar = true}) : super(key: key);

  @override
  State<MensAllProduct> createState() => _MensAllProductState();
}

class _MensAllProductState extends State<MensAllProduct> {
  List<bool> tappedList = List.generate(200, (index) => false);

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
    _productbycatid_controller.MensAllProductView();
  }

  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  MensAllProductEnglish _productbycatid_controller = MensAllProductEnglish();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      width: Get.width * .07,
                      height: Get.height * .03,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(90, 158, 158, 158)),
                      child: Icon(
                        Icons.arrow_back,
                      )),
                ),
              ),
            )
          : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
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
            return _productbycatid_controller.mens.value.productByCategory ==
                        null ||
                    _productbycatid_controller
                            .mens.value.productByCategory?.length ==
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
                      itemCount: _productbycatid_controller
                              .mens.value.productByCategory?.length ??
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
                                          .mens
                                          .value
                                          .productByCategory?[index]
                                          .mainCategoryId!
                                          .toString();
                                      String? productId =
                                          _productbycatid_controller.mens.value
                                              .productByCategory?[index].id!
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
                                        Get.to(
                                            SinglePageScreen_mens_activewear());
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
                                    fit: BoxFit.cover,
                                    imagePath:
                                        "${_productbycatid_controller.mens.value.productByCategory?[index].imageUrl.toString()}",
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
                                                  .mens
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
                                      fontSize: 8,
                                      color: Color(0xffff8300),
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
                                  "${_productbycatid_controller.mens.value.productByCategory?[index].title.toString()}",
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
                                              "${_productbycatid_controller.mens.value.productByCategory?[index].averageRating.toString()}",
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
                                                        .mens
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
                                                  "${_productbycatid_controller.mens.value.productByCategory?[index].price.toString()}",
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
                                        mainCatId = _productbycatid_controller
                                            .mens
                                            .value
                                            .productByCategory?[index]
                                            .mainCategoryId
                                            .toString();
                                        String? productId =
                                            _productbycatid_controller
                                                .mens
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
                                        } else if (mainCatId == "154") {
                                          productviewcontroller
                                              .Single_ProductApiHit(context);

                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return _buildAddtocartmensBottoms(
                                                    context,
                                                    mainCatId,
                                                    productId);
                                              });
                                        } else if (mainCatId == "155") {
                                          productviewcontroller
                                              .Single_ProductApiHit(context);

                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return _buildAddtocartmensJacket(
                                                    context,
                                                    mainCatId,
                                                    productId);
                                              });
                                        } else if (mainCatId == "156") {
                                          productviewcontroller
                                              .Single_ProductApiHit(context);

                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return _buildAddtocartmensActiveWear(
                                                    context,
                                                    mainCatId,
                                                    productId);
                                              });
                                        } else if (mainCatId == "157") {
                                          productviewcontroller
                                              .Single_ProductApiHit(context);

                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return _buildAddtocartmensFormals(
                                                    context,
                                                    mainCatId,
                                                    productId);
                                              });
                                        } else if (mainCatId == "174") {
                                          productviewcontroller
                                              .Single_ProductApiHit(context);

                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return _buildAddtocartmensShoes_view(
                                                    context,
                                                    mainCatId,
                                                    productId);
                                              });
                                        }

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
      ),
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
                        // Obx(() {
                        //   return
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

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.ShirtandTops_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .ShirtandTops_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.ShirtandTops_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.ShirtandTops_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .ShirtandTops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .ShirtandTops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.ShirtandTops_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid = productviewcontroller
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                ?.price
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
                                                ?.price
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
                                                ?.price
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
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.jacket_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.jacket_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.jacket_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .jacket_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.jacket_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.jacket_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .jacket_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.jacket_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                          productviewcontroller.jacket_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.jacket_userlist
                                              .value.productView?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
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
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.activewear_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.activewear_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .activewear_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.activewear_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.activewear_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .activewear_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .activewear_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.activewear_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .activewear_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .activewear_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                              .activewear_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .activewear_userlist
                                              .value
                                              .productView
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.formal_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.formal_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.formal_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .formal_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.formal_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.formal_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .formal_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .formal_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.formal_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .formal_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                          productviewcontroller.formal_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.formal_userlist
                                              .value.productView?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.wearable_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.wearable_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.wearable_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .wearable_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.wearable_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.wearable_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.wearable_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .wearable_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                              .wearable_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .wearable_userlist
                                              .value
                                              .productView
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
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
                                      .smartphone_userlist
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
                                      : "${productviewcontroller.smartphone_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.smartphone_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .smartphone_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.smartphone_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.smartphone_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .smartphone_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.smartphone_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    ?.details!
                                                    .model
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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .smartphone_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                              .smartphone_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .smartphone_userlist
                                              .value
                                              .productView
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.camera_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.camera_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.camera_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .camera_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.camera_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.camera_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .camera_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .camera_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .camera_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.camera_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .camera_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                          productviewcontroller.camera_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.camera_userlist
                                              .value.productView?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
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
                                      .headphones_userlist
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
                                      : "${productviewcontroller.headphones_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.headphones_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .headphones_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.headphones_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.headphones_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .headphones_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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

                        if (productviewcontroller.headphones_userlist.value
                                    .productView?.productType ==
                                "variable" &&
                            productviewcontroller
                                    .headphones_userlist
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
                                size1 = productviewcontroller
                                    .headphones_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.headphones_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .headphones_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                              .headphones_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .headphones_userlist
                                              .value
                                              .productView
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.laptops_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.laptops_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.laptops_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .laptops_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.laptops_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.laptops_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .laptops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .laptops_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .laptops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.model?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.laptops_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .laptops_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                          productviewcontroller.laptops_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.laptops_userlist
                                              .value.productView?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: Get.height * .4,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // Remove the physics property or set it to ScrollPhysics()
                              // physics: ScrollPhysics(),
                              itemCount: productviewcontroller.Bottom_userlist
                                      .value.productView?.galleryUrl?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.Bottom_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.Bottom_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .Bottom_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.Bottom_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.Bottom_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .Bottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .Bottom_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.Bottom_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .Bottom_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                          productviewcontroller.Bottom_userlist
                                              .value.productView?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller.Bottom_userlist
                                              .value.productView?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
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
                                      .mensshoes_userlist
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
                                      : "${productviewcontroller.mensshoes_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.mensshoes_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .mensshoes_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.mensshoes_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.mensshoes_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .mensshoes_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.mensshoes_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .mensshoes_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                              .mensshoes_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .mensshoes_userlist
                                              .value
                                              .productView
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
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
                                      .womensDress_userlist
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
                                      : "${productviewcontroller.womensDress_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.womensDress_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .womensDress_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.womensDress_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.womensDress_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .womensDress_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.womensDress_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .womensDress_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womensDress_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                              .womensDress_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .womensDress_userlist
                                              .value
                                              .productView
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
                        // Obx(() {
                        //   return
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
                                      .womenstops_userlist
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
                                      : "${productviewcontroller.womenstops_userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                );
                              },
                            ),
                          ),

                          //  Container(
                          //   height: Get.height * .4,
                          //   width: Get.width,
                          //   child:
                          //       //  ListView.builder(
                          //       //   physics: ScrollPhysics(),
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   itemCount: productviewcontroller.womenstops_userlist
                          //       //           .value.productView?.galleryUrl?.length ??
                          //       //       0,
                          //       //   itemBuilder: (BuildContext context, int index) {
                          //       //     // String imageUrl = productviewcontroller
                          //       //     //         .womenstops_userlist
                          //       //     //         .value
                          //       //     //         .productView
                          //       //     //         ?.galleryUrl?[index] ??
                          //       //     //     '';
                          //       //     return Row(
                          //       //       children: [
                          //       Container(
                          //     height: Get.height * .4,
                          //     width: Get.width,
                          //     child: CustomImageView(
                          //       fit: BoxFit.cover,
                          //       imagePath: selectedImageUrl.value.isNotEmpty
                          //           ? selectedImageUrl.value
                          //           : "${productviewcontroller.womenstops_userlist.value.productView!.imageUrl.toString()}",
                          //       height: 504.v,
                          //       width: Get.width,
                          //       alignment: Alignment.center,
                          //     ),
                          //   ),
                          //   // SizedBox(
                          //   //   width: Get.width * .04,)
                          //   //   ],
                          //   // );
                          //   //   },
                          //   // ),
                          // ),
                        ),

                        // }),
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
                          height: Get.height * .07,
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
                                              //   text:
                                              //       '${productviewcontroller.womenstops_userlist.value.productView?.productDetails!.details?[index].productPrice}',
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
                                color = productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.color
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
                                                            .value
                                                            .toString(),
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
                                                          .value
                                                          .toString() ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    setState(() {
                                                      selectedcolored.value =
                                                          selectedcolorname;
                                                      selectedcolorIndex.value =
                                                          index;
                                                    });

                                                    colorId =
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
                                size1 = productviewcontroller
                                    .womenstops_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value
                                    .toString();
                                // var size2 = productviewcontroller.womenstops_userlist.value
                                //     .productView?.productDetails?.details?[index].Size;

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
                                                    setState(() {
                                                      selectedSizeIndex.value =
                                                          index;
                                                    });
                                                    sizeid =
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
                        //                       .womenstops_userlist
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
                        //                   color = null;
                        //                   size1 = null;
                        //                   colorId = null;
                        //                   sizeid = null;
                        //                   // selectedcolored.value = "null";
                        //                   selectedcolorIndex.value = -1;

                        //                   selectedSizeIndex.value = -1;
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
                          height: Get.height * .04,
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
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        EnglishAddtocartColor =
                                            colorId.toString();
                                        EnglishAddtocartprice =
                                            productviewcontroller
                                                .womenstops_userlist
                                                .value
                                                .productView
                                                ?.price
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
                                              .womenstops_userlist
                                              .value
                                              .productView
                                              ?.id
                                              .toString();
                                      EnglishAddtocartColor =
                                          colorId.toString();
                                      EnglishAddtocartprice =
                                          productviewcontroller
                                              .womenstops_userlist
                                              .value
                                              .productView
                                              ?.price
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
                                      height: Get.height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300)),
                                      child: AddToCartcontrollerin
                                                  .loading.value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
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
