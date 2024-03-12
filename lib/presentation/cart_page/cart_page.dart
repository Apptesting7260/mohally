// ignore_for_file: unused_import
import 'dart:async';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/home_page_one_page.dart';
import 'package:mohally/presentation/order_confirmed_screen/order_confirmed_screen.dart';
import 'package:mohally/presentation/payment_screen/payment_screen.dart';
import 'package:mohally/presentation/price_details_bottomsheet/price_details_bottomsheet.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/AudioSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/CameraSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/LaptopsSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/SmartPhonesSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/WearableSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ActivewearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/Bottoms_single_view.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/JacketandOutwearSingleViewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/MensShoesSingleviewScreen.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ShirtAndTopsSingleView.dart';
import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/SuitsandFormalsSingleVoewScreen.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/AddressViewController/address_view_controller.dart';
import 'package:mohally/view_models/controller/ApplyCouponCodeController/applycouponcodecontroller.dart';
import 'package:mohally/view_models/controller/Cart/DeleteCartController.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/Cart/EnglishViewCartController.dart';
import 'package:mohally/view_models/controller/Cart/ProductQtyUpdateController/cartproductqtyUpdateController.dart';
import 'package:mohally/view_models/controller/CouponController/couponcodeController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/PlaceOrderController/paceOrderController.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import '../cart_page/widgets/cart1_item_widget.dart';
import '../cart_page/widgets/cart_item_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_title.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_radio_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

String? totalAmount;
RxString couponcodeee = "".obs;

// ignore_for_file: must_be_immutable
class CartPage extends StatefulWidget {
  CartPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _refreshing = false;

  Future<void> _refresh() async {
    setState(() {
      _refreshing = true;
    });

    // Simulate a refresh delay
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _refreshing = false;
    });
  }

  bool Allselected = false;
  bool Allselected2 = false;
  final DeleteCartCartControlleri = Get.put(DeleteCartCartController());
  final Qtycontroller = Get.put(CartProductQtyIncrementCartcontroller());
  TextEditingController addtoCartController = TextEditingController();
  bool allSelected = false;
  CouponCodeApplyController applydiscountcontroller =
      CouponCodeApplyController();

  int counter = 1;
  int counter2 = 1;
  TextEditingController group166Controller = TextEditingController();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();

  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  List<bool> isSelectedList = List.generate(100, (index) => false);
  PlaceOrdercontroller placeordercontroller = PlaceOrdercontroller();
  List<String> recomemded_text = [
    'Recommended',
    'Recommended',
    'Recommended',
    'Recommended',
    'Recommended',
  ];

  int selectedIndex = 0;
  String? selectedSize;
  String selectedSize22 = "Dark Blue/M(38)";
  int selectedTabIndex = 0;
  List<bool> tappedList = List.generate(200, (index) => false);
  TextEditingController trailRunningJacketByController =
      TextEditingController();

  TextEditingController vectorController = TextEditingController();
  Englishuseraddressviewcontroller viewaddresscontroller =
      Englishuseraddressviewcontroller();

  CouponCodeController _couponCodeController = CouponCodeController();
  CartProductQtyIncrementCartcontroller _qtyupdatecontroller =
      CartProductQtyIncrementCartcontroller();

  EnglishViewCart _viewcartcontroller = EnglishViewCart();

  @override
  void initState() {
    super.initState();
    setInitialLocale();

    _viewcartcontroller.Viewcart_apihit();
    homeView_controller.homeview_apihit();
    _couponCodeController.fetchMycouponData();
  }

  void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }

  /// Section Widget

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: _refreshing
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Obx(() {
                    if (_viewcartcontroller.rxRequestStatus.value ==
                        Status.LOADING) {
                      return Center(child: CircularProgressIndicator());
                    } else if (_viewcartcontroller.rxRequestStatus.value ==
                        Status.ERROR) {
                      return Center(
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
                                color: Color.fromARGB(73, 0, 0, 0),
                                fontSize: 12),
                          ),
                        ],
                      ));
                    } else {
                      return _viewcartcontroller.userList.value.viewCart ==
                                  null ||
                              _viewcartcontroller
                                      .userList.value.viewCart!.length ==
                                  0
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
                                  padding:
                                      const EdgeInsets.fromLTRB(70, 0, 40, 0),
                                  child: Text(
                                    "Your cart is currently empty.\n Start adding items to your cart and make your shopping experience even better!",
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(
                                            color: const Color.fromARGB(
                                                73, 0, 0, 0),
                                            fontSize: 15),
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
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: Text(
                                          " Your shopping cart now contains ",
                                          style: theme.textTheme.labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 6.v),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: Text(
                                          "${_viewcartcontroller.userList.value.viewCartTotal.toString()}  items! ",
                                          style: CustomTextStyles
                                              .bodyLargeGray50001_3
                                              ?.copyWith(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 27.v),
                                    _buildFreeShippingAnd(context),
                                    SizedBox(height: 29.v),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: GestureDetector(
                                          onTap: () {
                                            // if (isSelectedList[index]) {

                                            // }
                                            DeleteCartCartController()
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
                                    // SizedBox(height: 29.v),
                                    // _buildTrailRunningJacket1(context),
                                    SizedBox(height: 30.v),
                                    _buildTwentyNine(context),
                                    SizedBox(height: 29.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Delivery address',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Get.to(() => Default_address());
                                            },
                                            child: Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 14.v),
                                    _buildAddress(context),
                                    SizedBox(height: 29.v),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       'Payment or payment method',
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.w600,
                                    //           color: Colors.black,
                                    //           fontSize: 18),
                                    //     ),
                                    //     GestureDetector(
                                    //         onTap: () {
                                    //           Get.to(PaymentScreen());
                                    //         },
                                    //         child: Icon(
                                    //           Icons.keyboard_arrow_right,
                                    //           color: Colors.black,
                                    //         )),
                                    //   ],
                                    // ),
                                    // SizedBox(height: 15.v),
                                    // _buildVisaClassic(context),
                                    // SizedBox(height: 29.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: Text(
                                              "coupon code",
                                              style:
                                                  theme.textTheme.titleMedium,
                                            ),
                                          ),
                                        ),
                                        // SizedBox(width: Get.width*.08,),
                                        // Container(
                                        //   height: 30.v,
                                        //   width: 120.h,
                                        //   decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(20)),
                                        //       border:
                                        //           Border.all(color: Colors.black)),
                                        //   margin: EdgeInsets.only(left: 23.h),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.center,
                                        //     // crossAxisAlignment:
                                        //     //     CrossAxisAlignment.center,
                                        //     children: [
                                        //       Text(
                                        //         'Your Coupon Code',
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Item(s) discount:",
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                  color: appTheme.gray90001,
                                                ),
                                              ),
                                              Text(
                                                discountprice.toString(),
                                                style: CustomTextStyles
                                                    .titleMediumPrimary_1
                                                    .copyWith(
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                              ),
                                            ],
                                          )),

                                    SizedBox(height: 15.v),
                                    if (totalpriceafterdiscount != null)
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Estimated total",
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                  color: appTheme.gray90001,
                                                ),
                                              ),
                                              Text(
                                                totalpriceafterdiscount
                                                    .toString(),
                                                style: CustomTextStyles
                                                    .titleMediumPrimary_1
                                                    .copyWith(
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                              ),
                                            ],
                                          )),
                                    SizedBox(height: 17.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Container(
                                          height: 40.v,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              color: Color(0xffff8300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                          // margin: EdgeInsets.only(left: 23.h),
                                          child: Center(
                                              child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                couponid = couponidforcheckout;
                                                address_id =
                                                    addressIndexId.toString();
                                                itemdiscountAmount =
                                                    discountprice;
                                                subtotalamount =
                                                    _viewcartcontroller.userList
                                                        .value.subTotalPrice
                                                        .toString();
                                                totalamount =
                                                    _viewcartcontroller.userList
                                                        .value.totalPrice
                                                        .toString();
                                              });

                                              placeordercontroller
                                                  .Placeorderapihit(
                                                      placeordercontroller
                                                          .selectedCartIds,
                                                      context);
                                            },
                                            child: Text('Checkout',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                )),
                                          ))),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //   child: Container(
                                    //     height: 40.v,
                                    //     width: 100.h,
                                    //     decoration: BoxDecoration(
                                    //       color: Color(0xffff8300),
                                    //       borderRadius:
                                    //           BorderRadius.all(Radius.circular(20)),
                                    //       border:
                                    //           Border.all(color: Color(0xffff8300)),
                                    //     ),
                                    //     child: Center(
                                    //       child: GestureDetector(
                                    //         onTap: () {
                                    //           print(
                                    //               "address_id: $address_id"); // Debugging statement
                                    //           if (address_id == null) {
                                    //             print(
                                    //                 "Address ID is null."); // Debugging statement
                                    //             Utils.snackBar(context, 'Failed',
                                    //                 'Please select a delivery address to proceed with checkout');
                                    //             return;
                                    //           }
                                    //           print(
                                    //               "addressIndexId: $addressIndexId"); // Debugging statement
                                    //           setState(() {
                                    //             couponid = couponidforcheckout;
                                    //             address_id =
                                    //                 addressIndexId.toString();
                                    //             itemdiscountAmount = discountprice;
                                    //             subtotalamount = _viewcartcontroller
                                    //                 .userList.value.subTotalPrice
                                    //                 .toString();
                                    //             totalamount = _viewcartcontroller
                                    //                 .userList.value.totalPrice
                                    //                 .toString();
                                    //           });
                                    //           print(
                                    //               "Before calling Placeorderapihit."); // Debugging statement
                                    //           placeordercontroller.Placeorderapihit(
                                    //               placeordercontroller
                                    //                   .selectedCartIds,
                                    //               context);
                                    //           print(
                                    //               "After calling Placeorderapihit."); // Debugging statement
                                    //         },
                                    //         child: Text(
                                    //           'Checkout',
                                    //           style: TextStyle(
                                    //             fontSize: 14,
                                    //             fontWeight: FontWeight.w600,
                                    //             color: Colors.white,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),

                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    //   child: _buildAll(context),
                                    // ),
                                    SizedBox(height: 29.v),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20.h),
                                        child: Text(
                                          "Explore your interests",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 19.v),
                                    _buildAddToCart(context),
                                    SizedBox(height: 19.v),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20.h),
                                        child: Row(
                                          children: [
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgMaskGroup16x16,
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin:
                                                  EdgeInsets.only(bottom: 2.v),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 7.h),
                                              child: Text(
                                                "secure payment options",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffff8300),
                                                ),
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
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a form book.",
                                          maxLines: 6,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
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
                                              imagePath:
                                                  ImageConstant.imgMaskGroup2,
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin:
                                                  EdgeInsets.only(bottom: 2.v),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 7.h),
                                              child: Text(
                                                "privacy insurance",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffff8300),
                                                ),
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
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
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
                                              imagePath:
                                                  ImageConstant.imgMaskGroup3,
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin:
                                                  EdgeInsets.only(bottom: 2.v),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 7.h),
                                              child: Text(
                                                "Secure Privacy",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffff8300),
                                                ),
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
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 21.v),
                                    _buildListRecommended(context),
                                    // _buildCart(context),
                                    SizedBox(height: 15.v),
                                    _buildCart1(context),
                                    SizedBox(height: 2.v),
                                  ],
                                ),
                              ),
                            );
                    }
                  })),
      ),
    );
  }

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
              "Free shipping and free returns",
              style:
                  CustomTextStyles.labelLargeInterPrimarySemiBold?.copyWith(),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              right: 3.h,
            ),
            child: Text(
              "limited time",
              style: CustomTextStyles.bodySmallInterGray90001?.copyWith(),
            ),
          ),
        ],
      ),
    );
  }

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
                    margin: EdgeInsets.only(bottom: 15.v),
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
      hintStyle: CustomTextStyles.bodySmallGray90001?.copyWith(),
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
  // Widget _buildTrailRunningJacket1(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 10.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CustomImageView(
  //           imagePath: ImageConstant.imgRectangle569100x100,
  //           height: 100.adaptSize,
  //           width: 100.adaptSize,
  //           radius: BorderRadius.circular(
  //             10.h,
  //           ),
  //           margin: EdgeInsets.only(bottom: 15.v),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(left: 14.h),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               SizedBox(height: 20),
  //               Row(
  //                 children: [
  //                   Text(
  //                     "Nike running jacket...",
  //                     style: theme.textTheme.titleSmall?.copyWith(),
  //                   ),
  //                   SizedBox(width: Get.width * .2),
  //                   GestureDetector(
  //                     onTap: () {
  //                       setState(() {
  //                         isSelected = !isSelected;
  //                       });
  //                     },
  //                     child: Container(
  //                       height: Get.height * .03,
  //                       width: Get.width * .05,
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         border: Border.all(
  //                           width: 2,
  //                           color: Color(0xffff8300),
  //                         ),
  //                         color: Colors.white,
  //                       ),
  //                       child: isSelected
  //                           ? Center(
  //                               child: Container(
  //                                 height: Get.height * .02,
  //                                 width: Get.width * .03,
  //                                 decoration: BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                   color: Color(0xffff8300),
  //                                 ),
  //                               ),
  //                             )
  //                           : null,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               // CustomRadioButton(
  //               //   width: 221.h,
  //               //   text: "سترة الجري من نايك...",
  //               //   value: "سترة الجري من نايك...",
  //               //   groupValue: radioGroup1,
  //               //   textStyle: theme.textTheme.titleSmall?.copyWith(),
  //               //   isRightCheck: true,
  //               //   onChange: (value) {
  //               //     radioGroup1 != value;
  //               //   },
  //               // ),
  //               SizedBox(height: 9.v),
  //               _buildTrailRunningJacketBy(context),
  //               SizedBox(height: 9.v),
  //               Text(
  //                 "Black Friday! Ends at 16:19:50:21",
  //                 style: CustomTextStyles.labelLargePrimary?.copyWith(),
  //               ),
  //               SizedBox(height: 6.v),
  //               _buildprice_2(
  //                 context,
  //                 price: "\$99 \$120",
  //                 one: "1",
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 306.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                    "The availability and price of the item are not guaranteed until final payment is made.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
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
      if (addressname.value == "" || addressIndexId == null) {
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
                child: Text("${addressname.value}",
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
                  "Visa Classic",
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

  /// Section Widget
  // Widget _buildCouponCode(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 20.h),
  //     decoration: AppDecoration.outlinePrimary.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder15,
  //     ),
  //     child: DottedBorder(
  //       color: theme.colorScheme.primary,
  //       padding: EdgeInsets.only(
  //         left: 1.h,
  //         top: 1.v,
  //         right: 1.h,
  //         bottom: 1.v,
  //       ),
  //       strokeWidth: 1.h,
  //       radius: Radius.circular(15),
  //       borderType: BorderType.RRect,
  //       dashPattern: [
  //         5,
  //         5,
  //       ],
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 15.h,
  //           vertical: 16.v,
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Expanded(
  //               child: Padding(
  //                 padding: EdgeInsets.only(top: 4.v),
  //                 child: CustomTextFormField(
  //                   controller: group166Controller,
  //                   hintText: "Enter coupon code here",
  //                   hintStyle: CustomTextStyles.bodyLargeOnError_1,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(
  //                 left: 12.h,
  //                 top: 3.v,
  //                 right: 2.h,
  //               ),
  //               child: Text("Apply",
  //                   style: TextStyle(
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.w600,
  //                       color: Color(0xffff8300))),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
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
                    hintText: couponcodeee.value.isNotEmpty
                        ? couponcodeee.value
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
                    couponcodeee.value.isNotEmpty ? "Applied" : "Apply",
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
                              "Expire At: ${_couponCodeController.couponlist.value.availableCoupon?[index].expireAt}",
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
                                couponcodeee.value = _couponCodeController
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
            "Item(s) total:",
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            "${_viewcartcontroller.userList.value.totalPrice.toString()}",
            style: CustomTextStyles.titleMediumMedium16,
          ),
        ],
      ),
    );
  }

  Widget _buildYourcouponcode(BuildContext context) {
    return _couponCodeController.couponlist.value.availableCoupon == null ||
            _couponCodeController.couponlist.value.availableCoupon!.isEmpty
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1.5,
              padding: EdgeInsets.symmetric(vertical: 18.v),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL30,
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/nocoupon.png'),
                  Text(
                    "No Coupon Available",
                    style: theme.textTheme.headlineMedium?.copyWith(
                        color: Color.fromARGB(73, 0, 0, 0), fontSize: 20),
                  ),
                ],
              )),
            ),
          )
        : Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.5,
            padding: EdgeInsets.symmetric(vertical: 18.v),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.v),
                          child: Text(
                            "Your Promo Codes",
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
                  // SizedBox(height: 17.v),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade200,
                  ),
                  SizedBox(height: 19.v),
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
                          width: Get.width * .8,
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
                                        ?.copyWith(
                                            color: Colors.white, fontSize: 45),
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
                                    "Expire At: ${_couponCodeController.couponlist.value.availableCoupon?[index].expireAt}",
                                    style: theme.textTheme.bodySmall!
                                        .copyWith(color: Colors.grey.shade400),
                                  ),
                                  Gap(5),
                                  CustomElevatedButton(
                                    height: 40.v,
                                    width: 100.h,
                                    text: "Apply",
                                    margin: EdgeInsets.only(left: 8.h),
                                    buttonStyle:
                                        CustomButtonStyles.fillPrimaryTL15,
                                    buttonTextStyle: CustomTextStyles
                                        .labelLargeWhiteA70002_1,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
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
              textDirection: TextDirection.ltr,
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
                                "Pricing Details",
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
                      // SizedBox(height: 17.v),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(height: 19.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "shopping cart (1)",
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
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 20.h),
                      ),
                      SizedBox(height: 7.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
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
                          itemDiscountText: "Item Total:",
                          priceText: "\$99",
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "Item Discount:",
                          priceText: "\$20",
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "Total",
                          priceText: "\$218",
                        ),
                      ),
                      SizedBox(height: 27.v),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: Get.width * .19,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                                SizedBox(
                                  width: Get.width * .01,
                                ),
                                Text(
                                  "All",
                                  style: theme.textTheme.titleSmall?.copyWith(),
                                ),
                              ],
                            ),
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              Get.to(() => OrderConfirmedScreen());
                            },
                            height: 40.v,
                            width: 100.h,
                            text: "Checkout",
                            margin: EdgeInsets.only(left: 10.h),
                            buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                            buttonTextStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
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
                                        text: "Total\$",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      TextSpan(
                                        text: " 218",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(Icons.keyboard_arrow_up_sharp)
                              ],
                            ),
                          ),
                        ],
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
                    text: "Total \$",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  TextSpan(
                    text: " 79",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
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

  /// Section Widget
  Widget _buildAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: Get.width * .19,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'All',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
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
          ),
        ),
        _buildCheckout(context),
        Container(
            height: 40.v,
            width: 100.h,
            decoration: BoxDecoration(
                color: Color(0xffff8300),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Color(0xffff8300))),
            margin: EdgeInsets.only(left: 23.h),
            child: Center(
                child: Text('Checkout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )))),
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

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return Obx(() {
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
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
      } else {
        return Container(
          height: Get.height * .3,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount:
                homeView_controller.userList.value.recommendedProduct?.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Container(
                                width: Get.width * .3,
                                child: Text(
                                  "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
                                  style: theme.textTheme.labelLarge
                                      ?.copyWith(fontSize: 10),
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 1.v),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.v),
                                    child: CustomRatingBar(
                                      ignoreGestures: true,
                                      initialRating: homeView_controller
                                          .userList
                                          .value
                                          .recommendedProduct?[index]
                                          .averageRating
                                          ?.toDouble(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "(${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()})",
                                      style:
                                          CustomTextStyles.labelMediumGray90001,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.v),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "${homeView_controller.userList.value.recommendedProduct?[index].price.toString()}",
                                      style: CustomTextStyles
                                          .titleSmallPrimarySemiBold,
                                    ),
                                    TextSpan(
                                      text: " ",
                                    ),
                                    TextSpan(
                                      text: "2k+ sold",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 6.v),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tappedList[index] = !tappedList[
                                        index]; // Toggle tapped state for this item
                                  });
                                  if (tappedList[index]) {
                                    Englishcartproductid = homeView_controller
                                        .userList
                                        .value
                                        .recommendedProduct?[index]
                                        .id
                                        .toString();

                                    EnglishAddtocartprice = homeView_controller
                                        .userList
                                        .value
                                        .recommendedProduct?[index]
                                        .price
                                        .toString();

                                    AddToCartcontroller()
                                        .addtocart_Apihit(context);
                                  }
                                },
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    border: Border.all(
                                      color: tappedList[index]
                                          ? Colors.orange
                                          : Colors.black,
                                      width: 2,
                                    ),
                                    color: tappedList[index]
                                        ? Colors.orange
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: tappedList[index]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ])),
              );
            },
          ),
        );
      }
    });
    // Obx(() {
    //   if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
    //     return const Scaffold(
    //       body: Center(child: CircularProgressIndicator()),
    //     );
    //   } else {
    //     return homeView_controller.userList.value.categoryData == null ||
    //             homeView_controller.userList.value.categoryData?.length == 0
    //         ? Center(child: Text('Error: ${homeView_controller.error.value}'))
    //         : Padding(
    //             padding: const EdgeInsets.only(right: 10),
    //             child: Container(
    //               height: Get.height * .3,
    //               child: ListView.builder(
    // shrinkWrap: true,
    // scrollDirection: Axis.horizontal,
    // physics: BouncingScrollPhysics(),
    //                 itemCount: homeView_controller
    //                         .userList.value.recommendedProduct?.length ??
    //                     0,
    //                 itemBuilder: (context, index) {
    //       return Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 8.0),
    //         child: Align(
    //             alignment: Alignment.centerRight,
    //             child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Column(
    //                     crossAxisAlignment:
    //                         CrossAxisAlignment.start,
    //                     children: [
    //                       CustomImageView(
    //                         fit: BoxFit.cover,
    //                         imagePath:
    //                             "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
    //                         height: 120.adaptSize,
    //                         width: 120.adaptSize,
    //                         radius: BorderRadius.circular(
    //                           10.h,
    //                         ),
    //                       ),
    //                       SizedBox(height: 9.v),
    //                       Text(
    //                         "Luxury Rhinestone....",
    //                         style: theme.textTheme.labelLarge,
    //                       ),
    //                       SizedBox(height: 1.v),
    //                       Row(
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.symmetric(
    //                                 vertical: 1.v),
    //                             child: CustomRatingBar(
    //                               initialRating: 5,
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: EdgeInsets.only(left: 4.h),
    //                             child: Text(
    //                               "(120)",
    //                               style: CustomTextStyles
    //                                   .labelMediumGray90001,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(height: 2.v),
    //                       RichText(
    //                         text: TextSpan(
    //                           children: [
    //                             TextSpan(
    //                               text: "99",
    //                               style: CustomTextStyles
    //                                   .titleSmallPrimarySemiBold,
    //                             ),
    //                             TextSpan(
    //                               text: " ",
    //                             ),
    //                             TextSpan(
    //                               text: "2k+ sold",
    //                               style: theme.textTheme.bodySmall,
    //                             ),
    //                           ],
    //                         ),
    //                         textAlign: TextAlign.left,
    //                       ),
    //                       SizedBox(height: 6.v),
    //                       Container(
    //                         width: 100.h,
    //                         height: 30.v,
    //                         decoration: AppDecoration
    //                             .outlineErrorContainer
    //                             .copyWith(
    //                           borderRadius:
    //                               BorderRadiusStyle.circleBorder35,
    //                         ),
    //                         child: Center(
    //                           child: Text(
    //                             "Add to Cart",
    //                             style: TextStyle(
    //                                 fontSize: 8,
    //                                 color: Colors.black),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ])),
    //       );
    //     },
    //   ),
    // ));
    //   }
    // });
  }

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
  Widget _buildCart1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: Get.height * .4,
          crossAxisCount: 2,
          // mainAxisSpacing: 2,
          crossAxisSpacing: 10.h,
        ),
        physics: BouncingScrollPhysics(),
        itemCount:
            homeView_controller.userList.value.recommendedProduct?.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width, padding: EdgeInsets.only(left: 10),
                //    width: 170.adaptSize,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      onTap: () {
                        mainCatId = homeView_controller.userList.value
                            .recommendedProduct?[index].mainCategoryId!
                            .toString();
                        String? productId = homeView_controller
                            .userList.value.recommendedProduct?[index].id!
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
                          Get.to(SinglePageScreen_mens_activewear());
                        } else if (mainCatId == "157") {
                          Get.to(SinglePageScreen_Mens_Formals());
                        } else if (mainCatId == "174") {
                          Get.to(SinglePageScreen_Mens_Shoes());
                        } else if (mainCatId == "166") {
                          Get.to(SinglePageScreen_Electronics_Smartphones());
                        } else if (mainCatId == "170") {
                          Get.to(SinglePageScreen_Electronics_Laptops());
                        } else if (mainCatId == "171") {
                          Get.to(
                              SinglePageScreen_Electronics_AudioHeadphones());
                        } else if (mainCatId == "172") {
                          Get.to(SinglePageScreen_Electronics_Camera());
                        } else if (mainCatId == "173") {
                          Get.to(SinglePageScreen_Electronics_wearable());
                        } else {
                          print('not found ');
                        }
                      },
                      fit: BoxFit.cover,
                      imagePath:
                          "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
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
                            Add_remove_productidd = homeView_controller
                                .userList.value.recommendedProduct![index].id!
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
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
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 131.h,
                  child: Text(
                    "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()}",
                                // "4.8",
                                style: theme.textTheme.labelMedium,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: CustomRatingBar(
                                  ignoreGestures: true,
                                  initialRating: homeView_controller
                                      .userList
                                      .value
                                      .recommendedProduct?[index]
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
                                    "${homeView_controller.userList.value.recommendedProduct?[index].price.toString()}",
                                //"99 ",
                                style: CustomTextStyles.titleMediumPrimary_2,
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
                            // onTap: () {
                            //   String? mainCatId = homeView_controller
                            //       .userList
                            //       .value
                            //       .recommendedProduct?[index]
                            //       .mainCategoryId
                            //       .toString();
                            //   String? productId = homeView_controller
                            //       .userList.value.recommendedProduct?[index].id
                            //       ?.toString();

                            //   setState(() {
                            //     Englishproductid = productId;
                            //     EnglishMainCatId = mainCatId;
                            //   });
                            //   productviewcontroller.Single_ProductApiHit();
                            //   if (mainCatId == "153") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartmensShirt(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "154") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartmensBottoms(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "155") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartmensJacket(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "156") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartmensActiveWear(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "157") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartmensFormals(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "174") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartmensShoes_view(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "166") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartelectronicsPhone(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "170") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartelectronicsLaptop(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "171") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartelectronicsHeadphones(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "172") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartelectronicsCamera(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "173") {
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartelectronicsWarable(
                            //               context, mainCatId, productId);
                            //         });
                            //   }
                            // },
                            // onTap: () {
                            //   // Retrieve mainCategoryId and productId
                            //   String? mainCatId = homeView_controller
                            //       .userList
                            //       .value
                            //       .recommendedProduct?[index]
                            //       .mainCategoryId
                            //       ?.toString();
                            // String? productId = homeView_controller
                            //     .userList.value.recommendedProduct?[index].id
                            //     ?.toString();

                            // setState(() {
                            //   Englishproductid = productId;
                            //   EnglishMainCatId = mainCatId;
                            // });
                            // productviewcontroller.Single_ProductApiHit();
                            //   if (mainCatId == "133") {
                            //     // Make sure to call the method with ()
                            // showModalBottomSheet(
                            //     context: context,
                            //     isScrollControlled: true,
                            //     builder: (context) {
                            //       return _buildAddtocartMens_view(
                            //           context, mainCatId, productId);
                            //     });
                            //   } else if (mainCatId == "134") {
                            //     // Make sure to call the method with ()
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            // builder: (context) {
                            //   return _buildAddtocartElectronics(
                            //       context, mainCatId, productId);
                            // });
                            //   } else if (mainCatId == "135") {
                            //     // Make sure to call the method with ()
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartHome_and_Living(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else if (mainCatId == "136") {
                            //     // Make sure to call the method with ()
                            //     showModalBottomSheet(
                            //         context: context,
                            //         isScrollControlled: true,
                            //         builder: (context) {
                            //           return _buildAddtocartHealth_and_wellness(
                            //               context, mainCatId, productId);
                            //         });
                            //   } else {
                            //     print('Category not found');
                            //   }
                            // },
                          )),
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

  /// Common widget
  Widget _buildBy(
    BuildContext context, {
    required String userName,
    required String userFashion,
  }) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.v),
          child: Text(
            userName,
            style: CustomTextStyles.bodySmall12_1.copyWith(
              color: appTheme.gray50001,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgEllipse889,
          height: 15.adaptSize,
          width: 15.adaptSize,
          radius: BorderRadius.circular(
            7.h,
          ),
          margin: EdgeInsets.only(left: 4.h),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.h,
            top: 1.v,
          ),
          child: Text(
            userFashion,
            style: CustomTextStyles.bodySmall12_1.copyWith(
              color: appTheme.gray50001,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgVectorGray50001,
          height: 6.v,
          width: 3.h,
          margin: EdgeInsets.only(
            left: 4.h,
            top: 3.v,
            bottom: 4.v,
          ),
        ),
      ],
    );
  }

  Widget _buildprice_2(
    BuildContext context, {
    required String price,
    required String one,
  }) {
    return SizedBox(
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
                    text: "99",
                    style: theme.textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                    text: "120",
                    style: CustomTextStyles.titleSmallGray50001.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 80.h,
            height: Get.height * .05,
            margin: EdgeInsets.only(left: 14.h),
            padding: EdgeInsets.symmetric(vertical: 10.v),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomImageView(
                  onTap: () {
                    setState(() {
                      // Increment the counter when "+" is pressed
                      counter++;
                    });
                  },
                  imagePath: ImageConstant.imgGroup239412WhiteA70002,
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  margin: EdgeInsets.only(
                    top: 2.v,
                    bottom: 3.v,
                  ),
                ),
                Center(
                  child: Text(
                    counter.toString(),
                    style: CustomTextStyles.titleLargeWhiteA7000220,
                  ),
                ),
                CustomImageView(
                  onTap: () {
                    setState(() {
                      // Decrement the counter when "-" is pressed
                      if (counter > 1) {
                        counter--;
                      }
                    });
                  },
                  imagePath: ImageConstant.imgLine1,
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 9.v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildPrice(
    BuildContext context, {
    required String price,
    required String one,
  }) {
    return SizedBox(
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
                    text: "99",
                    style: theme.textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                    text: "120",
                    style: CustomTextStyles.titleSmallGray50001.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 80.h,
            height: Get.height * .05,
            margin: EdgeInsets.only(left: 14.h),
            padding: EdgeInsets.symmetric(vertical: 10.v),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomImageView(
                  onTap: () {
                    setState(() {
                      // Increment the counter when "+" is pressed
                      counter2++;
                    });
                  },
                  imagePath: ImageConstant.imgGroup239412WhiteA70002,
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  margin: EdgeInsets.only(
                    top: 2.v,
                    bottom: 3.v,
                  ),
                ),
                Center(
                  child: Text(
                    counter2.toString(),
                    style: CustomTextStyles.titleLargeWhiteA7000220,
                  ),
                ),
                CustomImageView(
                  onTap: () {
                    setState(() {
                      // Decrement the counter when "-" is pressed
                      if (counter2 > 1) {
                        counter2--;
                      }
                    });
                  },
                  imagePath: ImageConstant.imgLine1,
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 9.v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
    String? total,
    String? price,
  }) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            total.toString(),
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.gray90001,
            ),
          ),
          Text(
            price.toString(),
            style: CustomTextStyles.titleMediumPrimary_1.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      );
    });
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "My Cart",
        margin: EdgeInsets.only(left: 20.h),
      ),
    );
  }
}
