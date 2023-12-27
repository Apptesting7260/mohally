import 'package:get/get.dart';
import 'package:mohally/presentation/price_details_bottomsheet/price_details_bottomsheet.dart';
import 'package:mohally/presentation/single_page_screen/single_page_screen.dart';

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
class CartPage extends StatelessWidget {
  CartPage({Key? key})
      : super(
          key: key,
        );

  String radioGroup = "";

  TextEditingController trailRunningJacketByController =
      TextEditingController();

  String radioGroup1 = "";

  TextEditingController vectorController = TextEditingController();

  TextEditingController group166Controller = TextEditingController();

  String radioGroup2 = "";

  TextEditingController addtoCartController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: ListView(
            children: [
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    "3 Items",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(height: 6.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    "in cart",
                    style: CustomTextStyles.bodyLargeGray50001_3,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: _buildPaymentMethod(
                  context,
                  paymentMethodText: "Delivery Address",
                ),
              ),
              SizedBox(height: 14.v),
              _buildNewbridgeCourt(context),
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: _buildPaymentMethod(
                  context,
                  paymentMethodText: "Payment Method",
                ),
              ),
              SizedBox(height: 15.v),
              _buildVisaClassic(context),
              SizedBox(height: 29.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    "Coupon Code",
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
                  total: "Item discount:",
                  price: "20",
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: _buildTotal(
                  context,
                  total: "Total",
                  price: "79",
                ),
              ),
              SizedBox(height: 17.v),
              _buildAll(context),
              SizedBox(height: 29.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    "Explore your interests",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(height: 19.v),
              _buildAddToCart(context),
              SizedBox(height: 30.v),
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
                          "Safe Payment Options",
                          style: CustomTextStyles.titleMediumPrimary_1,
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
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      height: 1.43,
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
                        imagePath: ImageConstant.imgMaskGroup2,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(bottom: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "Secure privacy",
                          style: CustomTextStyles.titleMediumPrimary_1,
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
                    style: theme.textTheme.bodyMedium!.copyWith(
                      height: 1.43,
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
                        imagePath: ImageConstant.imgMaskGroup3,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(bottom: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "Mohally Purchase protection",
                          style: CustomTextStyles.titleMediumPrimary_1,
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
                    style: theme.textTheme.bodyMedium!.copyWith(
                      height: 1.43,
                    ),
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
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "My Cart",
        margin: EdgeInsets.only(left: 20.h),
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
          color: Colors.orange.shade50),
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
              "Free shipping and free retunrs",
              style: CustomTextStyles.labelLargeInterPrimarySemiBold,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              right: 3.h,
            ),
            child: Text(
              "Time-limited",
              style: CustomTextStyles.bodySmallInterGray90001,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTrailRunningJacketBy(BuildContext context) {
    return CustomTextFormField(
      width: 98.h,
      controller: trailRunningJacketByController,
      hintText: "Dark Blue/M(38)",
      hintStyle: CustomTextStyles.bodySmallGray90001,
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
      padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                CustomRadioButton(
                  width: 221.h,
                  text: "Trail Running Jacket Nike...",
                  value: "Trail Running Jacket Nike...",
                  groupValue: radioGroup,
                  textStyle: theme.textTheme.titleSmall,
                  isRightCheck: true,
                  onChange: (value) {
                    radioGroup = value;
                  },
                ),
                _buildBy(
                  context,
                  userName: "By",
                  userFashion: "Wild Yi fashion",
                ),
                SizedBox(height: 9.v),
                _buildTrailRunningJacketBy(context),
                SizedBox(height: 9.v),
                Text(
                  "Black Friday! Ends in 16:19:50:21",
                  style: CustomTextStyles.labelLargePrimary,
                ),
                SizedBox(height: 6.v),
                _buildPrice(
                  context,
                  price: "99 120",
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
  Widget _buildVector(BuildContext context) {
    return CustomTextFormField(
      width: 98.h,
      controller: vectorController,
      hintText: "Dark Blue/M(38)",
      hintStyle: CustomTextStyles.bodySmallGray90001,
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
      padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                CustomRadioButton(
                  width: 221.h,
                  text: "Trail Running Jacket Nike...",
                  value: "Trail Running Jacket Nike...",
                  groupValue: radioGroup1,
                  textStyle: theme.textTheme.titleSmall,
                  isRightCheck: true,
                  onChange: (value) {
                    radioGroup1 = value;
                  },
                ),
                _buildBy(
                  context,
                  userName: "By",
                  userFashion: "Wild Yi fashion",
                ),
                SizedBox(height: 9.v),
                _buildVector(context),
                SizedBox(height: 9.v),
                Text(
                  "Black Friday! Ends in 16:19:50:21",
                  style: CustomTextStyles.labelLargePrimary,
                ),
                SizedBox(height: 6.v),
                _buildPrice(
                  context,
                  price: "99 120",
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
      height: 55.v,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 8.v,
      ),
      decoration: BoxDecoration(color: Colors.orange.shade50),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 306.h,
              child: Text(
                "    Item availability and pricing are not guaranteed until \npayment is final",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallInterGray90001.copyWith(
                  height: 1.50,
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgInfoCircle1,
            height: 10.adaptSize,
            width: 10.adaptSize,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 6.v),
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
          Container(
            width: 193.h,
            margin: EdgeInsets.only(
              left: 15.h,
              top: 5.v,
              bottom: 4.v,
            ),
            child: Text(
              "3 Newbridge Court  Chino Hills, \nCA 91709, United States",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumGray9000115.copyWith(
                height: 1.47,
              ),
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
          hintText: "Enter coupon code here",
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
                  style: CustomTextStyles.titleMediumPrimary_1,
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
            "Item total:",
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            "99",
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
            return Container(
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
                              "Price Details",
                              style: theme.textTheme.titleMedium,
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
                          "Cart (1)",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle56980x80,
                      height: 80.adaptSize,
                      width: 80.adaptSize,
                      radius: BorderRadius.circular(
                        5.h,
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20.h),
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
                        itemDiscountText: "Item total:",
                        priceText: "\$198",
                      ),
                    ),
                    SizedBox(height: 15.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: _buildItemDiscount(
                        context,
                        itemDiscountText: "Item discount:",
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 11.v),
                            child: CustomRadioButton(
                              text: "All",
                              value: "All",
                              groupValue: radioGroup,
                              padding: EdgeInsets.symmetric(vertical: 1.v),
                              textStyle: CustomTextStyles.bodyLarge18,
                              onChange: (value) {
                                radioGroup = value;
                              },
                            ),
                          ),
                          Container(
                            height: 40.v,
                            width: 120.h,
                            margin: EdgeInsets.only(left: 23.h),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 27.h,
                                      top: 12.v,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Total",
                                            style: CustomTextStyles
                                                .bodyMediumGray90001,
                                          ),
                                          TextSpan(
                                            text: " 218",
                                            style: CustomTextStyles
                                                .titleSmallSemiBold,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 40.v,
                                    width: 130.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 26.h,
                                      vertical: 16.v,
                                    ),
                                    decoration: AppDecoration
                                        .outlineErrorContainer
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder20,
                                    ),
                                    child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgVectorGray900013x6,
                                      height: 5.v,
                                      width: 10.h,
                                      alignment: Alignment.topRight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              Get.to(() => SinglePageScreen());
                            },
                            height: 40.v,
                            width: 120.h,
                            text: "Checkout",
                            margin: EdgeInsets.only(left: 10.h),
                            buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA70016,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
            ;
          },
        );
      },
      height: 40.v,
      width: 130.h,
      text: "Checkout",
      margin: EdgeInsets.only(left: 10.h),
      buttonStyle: CustomButtonStyles.fillPrimaryTL20,
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA70016,
    );
  }

  /// Section Widget
  Widget _buildAll(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11.v),
            child: CustomRadioButton(
              text: "All",
              value: "All",
              groupValue: radioGroup2,
              padding: EdgeInsets.symmetric(vertical: 1.v),
              textStyle: CustomTextStyles.bodyLarge18,
              onChange: (value) {
                radioGroup2 = value;
              },
            ),
          ),
          Container(
            height: 40.v,
            width: 125.h,
            margin: EdgeInsets.only(left: 23.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 28.h,
                      top: 12.v,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Total",
                            style: CustomTextStyles.bodyMediumGray90001,
                          ),
                          TextSpan(
                            text: " 79",
                            style: CustomTextStyles.titleSmallSemiBold,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40.v,
                    width: 125.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.h,
                      vertical: 16.v,
                    ),
                    decoration: AppDecoration.outlineErrorContainer.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder20,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgVectorGray900015x10,
                      height: 5.v,
                      width: 10.h,
                      alignment: Alignment.topRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildCheckout(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddtoCart(BuildContext context) {
    return Container(
      width: 120.h,
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
          style: TextStyle(fontSize: 13, color: Colors.black),
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
    ;

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
    ;
  }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return Align(
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
                    width: 120.h,
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
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: Column(
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
                      width: 120.h,
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
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: Column(
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
                    _buildAddtoCart(context),
                  ],
                ),
              ),
            ],
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
        height: 18.v,
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
            return CartItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCart1(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 265.v,
            crossAxisCount: 2,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 15.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Cart1ItemWidget();
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
