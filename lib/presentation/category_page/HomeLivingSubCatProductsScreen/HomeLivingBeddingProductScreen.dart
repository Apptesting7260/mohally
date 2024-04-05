import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensDressSingleView.dart';
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

class HomeLivingBeddingProducts extends StatefulWidget {
  final bool showAppBar;

  const HomeLivingBeddingProducts({Key? key, this.showAppBar = true})
      : super(key: key);

  @override
  State<HomeLivingBeddingProducts> createState() =>
      _HomeLivingBeddingProductsState();
}

class _HomeLivingBeddingProductsState extends State<HomeLivingBeddingProducts> {
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
      appBar: widget.showAppBar
          ? AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 11, left: 10),
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
          return _productbycatid_controller.homeliving_bedding_userlist.value
                          .productByCategory ==
                      null ||
                  _productbycatid_controller.homeliving_bedding_userlist.value
                          .productByCategory?.length ==
                      0 ||
                  _productbycatid_controller.homeliving_bedding_userlist.value
                      .productByCategory!.isEmpty
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
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: Get.height * .4,
                            crossAxisCount: 2,
                            // mainAxisSpacing: 2,
                            crossAxisSpacing: 10.h,
                          ),
                          physics: BouncingScrollPhysics(),
                          itemCount: _productbycatid_controller
                                  .homeliving_bedding_userlist
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
                                              .homeliving_bedding_userlist
                                              .value
                                              .productByCategory?[index]
                                              .mainCategoryId!
                                              .toString();
                                          String? productId =
                                              _productbycatid_controller
                                                  .homeliving_bedding_userlist
                                                  .value
                                                  .productByCategory?[index]
                                                  .id!
                                                  .toString();

                                          setState(() {
                                            Englishproductid = productId;
                                            EnglishMainCatId = mainCatId;
                                          });
                                          print("$Englishproductid==");
                                          if (mainCatId == "176") {
                                            Get.to(Womens_Dress_SingleView());
                                          }
                                        },
                                        fit: BoxFit.cover,
                                        imagePath:
                                            "${_productbycatid_controller.homeliving_bedding_userlist.value.productByCategory?[index].imageUrl.toString()}",
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
                                                      .homeliving_bedding_userlist
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
                                            decoration: IconButtonStyleHelper
                                                .fillWhiteA,
                                            alignment: Alignment.topRight,
                                            child: CustomImageView(
                                              imagePath: isButtonTappedList[
                                                      index]
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
                                      "${_productbycatid_controller.homeliving_bedding_userlist.value.productByCategory?[index].title.toString()}",
                                      //  "Luxury Rhinestone Quartz Watch Ladies Rome...",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          theme.textTheme.labelLarge!.copyWith(
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
                                                  "${_productbycatid_controller.homeliving_bedding_userlist.value.productByCategory?[index].averageRating.toString()}",
                                                  // "4.8",
                                                  style: theme
                                                      .textTheme.labelMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.h),
                                                  child: CustomRatingBar(
                                                    ignoreGestures: true,
                                                    initialRating:
                                                        _productbycatid_controller
                                                            .homeliving_bedding_userlist
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
                                                      "${_productbycatid_controller.homeliving_bedding_userlist.value.productByCategory?[index].price.toString()}",
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
                                            mainCatId =
                                                _productbycatid_controller
                                                    .homeliving_bedding_userlist
                                                    .value
                                                    .productByCategory?[index]
                                                    .mainCategoryId
                                                    .toString();
                                            String? productId =
                                                _productbycatid_controller
                                                    .homeliving_bedding_userlist
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
                  ),
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
}
