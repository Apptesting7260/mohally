import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/AllprodutSingleview/ALLMensSingleViewScreen/all_ActivewearSingleViewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ALLMensSingleViewScreen/all_Bottoms_single_view.dart';
import 'package:mohally/presentation/AllprodutSingleview/ALLMensSingleViewScreen/all_JacketandOutwearSingleViewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ALLMensSingleViewScreen/all_MensShoesSingleviewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ALLMensSingleViewScreen/all_ShirtAndTopsSingleView.dart';
import 'package:mohally/presentation/AllprodutSingleview/ALLMensSingleViewScreen/all_SuitsandFormalsSingleVoewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ElectronicsSingleViewScreen/allAudioSingleViewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ElectronicsSingleViewScreen/allLaptopsSingleviewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ElectronicsSingleViewScreen/allSmartPhonesSingleViewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ElectronicsSingleViewScreen/allWearableSingleviewScreen.dart';
import 'package:mohally/presentation/AllprodutSingleview/ElectronicsSingleViewScreen/all_CameraSingleView.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/EnglishAllproductviewController/english_allproductviewcontroller.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_allProductviewEnglish.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

String? engallmainCatId;
String? allProductId;

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

  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  AllProduct_controller _allProduct_controller = AllProduct_controller();
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
                                    engallmainCatId = _allProduct_controller
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
                                      EnglishAllMainCatId = engallmainCatId;
                                    });
                                    print("$Englishproductid==");
                                    if (engallmainCatId == "153") {
                                      Get.to(AllShirtsandTopsSingleView());
                                      print(
                                          "$engallmainCatId===========Mens Appearl main category id ");
                                    } else if (engallmainCatId == "154") {
                                      Get.to(AllSinglePageScreen_Bottoms());
                                    } else if (engallmainCatId == "155") {
                                      Get.to(AllSinglePageScreen_mens_Jacket());
                                    } else if (engallmainCatId == "156") {
                                      Get.to(
                                          AllSinglePageScreen_mens_activewear());
                                    } else if (engallmainCatId == "157") {
                                      Get.to(
                                          AllSinglePageScreen_Mens_Formals());
                                    } else if (engallmainCatId == "174") {
                                      Get.to(AllSinglePageScreen_Mens_Shoes());
                                    } else if (engallmainCatId == "166") {
                                      Get.to(
                                          ALLSinglePageScreen_Electronics_Smartphones());
                                    } else if (engallmainCatId == "170") {
                                      Get.to(
                                          ALLSinglePageScreen_Electronics_Laptops());
                                    } else if (engallmainCatId == "171") {
                                      Get.to(
                                          ALLSinglePageScreen_Electronics_AudioHeadphones());
                                    } else if (engallmainCatId == "172") {
                                      Get.to(
                                          ALLSinglePageScreen_Electronics_Camera());
                                    } else if (engallmainCatId == "173") {
                                      Get.to(
                                          ALLSinglePageScreen_Electronics_wearable());
                                    } else {
                                      print('not found ');
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
