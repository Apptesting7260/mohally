import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_AllcategoryProductController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleAllProductCategoryController.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

String? allmainCatId;
String? allProductId;

class arabicAllProductView extends StatefulWidget {
  const arabicAllProductView({Key? key}) : super(key: key);

  @override
  State<arabicAllProductView> createState() => _arabicAllProductViewState();
}

class _arabicAllProductViewState extends State<arabicAllProductView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allProduct_controller.allProductView_apihit();
  }

  List<bool> isButtonTappedList = List.generate(20, (index) => false);
  ArabicAllProduct_controller _allProduct_controller =
      ArabicAllProduct_controller();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Obx(() {
        if (_allProduct_controller.rxRequestStatus.value == Status.LOADING) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (_allProduct_controller.rxRequestStatus.value ==
                Status.ERROR ||
            homeView_controller.rxRequestStatus.value == Status.ERROR) {
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
              : Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
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
                                    allmainCatId = _allProduct_controller
                                        .userList
                                        .value
                                        .allProductList?[index]
                                        .mainCategoryId!
                                        .toString();
                                    allProductId = _allProduct_controller
                                        .userList
                                        .value
                                        .allProductList?[index]
                                        .id
                                        .toString();

                                    setState(() {
                                      arabicAllproductid = allProductId;
                                      arabicAllMainCatId = allmainCatId;
                                    });
                                    print("$allProductId==productId");
                                    print("$allmainCatId =====AllmainCatId");
                                    // if (allmainCatId == "133") {
                                    //   Get.to(
                                    //       Arabic_MensAllProduct_SinglePageScreen_arabic());
                                    // } else if (allmainCatId == "134") {
                                    //   Get.to(
                                    //       AllProductElectronicsViewSinglePageScreen_arabic());
                                    // } else if (allmainCatId == "135") {
                                    //   Get.to(
                                    //       AllProduct_SinglePageScreen_HomeLiving());
                                    // } else if (allmainCatId == "136") {
                                    //   Get.to(
                                    //       AllproductView_SinglePageScreen_healthwellness());
                                    // } else {
                                    //   print('not found ');
                                    // }
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
}
