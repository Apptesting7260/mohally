import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/Arabic_cart/arabic_cart.dart';
import 'package:mohally/Arabic/widgets/arabic_review.dart';
import 'package:mohally/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
class SinglePageScreen_arabic extends StatefulWidget {
  
  const SinglePageScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<SinglePageScreen_arabic> createState() => _SinglePageScreen_arabicState();
}
class _SinglePageScreen_arabicState extends State<SinglePageScreen_arabic> {
  int counter =1;
   bool PrizeAdjustmentisExpanded = false;
   bool ShoppingSecurityisExpanded = false;
 int selectedIndex = 0;
SingleProductViewController productviewcontroller =SingleProductViewController();
int selectedTabIndex=0;
HomeView_controller homeView_controller = HomeView_controller();
List<String> recomemded_text =
[
  'مُستَحسَن',
  'ملابس رجالية',
  'الصحة و الجمال',
  'الصحة و الجمال',
  "الصحة و الجمال"
];
void initState() {
  super.initState();
    productviewcontroller.Single_ProductApiHit();
    homeView_controller.homeview_apihit();
}
  @override
  Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);

    return Obx((){
  if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }  else {
          return SafeArea(
        child: Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child:
            productviewcontroller.userList.value.productView ==  null 
                                    // productviewcontroller.userList.value
                                    //         .productView?.length ==
                                    //     0
                                ? Center(child:  Text('Error: ${productviewcontroller.error.value}'))
                                :
             SizedBox(
              width: double.maxFinite,
              child: 
              
              
              ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStackSixtyNine(context),
                  SizedBox(height: 26.v),
                  Padding(
                    padding: const EdgeInsets.only(right:15),
                    child: Text(
                       "${productviewcontroller.userList.value.productView?.atitle.toString()}",
                      // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Almarai')
                    ),
                  ),
                  SizedBox(height: 12.v),
                                Padding(
                                  padding: const EdgeInsets.only(right:15),
                                  child: Text(
                                      //"${productviewcontroller.userList.value.productView?.aDescription.toString()}",
                                     "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Almarai')
                                  ),
                                ),
                // Text(
                //                       "${productviewcontroller.userList.value.productView?.productDetails.toString()}",
                //                     // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                //                     maxLines: 2,
                //                     overflow: TextOverflow.ellipsis,
                //                     style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Almarai')
                //                   ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: EdgeInsets.only(right: 15.h),
                    child: Row(
                      children: [
                        CustomRatingBar(
                          initialRating: 4,
                          itemSize: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.h),
                          child: Text(
                            "4.8",
                            style: CustomTextStyles.bodyMediumInterGray90001,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.v),
                  Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Row(
                      children: [
                        Obx((){
                          var currentPrice = productviewcontroller.userList.value.productView?.productDetails?[0].price ?? 0;
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: " \$120",
                                  style:
                                      CustomTextStyles.titleMediumGray50001.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "\$$currentPrice ",
                                  style: CustomTextStyles.titleLargePrimary,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          );
                        }
                        ),
                        SizedBox(width: Get.width*.02,),
                        Container(
                width: 63,
                height: 16,
                decoration:     BoxDecoration(
            borderRadius: BorderRadius.circular(20), 
            color: Color.fromARGB(54, 206, 117, 147)),
            child: Center(
              child:Text(
                            "-20% خصم",
                            style: TextStyle(color: Color(0xffff8300), fontSize: 9, fontFamily: 'Almarai'),
               ) ,
            ),
                )
                      ],
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Padding(
                    padding: const EdgeInsets.only(right:15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Obx((){
                        var color = productviewcontroller.userList.value.productView?.productDetails?[0].color ?? 0;
                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "لون:",
                                style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai', fontSize: 18),
                              ),
                              TextSpan(
                                text:"$color",
                               style: theme.textTheme.titleMedium?.copyWith(fontSize: 18,fontFamily: 'Almarai', color: Colors.grey),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        );
                      }
                        
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
                    padding: EdgeInsets.only(right: 15.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 13.v,
                            bottom: 9.v,
                          ),
                          child: Text(
                            "كمية",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                       
                        Padding(
                          padding: const EdgeInsets.only(right:20),
                          child: Container(
                            width: 100.h,
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
                                Text(
                                   counter.toString(),
                                  style: CustomTextStyles.titleLargeWhiteA7000220,
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
                        Text('شحن', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'Almarai', color: Colors.black),)
                      ],
                    )
                    // _buildShoppingSecurity(
                    //   context,
                    //   image: ImageConstant.imgMaskGroup4,
                    //   securityMessage:"Shipping",
                    // ),
                  ),
                  SizedBox(height: 12.v),
                  _buildRowDescription(context),
                  SizedBox(height: 35.v),
                  _buildRowReturnOne(context),
                  
                  SizedBox(height: 29.v),

                  _buildShoppingSecurity(context),
                  SizedBox(height: 25.v),
                  _buildRowItemsReviewsAnd(context),
                  SizedBox(height: 8.v),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       
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
                         Text(
                          "4.8",
                          style: CustomTextStyles.titleMediumInter,
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
                      userName: "رونالد ريتشاردز",
                      userClockText: "13 سبتمبر 2020",
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: CustomRatingBar(
                      initialRating: 2,
                      itemSize: 14,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Container(
                    width: 138.h,
                    margin: EdgeInsets.only(right: 20.h),
                    child: Text(
                      "الشراء : أسود/كبير(40)\nالإجمالي: صحيح في الحجم",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: 'Almarai', color:Colors.grey, fontSize: 15, fontWeight: FontWeight.w400)
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Container(
                    width: 322.h,
                    margin: EdgeInsets.only(
                      left: 10.h,
                      right: 20.h,
                    ),
                    child: Text(
                       'لوريم إبسوم هو طباعة ببساطة نص وهمي من صناعة والتنضيف. لقد كان لوريم إيبسوم هو النص الوهمي الكلاسيكي في هذه الصناعة منذ القرن السادس عشر.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(fontFamily: 'Almarai', color:Colors.black, fontSize: 15, fontWeight: FontWeight.w400)
                    ),
                  ),
                  SizedBox(height: 13.v),
                  _buildListRectangle1(context),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: _buildShareOne(
                      context,
                      userShareLabel: "يشارك",
                      userHelpfulLabel: "مفيد (2)",
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
                      userName: "رونالد ريتشاردز",
                      userClockText: "13 سبتمبر 2020",
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: CustomRatingBar(
                      initialRating: 3,
                      itemSize: 14,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Container(
                    width: 138.h,
                    margin: EdgeInsets.only(right: 20.h),
                    child: Text(
                      "الشراء : أسود/كبير(40)\nالإجمالي: صحيح في الحجم",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: 'Almarai', fontSize: 15, fontWeight:FontWeight.w400, color: Colors.grey)
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
                     'لوريم إبسوم هو طباعة ببساطة نص وهمي من صناعة والتنضيف. لقد كان لوريم إيبسوم هو النص الوهمي الكلاسيكي في هذه الصناعة منذ القرن السادس عشر.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: 'Almarai', fontSize: 15, fontWeight:FontWeight.w400, color: Colors.black)
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: _buildShareOne(
                      context,
                      userShareLabel: "يشارك",
                      userHelpfulLabel: "مفيد (2)",
                    ),
                  ),
                  SizedBox(height: 30.v),
                  // _buildRowFollow(context),
                  SizedBox(height: 27.v),
                  Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: Text(
                      "تفاصيل المنتجات",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'Almarai', color: Colors.black)
                    ),
                  ),
                  SizedBox(height: 14.v),
               Obx(() {
   var materialTags = productviewcontroller.userList.value.productView?.productCatgories?.tags;
  var materialsubTags = productviewcontroller.userList.value.productView?.productCatgories?.subtags;
  var details=productviewcontroller.userList.value.productView?.productDetails;
  int itemCount = productviewcontroller.userList.value.productView?.productCatgories?.subtags?.length ?? 0;
  // Calculate the total height needed based on the number of items
 // double totalHeight = itemCount *.50; // Assuming each item has a height of 30.0 (you can adjust this)

  return Padding(
    padding: EdgeInsets.only(right: 20),
    child: Container(
      height:itemCount*40.0,
      child: ListView.builder(
        itemCount:productviewcontroller.userList.value.productView?.productCatgories!.subtags?.length ??0,
        itemBuilder: (context, index) {
          return Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:"${materialTags?[0].tagTitle}:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.grey),
                    ),
                    TextSpan(
                      text: " ${materialsubTags?[index].subTagName}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            Gap(10)
            ],
          ),
          
        );
        },
      ),
    ),
  );
}),

Obx(() {
   var materialTags = productviewcontroller.userList.value.productView?.productCatgories?.tags;
  var materialsubTags = productviewcontroller.userList.value.productView?.productCatgories?.subtags;
  var details=productviewcontroller.userList.value.productView?.productDetails;
  int itemCount = productviewcontroller.userList.value.productView?.productCatgories?.subtags?.length ?? 0;

  // Calculate the total height needed based on the number of items
 // double totalHeight = itemCount *.50; // Assuming each item has a height of 30.0 (you can adjust this)

  return Padding(
 padding: EdgeInsets.only(right: 20),
    child: Container(
      height:itemCount*40.0,
      child: ListView.builder(
        itemCount:productviewcontroller.userList.value.productView?.productDetails?.length ??0,
        itemBuilder: (context, index) {
          return Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${materialTags?[1].tagTitle}:",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.grey),),
              
              RichText(
                text: TextSpan(
                  children: [
                     TextSpan(
                      text:"سعة الحجم:",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                     TextSpan(
                      text: " ${details?[index].sizecapicity}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                   
                   
                    
                  ],
                ),
                textAlign: TextAlign.left,
              ),
               SizedBox(height: Get.height*.01,),
               RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:"لون:",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                     TextSpan(
                      text: " ${details?[index].color}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                    
                   
                    
                  ],
                ),
                textAlign: TextAlign.left,
              ),
               SizedBox(height: Get.height*.01,),
               RichText(
                text: TextSpan(
                  children: [
                   TextSpan(
                      text:"كمية:",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                    TextSpan(
                      text: " ${details?[index].quantity}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                     
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: Get.height*.01,),
               RichText(
                text: TextSpan(
                  children: [
                   
                    TextSpan(
                      text:"سعر:",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                     TextSpan(
                      text: " ${details?[index].price}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black),
                    ),
                    
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            Gap(10)
            ],
          ),
          
        );
        },
      ),
    ),
  );
}),

                  // SizedBox(height: 5.v),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 20.h),
                  //   child: RichText(
                  //     text: TextSpan(
                  //       children: [
                  //         TextSpan(
                  //           text: "تعبير: ",
                  //           style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.grey)
                  //         ),
                  //         TextSpan(
                  //           text: "100٪ بوليستر",
                  //            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black)
                  //         ),
                  //       ],
                  //     ),
                  //     textAlign: TextAlign.right,
                  //   ),
                  // ),
                  // SizedBox(height: 3.v),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 20.h),
                  //   child: RichText(
                  //     text: TextSpan(
                  //       children: [
                  //         TextSpan(
                  //           text: "تفاصيل",
                  //           style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.grey)
                  //         ),
                  //         TextSpan(
                  //           text: "لا أحد",
                  //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black)
                  //         ),
                  //       ],
                  //     ),
                  //     textAlign: TextAlign.right,
                  //   ),
                  // ),
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: Text(
                     "اظهار الكل",
                       style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, fontFamily: 'Almarai', color: Color(0xffff8300))
                    ),
                  ),
              SizedBox(height: 30.v),
                  CustomImageView(
                    imagePath:  "${productviewcontroller.userList.value.productView?.imageUrl.toString()}",
                    //ImageConstant.imgRectangle569491x375,
                    height: Get.height*.4,
                    width: 335.h,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 5.v),
                 //_buildGridRectangle(context),
                  SizedBox(height: 5.v),
                  CustomImageView(
                    imagePath: "${productviewcontroller.userList.value.productView?.imageUrl.toString()}",
                    // ImageConstant.imgRectangle569491x375,
                 height: Get.height*.4,
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
                          "اظهار الكل",
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
          padding: const EdgeInsets.only(right:20),
          child:
          _buildHomePageSection(context),
        ),
                  SizedBox(height: 15.v),
                ],
              ),
            ),
          ),
        ),
      );
      }
    }
    );
  }

 Widget _buildAdditionalInformation(String text) {
    return Column(
      children: [
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.only(right: 27.h),
          child: Row(
            children: [
              Container(
                height: Get.height * 0.01,
                width: Get.width * 0.02,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: Get.width * 0.03),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Almarai',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
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
      height: 505.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color:Colors.white,
      ),
      //AppDecoration.fillGray10003,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            fit: BoxFit.cover,
            imagePath: "${productviewcontroller.userList.value.productView?.imageUrl.toString()}",
            // ImageConstant.imgRectangle569491x375,
            height: 505.v,
            width: Get.width,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Padding(
                 padding: const EdgeInsets.only(top:10, right: 10, left: 10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
  Container(
                    width: Get.width*.09,
                  height: Get.height*.05,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back, ))),
 Container(
                         margin: EdgeInsets.only(left: 20.h,),
                  width: Get.width*.09,
                  height: Get.height*.05,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset('assets/images/search.png',)),
                  ],
                 )
                 
              
               ),
                SizedBox(height: 371.v),
                _buildButtonOneHundredTen(context),
                SizedBox(height: 10.v),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
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
                            "شحن مجاني لك",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Almarai')
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.v,
                            bottom: 2.v,
                          ),
                          child: Text(
                            "عرض لفترة محدودة",
                           style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Almarai')
                          ),
                        ),
                      ],
                    ),
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
       // 
    return  Align(
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
            itemCount: 3,
            itemBuilder: (context, index) {
              
              return  SizedBox(
      width: 60.h,
      child: Align(
        alignment: Alignment.center,
        child: CustomImageView(
          fit: BoxFit.contain,
         imagePath: "${productviewcontroller.userList.value.productView?.imageUrl.toString()}",
          height: 60.adaptSize,
          width: 60.adaptSize,
          radius: BorderRadius.circular(
            6.h,
          ),
        ),
      ),
    );
              //ListrectangleItemWidget();
            },
          ),
        ),
      );
    }
    
  //   );
  // }

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
              "مقاس",
              style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
                "دليل المقاسات",
                style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai', color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
 Widget _buildListWidget(BuildContext context) {
//List<ProductDetails>? productDetails = productviewcontroller.userList.value.productView?.productDetails;

  return Padding(
    padding: const EdgeInsets.fromLTRB(10,0,10,0),
    child: Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 40.v,
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
          itemCount: productviewcontroller.userList.value.productView?.productDetails?.length ?? 0,
          itemBuilder: (context, index) {
            if (index < 0 || index >= (productviewcontroller.userList.value.productView?.productDetails?.length ?? 0)) {
              // Check if index is out of bounds
              return Container(); // Return an empty container or any other widget as needed
            }
    
            bool isSelected = index == selectedIndex;
    
            // Access the sizeCapacity from your data model
            String sizeCapacity = productviewcontroller.userList.value.productView?.productDetails![index].sizecapicity;
    
            return SizedBox(
              width: 70.h,
              child: GestureDetector(
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
                      border: Border.all(color: isSelected ? Color(0xffff8300) : Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        sizeCapacity,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 12.0,
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
  );
}


  /// Section Widget
  Widget _buildRowDescription(BuildContext context) {
    return 
     Padding(
       padding: const EdgeInsets.fromLTRB(15,0,15,0),
       child: Container(
                              
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
                           Text("قياسي: مجاني لجميع الطلبات",style: TextStyle(color: Color(0xffff8300), fontFamily: 'Almarai', fontSize: 12, fontWeight:FontWeight.w400, ),),
                           // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text( "توصيل",style: TextStyle(color: Colors.grey, fontFamily: 'Almarai', fontSize: 12, fontWeight:FontWeight.w400, ),),
                                Text( "15-23 نوفمبر، 73.9% ≥ 8 أيام",style: TextStyle(color: Colors.black, fontFamily: 'Almarai', fontSize: 12, fontWeight:FontWeight.w400, ),),                     
                              ],
                            ),
                           // SizedBox(height: Get.height*.01,),
                           
                            Text( "احصل على رصيد بقيمة 5.00 جنيه إسترليني للتسليم المتأخر",style: TextStyle(color: Colors.grey, fontFamily: 'Almarai', fontSize: 12, fontWeight:FontWeight.w400, ),),
                           // SizedBox(height: Get.height*.01,),
                           Row(
                             children: [
                               Text('شركة البريد السريع: ',
                                style: TextStyle(color: Colors.grey, fontFamily: 'Almarai', fontSize: 12, fontWeight:FontWeight.w400, ),),
                                  Text(' Royal Mail, Yodel, etc',
                                style: TextStyle(color: Colors.black, fontFamily: 'Almarai', fontSize: 12, fontWeight:FontWeight.w400, ),),
                             ],
                           ),
                       
                 ],
               ),
             ),
                   ),
                SizedBox(width: Get.width*.06,)
                   ]
                   
               )
             )
           );
           
           }
         ),
       ),
     );
    
    
  
  }

  /// Section Widget
  Widget _buildRowReturnOne(BuildContext context) {
    return 
    Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
   
        imagePath: ImageConstant.imgReturn1,
        height: 25.adaptSize,
        width: 25.adaptSize,
                ),
                Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Text(
      "عودة مجانية",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'Almarai', color: Colors.black),
        ),
                ),
                SizedBox(width:Get.width*.02),
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
             "تعديل السعر",
                style: TextStyle(color: Colors.black, fontFamily: 'Almarai', fontSize: 16, fontWeight:FontWeight.w600, ),
              ),
            ),
                Spacer(),
                GestureDetector(
                  onTap: (){
          setState(() {
          PrizeAdjustmentisExpanded = !PrizeAdjustmentisExpanded;
          });
        },
                  child:  Icon(
                PrizeAdjustmentisExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.arrow_forward_ios,
                size: 10,
              ), 
              )
              ],
            )
        
        ),
        if (PrizeAdjustmentisExpanded) _buildAdditionalInformation("خيارات الدفع الآمنة"),
        if (PrizeAdjustmentisExpanded) _buildAdditionalInformation("الخدمات اللوجستية الآمنة"),
        if (PrizeAdjustmentisExpanded) _buildAdditionalInformation("تأمين الخصوصية"),
        if (PrizeAdjustmentisExpanded) _buildAdditionalInformation("حماية المشتريات"),
      ],
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
              "مراجعات العناصر",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Almarai', color: Colors.black)
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => ReviewsScreen_arabic());
              },
              child: Text(
                "اظهار الكل",
               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Almarai', color: Color(0xffff8300))
              ),
            ),
            GestureDetector(
               onTap: () {
                Get.to(() => ReviewsScreen_arabic());
              },
              child: Icon(Icons.keyboard_arrow_left_outlined,  color: Color(0xffff8300),))
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
          return  SizedBox(
      height: 80.adaptSize,
      width: 80.adaptSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: "${productviewcontroller.userList.value.productView?.imageUrl.toString()}",
            height: 80.adaptSize,
            width: 80.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
            alignment: Alignment.center,
          ),
        
        ],
      ),
    );
          //Listrectangle1ItemWidget();
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
              crossAxisCount: 1,
              mainAxisSpacing: 5.h,
              crossAxisSpacing: 5.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: productviewcontroller.userList.value.productView!.galleryUrl!.length,
            itemBuilder: (context, index) {
              return Align(
      alignment: Alignment.center,
      child: CachedNetworkImage(
          imageUrl: 
          "${productviewcontroller.userList.value.productView!.galleryUrl.toString()}",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
       ),
    );
              // GridrectangleItemWidget();
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return CustomOutlinedButton(
      text: "أضف إلى السلة",
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL25,
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
      alignment: Alignment.center,
      onPressed: (){
       Get.to(CartPage_arabic());
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
                    fontFamily:  'Almarai',
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
  Widget _buildShoppingSecurity(BuildContext context){
 return  Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
   
        imagePath:  ImageConstant.imgMaskGroup16x16,
        height: 25.adaptSize,
        width: 25.adaptSize,
                ),
                Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Text(
        "أمن التسوق",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'Almarai', color: Colors.black),
        ),
                ),
                Spacer(),
               GestureDetector(
                  onTap: (){
          setState(() {
         ShoppingSecurityisExpanded = !ShoppingSecurityisExpanded;
          });
        },
                  child:  Icon(
               ShoppingSecurityisExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.arrow_forward_ios,
                size: 10,
              ), 
              )
              ],
            )
        
        ),
        if (ShoppingSecurityisExpanded) _buildAdditionalInformation("خيارات الدفع الآمنة"),
        if (ShoppingSecurityisExpanded) _buildAdditionalInformation("الخدمات اللوجستية الآمنة"),
        if (ShoppingSecurityisExpanded) _buildAdditionalInformation("تأمين الخصوصية"),
        if (ShoppingSecurityisExpanded) _buildAdditionalInformation("حماية المشتريات"),
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
                20.h,
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
                style: TextStyle(fontFamily: 'Almarai', fontSize:11 , fontWeight: FontWeight.w400, color:Colors.black )
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
                        style: TextStyle(fontFamily: 'Almarai', fontSize:11 , fontWeight: FontWeight.w400, color:Colors.black )
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
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black)
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
           style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.black)
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
    return  Obx((){
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
                                Container(
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
                                          return  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                                            
                                            width: Get.width,padding: EdgeInsets.only(left: 20),
                                            // height: 160.adaptSize,
                                            // width: 160.adaptSize,
                                            // height: Get.height*.2,
                                            // width: Get.width*.3,
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                
                                                CustomImageView(
                                                   fit: BoxFit.cover,
                                                 imagePath: "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
// onTap: (){
//  // singleProductViewController.productId.value= homeView_controller.userList.value.recommendedProduct![index].id.toString();
//   singleProductViewController.productId.value =
//         homeView_controller.userList.value.recommendedProduct![index].id.toString();
//     Get.to(SinglePageScreen_arabic());
// },
onTap: () {
  productid =
    homeView_controller.userList.value.recommendedProduct![index].id!.toString();
    setState(() {
      productid;
    });
  Get.to(SinglePageScreen_arabic(), 
  );
},

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
                                                    height: 20.adaptSize,
                                                    width: 20.adaptSize,
                                                    padding: EdgeInsets.all(5.h),
                                                    decoration: IconButtonStyleHelper.fillWhiteA,
                                                    alignment: Alignment.topRight,
                                                    child: CustomImageView(
                                                      imagePath: ImageConstant.imgSearch,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 12.v),
                                          Container(
                                                height: 16.v,
                                            width: 48.h,
                                            
                                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color.fromARGB(71, 228, 193, 204),
                                            ),
                                            child: Center(child: Text('خصم 10', style: TextStyle(
                                              fontSize: 8, color: Color(0xffff8300),fontWeight: FontWeight.w600,
                                              fontFamily: 'Almarai'
                                            ),),),
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
                                              style: theme.textTheme.labelLarge!.copyWith(
                                                height: 1.33,
                                              ).copyWith(fontFamily:'Almarai' ),
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
                                                            initialRating: 0,
                                                          ),
                                                        ),
                                                          Text(
                                                          "4.8",
                                                          style: theme.textTheme.labelMedium?.copyWith(fontFamily:'Almarai' ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.v),
                                                  Row(
                                                    children: [
                                  Text(
                                                        "2k+ مُباع  " ,
                                                          style: theme.textTheme.bodySmall?.copyWith(fontFamily:'Almarai' ),
                                                        ),
                                                         Text(
                                                          "${homeView_controller.userList.value.recommendedProduct?[index].pricee.toString()}",
                                                          //"\$99 ",
                                                          style: CustomTextStyles.titleMediumPrimary_2.copyWith(fontFamily:'Almarai' ),
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
                                                  onTap: (){
                                                  //Get.to(()=>SinglePageScreen_arabic());
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
                                );   
      }
      });
  }
}
