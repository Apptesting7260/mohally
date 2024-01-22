import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_whishlishScreen/arabic_whishlist_widgets.dart';
import 'package:mohally/Arabic/Screens/Payment/arabic_payment_screen.dart';
import 'package:mohally/Arabic/widgets/Address/arabic_shippingaddress.dart';
import 'package:mohally/Arabic/widgets/arabic_order_confirmed.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_radio_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

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
  bool isSelected=false;
   bool isSelected2=false;
   bool allSelected=false;
  String radioGroup = "";

  TextEditingController trailRunningJacketByController =
      TextEditingController();

  String radioGroup1 = "";

  TextEditingController vectorController = TextEditingController();

  TextEditingController group166Controller = TextEditingController();

  String radioGroup2 = "";

  TextEditingController addtoCartController = TextEditingController();

   @override
  void initState() {
    super.initState();
        setInitialLocale();
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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:  AppBar(
          title: Text( "سلة التسوق الخاصة بي",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),),
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
 
        body: Padding(
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
                      "3 عناصر",
                      style: theme.textTheme.titleLarge?.copyWith(fontFamily: 'Almarai', fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 6.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "في العربة",
                      style: CustomTextStyles.bodyLargeGray50001_3?.copyWith(fontFamily: 'Almarai',),
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
                  
                   Text('عنوان التسليم', style: TextStyle(fontFamily: 'Almarai', fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),),
                    GestureDetector(
                      onTap: () {
                        Get.to(ShippingaddressesItemWidget_arabic());
                      },
                      child: Icon(Icons.keyboard_arrow_left, color: Colors.black,)),
                 ],
                ),
                SizedBox(height: 14.v),
                _buildNewbridgeCourt(context),
                SizedBox(height: 29.v),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  
                   Text('طريقة الدفع او السداد', style: TextStyle(fontFamily: 'Almarai', fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),),
                    GestureDetector(
                      onTap: () {
                        Get.to(Payment_Screen_arabic());
                      },
                      child: Icon(Icons.keyboard_arrow_left, color: Colors.black,)),
                 ],
                ),
                SizedBox(height: 15.v),
                _buildVisaClassic(context),
                SizedBox(height: 29.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "رمز الكوبون",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 7.v),
                _buildCouponCode(context),
                SizedBox(height: 28.v),
                _buildItemTotal(context),
                SizedBox(height: 15.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: _buildTotal(
                    context,
                    total: "خصم السلعة:",
                    price: "20",
                  ),
                ),
                SizedBox(height: 15.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: _buildTotal(
                    context,
                    total: "المجموع",
                    price: "79\$",
                  ),
                ),
                SizedBox(height: 17.v),
                _buildAll(context),
                SizedBox(height: 29.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "استكشف اهتماماتك",
                      style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
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
                            "خيارات الدفع الآمنة",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xffff8300), fontFamily: 'Almarai'),
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
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, fontFamily: 'Almarai'),
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
                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xffff8300), fontFamily: 'Almarai'),
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
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, fontFamily: 'Almarai'),
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
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xffff8300), fontFamily: 'Almarai'),
                          
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
                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, fontFamily: 'Almarai'),
                    ),
                  ),
                ),
                SizedBox(height: 21.v),
                _buildCart(context),
                SizedBox(height: 15.v),
                _buildCart1(context),
                SizedBox(height: 15.v),
              ],
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
              "شحن مجاني وإرجاع مجاني",
              style: CustomTextStyles.labelLargeInterPrimarySemiBold?.copyWith(fontFamily: 'Almarai',),
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
              style: CustomTextStyles.bodySmallInterGray90001?.copyWith(fontFamily: 'Almarai',),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTrailRunningJacketBy(BuildContext context) {
    return 
    CustomTextFormField(
      width:Get.width*.3,
      controller: trailRunningJacketByController,
      hintText: "أزرق داكن/متوسط(38)",
      hintStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
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
              padding: EdgeInsets.only(right: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                             Row(
             children: [
              Text("سترة الجري من نايك...",style: theme.textTheme.titleSmall?.copyWith(fontFamily: 'Almarai',),),
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
                  _buildTrailRunningJacketBy(context),
                  SizedBox(height: 9.v),
                  Text(
                    "الجمعة السوداء! ينتهي في 16:19:50:21",
                    style: CustomTextStyles.labelLargePrimary?.copyWith(fontFamily: 'Almarai',),
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
      width: 98.h,
      controller: vectorController,
      hintText: "أزرق داكن/متوسط(38)",
      hintStyle: CustomTextStyles.bodySmallGray90001?.copyWith(fontFamily: 'Almarai',),
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
            padding: EdgeInsets.only(right: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            SizedBox(height: 20),
           Row(
             children: [
              Text("سترة الجري من نايك...",style: theme.textTheme.titleSmall?.copyWith(fontFamily: 'Almarai',),),
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
                //   textStyle: theme.textTheme.titleSmall?.copyWith(fontFamily: 'Almarai',),
                //   isRightCheck: true,
                //   onChange: (value) {
                //     radioGroup1 != value;
                //   },
                // ),
                SizedBox(height: 9.v),
                _buildVector(context),
                SizedBox(height: 9.v),
                Text(
                  "الجمعة السوداء! ينتهي في 16:19:50:21",
                  style: CustomTextStyles.labelLargePrimary?.copyWith(fontFamily: 'Almarai',),
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
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black, fontFamily: 'Almarai')
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
              "3 نيوبريدج كورت تشينو هيلز،كاليفورنيا 91709، الولايات المتحدة",
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
                  "يتقدم",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Almarai', color:  Color(0xffff8300))
                  
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
            "\$99",
            style: CustomTextStyles.titleMediumMedium16,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        // Get.to(()=>PriceDetailsBottomsheet());
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
                                style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
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
                         height: Get.height*.2,
                      width: Get.width*.3,
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
                              buttonTextStyle:
                                   TextStyle(fontSize: 16, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255),fontFamily: 'Almarai'),
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
                                text: "المجموع \$",
                                style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),fontFamily: 'Almarai'),
                              ),
                              TextSpan(
                                text: " 218",
                                style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),fontFamily: 'Almarai'),
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
              Text("الجميع",style: theme.textTheme.titleSmall?.copyWith(fontFamily: 'Almarai',),),
            
               GestureDetector(
                  onTap: () {
                    setState(() {
                      allSelected = !allSelected;
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
                    child: allSelected
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
      height: 40.v,
      width: 130.h,
      text: "الدفع",
      margin: EdgeInsets.only(left: 10.h),
      buttonStyle: CustomButtonStyles.fillPrimaryTL20,
      buttonTextStyle:   TextStyle(fontSize: 16, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255),fontFamily: 'Almarai'),
    );
  }

  /// Section Widget
  Widget _buildAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCheckout(context),
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
                              text: "المجموع \$",
                              style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),fontFamily: 'Almarai'),
                            ),
                            TextSpan(
                              text: " 79",
                              style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0),fontFamily: 'Almarai'),
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
  
          Text('All', style: TextStyle(fontSize: 18, fontFamily: 'Almarai', fontWeight: FontWeight.w400, color: Colors.black),),
           CustomRadioButton(
            text: "all",
            value: "الجميع",
            groupValue: radioGroup2,
            padding: EdgeInsets.symmetric(vertical: 1.v),
            textStyle:  TextStyle(fontSize: 5, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255),fontFamily: 'Almarai'),
            onChange: (value) {
              radioGroup2 = value;
            },
          ),
],
       )
        //  Padding(
        //   padding: EdgeInsets.symmetric(vertical: 11.v),
        //   child: 
        // CustomRadioButton(
        //     text: "all",
        //     value: "الجميع",
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

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
     return Expanded(
  child: Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      height: Get.height*.3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return  Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 20.h),
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle569,
                      height: 120.adaptSize,
                      width: 120.adaptSize,
                      radius: BorderRadius.circular(
                        10.h,
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "حجر الراين الفاخر....",
                      style: theme.textTheme.labelLarge?.copyWith(fontFamily: 'Almarai'),
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
                            text: "2k+ مُباع",
                            style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Almarai'),
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "99\$",
                            style: 
                            TextStyle(fontSize: 12, color: Color(0xffff8300), fontFamily: 'Almarai'),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 15.v),
                    Container(
                      width: 115.h,
                      height: 40.v,
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
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            )))
      );
        },
      ),
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
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: Get.height*.4,
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return WishlistgridItemWidget_arabic();
          },
        ),
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
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 10.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder12,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLine1,
                    height: 1.v,
                    width: 8.h,
                    alignment: Alignment.bottomRight,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 5.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    one,
                    style: CustomTextStyles.titleMediumWhiteA7000216.copyWith(
                      color: appTheme.whiteA70002,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgGroup239412,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 10.h),
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
  
  
  }

