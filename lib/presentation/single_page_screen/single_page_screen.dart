import 'package:get/get.dart';
import 'package:mohally/presentation/home_page_one_page/widgets/homepagesection_item_widget.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import '../single_page_screen/widgets/gridrectangle_item_widget.dart';
import '../single_page_screen/widgets/listrectangle1_item_widget.dart';
import '../single_page_screen/widgets/listrectangle_item_widget.dart';
import '../single_page_screen/widgets/listwidget_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:mohally/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class SinglePageScreen extends StatefulWidget {
  const SinglePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SinglePageScreen> createState() => _SinglePageScreenState();
}

class _SinglePageScreenState extends State<SinglePageScreen> {

   int selectedTabIndex=0;
 List<String> recomemded_text = [
  'Recommended',
  'Men\'s clothing',
 'Recommended',
  'Men\'s clothing',
 'Recommended',
];
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
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Text(
               "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'League Spartan')
                ),
              ),
              SizedBox(height: 12.v),
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: Text(
                               "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'League Spartan')
                              ),
                            ),
            
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: Row(
                  children: [
                    
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "4.8",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ),
                    CustomRatingBar(
                      initialRating: 4,
                      itemSize: 16,
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
                            text: "\$99 ",
                            style: CustomTextStyles.titleLargePrimary,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: " \$120",
                            style:
                                CustomTextStyles.titleMediumGray50001.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: Get.width*.02,),
                    // Container(
                    //   width: 48.h,
                    //   margin: EdgeInsets.only(
                    //     left: 9.h,
                    //     top: 4.v,
                    //     bottom: 5.v,
                    //   ),
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 9.h,
                    //     vertical: 2.v,
                    //   ),
                    //   decoration: AppDecoration.fillPrimary.copyWith(
                    //     borderRadius: BorderRadiusStyle.roundedBorder8,
                    //   ),
                      // child: Text(
                      //   "-20% خصم",
                      //   style: TextStyle(color: Colors.white, fontSize: 9, fontFamily: 'League Spartan'),
                      // ),
                    // ),
                    Container(
            width: 63,
            height: 16,
            decoration:     BoxDecoration(
        borderRadius: BorderRadius.circular(20), 
        color: Color.fromARGB(36, 206, 117, 147)),
        child: Center(
          child:Text(
                        "-20% off",
                        style: TextStyle(color: Color(0xffff8300), fontSize: 9, fontFamily: 'League Spartan'),
           ) ,
        ),
            )
                  ],
                ),
              ),
              SizedBox(height: 32.v),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "color:",
                          style: theme.textTheme.titleMedium?.copyWith(fontSize: 18, ),
                        ),
                        TextSpan(
                          text:"olive green",
                         style: theme.textTheme.titleMedium?.copyWith(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
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
                padding: EdgeInsets.only(left: 15.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 13.v,
                        bottom: 9.v,
                      ),
                      child: Text(
                      "amount",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.only(right:20),
                      child: Container(
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
                              imagePath: ImageConstant.imgGroup239412WhiteA70002,
                              height: 13.adaptSize,
                              width: 13.adaptSize,
                              margin: EdgeInsets.only(
                                top: 2.v,
                                bottom: 3.v,
                              ),
                            ),
                            Text(
                              "1",
                              style: CustomTextStyles.titleLargeWhiteA7000220,
                            ),
                              CustomImageView(
                              imagePath: ImageConstant.imgLine1,
                             height: 13.adaptSize,
                              width: 13.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 9.v),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: 
                Row(
                  
                  children: [
                    Image.asset('assets/images/img_mask_group_4.png',width: 16,),
                    SizedBox(width: Get.width*.03,),
                    Text('shipping', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'League Spartan', color: Colors.black),)
                  ],
                )
                // _buildShoppingSecurity(
                //   context,
                //   image: ImageConstant.imgMaskGroup4,
                //   securityMessage:"Shipping",
                // ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: _buildRowDescription(context),
              ),
              SizedBox(height: 35.v),
              _buildRowReturnOne(context),
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: _buildShoppingSecurity(
                  context,
                  image: ImageConstant.imgMaskGroup16x16,
                  securityMessage:"  Shopping security",
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Row(
                  children: [
                     Container(
                      height: Get.height*.01,
                      width: Get.width*.02,
                      decoration: BoxDecoration(shape: BoxShape.circle,   color: Colors.grey,),
                    ),
                    SizedBox(width: Get.width*.03,),
                    Text(
                     "secure payment options",
                       style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child:
                 Row(
                   children: [
                    Container(
                      height: Get.height*.01,
                      width: Get.width*.02,
                      decoration: BoxDecoration(shape: BoxShape.circle,   color: Colors.grey,),
                    ),
                    SizedBox(width: Get.width*.03,),
                     Text(
                    "Secure Logistics",
                     style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.grey),
                                     ),
                   ],
                 ),
              ),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Row(
                  children: [
                     Container(
                      height: Get.height*.01,
                      width: Get.width*.02,
                      decoration: BoxDecoration(shape: BoxShape.circle,   color: Colors.grey,),
                    ),
                    SizedBox(width: Get.width*.03,),
                    Text(
                   "Secure privacy",
                     style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Row(
                  children: [
                     Container(
                      height: Get.height*.01,
                      width: Get.width*.02,
                      decoration: BoxDecoration(shape: BoxShape.circle,   color: Colors.grey,),
                    ),
                    SizedBox(width: Get.width*.03,),
                    Text(
                     "purchase protection",
                       style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.v),
              _buildRowItemsReviewsAnd(context),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                   
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     left: 6.h,
                    //     top: 2.v,
                    //   ),
                    //   child: Text(
                    //     "(200 shop ratings)",
                    //     style: CustomTextStyles.bodyMediumInterGray90001,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: _buildRonaldRichards(
                  context,
                  userName: 'Ronald Richards',
                  userClockText: "September 13, 2020",
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
                "Purchase: Black/Large(40)\nTotal: True to size",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'League Spartan', color:Colors.grey, fontSize: 15, fontWeight: FontWeight.w400)
                ),
              ),
              SizedBox(height: 4.v),
              Container(
                width: 322.h,
                margin: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                ),
                child: Text(
                 'Lorem Ipsum is simply dummy text of the printing industry. Lorem Ipsum has been the industry\'s classic dummy text ever since the 1500.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style:TextStyle(fontFamily: 'League Spartan', color:Colors.black, fontSize: 15, fontWeight: FontWeight.w400)
                ),
              ),
              SizedBox(height: 13.v),
              _buildListRectangle1(context),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 190.h),
                child: _buildShareOne(
                  context,
                  userShareLabel: 'Share',
                  userHelpfulLabel: "Helpful (2)",
                ),
              ),
              SizedBox(height: 20.v),
              Center(
                child: Divider(
                  color:  Color.fromARGB(40, 39, 39, 39),
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                
                ),
              ),
              
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: _buildRonaldRichards(
                  context,
                  userName: "Ronald Richards",
                  userClockText:"September 13, 2020",
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
                "Purchase: Black/Large(40)\nTotal: True to size",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'League Spartan', fontSize: 15, fontWeight:FontWeight.w400, color: Colors.grey)
                ),
              ),
              SizedBox(height: 10.v),
              Container(
                width: 322.h,
                margin: EdgeInsets.only(
                  right: 20.h,
                  left: 32.h,
                ),
                child: Text(
                 'Lorem Ipsum is simply dummy text of the printing industry. Lorem Ipsum has been the industry\'s classic dummy text ever since the 1500.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'League Spartan', fontSize: 15, fontWeight:FontWeight.w400, color: Colors.black)
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 190.h),
                child: _buildShareOne(
                  context,
                  userShareLabel: "Share",
                  userHelpfulLabel: "Helpful (2)",
                ),
              ),
              SizedBox(height: 30.v),
              // _buildRowFollow(context),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                "Product Details",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'League Spartan', color: Colors.black)
                ),
              ),
              SizedBox(height: 14.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:"Material :",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.grey)
                      ),
                      TextSpan(
                        text: "Polyster",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.black)
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
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.grey)
                      ),
                      TextSpan(
                        text: "100٪ Polyster",
                         style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.black)
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
                        text: "Detail:",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.grey)
                      ),
                      TextSpan(
                        text: "None",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.black)
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
                   style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, fontFamily: 'League Spartan', color: Color(0xffff8300))
                ),
              ),
              SizedBox(height: 17.v),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle569491x375,
                height: Get.height*.7,
                width: 335.h,
                alignment: Alignment.center,
              ),
              SizedBox(height: 5.v),
              _buildGridRectangle(context),
              SizedBox(height: 5.v),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle569491x375,
               height: Get.height*.7,
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
                      "See al",
                      style: CustomTextStyles.titleMediumPrimaryMedium,
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Color(0xffff8300),)
                  ],
                ),
              ),
              SizedBox(height: 17.v),
              _buildAddToCart(context),
              SizedBox(height: 37.v),
              _buildListRecommended(context),
              SizedBox(height: 15.v),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Center(child: _buildHomePageSection(context)),
              ),
              SizedBox(height: 15.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildButtonOneHundredTen(BuildContext context) {
    return
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
           
             height: 20.v,
            width: 41.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(127, 0, 0, 0),
          
            ),
            child: Center(
              child: Text('1/10', style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ],
    );
    
    //  CustomElevatedButton(
    //   height: 20.v,
    //   width: 41.h,
    //   text: "1/10",
    //   margin: EdgeInsets.only(right: 20.h),
    //   buttonStyle: ButtonStyle(backgroundColor: Colors.black),
    //   buttonTextStyle: CustomTextStyles.bodySmallWhiteA70002,
    //   alignment: Alignment.centerRight,
    // );
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
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'League Spartan')
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 1.v,
                          bottom: 2.v,
                        ),
                        child: Text(
                      "Limited time offer",
                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'League Spartan')
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
    return 
    Align(
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
              style: theme.textTheme.titleMedium
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
               "Size Guide",
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey)
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
    return 
     Container(
                            
        width: 300,
        height: 119,
       child: ListView.builder(
         scrollDirection: Axis.horizontal,
         itemCount: 3,
         itemBuilder: (context, index) {
           return  Center(
           child: IntrinsicWidth(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Expanded(
                   child: Container(
         width: 300,
             height: 119,
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
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       // mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(height: 5.v),
                         Text("Standard: Free for all orders",style: TextStyle(color: Color(0xffff8300), fontFamily: 'League Spartan', fontSize: 12, fontWeight:FontWeight.w400, ),),
                         // SizedBox(height: Get.height*.01,),
                          Row(
                            children: [
                              Text( "delivery",style: TextStyle(color: Colors.grey, fontFamily: 'League Spartan', fontSize: 12, fontWeight:FontWeight.w400, ),),
                              Text( "November 15-23, 73.9% ≥ 8 days",style: TextStyle(color: Colors.black, fontFamily: 'League Spartan', fontSize: 12, fontWeight:FontWeight.w400, ),),                     
                            ],
                          ),
                         // SizedBox(height: Get.height*.01,),
                         
                          Text( "Get £5.00 credit for late delivery",style: TextStyle(color: Colors.grey, fontFamily: 'League Spartan', fontSize: 12, fontWeight:FontWeight.w400, ),),
                         // SizedBox(height: Get.height*.01,),
                         Row(
                           children: [
                             Text('Courier company:',
                              style: TextStyle(color: Colors.grey, fontFamily: 'League Spartan', fontSize: 12, fontWeight:FontWeight.w400, ),),
                                Text(' Royal Mail, Yodel, etc',
                              style: TextStyle(color: Colors.black, fontFamily: 'League Spartan', fontSize: 12, fontWeight:FontWeight.w400, ),),
                           ],
                         ),
                     
               ],
             ),
           ),
                 ),
              SizedBox(width: Get.width*.1,)
                 ]
                 
             )
           )
         );
         
         }
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
              height: 25.adaptSize,
              width: 25.adaptSize,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Text(
                "free returns",
                style: TextStyle(color: Colors.black, fontFamily: 'League Spartan', fontSize: 16, fontWeight:FontWeight.w600, ),
              ),
            ),
           Container(
              height: 4.adaptSize,
              width: 4.adaptSize,
              margin: EdgeInsets.only(
                left: 8.h,
                top: 10.v,
                bottom: 8.h
               
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
              "Price Adjusments",
                style: TextStyle(color: Colors.black, fontFamily: 'League Spartan', fontSize: 16, fontWeight:FontWeight.w600, ),
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
            "item reviews",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'League Spartan', color: Colors.black)
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => ReviewsScreen());
              },
              child: Text(
                "Show all",
               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'League Spartan', color: Color(0xffff8300))
              ),
            ),
            GestureDetector(
               onTap: () {
                Get.to(() => ReviewsScreen());
              },
              child: Icon(Icons.keyboard_arrow_right_outlined,  color: Color(0xffff8300),))
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
          right: 20.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: Get.width*.04,
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
        text:   "Follow ",
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
                                text: "Followers ",
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
              mainAxisExtent: Get.height*.3,
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
      onPressed: (){
       
      },
    );
  }

  /// Section Widget
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
                    fontFamily:  'League Spartan',
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
  // Widget _buildGridTenOff(BuildContext context) {
  //   return Expanded(
  //     child: Align(
  //       alignment: Alignment.center,
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 20.h),
  //         child: GridView.builder(
  //           shrinkWrap: true,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             mainAxisExtent: 265.v,
  //             crossAxisCount: 2,
  //             mainAxisSpacing: 15.h,
  //             crossAxisSpacing: 15.h,
  //           ),
  //           physics: BouncingScrollPhysics(),
  //           itemCount: 12,
  //           itemBuilder: (context, index) {
  //             return GridtenoffItemWidget();
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
          height: 25.adaptSize,
          width: 25.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(right: 7.h),
          child: Text(
            securityMessage,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'League Spartan', color: Colors.black),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CustomImageView(
            imagePath: ImageConstant.imgArrowRightGray90001,
            height: 8.v,
            width: 4.h,
            margin: EdgeInsets.symmetric(vertical: 4.v),
          ),
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
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 60.adaptSize,
            width: 60.adaptSize,
            decoration: 
            AppDecoration.fillBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder20,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgRectangle568,
              height: 60.adaptSize,
              width: 60.adaptSize,
              radius: BorderRadius.circular(
                30.h,
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(fontFamily: 'League Spartan', fontSize:11 , fontWeight: FontWeight.w400, color:Colors.black )
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
                        style: TextStyle(fontFamily: 'League Spartan', fontSize:11 , fontWeight: FontWeight.w400, color:Colors.black )
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            userShareLabel,
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.black)
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgShare1,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        SizedBox(width: Get.width*.02,),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            userHelpfulLabel,
           style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'League Spartan', color: Colors.black)
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgLike1,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 10.h),
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
  Widget _buildHomePageSection(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: Get.height*.4,
        crossAxisCount: 2,
        // mainAxisSpacing: 2,
        crossAxisSpacing: 10.h,
        
      ),
      physics: BouncingScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return HomepagesectionItemWidget();
      },
    );
  }
}
