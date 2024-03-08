import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_productbycategoryListController.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
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
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

// String? allmainCatId;
// String? allProductId;

class arabicSubCat_Electronics_laptops extends StatefulWidget {
  const arabicSubCat_Electronics_laptops({Key? key}) : super(key: key);

  @override
  State<arabicSubCat_Electronics_laptops> createState() =>
      _arabicSubCat_Electronics_laptopsState();
}

class _arabicSubCat_Electronics_laptopsState
    extends State<arabicSubCat_Electronics_laptops> {
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
                            .laptops_userlist.value.productByCategory ==
                        null ||
                    _productbycatid_controller
                            .laptops_userlist.value.productByCategory?.length ==
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
                      itemCount: _productbycatid_controller.laptops_userlist
                              .value.productByCategory?.length ??
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
                                      arabicMainCatId =
                                          _productbycatid_controller
                                              .laptops_userlist
                                              .value
                                              .productByCategory![index]
                                              .mainCategoryId!
                                              .toString();
                                      String? ProductId =
                                          _productbycatid_controller
                                              .laptops_userlist
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
                                      if (arabicMainCatId == "153") {
                                        Get.to(
                                            ArabicMensSingleShirtViewScreen());
                                        print(
                                            "$arabicMainCatId===========Mens Appearl main category id ");
                                      } else if (arabicMainCatId == "154") {
                                        Get.to(
                                            ArabicMensBottomSingleShViewScreen());
                                      } else if (arabicMainCatId == "155") {
                                        Get.to(
                                            ArabicMensJacketSingleShViewScreen());
                                      } else if (arabicMainCatId == "156") {
                                        Get.to(
                                            ArabicMensActivewearSingleShViewScreen());
                                      } else if (arabicMainCatId == "157") {
                                        Get.to(
                                            ArabicMensFormalsSingleShViewScreen());
                                      } else if (arabicMainCatId == "174") {
                                        Get.to(
                                            ArabicMensShoesSingleShViewScreen());
                                      } else if (arabicMainCatId == "166") {
                                        Get.to(
                                            ArabicElectronicsPhoneSingleShViewScreen());
                                      } else if (arabicMainCatId == "170") {
                                        Get.to(
                                            ArabicElectronicsLaptopsSingleShViewScreen());
                                      } else if (arabicMainCatId == "171") {
                                        Get.to(
                                            ArabicElectronicsHeadphonesSingleShViewScreen());
                                      } else if (arabicMainCatId == "172") {
                                        Get.to(
                                            ArabicElectronicsCameraSingleShViewScreen());
                                      } else if (arabicMainCatId == "173") {
                                        Get.to(
                                            ArabicElectronicswearableSingleShViewScreen());
                                      } else {
                                        print('not found ');
                                      }
                                    },
                                    fit: BoxFit.cover,
                                    imagePath:
                                        "${_productbycatid_controller.laptops_userlist.value.productByCategory?[index].imageUrl.toString()}",
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
                                                  .laptops_userlist
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
                                    'خصم 10',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Color(0xffff8300),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Almarai'),
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
                                  "${_productbycatid_controller.laptops_userlist.value.productByCategory?[index].aTitle.toString()}",
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
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 3.h),
                                              child: CustomRatingBar(
                                                ignoreGestures: true,
                                                initialRating:
                                                    _productbycatid_controller
                                                        .laptops_userlist
                                                        .value
                                                        .productByCategory?[
                                                            index]
                                                        .averageRating
                                                        ?.toDouble(),
                                              ),
                                            ),
                                            Text(
                                              "${_productbycatid_controller.laptops_userlist.value.productByCategory?[index].averageRating.toString()}",
                                              // "4.8",
                                              style:
                                                  theme.textTheme.labelMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5.v),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "2k+ مُباع  ",
                                              style: theme.textTheme.bodySmall,
                                            ),
                                            TextSpan(
                                              text:
                                                  "${_productbycatid_controller.laptops_userlist.value.productByCategory?[index].price.toString()}",
                                              //"99 ",
                                              style: CustomTextStyles
                                                  .titleMediumPrimary_2,
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 58.h,
                                      top: 3.v,
                                    ),
                                    child: CustomIconButton(
                                      onTap: () {},
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
}
