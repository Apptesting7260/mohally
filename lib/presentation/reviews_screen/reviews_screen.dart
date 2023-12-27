import 'package:get/get.dart';
import 'package:mohally/presentation/add_review_screen/add_review_screen.dart';

import '../reviews_screen/widgets/photos_item_widget.dart';
import '../reviews_screen/widgets/photoslist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 19.v),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAddReviewRow(context),
                    SizedBox(height: 25.v),
                    _buildRonaldRichards(
                      context,
                      userName: "Ronald Richards",
                      userClockText: "13 Sep, 2020",
                    ),
                    SizedBox(height: 20.v),
                    CustomRatingBar(
                      initialRating: 3,
                      itemSize: 14,
                    ),
                    SizedBox(height: 8.v),
                    SizedBox(
                      width: 138.h,
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
                      margin: EdgeInsets.only(right: 13.h),
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
                    _buildPhotosList(context),
                    SizedBox(height: 20.v),
                    _buildShareOne(
                      context,
                      share: "Share",
                      helpfulTwo: "Helpful (2)",
                    ),
                    SizedBox(height: 20.v),
                    Divider(thickness: 1,
                      color:Colors.grey.shade200,
                    ),
                    SizedBox(height: 20.v),
                    _buildRonaldRichards(
                      context,
                      userName: "Ronald Richards",
                      userClockText: "13 Sep, 2020",
                    ),
                    SizedBox(height: 20.v),
                    CustomRatingBar(
                      initialRating: 3,
                      itemSize: 14,
                    ),
                    SizedBox(height: 8.v),
                    SizedBox(
                      width: 138.h,
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
                      margin: EdgeInsets.only(right: 13.h),
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
                    _buildShareOne(
                      context,
                      share: "Share",
                      helpfulTwo: "Helpful (2)",
                    ),
                    SizedBox(height: 20.v),
                    Divider(thickness: 1,
                      color:Colors.grey.shade200,
                    ),
                    SizedBox(height: 20.v),
                    _buildReviewsStack(context),                    SizedBox(height: 60.v),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Item Reviews",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddReviewRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
              ],
            ),
            SizedBox(height: 9.v),
            Text(
              "(200 shop ratings)",
              style: CustomTextStyles.bodyMediumInterGray90001,
            ),
          ],
        ),
        CustomElevatedButton(
          onPressed: () {
            Get.to(() => AddReviewScreen());
          },
          height: 35.v,
          width: 114.h,
          text: "Add Review",
          margin: EdgeInsets.only(
            top: 5.v,
            bottom: 7.v,
          ),
          leftIcon: Container(
            margin: EdgeInsets.only(right: 5.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgEditSquare,
              height: 15.adaptSize,
              width: 15.adaptSize,
            ),
          ),
          buttonTextStyle: CustomTextStyles.labelLargeWhiteA70001,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPhotosList(BuildContext context) {
    return SizedBox(
      height: 80.v,
      child: ListView.separated(
        padding: EdgeInsets.only(right: 76.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 10.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return PhotoslistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildReviewsStack(BuildContext context) {
    return SizedBox(
      height: 327.v,
      width: 335.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 107.v),
                child: SizedBox(
                  width: 335.h,
                  child: Divider(
                    color: appTheme.gray90001.withOpacity(0.39),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRonaldRichards(
                  context,
                  userName: "Ronald Richards",
                  userClockText: "13 Sep, 2020",
                ),
                SizedBox(height: 20.v),
                CustomRatingBar(
                  initialRating: 3,
                  itemSize: 14,
                ),
                SizedBox(height: 8.v),
                SizedBox(
                  width: 138.h,
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
                  margin: EdgeInsets.only(right: 12.h),
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
                SizedBox(
                  height: 80.v,
                  child: ListView.separated(
                    padding: EdgeInsets.only(right: 75.h),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        width: 10.h,
                      );
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return PhotosItemWidget();
                    },
                  ),
                ),
                SizedBox(height: 17.v),
                _buildShareOne(
                  context,
                  share: "Share",
                  helpfulTwo: "Helpful (2)",
                ),
              ],
            ),
          ),
        ],
      ),
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
    required String share,
    required String helpfulTwo,
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
            share,
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
            helpfulTwo,
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
