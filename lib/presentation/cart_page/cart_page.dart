// ignore_for_file: unused_import
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/order_confirmed_screen/order_confirmed_screen.dart';
import 'package:mohally/presentation/payment_screen/payment_screen.dart';
import 'package:mohally/presentation/price_details_bottomsheet/price_details_bottomsheet.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/presentation/single_page_screen/single_page_screen.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
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
int counter = 1;
int counter2 = 1;
   List<bool> isButtonTappedList = List.generate(8, (index) => false);
 List<String> recomemded_text =
[
  'Recommended',
  'Recommended',
 'Recommended',
  'Recommended',
 'Recommended',
];
int selectedTabIndex=0;
  int selectedIndex =0;
HomeView_controller_English homeView_controller = HomeView_controller_English();
String selectedSize = "Dark Blue/M(38)";
String selectedSize22 = "Dark Blue/M(38)";
bool Allselected =false;
bool Allselected2 =false;
  bool isSelected=false;
   bool isSelected2=false;
   bool allSelected=false;
  

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
        textDirection: TextDirection.ltr,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar:  _buildAppBar(context),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.maxFinite,
              child: ListView(
                children: [
                  SizedBox(height: 7.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                      "3 types",
                        style: theme.textTheme.titleLarge?.copyWith( fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                       "in the cart",
                        style: CustomTextStyles.bodyLargeGray50001_3?.copyWith(),
                      ),
                    ),
                  ),
                  SizedBox(height: 27.v),
                  _buildFreeShippingAnd(context),
                  SizedBox(height: 29.v),
                  _buildTrailRunningJacket(context),
                  SizedBox(height: 29.v),
                  _buildTrailRunningJacket1(context),
                  SizedBox(height: 30.v),
                  _buildTwentyNine(context),
                  SizedBox(height: 29.v),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    
                     Text('Delivery address', style: TextStyle( fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),),
                      GestureDetector(
                        onTap: () {
                   Get.to(() => Default_address());
                        },
                        child: Icon(Icons.keyboard_arrow_right, color: Colors.black,)),
                   ],
                  ),
                  SizedBox(height: 14.v),
                  _buildNewbridgeCourt(context),
                  SizedBox(height: 29.v),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    
                     Text('Payment or payment method', style: TextStyle( fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),),
                      GestureDetector(
                        onTap: () {
                          Get.to(PaymentScreen());
                        },
                        child: Icon(Icons.keyboard_arrow_right, color: Colors.black,)),
                   ],
                  ),
                  SizedBox(height: 15.v),
                  _buildVisaClassic(context),
                  SizedBox(height: 29.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                          "coupon code",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
// SizedBox(width: Get.width*.08,),
                       Container(
                                             height: 30.v,
                                             width: 120.h,
                                             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), 
                                             border: Border.all(color:Colors.black)
                                             ),
                                             margin: EdgeInsets.only(left: 23.h),
                                             child: 
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Your Coupon Code',style: theme.textTheme.titleMedium?.copyWith(fontSize: 10), ),
                                             
                                           GestureDetector(
                                            onTap: (){
showModalBottomSheet(context: context, builder: (context){
return _buildYourcouponcode(context);
});
                                            },
                                            child: Icon(Icons.keyboard_arrow_up_sharp,weight: 8,))
                                            ],
                                          ),
                       
                                            ),
                         
                        
                      
                    ],
                  ),
                  SizedBox(height: 20.v),
                  _buildCouponCode(context),
                  SizedBox(height: 28.v),
                  _buildItemTotal(context),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: _buildTotal(
                      context,
                      total: "Item discount:",
                      price: "20",
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: _buildTotal(
                      context,
                      total:"the total",
                      price: "79\$",
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,10,10),
                    child: _buildAll(context),
                  ),
                  SizedBox(height: 29.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                     "Explore your interests",
                        style: theme.textTheme.titleMedium?.copyWith(),
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
                            imagePath: ImageConstant.imgMaskGroup16x16,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                            margin: EdgeInsets.only(bottom: 2.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Text(
                           "secure payment options",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xffff8300), ),
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
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, ),
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
                             "privacy insurance",
                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xffff8300), ),
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
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, ),
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
                             "Secure Privacy",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xffff8300), ),
                            
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
                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, ),
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
          ),
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
             "Free shipping and free returns",
              style: CustomTextStyles.labelLargeInterPrimarySemiBold?.copyWith(),
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

  /// Section Widget
  Widget _buildTrailRunningJacketBy(BuildContext context) {
  return Container(
   
    child: CustomTextFormField(
      
      readOnly: true,
      width: Get.width*.3,
      controller: trailRunningJacketByController,
      //hintText: "Dark Blue/M(38)",
      hintStyle: CustomTextStyles.bodySmallGray90001,
      suffix: DropdownButtonHideUnderline(
        
        child: DropdownButton<String>(
          value: selectedSize22,
          items: ['Dark Blue/M(38)', 'Dark Blue/M(40)', 'Dark Blue/M(42)', 'XXL'].map((String size) {
          
            return DropdownMenuItem<String>(
              
           
              value: size,
              child: Center(child: Text(size, style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),)),
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


 Widget _buildTrailRunningJacketBy2222(BuildContext context) {
  return Container(
   
    child: CustomTextFormField(
      
      readOnly: true,
      width: Get.width*.3,
      controller: trailRunningJacketByController,
      //hintText: "Dark Blue/M(38)",
      hintStyle: CustomTextStyles.bodySmallGray90001,
      suffix: DropdownButtonHideUnderline(
        
        child: DropdownButton<String>(
          value: selectedSize,
          items: ['Dark Blue/M(38)', 'Dark Blue/M(40)', 'Dark Blue/M(42)', 'XXL'].map((String size) {
          
            return DropdownMenuItem<String>(
              
           
              value: size,
              child: Center(child: Text(size, style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),)),
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
  Widget _buildTrailRunningJacket(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: Get.width,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle569100x100,
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
              Text("Nike running jacket...",style: theme.textTheme.titleSmall?.copyWith(),),
               SizedBox(width: Get.width*.2),
               GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected2 = !isSelected2;
                    });
                  },
                  child: Container(
                  height: Get.height*.03,
                  width: Get.width*.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color:  Color(0xffff8300),
                      ),
                     
                      color: Colors.white,
                    ),
                    child: isSelected2
                        ? Center(
                            child: Container(
                           height: Get.height*.02,
                  width: Get.width*.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Color(0xffff8300),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
             ],
           ),
                  // _buildBy(
                  //   context,
                  //   userName: "By",
                  //   userFashion: "Wild Yi fashion",
                  // ),
                  SizedBox(height: 9.v),
                  _buildTrailRunningJacketBy2222(context),
                  SizedBox(height: 9.v),
                  Text(
                   "Black Friday! Ends at 16:19:50:21",
                    style: CustomTextStyles.labelLargePrimary?.copyWith(),
                  ),
                  SizedBox(height: 6.v),
                  _buildPrice(
                    context,
                    price: "\$99 \$120",
                    one: "1",
                  ),
                ],
              ),
            ),
          ],
        ),
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
  Widget _buildTrailRunningJacket1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle569100x100,
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

            SizedBox(height: 20),
           Row(
             children: [
              Text("Nike running jacket...",style: theme.textTheme.titleSmall?.copyWith(),),
               SizedBox(width: Get.width*.2),
               GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                  height: Get.height*.03,
                  width: Get.width*.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color:  Color(0xffff8300),
                      ),
                     
                      color: Colors.white,
                    ),
                    child: isSelected
                        ? Center(
                            child: Container(
                           height: Get.height*.02,
                  width: Get.width*.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Color(0xffff8300),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
             ],
           ),
                // CustomRadioButton(
                //   width: 221.h,
                //   text: "سترة الجري من نايك...",
                //   value: "سترة الجري من نايك...",
                //   groupValue: radioGroup1,
                //   textStyle: theme.textTheme.titleSmall?.copyWith(),
                //   isRightCheck: true,
                //   onChange: (value) {
                //     radioGroup1 != value;
                //   },
                // ),
                SizedBox(height: 9.v),
               _buildTrailRunningJacketBy(context),
                SizedBox(height: 9.v),
                Text(
                "Black Friday! Ends at 16:19:50:21",
                  style: CustomTextStyles.labelLargePrimary?.copyWith(),
                ),
                SizedBox(height: 6.v),
                _buildprice_2(
                  context,
                   price: "\$99 \$120",
                  one: "1",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyNine(BuildContext context) {
    return Container(
      height: 70.v,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 8.v,
      ),
      decoration: BoxDecoration( color: Color.fromARGB(125, 252, 228, 236)),
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
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black, )
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgInfoCircle1,
            height: 15.adaptSize,
            width: 15.adaptSize,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 6.v, ),
            
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNewbridgeCourt(BuildContext context) {
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
     SizedBox(width: Get.width*.03,),
          Container(
            width: 193.h,
            margin: EdgeInsets.only(
              left: 15.h,
              top: 5.v,
              bottom: 4.v,
            ),
            child: Text(
             "3 Newbridge Court Chino Hills, CA 91709, USA",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumGray9000115.copyWith(
                height: 1.47
              )
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
           SizedBox(width: Get.width*.03,),
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
  Widget _buildGroup166(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 4.v),
        child: CustomTextFormField(
          controller: group166Controller,
          hintText:"Enter coupon code here",
          hintStyle: CustomTextStyles.bodyLargeOnError_1,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCouponCode(BuildContext context) {
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
              _buildGroup166(context),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  top: 3.v,
                  right: 2.h,
                ),
                child: Text(
                "Apply",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,  color:  Color(0xffff8300))
                  
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
          "The sum of things:",
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            "\$99",
            style: CustomTextStyles.titleMediumMedium16,
          ),
        ],
      ),
    );
  }


Widget _buildYourcouponcode(BuildContext context){
  return Container(
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
                                itemCount: 3,
                                itemExtent: 90,
                                shrinkWrap: true,
                                padding: EdgeInsets.all(5),
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5)),
                                    margin: EdgeInsets.symmetric(vertical: 6),
                                    width: double.infinity,
                                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/bg.png",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 25,
                                left: 20,
                                child: Image.asset(
                                  "assets/images/discou.png",
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Personal Offer",
                              style: theme.textTheme.subtitle1,
                            ),
                            Text(
                              "Summer2020",
                              style: theme.textTheme.subtitle2,
                            ),
                          ],
                        ),
                        Gap(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "6 days remaining",
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: Colors.grey.shade400),
                            ),
                            Gap(5),
                            CustomElevatedButton(
                              height: 30.v,
                              width: 80.h,
                              text: "Apply",
                              margin: EdgeInsets.only(left: 8.h),
                              buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeWhiteA70002_1,
                            ),
                          ],
                        )
                      ],
                                    ),
                                  );
                                },
                              ),
                    ],
                  ),
                ),
  );
}
  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return 
      GestureDetector(
        onTap: (){
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
                         height: Get.height*.2,
                      width: Get.width*.3,
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
                            width: Get.width*.19,
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
                                          height: Get.height*.03,
                                          width: Get.width*.05,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                   width: 2,
                                                   color:  Color(0xffff8300),
                                              ),
                                             
                                              color: Colors.white,
                                            ),
                                            child: Allselected2
                                                   ? Center(
                                                       child: Container(
                                                      height: Get.height*.02,
                                          width: Get.width*.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Color(0xffff8300),
                              ),
                                                       ),
                                                     )
                                                   : null,
                                          ),
                                        ),
                                        SizedBox(width: Get.width*.01,),
                                          Text("All",style: theme.textTheme.titleSmall?.copyWith(),),
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
                            buttonTextStyle:
                                 TextStyle(fontSize: 16, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255),),
                          ),
                          Container(
                      height: 40.v,
                      width: 120.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), 
                      border: Border.all(color:Colors.black)
                      ),
                      margin: EdgeInsets.only(left: 23.h),
                      child: 
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Total\$",
                              style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
                            ),
                            TextSpan(
                              text: " 218",
                              style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
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
            border: Border.all(color:Colors.black)
            ),
            margin: EdgeInsets.only(left: 23.h),
            child: 
         
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Total \$",
                                style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
                              ),
                              TextSpan(
                                text: " 79",
                                style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
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
          width: Get.width*.19,
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             
            Text('All', style: TextStyle(fontSize: 18,  fontWeight: FontWeight.w400, color: Colors.black),),
               GestureDetector(
                  onTap: () {
                    setState(() {
                      Allselected = !Allselected;
                    });
                  },
                  child: Container(
                  height: Get.height*.03,
                  width: Get.width*.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color:  Colors.black,
                      ),
                     
                      color: Colors.white,
                    ),
                    child: Allselected
                        ? Center(
                            child: Container(
                           height: Get.height*.02,
                  width: Get.width*.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Colors.black,
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
          border: Border.all(color:Color(0xffff8300))
          ),
          margin: EdgeInsets.only(left: 23.h),
          child: 
          Center(child: Text('Checkout', style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Colors.white,)))

        ),
      
        
      
        //  Padding(
        //   padding: EdgeInsets.symmetric(vertical: 11.v),
        //   child: 
        // CustomRadioButton(
        //     text: "all",
        //     value: "الدفع",
        //     groupValue: radioGroup2,
        //     padding: EdgeInsets.symmetric(vertical: 1.v),
        //     textStyle:  TextStyle(fontSize: 5, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255),),
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

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
     return Obx((){
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }  else {
        return  homeView_controller.userList.value.categoryData ==  null ||
                                 homeView_controller.userList.value
                                         .categoryData?.length ==
                                     0
                             ? Center(child:  Text('Error: ${homeView_controller.error.value}'))
                             :Padding(
                               padding: const EdgeInsets.only(right: 10),
                               child: Container(
                                     height: Get.height*.3,
                                     child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: homeView_controller.userList.value.recommendedProduct?.length ?? 0,
                              itemBuilder: (context, index) {
                                return  Padding(
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
                                           imagePath: "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                                          height: 120.adaptSize,
                                          width: 120.adaptSize,
                                          radius: BorderRadius.circular(
                                            10.h,
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                                                       Text(
                                                                "Luxury Rhinestone....",
                                                                style: theme.textTheme.labelLarge,
                                                              ),
                                                              SizedBox(height: 1.v),
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 1.v),
                                                                    child: CustomRatingBar(
                                                                      initialRating: 5,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(left: 4.h),
                                                                    child: Text(
                                                                      "(120)",
                                                                      style: CustomTextStyles.labelMediumGray90001,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 2.v),
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: "99",
                                                                      style: CustomTextStyles.titleSmallPrimarySemiBold,
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
                                                              Container(
                                                                width: 100.h,
                                                                height: 30.v,
                                                                decoration: AppDecoration.outlineErrorContainer.copyWith(
                                                                  borderRadius: BorderRadiusStyle.circleBorder35,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Add to Cart",
                                                                    style: TextStyle(fontSize: 8, color: Colors.black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                  ]
                                                                )
                                  ),
                                );
                                                        },
                                                      ),
                               )
                                                      );

    }
    }
    );
  }

   Widget _buildListRecommended(BuildContext context) {
    return   Container(
        height: Get.height * .05,
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: recomemded_text.length,
      itemBuilder: (context, index) {
        bool isSelected = index == selectedTabIndex; // Assuming you have a variable to track the selected tab index
      
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
                    fontWeight: isSelected ? FontWeight.bold:FontWeight.w400 ,
                  
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
      padding: const EdgeInsets.fromLTRB(10,0,10,0),
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
                 border: Border.all(color: isSelected ? Color(0xffff8300): Colors.black),
                    // Adjust the colors as needed
                    borderRadius: BorderRadius.circular(15.0), // Adjust the border radius as needed
                  ),
                  child: Center(
                    child: Text(
                      "S(36)",
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black, // Adjust the text color as needed
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
return Obx((){
  if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }  else {
          return
     homeView_controller.userList.value.categoryData ==  null ||
                                    homeView_controller.userList.value
                                            .categoryData?.length ==
                                        0
                                ? Center(child:  Text('Error: ${homeView_controller.error.value}'))
                                :
                                Padding(
       padding: const EdgeInsets.only(right:20),
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: Get.height*.4,
               crossAxisCount: 2,
                  // mainAxisSpacing: 2,
                 crossAxisSpacing: 10.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: homeView_controller.userList.value.recommendedProduct?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                // decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                                              
          width: Get.width,padding: EdgeInsets.only(left: 10),
        //    width: 170.adaptSize,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                 
                  onTap: () {
          Englishproductid =
         homeView_controller.userList.value.recommendedProduct![index].id!.toString();
        
            setState(() {
        Englishproductid;
            });
          Get.to(SinglePageScreen(), 
          );
        },
         fit: BoxFit.cover,
                  imagePath:"${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
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
                  child:
                   CustomIconButton(
                    onTap: () {
                   
                          Add_remove_productidd =
                        homeView_controller.userList.value.recommendedProduct![index].id!.toString();
                        EnglishAdd_remove_wishlistController().AddRemoveWishlish_apihit();
                       
                        setState(() {
                          // Add_remove_productidd;
                          //  isButtonTapped = !isButtonTapped;
                           isButtonTappedList[index] =!isButtonTappedList[index];
                       });

                        },
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.fillWhiteA,
                    alignment: Alignment.topRight,
                    child:CustomImageView(
        imagePath:  isButtonTappedList[index]
            ? ImageConstant. imgGroup239531// Change this to your tapped image
            :  ImageConstant.imgSearch,    // Default image
      ),
                  )
     

                                  
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          
           Padding(
             padding: const EdgeInsets.only(left: 10),
             child: Container(
                  height: 16.v,
                       width: 48.h,
                       
                       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Color.fromARGB(71, 228, 193, 204),
                       ),
                       child: Center(child: Text("10% Off", style: TextStyle(
              fontSize: 8, color: Color(0xffff8300),fontWeight: FontWeight.w600,
              // fontFamily: 'Almarai'
                       ),),),
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
                            "4.8",
                            style: theme.textTheme.labelMedium,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: CustomRatingBar(
                              ignoreGestures: true,
                              initialRating: 0,
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
                            text:  "${homeView_controller.userList.value.recommendedProduct?[index].pricee.toString()}",
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
                  child: 
                  CustomIconButton(
                                                     
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
      ),
    );  
      }
      });
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
                            height: Get.height*.05,
                            margin: EdgeInsets.only(left: 14.h),
                            padding: EdgeInsets.symmetric(vertical: 10.v),
                            decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              
                                 CustomImageView(
                                 onTap: (){
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
                                     onTap: (){
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
                            height: Get.height*.05,
                            margin: EdgeInsets.only(left: 14.h),
                            padding: EdgeInsets.symmetric(vertical: 10.v),
                            decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              
                                 CustomImageView(
                                 onTap: (){
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
                                     onTap: (){
                                    setState(() {
                // Decrement the counter when "-" is pressed
                if (counter2> 1) {
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
    PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "My Cart",
        margin: EdgeInsets.only(left: 20.h),
      ),
    );
  }
  
  }

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
//   String selectedSize = "Dark Blue/M(38)";
//    HomeView_controller_English homeView_controller = HomeView_controller_English();
//   bool isSelected=false;
//   bool isSelected2=false;
//   bool allSelected=false;
//   bool all2Selected=false;
//   String radioGroup = "";

//   TextEditingController trailRunningJacketByController =
//       TextEditingController();

//   String radioGroup1 = "";

//   TextEditingController vectorController = TextEditingController();

//   TextEditingController group166Controller = TextEditingController();

//   String radioGroup2 = "";

//   TextEditingController addtoCartController = TextEditingController();

//    @override
//   void initState() {
//     super.initState();
//         setInitialLocale();
//         homeView_controller.homeview_apihit();
//   }

//     void setInitialLocale() {
//     if (Get.locale == null || Get.locale?.languageCode == 'ar') {
//       Get.updateLocale(Locale('ar', 'DZ'));
//     } else {
//       Get.updateLocale(Locale('en', 'US'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: SizedBox(
//           width: double.maxFinite,
//           child: ListView(
//             children: [
//               SizedBox(height: 7.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20.h),
//                   child: Text(
//                     "3 Items",
//                     style: theme.textTheme.titleMedium,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 6.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20.h),
//                   child: Text(
//                     "in cart",
//                     style: CustomTextStyles.bodyLargeGray50001_3,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 27.v),
//               _buildFreeShippingAnd(context),
//               SizedBox(height: 29.v),
//               _buildTrailRunningJacket(context),
//               SizedBox(height: 29.v),
//               _buildTrailRunningJacket1(context),
//               SizedBox(height: 30.v),
//               _buildTwentyNine(context),
//               SizedBox(height: 29.v),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: _buildPaymentMethod(
//                   context,
//                   paymentMethodText: "Delivery Address",
//                 ),
//               ),
//               SizedBox(height: 14.v),
//               _buildNewbridgeCourt(context),
//               SizedBox(height: 29.v),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: _buildPaymentMethod(
//                   context,
//                   paymentMethodText: "Payment Method",
//                 ),
//               ),
//               SizedBox(height: 15.v),
//               _buildVisaClassic(context),
//               SizedBox(height: 29.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20.h),
//                   child: Text(
//                     "Coupon Code",
//                     style: theme.textTheme.titleMedium,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 7.v),
//               _buildCouponCode(context),
//               SizedBox(height: 28.v),
//               _buildItemTotal(context),
//               SizedBox(height: 15.v),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: _buildTotal(
//                   context,
//                   total: "Item discount:",
//                   price: "20",
//                 ),
//               ),
//               SizedBox(height: 15.v),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: _buildTotal(
//                   context,
//                   total: "Total",
//                   price: "79",
//                 ),
//               ),
//               SizedBox(height: 17.v),
//               _buildCheckout(context),
//               SizedBox(height: 29.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20.h),
//                   child: Text(
//                     "Explore your interests",
//                     style: theme.textTheme.titleMedium,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 19.v),
//               _buildAddToCart(context),
//               SizedBox(height: 30.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20.h),
//                   child: Row(
//                     children: [
//                       CustomImageView(
//                         imagePath: ImageConstant.imgMaskGroup16x16,
//                         height: 16.adaptSize,
//                         width: 16.adaptSize,
//                         margin: EdgeInsets.only(bottom: 2.v),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 7.h),
//                         child: Text(
//                           "Safe Payment Options",
//                           style: CustomTextStyles.titleMediumPrimary_1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: 318.h,
//                   margin: EdgeInsets.only(
//                     left: 20.h,
//                     right: 36.h,
//                   ),
//                   child: Text(
//                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
//                     maxLines: 6,
//                     overflow: TextOverflow.ellipsis,
//                     style: theme.textTheme.bodyMedium!.copyWith(
//                       height: 1.43,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20.h),
//                   child: Row(
//                     children: [
//                       CustomImageView(
//                         imagePath: ImageConstant.imgMaskGroup2,
//                         height: 16.adaptSize,
//                         width: 16.adaptSize,
//                         margin: EdgeInsets.only(bottom: 2.v),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 7.h),
//                         child: Text(
//                           "Secure privacy",
//                           style: CustomTextStyles.titleMediumPrimary_1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: 318.h,
//                   margin: EdgeInsets.only(
//                     left: 20.h,
//                     right: 36.h,
//                   ),
//                   child: Text(
//                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
//                     maxLines: 4,
//                     overflow: TextOverflow.ellipsis,
//                     style: theme.textTheme.bodyMedium!.copyWith(
//                       height: 1.43,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20.h),
//                   child: Row(
//                     children: [
//                       CustomImageView(
//                         imagePath: ImageConstant.imgMaskGroup3,
//                         height: 16.adaptSize,
//                         width: 16.adaptSize,
//                         margin: EdgeInsets.only(bottom: 2.v),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 7.h),
//                         child: Text(
//                           "Mohally Purchase protection",
//                           style: CustomTextStyles.titleMediumPrimary_1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: 318.h,
//                   margin: EdgeInsets.only(
//                     left: 20.h,
//                     right: 36.h,
//                   ),
//                   child: Text(
//                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
//                     maxLines: 4,
//                     overflow: TextOverflow.ellipsis,
//                     style: theme.textTheme.bodyMedium!.copyWith(
//                       height: 1.43,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 21.v),
//               _buildCart(context),
//               SizedBox(height: 15.v),
//              _buildHomePageSection(context),
//               SizedBox(height: 15.v),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       title: AppbarTitle(
//         text: "My Cart",
//         margin: EdgeInsets.only(left: 20.h),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildFreeShippingAnd(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20.h),
//       padding: EdgeInsets.symmetric(
//         horizontal: 12.h,
//         vertical: 15.v,
//       ),
//       decoration: AppDecoration.fillPrimary.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder8,
//           color: Colors.orange.shade50),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgMaskGroup1,
//             height: 20.adaptSize,
//             width: 20.adaptSize,
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 8.h,
//               top: 4.v,
//             ),
//             child: Text(
//               "Free shipping and free retunrs",
//               style: CustomTextStyles.labelLargeInterPrimarySemiBold,
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 3.v,
//               right: 3.h,
//             ),
//             child: Text(
//               "Time-limited",
//               style: CustomTextStyles.bodySmallInterGray90001,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
// Widget _buildTrailRunningJacketBy(BuildContext context) {
//   return Container(
   
//     child: CustomTextFormField(
      
//       readOnly: true,
//       width: Get.width*.3,
//       controller: trailRunningJacketByController,
//       //hintText: "Dark Blue/M(38)",
//       hintStyle: CustomTextStyles.bodySmallGray90001,
//       suffix: DropdownButtonHideUnderline(
        
//         child: DropdownButton<String>(
//           value: selectedSize,
//           items: ['Dark Blue/M(38)', 'Dark Blue/M(40)', 'Dark Blue/M(42)', 'XXL'].map((String size) {
          
//             return DropdownMenuItem<String>(
              
           
//               value: size,
//               child: Center(child: Text(size, style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),)),
//             );
//           }).toList(),
//           onChanged: (String? newSize) {
//             if (newSize != null) {
//               // Update selected size
//               setState(() {
//                 selectedSize = newSize;
//               });
//             }
//           },
//         ),
//       ),
//       suffixConstraints: BoxConstraints(
//         maxHeight: 20.v,
//       ),
//       contentPadding: EdgeInsets.only(
//         left: 10.h,
//         top: 5.v,
//         bottom: 5.v,
//       ),
//       borderDecoration: TextFormFieldStyleHelper.fillGray,
//       fillColor: appTheme.gray10003,
//     ),
//   );
// }

//   /// Section Widget
//   Widget _buildTrailRunningJacket(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgRectangle569100x100,
//             height: 100.adaptSize,
//             width: 100.adaptSize,
//             radius: BorderRadius.circular(
//               10.h,
//             ),
//             margin: EdgeInsets.only(bottom: 15.v),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//              children: [
//               Text( "Trail Running Jacket Nike...",style: theme.textTheme.titleSmall),
//                SizedBox(width: Get.width*.1),
//                GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isSelected2 = !isSelected2;
//                     });
//                   },
//                   child: Container(
//                   height: Get.height*.03,
//                   width: Get.width*.05,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         width: 2,
//                         color:  Color(0xffff8300),
//                       ),
                     
//                       color: Colors.white,
//                     ),
//                     child: isSelected2
//                         ? Center(
//                             child: Container(
//                            height: Get.height*.02,
//                   width: Get.width*.03,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color:  Color(0xffff8300),
//                               ),
//                             ),
//                           )
//                         : null,
//                   ),
//                 ),
//              ],
//            ),
                
//                 _buildBy(
//                   context,
//                   userName: "By",
//                   userFashion: "Wild Yi fashion",
//                 ),
//                 SizedBox(height: 9.v),
//                 _buildTrailRunningJacketBy(context),
//                 SizedBox(height: 9.v),
//                 Text(
//                   "Black Friday! Ends in 16:19:50:21",
//                   style: CustomTextStyles.labelLargePrimary,
//                 ),
//                 SizedBox(height: 6.v),
//                 _buildPrice(
//                   context,
//                   price: "99 120",
//                   one: "1",
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildVector(BuildContext context) {
//     return CustomTextFormField(
//       width: 98.h,
//       controller: vectorController,
//       hintText: "Dark Blue/M(38)",
//       hintStyle: CustomTextStyles.bodySmallGray90001,
//       suffix: Container(
//         margin: EdgeInsets.fromLTRB(4.h, 7.v, 10.h, 7.v),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgVectorGray900013x6,
//           height: 3.v,
//           width: 6.h,
//         ),
//       ),
//       suffixConstraints: BoxConstraints(
//         maxHeight: 20.v,
//       ),
//       contentPadding: EdgeInsets.only(
//         left: 10.h,
//         top: 5.v,
//         bottom: 5.v,
//       ),
//       borderDecoration: TextFormFieldStyleHelper.fillGray,
//       fillColor: appTheme.gray10003,
//     );
//   }

//   /// Section Widget
//   Widget _buildTrailRunningJacket1(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgRectangle569100x100,
//             height: 100.adaptSize,
//             width: 100.adaptSize,
//             radius: BorderRadius.circular(
//               10.h,
//             ),
//             margin: EdgeInsets.only(bottom: 15.v),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//              children: [
//               Text( "Trail Running Jacket Nike...",style: theme.textTheme.titleSmall),
//                SizedBox(width: Get.width*.1),
//                GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isSelected = !isSelected;
//                     });
//                   },
//                   child: Container(
//                   height: Get.height*.03,
//                   width: Get.width*.05,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         width: 2,
//                         color:  Color(0xffff8300),
//                       ),
                     
//                       color: Colors.white,
//                     ),
//                     child: isSelected
//                         ? Center(
//                             child: Container(
//                            height: Get.height*.02,
//                   width: Get.width*.03,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color:  Color(0xffff8300),
//                               ),
//                             ),
//                           )
//                         : null,
//                   ),
//                 ),
//              ],
//            ),
                
//                 _buildBy(
//                   context,
//                   userName: "By",
//                   userFashion: "Wild Yi fashion",
//                 ),
//                 SizedBox(height: 9.v),
//                 _buildTrailRunningJacketBy(context),
//                 // _buildVector(context),
//                 SizedBox(height: 9.v),
//                 Text(
//                   "Black Friday! Ends in 16:19:50:21",
//                   style: CustomTextStyles.labelLargePrimary,
//                 ),
//                 SizedBox(height: 6.v),
//                 _buildPrice(
//                   context,
//                   price: "99 120",
//                   one: "1",
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildTwentyNine(BuildContext context) {
//     return Container(
//       height: 55.v,
//       width: double.maxFinite,
//       padding: EdgeInsets.symmetric(
//         horizontal: 20.h,
//         vertical: 8.v,
//       ),
//       decoration: BoxDecoration(color: Colors.orange.shade50),
//       child: Stack(
//         alignment: Alignment.topLeft,
//         children: [
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: SizedBox(
//               width: 306.h,
//               child: Text(
//                 "    Item availability and pricing are not guaranteed until \npayment is final",
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: CustomTextStyles.bodySmallInterGray90001.copyWith(
//                   height: 1.50,
//                 ),
//               ),
//             ),
//           ),
//           CustomImageView(
//             imagePath: ImageConstant.imgInfoCircle1,
//             height: 10.adaptSize,
//             width: 10.adaptSize,
//             alignment: Alignment.topLeft,
//             margin: EdgeInsets.only(top: 6.v),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildNewbridgeCourt(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 50.adaptSize,
//             width: 50.adaptSize,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgRectangle584,
//                   height: 50.adaptSize,
//                   width: 50.adaptSize,
//                   radius: BorderRadius.circular(
//                     10.h,
//                   ),
//                   alignment: Alignment.center,
//                 ),
//                 CustomIconButton(
//                   height: 20.adaptSize,
//                   width: 20.adaptSize,
//                   padding: EdgeInsets.all(3.h),
//                   decoration: IconButtonStyleHelper.fillPrimaryTL10,
//                   alignment: Alignment.center,
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgGroup26,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 193.h,
//             margin: EdgeInsets.only(
//               left: 15.h,
//               top: 5.v,
//               bottom: 4.v,
//             ),
//             child: Text(
//               "3 Newbridge Court  Chino Hills, \nCA 91709, United States",
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               style: CustomTextStyles.bodyMediumGray9000115.copyWith(
//                 height: 1.47,
//               ),
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 13.v,
//               bottom: 12.v,
//             ),
//             child: CustomIconButton(
//               height: 25.adaptSize,
//               width: 25.adaptSize,
//               padding: EdgeInsets.all(5.h),
//               decoration: IconButtonStyleHelper.fillGreen,
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgCheck,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildVisaClassic(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CustomIconButton(
//             height: 50.adaptSize,
//             width: 50.adaptSize,
//             padding: EdgeInsets.all(10.h),
//             decoration: IconButtonStyleHelper.fillGray,
//             child: CustomImageView(
//               imagePath: ImageConstant.imgGroup27,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 14.h,
//               top: 4.v,
//               bottom: 6.v,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Visa Classic",
//                   style: CustomTextStyles.titleSmall15,
//                 ),
//                 SizedBox(height: 12.v),
//                 Text(
//                   "**** 7690",
//                   style: CustomTextStyles.bodyMedium13,
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 13.v,
//               bottom: 12.v,
//             ),
//             child: CustomIconButton(
//               height: 25.adaptSize,
//               width: 25.adaptSize,
//               padding: EdgeInsets.all(5.h),
//               decoration: IconButtonStyleHelper.fillGreen,
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgCheck,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildGroup166(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.only(top: 4.v),
//         child: CustomTextFormField(
//           controller: group166Controller,
//           hintText: "Enter coupon code here",
//           hintStyle: CustomTextStyles.bodyLargeOnError_1,
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildCouponCode(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20.h),
//       decoration: AppDecoration.outlinePrimary.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder15,
//       ),
//       child: DottedBorder(
//         color: theme.colorScheme.primary,
//         padding: EdgeInsets.only(
//           left: 1.h,
//           top: 1.v,
//           right: 1.h,
//           bottom: 1.v,
//         ),
//         strokeWidth: 1.h,
//         radius: Radius.circular(15),
//         borderType: BorderType.RRect,
//         dashPattern: [
//           5,
//           5,
//         ],
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 15.h,
//             vertical: 16.v,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildGroup166(context),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 12.h,
//                   top: 3.v,
//                   right: 2.h,
//                 ),
//                 child: Text(
//                   "Apply",
//                   style: CustomTextStyles.titleMediumPrimary_1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildItemTotal(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 20.h,
//         right: 25.h,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Item total:",
//             style: theme.textTheme.bodyLarge,
//           ),
//           Text(
//             "99",
//             style: CustomTextStyles.titleMediumMedium16,
//           ),
//         ],
//       ),
//     );
//   }

  

//   Widget _buildCheckout(BuildContext context) {
//     return 
//       GestureDetector(
//         onTap: (){
//  showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return Directionality(
//               textDirection: TextDirection.rtl,
//               child: Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 1.5,
//                 padding: EdgeInsets.symmetric(vertical: 18.v),
//                 decoration: AppDecoration.fillWhiteA.copyWith(
//                   borderRadius: BorderRadiusStyle.customBorderTL30,
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.h),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(vertical: 3.v),
//                               child: Text(
//                               "Price Details",
//                                 style: theme.textTheme.titleMedium?.copyWith(),
//                               ),
//                             ),
//                             CustomImageView(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               imagePath: ImageConstant.imgMaskGroup24x24,
//                               height: 24.adaptSize,
//                               width: 24.adaptSize,
//                             ),
//                           ],
//                         ),
//                       ),
//                       // SizedBox(height: 17.v),
//                       Divider(
//                         thickness: 1,
//                         color: Colors.grey.shade200,
//                       ),
//                       SizedBox(height: 19.v),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Padding(
//                           padding: EdgeInsets.only(right: 20.h),
//                           child: Text(
//                            "Cart(1)",
//                             style: theme.textTheme.titleMedium,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       CustomImageView(
//                         imagePath: ImageConstant.imgRectangle56980x80,
//                          height: Get.height*.2,
//                       width: Get.width*.3,
//                         radius: BorderRadius.circular(
//                           5.h,
//                         ),
//                         alignment: Alignment.centerRight,
//                         margin: EdgeInsets.only(right: 20.h),
//                       ),
//                       SizedBox(height: 7.v),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Padding(
//                           padding: EdgeInsets.only(right: 20.h),
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                  TextSpan(
//                                   text: "\$99",
//                                   style: theme.textTheme.titleSmall,
//                                 ),
//                                 TextSpan(
//                                   text: " ",
//                                 ),
                             
//                                    TextSpan(
//                                   text: "x 1",
//                                   style: CustomTextStyles.bodyMediumPrimary_1,
//                                 ),
                                
                               
//                               ],
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 26.v),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.h),
//                         child: _buildItemDiscount(
//                           context,
//                           itemDiscountText:"Item Total:",
//                           priceText: "\$99",
//                         ),
//                       ),
//                       SizedBox(height: 15.v),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.h),
//                         child: _buildItemDiscount(
//                           context,
//                           itemDiscountText:"Item Discount",
//                           priceText: "\$20",
//                         ),
//                       ),
//                       SizedBox(height: 15.v),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.h),
//                         child: _buildItemDiscount(
//                           context,
//                           itemDiscountText: "Total",
//                           priceText: "\$218",
//                         ),
//                       ),
//                       SizedBox(height: 27.v),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.h),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                              CustomElevatedButton(
//                               onPressed: () {
//                                 Get.to(() => OrderConfirmedScreen());
//                               },
//                               height: 40.v,
//                               width: 100.h,
//                               text: "Checkout",
//                               margin: EdgeInsets.only(left: 10.h),
//                               buttonStyle: CustomButtonStyles.fillPrimaryTL20,
//                               buttonTextStyle:
//                                    TextStyle(fontSize: 16, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255),),
//                             ),
//                             Container(
//                         height: 40.v,
//                         width: 120.h,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), 
//                         border: Border.all(color:Colors.black)
//                         ),
//                         margin: EdgeInsets.only(left: 23.h),
//                         child: 
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Total \$",
//                                 style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
//                               ),
//                               TextSpan(
//                                 text: " 218",
//                                 style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         Icon(Icons.keyboard_arrow_up_sharp)
//                       ],
//                     ),
                         
//                       ),
//                            Row(
//              children: [
//               Text("Checkout",style: theme.textTheme.titleSmall?.copyWith(),),
//                GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       allSelected = !allSelected;
//                     });
//                   },
//                   child: Container(
//                   height: Get.height*.03,
//                   width: Get.width*.05,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         width: 2,
//                         color:  Color(0xffff8300),
//                       ),
                     
//                       color: Colors.white,
//                     ),
//                     child: allSelected
//                         ? Center(
//                             child: Container(
//                            height: Get.height*.02,
//                   width: Get.width*.03,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color:  Color(0xffff8300),
//                               ),
//                             ),
//                           )
//                         : null,
//                   ),
//                 ),
//              ],
//            ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
            
//           },
//         );
//         },
//         child: Container(
//             height: 40.v,
//             width: 120.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)), 
//             border: Border.all(color:Colors.black)
//             ),
//             margin: EdgeInsets.only(left: 23.h),
//             child: 
         
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Total \$",
//                                 style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
//                               ),
//                               TextSpan(
//                                 text: " 79",
//                                 style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),),
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                        Icon(Icons.keyboard_arrow_up_sharp)
//                       ],
//                     ),
             
//           ),
  
//       );
//   }


//   /// Section Widget
//   Widget _buildAddtoCart(BuildContext context) {
//     return Container(
//       width: 120.h,
//       height: 45.v,
//       padding: EdgeInsets.symmetric(
//         horizontal: 26.h,
//         vertical: 9.v,
//       ),
//       decoration: AppDecoration.outlineErrorContainer.copyWith(
//         borderRadius: BorderRadiusStyle.circleBorder35,
//       ),
//       child: Center(
//         child: Text(
//           "Add to Cart",
//           style: TextStyle(fontSize: 10, color: Colors.black),
//         ),
//       ),
//     );

//     //   Container(
//     //   width: 120.h,
//     //   padding: EdgeInsets.symmetric(
//     //     horizontal: 26.h,
//     //     vertical: 9.v,
//     //   ),
//     //   decoration: AppDecoration.outlineErrorContainer.copyWith(
//     //     borderRadius: BorderRadiusStyle.roundedBorder15,
//     //   ),
//     //   child: Text(
//     //     "Add to Cart",
//     //     style: CustomTextStyles.bodyMediumGray90001_1,
//     //   ),
//     // )
    

//     //   CustomTextFormField(
//     //   width: 120.h,
//     //   controller: addtoCartController,
//     //   hintText: "Add to Cart",
//     //   hintStyle: CustomTextStyles.bodyMediumGray90001_1,
//     //   textInputAction: TextInputAction.done,
//     //   contentPadding: EdgeInsets.symmetric(
//     //     horizontal: 26.h,
//     //     vertical: 9.v,
//     //   ),
//     //   borderDecoration: TextFormFieldStyleHelper.outlineErrorContainer,
//     //   filled: false,
//     // )
  
//   }

//   Widget _buildAddToCart(BuildContext context) {
//     return Obx((){
//        if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       }  else {
//       return
//      homeView_controller.userList.value.categoryData ==  null ||
//                                     homeView_controller.userList.value
//                                             .categoryData?.length ==
//                                         0
//                                 ? Center(child:  Text('Error: ${homeView_controller.error.value}'))
//                                 :    Padding(
//                                   padding: const EdgeInsets.fromLTRB(10,0,10,0),
//                                   child: Container(
//                                     width: Get.width,
//                                     height: Get.height*.3,
//                                     child: ListView.builder(
//                                     itemCount: homeView_controller.userList.value.recommendedProduct?.length ?? 0,
//                                     shrinkWrap: true,
//                                     scrollDirection: Axis.horizontal,
//                                     itemBuilder: (context, index) {
//                                       return Padding(
//                                         padding: EdgeInsets.only(right: 10.0), // Add right padding between items
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             CustomImageView(
//                                               fit: BoxFit.cover,
//                                               imagePath: "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
//                                               height: 120.adaptSize,
//                                               width: 120.adaptSize,
//                                               radius: BorderRadius.circular(10.h),
//                                             ),
//                                             SizedBox(height: 9.v),
  //                                           Text(
  //                                             "Luxury Rhinestone....",
  //                                             style: theme.textTheme.labelLarge,
  //                                           ),
  //                                           SizedBox(height: 1.v),
  //                                           Row(
  //                                             children: [
  //                                               Padding(
  //                                                 padding: EdgeInsets.symmetric(vertical: 1.v),
  //                                                 child: CustomRatingBar(
  //                                                   initialRating: 5,
  //                                                 ),
  //                                               ),
  //                                               Padding(
  //                                                 padding: EdgeInsets.only(left: 4.h),
  //                                                 child: Text(
  //                                                   "(120)",
  //                                                   style: CustomTextStyles.labelMediumGray90001,
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                           SizedBox(height: 2.v),
  //                                           RichText(
  //                                             text: TextSpan(
  //                                               children: [
  //                                                 TextSpan(
  //                                                   text: "99",
  //                                                   style: CustomTextStyles.titleSmallPrimarySemiBold,
  //                                                 ),
  //                                                 TextSpan(
  //                                                   text: " ",
  //                                                 ),
  //                                                 TextSpan(
  //                                                   text: "2k+ sold",
  //                                                   style: theme.textTheme.bodySmall,
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                             textAlign: TextAlign.left,
  //                                           ),
  //                                           SizedBox(height: 6.v),
  //                                           Container(
  //                                             width: 100.h,
  //                                             height: 30.v,
  //                                             decoration: AppDecoration.outlineErrorContainer.copyWith(
  //                                               borderRadius: BorderRadiusStyle.circleBorder35,
  //                                             ),
  //                                             child: Center(
  //                                               child: Text(
  //                                                 "Add to Cart",
  //                                                 style: TextStyle(fontSize: 8, color: Colors.black),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     );
  //                                   },
  //                                 ),
                                  
  //                                 ),
  //                               );

  //   }
  //   }
  //   );
  // }

//   /// Section Widget
//   Widget _buildCart(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: SizedBox(
//         height: 18.v,
//         child: ListView.separated(
//           padding: EdgeInsets.only(left: 20.h),
//           scrollDirection: Axis.horizontal,
//           separatorBuilder: (
//             context,
//             index,
//           ) {
//             return SizedBox(
//               width: 20.h,
//             );
//           },
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             return CartItemWidget();
//           },
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildHomePageSection(BuildContext context) {
//     return Obx((){
//       if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       }  else {
//           return
//      homeView_controller.userList.value.categoryData ==  null ||
//                                     homeView_controller.userList.value
//                                             .categoryData?.length ==
//                                         0
//                                 ? Center(child:  Text('Error: ${homeView_controller.error.value}'))
//                                 :Center(
//         child: GridView.builder(
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             mainAxisExtent: Get.height*.4,
//             crossAxisCount: 2,
//             mainAxisSpacing: 20.h,
//             crossAxisSpacing: 35.h,
//           ),
//           physics: BouncingScrollPhysics(),
//           itemCount: homeView_controller.userList.value.recommendedProduct?.length ?? 0,
//           itemBuilder: (context, index) {
//             return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//              decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                                            
//                                             width: Get.width,padding: EdgeInsets.only(left: 20),
//           height: 170.adaptSize,
           
//             child: Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right:20),
//                   child: CustomImageView(
//                    fit: BoxFit.cover,
//                     onTap: () {
//                           Englishproductid =
//                         homeView_controller.userList.value.recommendedProduct![index].id!.toString();
                        
//                         setState(() {
//                           Englishproductid;
//                         });
//                           Get.to(SinglePageScreen(), 
//                           );
//                         },
//                     imagePath:"${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
//                     // ImageConstant.imgRectangle569,
//                     height: 160.adaptSize,
//                     width: 160.adaptSize,
//                     radius: BorderRadius.circular(
//                       10.h,
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     top: 10.v,
//                     right: 20.h,
//                   ),
//                   child: CustomIconButton(
//                     height: 20.adaptSize,
//                     width: 20.adaptSize,
//                     padding: EdgeInsets.all(5.h),
//                     decoration: IconButtonStyleHelper.fillWhiteA,
//                     alignment: Alignment.topRight,
//                     child: CustomImageView(
//                       imagePath: ImageConstant.imgSearch,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 12.v),
//           // CustomElevatedButton(
//           //   height: 16.v,
//           //   width: 48.h,
//           //   text: "10% Off",
//           //   buttonTextStyle:
//           //       theme.textTheme.labelSmall!.copyWith(color: Colors.white),
//           // ),
//            Container(
//                                                   height: 16.v,
//                                               width: 48.h,
                                              
//                                               decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
//                                               color: Color.fromARGB(71, 228, 193, 204),
//                                               ),
//                                               child: Center(child: Text("10% Off", style: TextStyle(
//                                                 fontSize: 8, color: Color(0xffff8300),fontWeight: FontWeight.w600,
//                                                 // 
//                                               ),),),
//                                             ),
//           SizedBox(height: 5.v),
//           SizedBox(
//             width: 131.h,
//             child: Text(
//               "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
//             //  "Luxury Rhinestone Quartz Watch Ladies Rome...",
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: theme.textTheme.labelLarge!.copyWith(
//                 height: 1.33,
//               ),
//             ),
//           ),
//           SizedBox(height: 3.v),
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "4.8",
//                           style: theme.textTheme.labelMedium,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 3.h),
//                           child: CustomRatingBar(
//                             ignoreGestures: true,
//                             initialRating: 0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 5.v),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text:  "${homeView_controller.userList.value.recommendedProduct?[index].pricee.toString()}",
//                           //"99 ",
//                           style: CustomTextStyles.titleMediumPrimary_2,
//                         ),
//                         TextSpan(
//                           text: "2k+ sold",
//                           style: theme.textTheme.bodySmall,
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 35.h,
//                   top: 5.v,
//                 ),
//                 child: CustomIconButton(onTap: (){
                  
//                 },
//                   height: 25.adaptSize,
//                   width: 25.adaptSize,
//                   padding: EdgeInsets.all(6.h),
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgGroup239533,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//             //HomepagesectionItemWidget();
//           },
//         ),
//       );
//     }
//     }
     
//     );
//   }

//   /// Common widget
//   Widget _buildBy(
//     BuildContext context, {
//     required String userName,
//     required String userFashion,
//   }) {
//     return Row(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: 3.v),
//           child: Text(
//             userName,
//             style: CustomTextStyles.bodySmall12_1.copyWith(
//               color: appTheme.gray50001,
//             ),
//           ),
//         ),
//         CustomImageView(
//           imagePath: ImageConstant.imgEllipse889,
//           height: 15.adaptSize,
//           width: 15.adaptSize,
//           radius: BorderRadius.circular(
//             7.h,
//           ),
//           margin: EdgeInsets.only(left: 4.h),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             left: 4.h,
//             top: 1.v,
//           ),
//           child: Text(
//             userFashion,
//             style: CustomTextStyles.bodySmall12_1.copyWith(
//               color: appTheme.gray50001,
//             ),
//           ),
//         ),
//         CustomImageView(
//           imagePath: ImageConstant.imgVectorGray50001,
//           height: 6.v,
//           width: 3.h,
//           margin: EdgeInsets.only(
//             left: 4.h,
//             top: 3.v,
//             bottom: 4.v,
//           ),
//         ),
//       ],
//     );
//   }

//   /// Common widget
//   Widget _buildPrice(
//     BuildContext context, {
//     required String price,
//     required String one,
//   }) {
//     return SizedBox(
//       width: 221.h,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 1.v),
//             child: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "99",
//                     style: theme.textTheme.titleMedium,
//                   ),
//                   TextSpan(
//                     text: " ",
//                   ),
//                   TextSpan(
//                     text: "120",
//                     style: CustomTextStyles.titleSmallGray50001.copyWith(
//                       decoration: TextDecoration.lineThrough,
//                     ),
//                   ),
//                 ],
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           Container(
//             decoration: AppDecoration.fillPrimary.copyWith(
//               borderRadius: BorderRadiusStyle.circleBorder12,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 24.adaptSize,
//                   width: 24.adaptSize,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 6.h,
//                     vertical: 10.v,
//                   ),
//                   decoration: AppDecoration.fillPrimary.copyWith(
//                     borderRadius: BorderRadiusStyle.circleBorder12,
//                   ),
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgLine1,
//                     height: 1.v,
//                     width: 8.h,
//                     alignment: Alignment.bottomRight,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: 10.h,
//                     top: 5.v,
//                     bottom: 3.v,
//                   ),
//                   child: Text(
//                     one,
//                     style: CustomTextStyles.titleMediumWhiteA7000216.copyWith(
//                       color: appTheme.whiteA70002,
//                     ),
//                   ),
//                 ),
//                 CustomImageView(
//                   imagePath: ImageConstant.imgGroup239412,
//                   height: 24.adaptSize,
//                   width: 24.adaptSize,
//                   margin: EdgeInsets.only(left: 10.h),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Common widget
//   Widget _buildPaymentMethod(
//     BuildContext context, {
//     required String paymentMethodText,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           paymentMethodText,
//           style: theme.textTheme.titleMedium!.copyWith(
//             color: appTheme.gray90001,
//           ),
//         ),
//         GestureDetector(
//           onTap: (){
//            Get.to(() => Default_address());
//           },
//           child: CustomImageView(
//             imagePath: ImageConstant.imgArrowRight,
//             height: 15.adaptSize,
//             width: 15.adaptSize,
//           ),
//         ),
//       ],
//     );
//   }

//   /// Common widget
//   Widget _buildTotal(
//     BuildContext context, {
//     required String total,
//     required String price,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           total,
//           style: theme.textTheme.titleMedium!.copyWith(
//             color: appTheme.gray90001,
//           ),
//         ),
//         Text(
//           price,
//           style: CustomTextStyles.titleMediumPrimary_1.copyWith(
//             color: theme.colorScheme.primary,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildItemDiscount(
//     BuildContext context, {
//     required String itemDiscountText,
//     required String priceText,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           itemDiscountText,
//           style: theme.textTheme.bodyLarge!.copyWith(
//             color: appTheme.gray90001,
//           ),
//         ),
//         Text(
//           priceText,
//           style: CustomTextStyles.titleMediumMedium16.copyWith(
//             color: Color(0xffFF8300),
//           ),
//         ),
//       ],
//     );
//   }
// }
