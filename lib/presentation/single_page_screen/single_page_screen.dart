import 'package:get/get.dart';
import 'package:mohally/presentation/add_review_screen/add_review_screen.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';

import '../single_page_screen/widgets/gridrectangle_item_widget.dart';
import '../single_page_screen/widgets/gridtenoff_item_widget.dart';
import '../single_page_screen/widgets/listrecommended_item_widget.dart';
import '../single_page_screen/widgets/listrectangle1_item_widget.dart';
import '../single_page_screen/widgets/listrectangle_item_widget.dart';
import '../single_page_screen/widgets/listwidget_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:mohally/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class SinglePageScreen extends StatelessWidget {
  const SinglePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStackSixtyNine(context),
              SizedBox(height: 26.v),
              Container(
                width: 304.h,
                margin: EdgeInsets.only(
                  left: 20.h,
                  right: 50.h,
                ),
                child: Text(
                  "NOBERO Men's Travel Cotton Solid Plain Hoody Sports Winter",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumMedium_1.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 12.v),
              Container(
                height: 18.v,
                width: 224.h,
                margin: EdgeInsets.only(left: 20.h),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVectorGray50001,
                      height: 6.v,
                      width: 3.h,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 103.h),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.v,
                              bottom: 1.v,
                            ),
                            child: Text(
                              "25K+ sold, By",
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse88918x18,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            radius: BorderRadius.circular(
                              9.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.v,
                              bottom: 1.v,
                            ),
                            child: Text(
                              "ZLNZ (100K+ sold)",
                              style: CustomTextStyles.bodyMediumGray90001_1,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRightGray90001,
                            height: 8.v,
                            width: 4.h,
                            margin: EdgeInsets.only(
                              top: 3.v,
                              bottom: 5.v,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    CustomRatingBar(
                      initialRating: 4,
                      itemSize: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child: Text(
                        "(200)",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "99",
                            style: CustomTextStyles.titleLargePrimary,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "120",
                            style:
                                CustomTextStyles.titleMediumGray50001.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: 48.h,
                      margin: EdgeInsets.only(
                        left: 9.h,
                        top: 4.v,
                        bottom: 5.v,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 9.h,
                        vertical: 2.v,
                      ),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder8,
                      ),
                      child: Text(
                        "-20 off",
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Color: ",
                        style: theme.textTheme.titleMedium,
                      ),
                      TextSpan(
                        text: "Olive Green",
                        style: CustomTextStyles.bodyLargeGray50001_2,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 11.v),
              _buildListRectangle(context),
              SizedBox(height: 27.v),
              _buildRowSize(context),
              SizedBox(height: 11.v),
              _buildListWidget(context),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 13.v,
                        bottom: 9.v,
                      ),
                      child: Text(
                        "Qty",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      width: 120.h,
                      margin: EdgeInsets.only(left: 14.h),
                      padding: EdgeInsets.symmetric(vertical: 10.v),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgLine1,
                            height: 1.v,
                            width: 13.h,
                            margin: EdgeInsets.symmetric(vertical: 9.v),
                          ),
                          Text(
                            "1",
                            style: CustomTextStyles.titleLargeWhiteA7000220,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup239412WhiteA70002,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                            margin: EdgeInsets.only(
                              top: 2.v,
                              bottom: 3.v,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: _buildShoppingSecurity(
                  context,
                  image: ImageConstant.imgMaskGroup4,
                  securityMessage: "Shipping",
                ),
              ),
              SizedBox(height: 12.v),
              _buildRowDescription(context),
              SizedBox(height: 35.v),
              _buildRowReturnOne(context),
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: _buildShoppingSecurity(
                  context,
                  image: ImageConstant.imgMaskGroup16x16,
                  securityMessage: "Shopping security",
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Text(
                  "Safe Payment Options",
                  style: CustomTextStyles.bodyMediumInter,
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Text(
                  "Secure logistics",
                  style: CustomTextStyles.bodyMediumInter,
                ),
              ),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Text(
                  "Secure privacy",
                  style: CustomTextStyles.bodyMediumInter,
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Text(
                  "Purchase protection",
                  style: CustomTextStyles.bodyMediumInter,
                ),
              ),
              SizedBox(height: 25.v),
              _buildRowItemsReviewsAnd(context),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    Text(
                      "4.8",
                      style: CustomTextStyles.titleMediumInter,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 2.v,
                        bottom: 2.v,
                      ),
                      child: CustomRatingBar(
                        initialRating: 4,
                        itemSize: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 2.v,
                      ),
                      child: Text(
                        "(200 shop ratings)",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: _buildRonaldRichards(
                  context,
                  userName: "Ronald Richards",
                  userClockText: "13 Sep, 2020",
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: CustomRatingBar(
                  initialRating: 2,
                  itemSize: 14,
                ),
              ),
              SizedBox(height: 8.v),
              Container(
                width: 138.h,
                margin: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Purchase : Black/L(40)\nOverall : True to size",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMedium15.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 4.v),
              Container(
                width: 322.h,
                margin: EdgeInsets.only(
                  left: 20.h,
                  right: 32.h,
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumGray9000115.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 13.v),
              _buildListRectangle1(context),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: _buildShareOne(
                  context,
                  userShareLabel: "Share",
                  userHelpfulLabel: "Helpful (2)",
                ),
              ),
              SizedBox(height: 20.v),
              Opacity(
                opacity: 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Divider(
                    color: appTheme.gray90001.withOpacity(0.39),
                    indent: 19.h,
                    endIndent: 20.h,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: _buildRonaldRichards(
                  context,
                  userName: "Ronald Richards",
                  userClockText: "13 Sep, 2020",
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: CustomRatingBar(
                  initialRating: 3,
                  itemSize: 14,
                ),
              ),
              SizedBox(height: 8.v),
              Container(
                width: 138.h,
                margin: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Purchase : Black/L(40)\nOverall : True to size",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMedium15.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 4.v),
              Container(
                width: 322.h,
                margin: EdgeInsets.only(
                  left: 20.h,
                  right: 32.h,
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumGray9000115.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: _buildShareOne(
                  context,
                  userShareLabel: "Share",
                  userHelpfulLabel: "Helpful (2)",
                ),
              ),
              SizedBox(height: 30.v),
              _buildRowFollow(context),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Products details",
                  style: CustomTextStyles.titleMedium_1,
                ),
              ),
              SizedBox(height: 14.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Material: ",
                        style: CustomTextStyles.bodyLargeGray50001_2,
                      ),
                      TextSpan(
                        text: "Polyester",
                        style: CustomTextStyles.titleMediumMedium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Composition: ",
                        style: CustomTextStyles.bodyLargeGray50001_2,
                      ),
                      TextSpan(
                        text: "100% Polyester",
                        style: CustomTextStyles.titleMediumMedium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Details: ",
                        style: CustomTextStyles.bodyLargeGray50001_2,
                      ),
                      TextSpan(
                        text: "None",
                        style: CustomTextStyles.titleMediumMedium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "See All",
                  style: CustomTextStyles.titleMediumPrimaryMedium,
                ),
              ),
              SizedBox(height: 17.v),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle569491x375,
                height: 480.v,
                width: 335.h,
                alignment: Alignment.center,
              ),
              SizedBox(height: 5.v),
              _buildGridRectangle(context),
              SizedBox(height: 5.v),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle569491x375,
                height: 480.v,
                width: 335.h,
                alignment: Alignment.center,
              ),
              SizedBox(height: 18.v),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "See All",
                      style: CustomTextStyles.titleMediumPrimaryMedium,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVectorPrimary,
                      height: 4.v,
                      width: 8.h,
                      margin: EdgeInsets.only(
                        left: 6.h,
                        top: 5.v,
                        bottom: 5.v,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17.v),
              _buildAddToCart(context),
              SizedBox(height: 37.v),
              _buildListRecommended(context),
              SizedBox(height: 15.v),
              _buildGridTenOff(context),
              SizedBox(height: 15.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildButtonOneHundredTen(BuildContext context) {
    return CustomElevatedButton(
      height: 20.v,
      width: 41.h,
      text: "1/10",
      margin: EdgeInsets.only(right: 20.h),
      buttonStyle: CustomButtonStyles.fillErrorContainer,
      buttonTextStyle: CustomTextStyles.bodySmallWhiteA70002,
      alignment: Alignment.centerRight,
    );
  }

  /// Section Widget
  Widget _buildStackSixtyNine(BuildContext context) {
    return Container(
      height: 491.v,
      width: double.maxFinite,
      decoration: AppDecoration.fillGray10003,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle569491x375,
            height: 491.v,
            width: 375.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar(
                  height: 40.v,
                  leadingWidth: 60.h,
                  leading: AppbarLeadingIconbuttonOne(
                    onTap: () {
                      Get.back();
                    },
                    imagePath: ImageConstant.imgBack,
                    margin: EdgeInsets.only(left: 20.h),
                  ),
                  actions: [
                    AppbarTrailingIconbutton(
                      imagePath: ImageConstant.imgSearchGray90001,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                    ),
                  ],
                ),
                SizedBox(height: 371.v),
                _buildButtonOneHundredTen(context),
                SizedBox(height: 10.v),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 10.v,
                  ),
                  decoration: AppDecoration.fillPrimary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMaskGroup1,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(top: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 3.v,
                        ),
                        child: Text(
                          "Free shipping for you",
                          style: CustomTextStyles.labelLargeInterWhiteA70002,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 1.v,
                          bottom: 2.v,
                        ),
                        child: Text(
                          "Time-limited offer",
                          style: CustomTextStyles.bodySmallInterWhiteA70002,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildListRectangle(BuildContext context) {
    return Align(
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
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListrectangleItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Size",
              style: theme.textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
                "Size Guide",
                style: CustomTextStyles.bodyMedium15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListWidget(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 32.v,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 20.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 10.h,
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListwidgetItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowDescription(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.h),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 9.v,
                  ),
                  decoration: AppDecoration.fillGray10003.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.v),
                      SizedBox(
                        width: 224.h,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Standard: free on all orders",
                                style: CustomTextStyles.labelLargeInterPrimary,
                              ),
                              TextSpan(
                                text: " Delivery ",
                                style: CustomTextStyles.bodySmallInter,
                              ),
                              TextSpan(
                                text: "Nov 15-23, 73.9% are ≤ 8 days",
                                style: CustomTextStyles.labelLargeInter,
                              ),
                              TextSpan(
                                text:
                                    " Get a £5.00 credit for late delivery Courier company:",
                                style: CustomTextStyles.bodySmallInter,
                              ),
                              TextSpan(
                                text: " Royal Mail, Yodel, etc",
                                style: CustomTextStyles.labelLargeInter,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 9.v,
                  ),
                  decoration: AppDecoration.fillGray10003.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.v),
                      SizedBox(
                        width: 270.h,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Express\n",
                                style: CustomTextStyles.labelLargeInter,
                              ),
                              TextSpan(
                                text: "Delivery ",
                                style: CustomTextStyles.bodySmallInter,
                              ),
                              TextSpan(
                                text: "Nov 15-23, 73.9% are ≤ 8 days",
                                style: CustomTextStyles.labelLargeInter,
                              ),
                              TextSpan(
                                text:
                                    " Get a £5.00 credit for late delivery Courier company:",
                                style: CustomTextStyles.bodySmallInter,
                              ),
                              TextSpan(
                                text: " Royal Mail, Yodel, etc",
                                style: CustomTextStyles.labelLargeInter,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
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
    );
  }

  /// Section Widget
  Widget _buildRowReturnOne(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgReturn1,
              height: 16.adaptSize,
              width: 16.adaptSize,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Text(
                "Free returns",
                style: CustomTextStyles.titleMedium16,
              ),
            ),
            Container(
              height: 4.adaptSize,
              width: 4.adaptSize,
              margin: EdgeInsets.only(
                left: 4.h,
                top: 6.v,
                bottom: 6.v,
              ),
              decoration: BoxDecoration(
                color: appTheme.gray90001,
                borderRadius: BorderRadius.circular(
                  2.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                "Price adjustment",
                style: CustomTextStyles.titleMedium16,
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRightGray90001,
              height: 8.v,
              width: 4.h,
              margin: EdgeInsets.symmetric(vertical: 4.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowItemsReviewsAnd(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Items reviews and shop ratings",
              style: CustomTextStyles.titleMedium16_2,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => ReviewsScreen());
              },
              child: Text(
                "See All",
                style: CustomTextStyles.titleSmallPrimary,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRightPrimary,
              height: 8.v,
              width: 4.h,
              margin: EdgeInsets.only(
                left: 6.h,
                top: 2.v,
                bottom: 4.v,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListRectangle1(BuildContext context) {
    return SizedBox(
      height: 80.v,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 95.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 100.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Listrectangle1ItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFollow(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        height: 36.v,
        text: "Follow",
        margin: EdgeInsets.only(right: 5.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleSmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildShopAllItems(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        height: 36.v,
        text: "Shop all items",
        margin: EdgeInsets.only(left: 5.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleSmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowFollow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray10003,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse88944x44,
            height: 44.adaptSize,
            width: 44.adaptSize,
            radius: BorderRadius.circular(
              22.h,
            ),
            margin: EdgeInsets.only(bottom: 52.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 2.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ZLNZ ",
                    style: CustomTextStyles.titleMediumMedium16,
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(right: 23.h),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "1.2K+ ",
                                style: CustomTextStyles.titleMediumMedium,
                              ),
                              TextSpan(
                                text: "Followers",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "100K+ ",
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                                TextSpan(
                                  text: "Sold",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "144 ",
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                                TextSpan(
                                  text: "Items",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFollow(context),
                      _buildShopAllItems(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGridRectangle(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 201.v,
              crossAxisCount: 2,
              mainAxisSpacing: 5.h,
              crossAxisSpacing: 5.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GridrectangleItemWidget();
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return CustomOutlinedButton(
      text: "Add to Cart",
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL25,
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildListRecommended(BuildContext context) {
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
            return ListrecommendedItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGridTenOff(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
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
            itemCount: 12,
            itemBuilder: (context, index) {
              return GridtenoffItemWidget();
            },
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildShoppingSecurity(
    BuildContext context, {
    required String image,
    required String securityMessage,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: image,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 7.h),
          child: Text(
            securityMessage,
            style: CustomTextStyles.titleMedium16.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightGray90001,
          height: 8.v,
          width: 4.h,
          margin: EdgeInsets.symmetric(vertical: 4.v),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildRonaldRichards(
    BuildContext context, {
    required String userName,
    required String userClockText,
  }) {
    return Row(
      children: [
        Container(
          height: 40.adaptSize,
          width: 40.adaptSize,
          decoration: AppDecoration.fillBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder20,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgRectangle568,
            height: 40.adaptSize,
            width: 40.adaptSize,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: CustomTextStyles.titleSmall15.copyWith(
                  color: appTheme.gray90001,
                ),
              ),
              SizedBox(height: 8.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgClock,
                    height: 15.adaptSize,
                    width: 15.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5.h,
                      bottom: 2.v,
                    ),
                    child: Text(
                      userClockText,
                      style: CustomTextStyles.bodySmall11.copyWith(
                        color: appTheme.gray50001,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildShareOne(
    BuildContext context, {
    required String userShareLabel,
    required String userHelpfulLabel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgShare1,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            userShareLabel,
            style: CustomTextStyles.bodySmallInterGray90001.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgLike1,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 10.h),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            userHelpfulLabel,
            style: CustomTextStyles.bodySmallInterGray90001.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgGroup239583,
          height: 15.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 10.h),
        ),
      ],
    );
  }
}
