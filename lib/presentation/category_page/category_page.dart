import 'package:get/get.dart';

import '../category_page/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Categories",
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 23.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Center(
                  child: Stack(
                    children: [
                      CustomSearchView(
                        readOnly: true,
                        enableTap: true,
                        controller: searchController,
                        hintText: "search",
                      ),
                        Positioned(
                  top: 20,
                  left: 240,
                  child: GestureDetector(
                    onTap: (){
                      //  showDialog(
                      //         context: context,
                      //         builder: (BuildContext context) {
                      //           return AlertDialog(
                      //             title: Text("Choose"),
                      //             content: Row(
                      //               children: [
                      //                 GestureDetector(
                      //                   child: Text("Camera"),
                      //                   onTap: () {
                      //                     openCameraa(ImageSource.camera);
                      //                   },
                      //                 ),
                      //                 SizedBox(width: 80),
                      //                 GestureDetector(
                      //                   child: Text("Gallery"),
                      //                   onTap: () {
                      //                     openCameraa(ImageSource.gallery);
                      //                   },
                      //                 ),
                      //               ],
                      //             ),
                      //           );
                      //         }
                      //         );
                      _buildOncameraclick(context);
                    },
                    
                    child: Image.asset('assets/images/greycamera.png'))),
                    ],
                  ),
                ),
              ),
              ),
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.only(right: 23.h),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16.v),
                      decoration: AppDecoration.fillGray,
                      child: Column(
                        children: [
                          Container(
                            decoration: AppDecoration.fillWhiteA,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 30.v,
                                  child: VerticalDivider(
                                    width: 2.h,
                                    thickness: 2.v,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.h,
                                    top: 7.v,
                                    bottom: 8.v,
                                  ),
                                  child: Text(
                                    "Featured",
                                    style: CustomTextStyles.titleSmall15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 33.h,
                                  child: Text(
                                    "Home &\nkitchen",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 5.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.v),
                                SizedBox(
                                  width: 36.h,
                                  child: Text(
                                    "Women’s \nClothing",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 5.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.v),
                                SizedBox(
                                  width: 62.h,
                                  child: Text(
                                    "Women’s \nCurve Clothing",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 36.h,
                                  child: Text(
                                    "Women’s \nShoes",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 5.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.v),
                                SizedBox(
                                  width: 42.h,
                                  child: Text(
                                    "Women’s \nLingerie & \nLounge",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 35.h,
                                  child: Text(
                                    "Men’s \nClothing",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 24.adaptSize,
                                  child: Text(
                                    "Men’s \nShoes",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 49.h,
                                  child: Text(
                                    "Men’s Big &\nTall",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 5.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.v),
                                SizedBox(
                                  width: 55.h,
                                  child: Text(
                                    "Men’s\nUnderwear &\nSleepwear",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 39.h,
                                  child: Text(
                                    "Sports &\nOutdoors",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 39.h,
                                  child: Text(
                                    "Sports &\nOutdoors",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 82.v),
                          Container(
                            width: 90.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 11.h,
                              vertical: 6.v,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 47.h,
                                  child: Text(
                                    "Jewelry &\nAccessories",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallGray90001
                                        .copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 21.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 7.h),
                              child: Text(
                                "Shop by category",
                                style: CustomTextStyles.titleMedium16,
                              ),
                            ),
                            SizedBox(height: 17.v),
                            _buildCategory(context),
                          ],
                        ),
                      ),
                    ),
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
  Widget _buildCategory(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 2,
        crossAxisSpacing: 240.h,
        mainAxisSpacing: 240.h,
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(2);
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return CategoryItemWidget();
        },
      ),
    );
  }
  Future _buildOncameraclick(BuildContext context){
  return showModalBottomSheet(
     context: context,
              builder: (BuildContext context) {
      return Container(
 width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 17.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
       child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMaskGroup24x24,
            height: 24.adaptSize,
            width: 24.adaptSize,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 20.h),
            onTap: () {
              Get.back();
            },
          ),
          SizedBox(height: 17.v),
          Divider(
            thickness: 0.5,
            color: Colors.grey
          ),
          SizedBox(height: 15.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath:"assets/images/blackcamera.png",
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 6.h,
                  top: 3.v,
                ),
                child: Text(
                  "Take photo",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 19.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: "assets/images/blackvideo.png",
                height: 16.adaptSize,
                width: 16.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.h),
                child: Text(
                  "Select from album",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 22.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath:  "assets/images/clock.png",
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 6.h,
                  top: 3.v,
                ),
                child: Text(
                  "Search history",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 17.v),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: CustomTextStyles.titleMediumPrimaryMedium,
            ),
          ),
        ],
      ));}
      );
}
}
