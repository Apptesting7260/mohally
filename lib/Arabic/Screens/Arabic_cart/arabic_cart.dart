import 'dart:async';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_ViewCartController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_deleteCart.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_placeorderController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_address.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/arabic_order_confirmed.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/ApplyCouponCodeController/applycouponcodecontroller.dart';
import 'package:mohally/view_models/controller/Cart/ProductQtyUpdateController/cartproductqtyUpdateController.dart';
import 'package:mohally/view_models/controller/CouponController/couponcodeController.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/view_models/controller/PlaceOrderController/paceOrderController.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_addtocartController.dart';
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

RxString arabiccouponcodeee = "".obs;
String? sizeid;
String? colorId;
String? color;
String? size1;

// ignore_for_file: must_be_immutable
class CartPage_arabic extends StatefulWidget {
  CartPage_arabic({Key? key})
      : super(
          key: key,
        );
  @override
  State<CartPage_arabic> createState() => _CartPage_arabicState();
}

class _CartPage_arabicState extends State<CartPage_arabic> {
  SingleProductViewController productviewcontroller =
      SingleProductViewController();

  RxInt selectedImageIndex = 0.obs;
  RxString selectedImageUrl = ''.obs;
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  ArabicPlaceOrdercontroller placeordercontroller =
      ArabicPlaceOrdercontroller();

  CouponCodeController _couponCodeController = CouponCodeController();
  List<bool> isSelectedList = List.generate(100, (index) => false);

  final DeleteCartCartControlleri = Get.put(ArabicDeleteCartCartController());

  ArabicViewCart _viewcartcontroller = ArabicViewCart();
  List<bool> tappedList = List.generate(200, (index) => false);

  List<bool> isButtonTappedList = List.generate(20, (index) => false);
  String selectedSize22 = "Dark Blue/M(38)";
  int counter = 1;
  int counter2 = 1;
  bool Allselected = false;
  bool Allselected2 = false;
  List<String> recomemded_text = [
    'مُستَحسَن',
    'ملابس رجالية',
    'الصحة و الجمال',
    'الصحة و الجمال',
    "الصحة و الجمال"
  ];
  int selectedTabIndex = 0;
  int selectedIndex = 0;
  HomeView_controller homeView_controller = HomeView_controller();
  String selectedSize = "Dark Blue/M(38)";
  bool isSelected = false;
  bool isSelected2 = false;
  bool allSelected = false;
  String radioGroup = "";

  TextEditingController trailRunningJacketByController =
      TextEditingController();

  TextEditingController vectorController = TextEditingController();

  TextEditingController group166Controller = TextEditingController();

  TextEditingController addtoCartController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setInitialLocale();
    homeView_controller.homeview_apihit();
    productviewcontroller.Single_ProductApiHit();
    _viewcartcontroller.Viewcart_apihit();
    _couponCodeController.fetchMycouponData();
  }

  void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              "عربتي",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
              ),
            ),
            // leading: Padding(
            //   padding: const EdgeInsets.only(top:15, ),
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: Container(
            //       width: Get.width*.07,
            //       height: Get.height*.03,
            //       decoration: BoxDecoration(shape: BoxShape.circle, color: const Color.fromARGB(90, 158, 158, 158)),
            //       child: Icon(Icons.arrow_back, )),
            //   ),
            // ),
          ),
          body: Obx(() {
            if (_viewcartcontroller.rxRequestStatus.value == Status.LOADING) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (_viewcartcontroller.rxRequestStatus.value ==
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
              return _viewcartcontroller.userList.value.viewCart == null ||
                      _viewcartcontroller.userList.value.viewCart!.length == 0
                  // _viewcartcontroller.home_living_userlist.value
                  //         .productView?.length ==
                  //     0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/nocart.png',
                          width: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 70, 0),
                          child: Text(
                            "سلة التسوق الخاصة بك فارغة حاليًا.\n ابدأ بإضافة عناصر إلى سلة التسوق الخاصة بك واجعل تجربة التسوق الخاصة بك أفضل!",
                            style: theme.textTheme.headlineMedium?.copyWith(
                                color: const Color.fromARGB(73, 0, 0, 0),
                                fontSize: 15,
                                fontFamily: 'Almarai'),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: ListView(
                          children: [
                            SizedBox(height: 7.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: Text(
                                  " تحتوي سلة التسوق الخاصة بك الآن على ",
                                  style: theme.textTheme.titleLarge?.copyWith(
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(height: 6.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: Text(
                                  "${_viewcartcontroller.userList.value.viewCartTotal.toString()} أغراض ! ",
                                  style: CustomTextStyles.bodyLargeGray50001_3
                                      ?.copyWith(
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 27.v),
                            _buildFreeShippingAnd(context),
                            SizedBox(height: 29.v),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: GestureDetector(
                                  onTap: () {
                                    // if (isSelectedList[index]) {

                                    // }
                                    ArabicDeleteCartCartController()
                                        .deleteCartApiHit(
                                            DeleteCartCartControlleri
                                                .selectedCartIds);
                                  },
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),

                            _buildCartProduct(context),

                            SizedBox(height: 30.v),
                            _buildTwentyNine(context),
                            SizedBox(height: 29.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'عنوان التسليم',
                                  style: TextStyle(
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Get.to(() => addresses_arabic());
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            SizedBox(height: 14.v),
                            _buildAddress(context),
                            SizedBox(height: 29.v),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'طريقة الدفع او السداد',
                            //       style: TextStyle(
                            //           fontFamily: 'Almarai',
                            //           fontWeight: FontWeight.w600,
                            //           color: Colors.black,
                            //           fontSize: 18),
                            //     ),
                            //     GestureDetector(
                            //         onTap: () {
                            //           Get.to(Payment_Screen_arabic());
                            //         },
                            //         child: Icon(
                            //           Icons.keyboard_arrow_left,
                            //           color: Colors.black,
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(height: 15.v),
                            // _buildVisaClassic(context),
                            SizedBox(height: 29.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.h),
                                    child: Text(
                                      "رمز الكوبون",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(fontFamily: 'Almarai'),
                                    ),
                                  ),
                                ),
                                // SizedBox(width: Get.width*.09,),
                                // Container(
                                //   height: 30.v,
                                //   width: 140.h,
                                //   decoration: BoxDecoration(
                                //       borderRadius:
                                //           BorderRadius.all(Radius.circular(20)),
                                //       border: Border.all(color: Colors.black)),
                                //   margin: EdgeInsets.only(left: 23.h),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     children: [
                                //       Text(
                                //         'رمز القسيمة الخاص بك',
                                //         style: theme.textTheme.titleMedium
                                //             ?.copyWith(fontSize: 10),
                                //       ),
                                //       GestureDetector(
                                //           onTap: () {
                                //             showModalBottomSheet(
                                //                 context: context,
                                //                 builder: (context) {
                                //                   return _buildYourcouponcode(
                                //                       context);
                                //                 });
                                //           },
                                //           child: Icon(
                                //             Icons.keyboard_arrow_up_sharp,
                                //             weight: 8,
                                //           ))
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(height: 20.v),
                            _buildCouponCode(context),
                            SizedBox(height: 28.v),
                            _buildItemTotal(context),
                            SizedBox(height: 15.v),
                            if (discountprice != null)
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Item(s) discount:",
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(
                                          color: appTheme.gray90001,
                                        ),
                                      ),
                                      Text(
                                        discountprice.toString(),
                                        style: CustomTextStyles
                                            .titleMediumPrimary_1
                                            .copyWith(
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  )),

                            SizedBox(height: 15.v),
                            if (totalpriceafterdiscount != null)
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Estimated total",
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(
                                          color: appTheme.gray90001,
                                        ),
                                      ),
                                      Text(
                                        totalpriceafterdiscount.toString(),
                                        style: CustomTextStyles
                                            .titleMediumPrimary_1
                                            .copyWith(
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  )),
                            SizedBox(height: 17.v),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                  height: 40.v,
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                      color: Color(0xffff8300),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border:
                                          Border.all(color: Color(0xffff8300))),
                                  // margin: EdgeInsets.only(left: 23.h),
                                  child: Center(
                                      child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        arabiccouponid = couponidforcheckout;
                                        arabicaddress_id =
                                            arabicaddressIndexId.toString();
                                        arabicitemdiscountAmount =
                                            discountprice;
                                        arabicsubtotalamount =
                                            _viewcartcontroller
                                                .userList.value.subTotalPrice
                                                .toString();
                                        arabictotalamount = _viewcartcontroller
                                            .userList.value.totalPrice
                                            .toString();
                                      });

                                      placeordercontroller.Placeorderapihit(
                                          placeordercontroller.selectedCartIds,
                                          context);
                                    },
                                    child: Text('الدفع',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Almarai')),
                                  ))),
                            ),
                            SizedBox(height: 29.v),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Padding(
                            //     padding: EdgeInsets.only(left: 20.h),
                            //     child: Text(
                            //       "استكشف اهتماماتك",
                            //       style: theme.textTheme.titleMedium
                            //           ?.copyWith(fontFamily: 'Almarai'),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 19.v),
                            // _buildAddToCart(context),
                            // SizedBox(height: 19.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: Row(
                                  children: [
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgMaskGroup16x16,
                                      height: 16.adaptSize,
                                      width: 16.adaptSize,
                                      margin: EdgeInsets.only(bottom: 2.v),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 7.h),
                                      child: Text(
                                        "خيارات الدفع الآمنة",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffff8300),
                                            fontFamily: 'Almarai'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 318.h,
                                margin: EdgeInsets.only(
                                  left: 20.h,
                                  right: 36.h,
                                ),
                                child: Text(
                                  "وريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد. لقد كان لوريم إيبسوم هو النص الوهمي القياسي في الصناعة منذ القرن السادس عشر، عندما أخذت طابعة غير معروفة لوح الكتابة وخلطته لصنع نموذج كتاب.",
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontFamily: 'Almarai'),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: Row(
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgMaskGroup2,
                                      height: 16.adaptSize,
                                      width: 16.adaptSize,
                                      margin: EdgeInsets.only(bottom: 2.v),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 7.h),
                                      child: Text(
                                        "تأمين الخصوصية",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffff8300),
                                            fontFamily: 'Almarai'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 318.h,
                                margin: EdgeInsets.only(
                                  left: 20.h,
                                  right: 36.h,
                                ),
                                child: Text(
                                  "لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد. لقد كان لوريم إيبسوم هو النص الوهمي القياسي في هذه الصناعة.",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontFamily: 'Almarai'),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: Row(
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgMaskGroup3,
                                      height: 16.adaptSize,
                                      width: 16.adaptSize,
                                      margin: EdgeInsets.only(bottom: 2.v),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 7.h),
                                      child: Text(
                                        "محلّي حماية الشراء",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffff8300),
                                            fontFamily: 'Almarai'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 318.h,
                                margin: EdgeInsets.only(
                                  left: 20.h,
                                  right: 36.h,
                                ),
                                child: Text(
                                  "لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد. لقد كان لوريم إيبسوم هو النص الوهمي القياسي في هذه الصناعة.",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontFamily: 'Almarai'),
                                ),
                              ),
                            ),
                            SizedBox(height: 21.v),
                            // _buildListRecommended(context),
                            // // _buildCart(context),
                            // SizedBox(height: 15.v),
                            _buildHomePageSection(context),
                            SizedBox(height: 15.v),
                          ],
                        ),
                      ),
                    );
            }
          }),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFreeShippingAnd(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          color: Color.fromARGB(125, 252, 228, 236)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMaskGroup1,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 4.v,
            ),
            child: Text(
              "شحن مجاني وإرجاع مجاني",
              style: CustomTextStyles.labelLargeInterPrimarySemiBold?.copyWith(
                fontFamily: 'Almarai',
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              right: 3.h,
            ),
            child: Text(
              "وقت محدود",
              style: CustomTextStyles.bodySmallInterGray90001?.copyWith(
                fontFamily: 'Almarai',
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTrailRunningJacketBy(BuildContext context) {
    return Container(
      child: CustomTextFormField(
        readOnly: true,
        width: Get.width * .3,
        controller: trailRunningJacketByController,
        //hintText: "Dark Blue/M(38)",
        hintStyle: CustomTextStyles.bodySmallGray90001,
        suffix: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedSize,
            items: [
              'Dark Blue/M(38)',
              'Dark Blue/M(40)',
              'Dark Blue/M(42)',
              'XXL'
            ].map((String size) {
              return DropdownMenuItem<String>(
                value: size,
                child: Center(
                    child: Text(
                  size,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                )),
              );
            }).toList(),
            onChanged: (String? newSize) {
              if (newSize != null) {
                // Update selected size
                setState(() {
                  selectedSize = newSize;
                });
              }
            },
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 20.v,
        ),
        contentPadding: EdgeInsets.only(
          left: 10.h,
          top: 5.v,
          bottom: 5.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray10003,
      ),
    );
  }

  /// Section Widget
  Widget _buildCartProduct(BuildContext context) {
    return Container(
      // width: Get.width,
      height: Get.height * .3,
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: _viewcartcontroller.userList.value.viewCart?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          _viewcartcontroller.userList.value.viewCart![index].totalQty.value =
              _viewcartcontroller.userList.value.viewCart![index].totalQuantity;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath:
                        "${_viewcartcontroller.userList.value.viewCart?[index].image.toString()}",
                    height: 100.adaptSize,
                    width: 100.adaptSize,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    // margin: EdgeInsets.only(bottom: 15.v),
                  ),
                  SizedBox(
                    width: Get.width * .04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Get.width * .4,
                              // color: Colors.amberAccent,
                              child: Text(
                                "${_viewcartcontroller.userList.value.viewCart?[index].name.toString()}",
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontSize: 10),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(width: Get.width * .1),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedList[index] =
                                      !isSelectedList[index];
                                });
                                // DeleteCartCartControlleri.selectedCartIds.addIf()

                                if (!DeleteCartCartControlleri.selectedCartIds
                                        .contains(_viewcartcontroller
                                            .userList.value.viewCart?[index].id
                                            .toString()) ||
                                    !placeordercontroller.selectedCartIds
                                        .contains(_viewcartcontroller
                                            .userList.value.viewCart?[index].id
                                            .toString())) {
                                  placeordercontroller.selectedCartIds.add(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  DeleteCartCartControlleri.selectedCartIds.add(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  print(DeleteCartCartControlleri
                                      .selectedCartIds);
                                } else {
                                  placeordercontroller.selectedCartIds.remove(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  DeleteCartCartControlleri.selectedCartIds
                                      .remove(_viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  print(DeleteCartCartControlleri
                                      .selectedCartIds);
                                }
                                // // deleteCartId = _viewcartcontroller
                                // //     .userList.value.viewCart?[index].id
                                // //     .toString();

                                // print(deleteCartId);
                                // DeleteCartCartController().deleteCartApiHit();
                              },
                              child: Container(
                                height: Get.height * .03,
                                width: Get.width * .05,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0xffff8300),
                                  ),
                                  color: Colors.white,
                                ),
                                child: isSelectedList[index]
                                    ? Center(
                                        child: Container(
                                          height: Get.height * .02,
                                          width: Get.width * .03,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffff8300),
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        SizedBox(
                          width: 221.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.v),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "${_viewcartcontroller.userList.value.viewCart?[index].price.toString()}",
                                        style: theme.textTheme.titleMedium,
                                      ),
                                      TextSpan(
                                        text: " ",
                                      ),
                                      TextSpan(
                                        text:
                                            "${_viewcartcontroller.userList.value.viewCart?[index].totalPrice.toString()}",
                                        style: CustomTextStyles
                                            .titleSmallGray50001
                                            .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                width: Get.width * .2,
                                height: Get.height * .04,
                                decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder30,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        CartId = _viewcartcontroller
                                            .userList.value.viewCart![index].id
                                            .toString();
                                        // Decrement the counter when "-" is pressed
                                        _viewcartcontroller
                                            .userList
                                            .value
                                            .viewCart![index]
                                            .totalQty
                                            .value -= 1;
                                        print(_viewcartcontroller.userList.value
                                            .viewCart![index].totalQty.value);

                                        CartProductQtyIncrementCartcontroller()
                                            .addtocart_Apihit(
                                                context, index, "decrement");
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                    Center(
                                        child: Text(
                                      _viewcartcontroller.userList.value
                                          .viewCart![index].totalQty.value
                                          .toString(),
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(color: Colors.white),
                                    )),
                                    GestureDetector(
                                      onTap: () {
                                        CartId = _viewcartcontroller
                                            .userList.value.viewCart![index].id
                                            .toString();
                                        // Increment the counter when "+" is pressed
                                        _viewcartcontroller
                                            .userList
                                            .value
                                            .viewCart![index]
                                            .totalQty
                                            .value += 1;
                                        print(_viewcartcontroller.userList.value
                                            .viewCart![index].totalQty.value);

                                        CartProductQtyIncrementCartcontroller()
                                            .addtocart_Apihit(
                                                context, index, "increment");
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    return CustomTextFormField(
      readOnly: true,
      width: 98.h,
      controller: vectorController,
      hintText: "أزرق داكن/متوسط(38)",
      hintStyle: CustomTextStyles.bodySmallGray90001?.copyWith(
        fontFamily: 'Almarai',
      ),
      suffix: Container(
        margin: EdgeInsets.fromLTRB(4.h, 7.v, 10.h, 7.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgVectorGray900013x6,
          height: 3.v,
          width: 6.h,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 20.v,
      ),
      contentPadding: EdgeInsets.only(
        left: 10.h,
        top: 5.v,
        bottom: 5.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      fillColor: appTheme.gray10003,
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildTwentyNine(BuildContext context) {
    return Container(
      height: 70.v,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 8.v,
      ),
      decoration: BoxDecoration(color: Color.fromARGB(125, 252, 228, 236)),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 306.h,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                    "    لا يتم ضمان توفر السلعة وسعرها حتى يتم الدفع نهائيًا",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgInfoCircle1,
            height: 15.adaptSize,
            width: 15.adaptSize,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
              top: 6.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Obx(() {
      if (arabicaddressname.value == "" || arabicaddressIndexId == null) {
        return Center(
            child: Text(
          'Please Go and Select Address',
          style: TextStyle(color: Colors.red),
        ));
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.adaptSize,
                width: 50.adaptSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle584,
                      height: 50.adaptSize,
                      width: 50.adaptSize,
                      radius: BorderRadius.circular(
                        10.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomIconButton(
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      padding: EdgeInsets.all(3.h),
                      decoration: IconButtonStyleHelper.fillPrimaryTL10,
                      alignment: Alignment.center,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgGroup26,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * .03,
              ),
              Container(
                width: 193.h,
                margin: EdgeInsets.only(
                  left: 15.h,
                  top: 5.v,
                  bottom: 4.v,
                ),
                child: Text("${arabicaddressname.value}",
                    // "3 نيوبريدج كورت تشينو هيلز،كاليفورنيا 91709، الولايات المتحدة",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumGray9000115
                        .copyWith(height: 1.47)),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 13.v,
                  bottom: 12.v,
                ),
                child: CustomIconButton(
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  padding: EdgeInsets.all(5.h),
                  decoration: IconButtonStyleHelper.fillGreen,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheck,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  /// Section Widget
  Widget _buildVisaClassic(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 50.adaptSize,
            width: 50.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillGray,
            child: CustomImageView(
              imagePath: ImageConstant.imgGroup27,
            ),
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 4.v,
              bottom: 6.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "فيزا كلاسيك",
                  style: CustomTextStyles.titleSmall15,
                ),
                SizedBox(height: 12.v),
                Text(
                  "**** 7690",
                  style: CustomTextStyles.bodyMedium13,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 13.v,
              bottom: 12.v,
            ),
            child: CustomIconButton(
              height: 25.adaptSize,
              width: 25.adaptSize,
              padding: EdgeInsets.all(5.h),
              decoration: IconButtonStyleHelper.fillGreen,
              child: CustomImageView(
                imagePath: ImageConstant.imgCheck,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup166(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 4.v),
        child: CustomTextFormField(
          controller: group166Controller,
          hintText: "أدخل رمز القسيمة هنا",
          hintStyle: CustomTextStyles.bodyLargeOnError_1,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCouponCode(BuildContext context) {
    // void _selectCoupon(String coupon) {
    //   group166Controller.text = coupon;
    // }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: DottedBorder(
        color: theme.colorScheme.primary,
        padding: EdgeInsets.only(
          left: 1.h,
          top: 1.v,
          right: 1.h,
          bottom: 1.v,
        ),
        strokeWidth: 1.h,
        radius: Radius.circular(15),
        borderType: BorderType.RRect,
        dashPattern: [
          5,
          5,
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 16.v,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: CustomTextFormField(
                    controller: group166Controller,
                    hintText: arabiccouponcodeee.value.isNotEmpty
                        ? arabiccouponcodeee.value
                        : "Enter coupon code here",
                    hintStyle: CustomTextStyles.bodyLargeOnError_1,
                    readOnly: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  top: 3.v,
                  right: 2.h,
                ),
                child: GestureDetector(
                  // onTap: () {
                  //   if (_couponCodeController
                  //               .couponlist.value.availableCoupon ==
                  //           [] ||
                  //       _couponCodeController
                  //               .couponlist.value.availableCoupon ==
                  //           "") {
                  //     return Utils.snackBar(context, 'Oops! ',
                  //         "Looks like there are no coupons available at the moment.\n Check back later for exciting offers!");
                  //   } else {
                  //     showModalBottomSheet(
                  //         context: context,
                  //         isScrollControlled: true,
                  //         builder: (context) {
                  //           return _openCouponList(context);
                  //         });
                  //   }
                  // },
                  onTap: () {
                    if (_couponCodeController
                        .couponlist.value.availableCoupon!.isEmpty) {
                      Utils.snackBar(context, 'Oops! ',
                          "Looks like there are no coupons available at the moment.\n Check back later for exciting offers!");
                    } else {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return _openCouponList(context);
                          });
                    }
                  },
                  child: Text(
                    arabiccouponcodeee.value.isNotEmpty ? "Applied" : "Apply",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffff8300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildItemTotal(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "مجموع الاشياء:",
            style: theme.textTheme.bodyLarge?.copyWith(fontFamily: 'Almarai'),
          ),
          Text(
            "${_viewcartcontroller.userList.value.totalPrice.toString()}",
            style: CustomTextStyles.titleMediumMedium16,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1.5,
                padding: EdgeInsets.symmetric(vertical: 18.v),
                decoration: AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.v),
                              child: Text(
                                "تفاصيل الأسعار",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(fontFamily: 'Almarai'),
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
                      // SizedBox(height: 17.v),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(height: 19.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: Text(
                            "عربة التسوق (1)",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle56980x80,
                        height: Get.height * .2,
                        width: Get.width * .3,
                        radius: BorderRadius.circular(
                          5.h,
                        ),
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 20.h),
                      ),
                      SizedBox(height: 7.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$99",
                                  style: theme.textTheme.titleSmall,
                                ),
                                TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "x 1",
                                  style: CustomTextStyles.bodyMediumPrimary_1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 26.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "مجموع الاشياء:",
                          priceText: "\$99",
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "خصم السلعة:",
                          priceText: "\$20",
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "المجموع",
                          priceText: "\$218",
                        ),
                      ),
                      SizedBox(height: 27.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                              onPressed: () {
                                Get.to(() => OrderConfirmedScreen_arabic());
                              },
                              height: 40.v,
                              width: 100.h,
                              text: "الدفع",
                              margin: EdgeInsets.only(left: 10.h),
                              buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                              buttonTextStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Almarai'),
                            ),
                            Container(
                              height: 40.v,
                              width: 120.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Colors.black)),
                              margin: EdgeInsets.only(left: 23.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "المجموع \$",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Almarai'),
                                        ),
                                        TextSpan(
                                          text: " 218",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Almarai'),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Icon(Icons.keyboard_arrow_up_sharp)
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "الدفع",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontFamily: 'Almarai',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Allselected2 = !Allselected2;
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * .03,
                                    width: Get.width * .05,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xffff8300),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Allselected2
                                        ? Center(
                                            child: Container(
                                              height: Get.height * .02,
                                              width: Get.width * .03,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffff8300),
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 40.v,
        width: 120.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black)),
        margin: EdgeInsets.only(left: 23.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "المجموع \$",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Almarai'),
                  ),
                  TextSpan(
                    text: " 79",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Almarai'),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            Icon(Icons.keyboard_arrow_up_sharp)
          ],
        ),
      ),
    );
  }

  Widget _buildTrailRunningJacketBy2222(BuildContext context) {
    return Container(
      child: CustomTextFormField(
        readOnly: true,
        width: Get.width * .3,
        controller: trailRunningJacketByController,
        //hintText: "Dark Blue/M(38)",
        hintStyle: CustomTextStyles.bodySmallGray90001,
        suffix: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedSize22,
            items: [
              'Dark Blue/M(38)',
              'Dark Blue/M(40)',
              'Dark Blue/M(42)',
              'XXL'
            ].map((String size) {
              return DropdownMenuItem<String>(
                value: size,
                child: Center(
                    child: Text(
                  size,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                )),
              );
            }).toList(),
            onChanged: (String? newSize) {
              if (newSize != null) {
                // Update selected size
                setState(() {
                  selectedSize22 = newSize;
                });
              }
            },
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 20.v,
        ),
        contentPadding: EdgeInsets.only(
          right: 10.h,
          top: 5.v,
          bottom: 5.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray10003,
      ),
    );
  }

  /// Section Widget
  Widget _buildAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 40.v,
            width: 120.h,
            decoration: BoxDecoration(
                color: Color(0xffff8300),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Color(0xffff8300))),
            margin: EdgeInsets.only(left: 23.h),
            child: Center(
                child: Text('الدفع',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Almarai')))),
        _buildCheckout(context),

        Row(
          children: [
            Text(
              'الدفع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Almarai',
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Allselected = !Allselected;
                });
              },
              child: Container(
                height: Get.height * .03,
                width: Get.width * .05,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                ),
                child: Allselected
                    ? Center(
                        child: Container(
                          height: Get.height * .02,
                          width: Get.width * .03,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ],
        )
        //  Padding(
        //   padding: EdgeInsets.symmetric(vertical: 11.v),
        //   child:
        // CustomRadioButton(
        //     text: "all",
        //     value: "الدفع",
        //     groupValue: radioGroup2,
        //     padding: EdgeInsets.symmetric(vertical: 1.v),
        //     textStyle:  TextStyle(fontSize: 5, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255),fontFamily: 'Almarai'),
        //     onChange: (value) {
        //       radioGroup2 = value;
        //     },
        //   ),
        // ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAddtoCart(BuildContext context) {
    return Container(
      width: 140.h,
      height: 45.v,
      padding: EdgeInsets.symmetric(
        horizontal: 26.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.outlineErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder35,
      ),
      child: Center(
        child: Text(
          "Add to Cart",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );

    //   Container(
    //   width: 120.h,
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 26.h,
    //     vertical: 9.v,
    //   ),
    //   decoration: AppDecoration.outlineErrorContainer.copyWith(
    //     borderRadius: BorderRadiusStyle.roundedBorder15,
    //   ),
    //   child: Text(
    //     "Add to Cart",
    //     style: CustomTextStyles.bodyMediumGray90001_1,
    //   ),
    // )

    //   CustomTextFormField(
    //   width: 120.h,
    //   controller: addtoCartController,
    //   hintText: "Add to Cart",
    //   hintStyle: CustomTextStyles.bodyMediumGray90001_1,
    //   textInputAction: TextInputAction.done,
    //   contentPadding: EdgeInsets.symmetric(
    //     horizontal: 26.h,
    //     vertical: 9.v,
    //   ),
    //   borderDecoration: TextFormFieldStyleHelper.outlineErrorContainer,
    //   filled: false,
    // )
  }

  Widget _buildAddToCart(BuildContext context) {
    return Obx(() {
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return homeView_controller.userList.value.categoryData == null ||
                homeView_controller.userList.value.categoryData?.length == 0
            ? Center(child: Text('Error: ${homeView_controller.error.value}'))
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: Get.height * .3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: homeView_controller
                            .userList.value.recommendedProduct?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        fit: BoxFit.cover,
                                        imagePath:
                                            "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                                        height: 120.adaptSize,
                                        width: 120.adaptSize,
                                        radius: BorderRadius.circular(
                                          10.h,
                                        ),
                                      ),
                                      SizedBox(height: 9.v),
                                      Text(
                                        //"${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
                                        "حجر الراين الفاخر....",
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(fontFamily: 'Almarai'),
                                      ),
                                      SizedBox(height: 1.v),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.v),
                                            child: CustomRatingBar(
                                              initialRating: 5,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text(
                                              "(120)",
                                              style: CustomTextStyles
                                                  .labelMediumGray90001,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2.v),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "2k+ مُباع",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontFamily: 'Almarai'),
                                            ),
                                            TextSpan(
                                              text: " ",
                                            ),
                                            TextSpan(
                                              text: "99\$",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xffff8300),
                                                  fontFamily: 'Almarai'),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 15.v),
                                      Container(
                                        width: 100.h,
                                        height: 30.v,
                                        // padding: EdgeInsets.symmetric(
                                        //   horizontal: 26.h,
                                        //   vertical: 9.v,
                                        // ),
                                        decoration: AppDecoration
                                            .outlineErrorContainer
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder35,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add to Cart",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ])),
                      );
                    },
                  ),
                ));
      }
    });
  }

  /// Section Widget

  Widget _buildListRecommended(BuildContext context) {
    return Container(
      height: Get.height * .05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recomemded_text.length,
        itemBuilder: (context, index) {
          bool isSelected = index ==
              selectedTabIndex; // Assuming you have a variable to track the selected tab index

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    recomemded_text[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w400,
                      fontFamily: 'Almarai',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 32.0, // Adjust this height as needed
        child: ListView.separated(
          padding: EdgeInsets.only(left: 20.0), // Adjust this padding as needed
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.0, // Adjust this width as needed
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            bool isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 70.0, // Adjust this width as needed
                  padding: EdgeInsets.symmetric(
                    horizontal: 17.0, // Adjust this padding as needed
                    vertical: 8.0, // Adjust this padding as needed
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xffff8300) : Colors.grey[10003],
                    border: Border.all(
                        color: isSelected ? Color(0xffff8300) : Colors.black),
                    // Adjust the colors as needed
                    borderRadius: BorderRadius.circular(
                        15.0), // Adjust the border radius as needed
                  ),
                  child: Center(
                    child: Text(
                      "S(36)",
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.black, // Adjust the text color as needed
                        fontSize: 10.0, // Adjust the font size as needed
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCart(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 38.v,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 20.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 20.h,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 112.h,
              height: Get.height,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "مُستَحسَن",
                  style: theme.textTheme.titleMedium,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHomePageSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
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
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  // padding: EdgeInsets.only(right: 10, left: 10),
                  // height: 160.adaptSize,
                  // width: 160.adaptSize,
                  // height: Get.height*.2,
                  // width: Get.width*.3,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: CustomImageView(
                          fit: BoxFit.cover,
                          imagePath:
                              "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                          onTap: () {
                            arabicMainCatId = homeView_controller.userList.value
                                .recommendedProduct![index].mainCategoryId!
                                .toString();
                            String? ProductId = homeView_controller
                                .userList.value.recommendedProduct![index].id!
                                .toString();

                            setState(() {
                              MainCatId = arabicMainCatId;
                              productid = ProductId;
                            });
                            print("$productid==");
                            print("$arabicMainCatId==");
                            if (arabicMainCatId == "153") {
                              Get.to(ArabicMensSingleShirtViewScreen());
                              print(
                                  "$arabicMainCatId===========Mens Appearl main category id ");
                            } else if (arabicMainCatId == "154") {
                              Get.to(ArabicMensBottomSingleShViewScreen());
                            } else if (arabicMainCatId == "155") {
                              Get.to(ArabicMensJacketSingleShViewScreen());
                            } else if (arabicMainCatId == "156") {
                              Get.to(ArabicMensActivewearSingleShViewScreen());
                            } else if (arabicMainCatId == "157") {
                              Get.to(ArabicMensFormalsSingleShViewScreen());
                            } else if (arabicMainCatId == "174") {
                              Get.to(ArabicMensShoesSingleShViewScreen());
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
                              Arabic_Add_remove_productid = homeView_controller
                                  .userList.value.recommendedProduct![index].id!
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
                            decoration: IconButtonStyleHelper.fillWhiteA,
                            alignment: Alignment.topRight,
                            child: CustomImageView(
                              imagePath: isButtonTappedList[index]
                                  ? ImageConstant
                                      .imgGroup239531 // Change this to your tapped image
                                  : ImageConstant.imgSearch, // Default image
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
                    "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: CustomRatingBar(
                                  ignoreGestures: true,
                                  initialRating: homeView_controller.userList
                                      .value.recommendedProduct?[index].rating
                                      ?.toDouble(),
                                ),
                              ),
                              Text(
                                "${homeView_controller.userList.value.recommendedProduct?[index].rating.toString()}",
                                // "4.8",
                                style: theme.textTheme.labelMedium
                                    ?.copyWith(fontFamily: 'Almarai'),
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
                              "${homeView_controller.userList.value.recommendedProduct?[index].pricee.toString()}",
                              //"\$99 ",
                              style: CustomTextStyles.titleMediumPrimary_2
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
                          arabicMainCatId = homeView_controller.userList.value
                              .recommendedProduct?[index].mainCategoryId
                              .toString();
                          String? arproductId = homeView_controller
                              .userList.value.recommendedProduct?[index].id
                              ?.toString();

                          setState(() {
                            MainCatId = arabicMainCatId;
                            productid = arproductId;
                          });
                          print("$productid==");
                          print("$arabicMainCatId==");
                          if (arabicMainCatId == "153") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensShirt(context,
                                          arabicMainCatId, arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "154") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensBottoms(context,
                                          arabicMainCatId, arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "155") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensJacket(context,
                                          arabicMainCatId, arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "156") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
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
                            });
                          } else if (arabicMainCatId == "157") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensFormals(context,
                                          arabicMainCatId, arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "174") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartmensShoes_view(
                                          context,
                                          arabicMainCatId,
                                          arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "166") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartelectronicsPhone(
                                          context,
                                          arabicMainCatId,
                                          arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "170") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartelectronicsLaptop(
                                          context,
                                          arabicMainCatId,
                                          arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "171") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartelectronicsHeadphones(
                                          context,
                                          arabicMainCatId,
                                          arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "172") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartelectronicsCamera(
                                          context,
                                          arabicMainCatId,
                                          arproductId);
                                    });
                              }
                            });
                          } else if (arabicMainCatId == "173") {
                            productviewcontroller.Single_ProductApiHit();
                            Timer(Duration(seconds: 2), () {
                              if (productviewcontroller.rxRequestStatus.value ==
                                  Status.COMPLETED) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return _buildAddtocartelectronicsWarable(
                                          context,
                                          arabicMainCatId,
                                          arproductId);
                                    });
                              }
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
      ),
    );
  }

  Widget buildAvatarColumn() {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            "assets/images/img_ellipse_1.png",
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Text(
          "إلكترونيات",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Almarai',
          ),
        ),
      ],
    );
  }

  /// Common widget

  /// Common widget

  /// Common widget
  Widget _buildPaymentMethod(
    BuildContext context, {
    required String paymentMethodText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          paymentMethodText,
          style: theme.textTheme.titleMedium!.copyWith(
            color: appTheme.gray90001,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildTotal(
    BuildContext context, {
    required String total,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          total,
          style: theme.textTheme.titleMedium!.copyWith(
            color: appTheme.gray90001,
          ),
        ),
        Text(
          price,
          style: CustomTextStyles.titleMediumPrimary_1.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildItemDiscount(
    BuildContext context, {
    required String itemDiscountText,
    required String priceText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemDiscountText,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.gray90001,
          ),
        ),
        Text(
          priceText,
          style: CustomTextStyles.titleMediumMedium16.copyWith(
            color: Color(0xffFF8300),
          ),
        ),
      ],
    );
  }

  Widget _openCouponList(
    BuildContext context,
  ) {
    return Container(
      constraints: BoxConstraints(maxHeight: 350),
      child: Container(
        height: double.infinity,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical: 18.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child:
            // _couponCodeController.couponlist.value.availableCoupon == "" ||
            //         _couponCodeController.couponlist.value.availableCoupon ==
            //             null ||
            //         _couponCodeController.couponlist.value.availableCoupon == []
            //     ? Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           // Image.asset('assets/images/nocoupon.png'),
            //           Text(
            //             "No Coupon Available",
            //             style: theme.textTheme.headlineMedium?.copyWith(
            //                 color: Color.fromARGB(73, 0, 0, 0), fontSize: 20),
            //           ),
            //         ],
            //       )
            Column(
          children: [
            // Obx(() {
            //   if (_couponCodeController.couponlist.value.availableCoupon ==
            //           null ||
            //       _couponCodeController.couponlist.value.availableCoupon ==
            //           "") {
            //     return Center(
            //         child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Image.asset('assets/images/nocoupon.png'),
            //         Text(
            //           "No Coupon Available",
            //           style: theme.textTheme.headlineMedium?.copyWith(
            //               color: Color.fromARGB(73, 0, 0, 0), fontSize: 20),
            //         ),
            //       ],
            //     ));
            // } else {
            ListView.builder(
                itemCount: _couponCodeController
                        .couponlist.value.availableCoupon?.length ??
                    0,
                itemExtent: 90,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: Get.height * .15,
                    width: Get.width * .5,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(52, 158, 158, 158),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height * .15,
                          width: Get.width * .2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            color: Color(0xffff8300),
                          ),
                          child: Center(
                            child: Text(
                              "${_couponCodeController.couponlist.value.availableCoupon?[index].amount}",
                              style: theme.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.white, fontSize: 45),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .06,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_couponCodeController.couponlist.value.availableCoupon?[index].type}",
                              style: theme.textTheme.subtitle1,
                            ),
                            Text(
                              "${_couponCodeController.couponlist.value.availableCoupon?[index].code}",
                              style: theme.textTheme.subtitle2,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Get.width * .08,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "تنتهي صلاحيته عند: ${_couponCodeController.couponlist.value.availableCoupon?[index].expireAt}",
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: Colors.grey.shade400),
                            ),
                            Gap(5),
                            CustomElevatedButton(
                              height: 40.v,
                              width: 100.h,
                              text: "Apply",
                              margin: EdgeInsets.only(left: 8.h),
                              buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeWhiteA70002_1,
                              onPressed: () {
                                String? couponid = _couponCodeController
                                    .couponlist.value.availableCoupon![index].id
                                    .toString();
                                String? totalAmount = _viewcartcontroller
                                    .userList.value.subTotalPrice
                                    .toString();
                                arabiccouponcodeee.value = _couponCodeController
                                    .couponlist
                                    .value
                                    .availableCoupon?[index]
                                    .code;

                                print(couponid);
                                print(totalAmount);
                                setState(() {
                                  CouponId = couponid;
                                  TotalAmount = totalAmount;
                                  Timer(Duration(seconds: 3), () {
                                    setState(() {
                                      discountprice;
                                    });
                                  });
                                });

                                CouponCodeApplyController()
                                    .applyCoupon_apihit(context);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })
            //   }
            // }),
          ],
        ),
      ),
    );
  }

  Widget _buildAddtocartmensShirt(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.ShirtandTops_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.v),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                              "${productviewcontroller.ShirtandTops_userlist.value.productView?.aTitle.toString()}",
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
                              "${productviewcontroller.ShirtandTops_userlist.value.productView?.aDescription.toString()}",
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
                                                      '${productviewcontroller.ShirtandTops_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.ShirtandTops_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .ShirtandTops_userlist
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
                                                            .Color ??
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                                                  child: Center(
                                                    child: Obx(
                                                      () => Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedSizeIndex
                                                                      .value ==
                                                                  index
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                                  .ShirtandTops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .ShirtandTops_userlist
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
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .ShirtandTops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .ShirtandTops_userlist
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
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .ShirtandTops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .ShirtandTops_userlist
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
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .ShirtandTops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensJacket(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.jacket_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.jacket_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.jacket_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .jacket_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .jacket_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .jacket_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .jacket_userlist
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
                                                    .jacket_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .jacket_userlist
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
                                                            .jacket_userlist
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                                  .jacket_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .jacket_userlist
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
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .jacket_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .jacket_userlist
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
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .jacket_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .jacket_userlist
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
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .jacket_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.activewear_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
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
                                                      '${productviewcontroller.activewear_userlist.value.productView!.productDetails!.details?[index].price}',
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .activewear_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensFormals(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.formal_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.formal_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.formal_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .formal_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .formal_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .formal_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .formal_userlist
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
                                                    .formal_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .formal_userlist
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
                                                            .formal_userlist
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                                  .formal_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .formal_userlist
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
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .formal_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .formal_userlist
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
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .formal_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .formal_userlist
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
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .formal_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsWarable(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.wearable_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.wearable_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.wearable_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                            height: Get.height * .2,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .wearable_userlist
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

                                      SizedBox(height: Get.height * .02),

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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .wearable_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .wearable_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .wearable_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details?[index]
                                    .Model;

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
                                                    .wearable_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .wearable_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details?[index]
                                                          .Model ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .wearable_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .ModelId
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .wearable_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .wearable_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartModelId =
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
                                        child: arabic_addtocart_controller()
                                                    .loading
                                                    .value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  "Add to cart ",
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsPhone(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.smartphone_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.smartphone_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.smartphone_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .smartphone_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .smartphone_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .smartphone_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .smartphone_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details?[index]
                                    .Model;

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
                                                    .smartphone_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .smartphone_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details?[index]
                                                          .Model ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .smartphone_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .ModelId
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .smartphone_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .smartphone_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartModelId =
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsCamera(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.camera_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.camera_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.camera_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .camera_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .camera_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .camera_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .camera_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details?[index]
                                    .Model;

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
                                                    .camera_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .camera_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details?[index]
                                                          .Model ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .camera_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .ModelId
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .camera_userlist
                                                  .value
                                                  .productView
                                                  ?.productDetails
                                                  ?.details?[index]
                                                  .price
                                                  .toString();
                                          ArabicAddtocartModelId =
                                              sizeid.toString();
                                          arabic_addtocart_controller()
                                              .addtocart_Apihit(context);
                                        }
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .camera_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartModelId =
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsHeadphones(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.headphones_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.headphones_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.headphones_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .headphones_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .headphones_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .headphones_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .headphones_userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details?[index]
                                    .Model;

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
                                                    .headphones_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .headphones_userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details?[index]
                                                          .Model ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    selectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .headphones_userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details?[index]
                                                            .ModelId
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .headphones_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .headphones_userlist
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
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .headphones_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .headphones_userlist
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
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .headphones_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .headphones_userlist
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
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .headphones_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartelectronicsLaptop(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.laptops_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.laptops_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.laptops_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .laptops_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .laptops_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .laptops_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .laptops_userlist
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
                                                    .laptops_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .laptops_userlist
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
                                                            .laptops_userlist
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .laptops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .laptops_userlist
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
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Model');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .laptops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .laptops_userlist
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
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .laptops_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .laptops_userlist
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
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .laptops_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensBottoms(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.Bottom_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
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
                                                      '${productviewcontroller.Bottom_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.Bottom_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .Bottom_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .Bottom_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .Bottom_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .Bottom_userlist
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
                                                    .Bottom_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .Bottom_userlist
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
                                                            .Bottom_userlist
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                                  .Bottom_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .Bottom_userlist
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
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .Bottom_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .Bottom_userlist
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
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .Bottom_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .Bottom_userlist
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
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .Bottom_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddtocartmensShoes_view(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: Get.height * .4,
                                width: Get.width,
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  imagePath: selectedImageUrl.value.isNotEmpty
                                      ? selectedImageUrl.value
                                      : "${productviewcontroller.mensshoes_userlist.value.productView!.imageUrl.toString()}",
                                  height: 504.v,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.v),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                              "${productviewcontroller.mensshoes_userlist.value.productView?.aTitle.toString()}",
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
                              "${productviewcontroller.mensshoes_userlist.value.productView?.aDescription.toString()}",
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
                                                      '${productviewcontroller.mensshoes_userlist.value.productView!.productDetails!.details?[index].price}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      // '${productviewcontroller.mensshoes_userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                color = productviewcontroller
                                    .mensshoes_userlist
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
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .mensshoes_userlist
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
                                                      selectedcolorIndex.value =
                                                          index;
                                                      colorId =
                                                          productviewcontroller
                                                              .mensshoes_userlist
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: selectedcolorIndex
                                                                        .value ==
                                                                    index
                                                                ? Colors.orange
                                                                : Colors.grey,
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
                                                              style: TextStyle(
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
                          Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .mensshoes_userlist
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
                                                    .mensshoes_userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .mensshoes_userlist
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
                                                            .mensshoes_userlist
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
                                                              ? Colors.orange
                                                              : Colors.grey,
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
                                                  .mensshoes_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .mensshoes_userlist
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
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .mensshoes_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .mensshoes_userlist
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
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          Utils.snackBar(context, 'Failed',
                                              'Please Select Color');
                                        } else {
                                          Arabiccartproductid =
                                              productviewcontroller
                                                  .mensshoes_userlist
                                                  .value
                                                  .productView
                                                  ?.id
                                                  .toString();
                                          ArabicAddtocartColor =
                                              colorId.toString();
                                          ArabicAddtocartprice =
                                              productviewcontroller
                                                  .mensshoes_userlist
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
                                      } else {
                                        Arabiccartproductid =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.id
                                                .toString();
                                        ArabicAddtocartColor =
                                            colorId.toString();
                                        ArabicAddtocartprice =
                                            productviewcontroller
                                                .mensshoes_userlist
                                                .value
                                                .productView
                                                ?.productDetails
                                                ?.details?[index]
                                                .price
                                                .toString();
                                        ArabicAddtocartSize = sizeid.toString();
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
                                              color: Colors.orange,
                                              width: 2,
                                            ),
                                            color: Colors.orange),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("مقاس", style: theme.textTheme.titleMedium),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text("دليل المقاسات",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.grey, fontFamily: 'Almarai')),
            ),
          ],
        ),
      ),
    );
  }
}
