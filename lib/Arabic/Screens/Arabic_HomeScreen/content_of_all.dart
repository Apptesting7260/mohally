import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_category.dart';
import 'package:mohally/Arabic/widgets/arabic_single_page_screen.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class content_of_all extends StatefulWidget {
  const content_of_all({Key? key}) : super(key: key);

  @override
  State<content_of_all> createState() => _content_of_allState();
}

class _content_of_allState extends State<content_of_all> {
    List<bool> isButtonTappedList = List.generate(8, (index) => false);
  Add_remove_wishlistController add_remove_wishlistController = Add_remove_wishlistController();
  // HomeBanner_controller homeBanner_controller = HomeBanner_controller();
 HomeView_controller homeView_controller = HomeView_controller();
@override
void initState() {
  super.initState();
  //homeBanner_controller.homeBanner_apihit();
 homeView_controller.homeview_apihit();
}
  int _currentPage = 0;
List<String> category =[
  'إلكترونيات', 
  'للنساءملابس', 
  'مِلك الرجالملابس', 
  'منحنى وزائد'
];
  int selectedTabIndex=0;
    List<String> title = [
  'الجميع',
  'نحيف',
  'رجال',
  'أطفال',
  "مجوهرات"
];
   List<String> recomemded_text = [
  'مُستَحسَن',
  'ملابس رجالية',
  'الصحة و الجمال',
  'الصحة و الجمال',
  "الصحة و الجمال"
];
List<String> carouselImages =[
 "assets/images/arabic_banner.png",
 "assets/images/arabic_banner.png",
];
List<String> categoriesImages =[
 "assets/images/img_ellipse_1.png",
 "assets/images/img_ellipse_1.png",
  "assets/images/img_ellipse_1.png",
 "assets/images/img_ellipse_1.png",
  "assets/images/img_ellipse_1.png",
 "assets/images/img_ellipse_1.png",
  "assets/images/img_ellipse_1.png",
 "assets/images/img_ellipse_1.png",
];
  @override
  Widget build(BuildContext context) {
    return 
    Obx((){
      //   if (homeBanner_controller.rxRequestStatus.value == Status.LOADING) {
      //   return const Scaffold(
      //     body: Center(child: CircularProgressIndicator()),
      //   );
      // }
      //  else if (homeBanner_controller.error.value == 'No internet') {
      //   return Scaffold(
      //     body: Center(
      //         child: InterNetExceptionWidget(
      //       onPress: () {},
      //     )),
      //   );
      // } 
       if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      // } 
      // else if (homeBanner_controller.error.value == 'No internet') {
      //   return Scaffold(
      //     body: Center(
      //         child: InterNetExceptionWidget(
      //       onPress: () {},
      //     )),
      //   );
      } else {
       return   Container(
        height: Get.height,
         child: SingleChildScrollView(
                     child: Column(
                       children: [
         SizedBox(height: Get.height*.02,),
CarouselSlider(
  items: carouselImages.map((String imageUrl) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }).toList(),
  options: CarouselOptions(
    autoPlay: true,
    aspectRatio: 2.0,
    enlargeCenterPage: true,
  ),
),

          //           CarouselSlider(
          //             items: carouselImages.map((String imageUrl) {
          //        return Builder(
          //          builder: (BuildContext context) {
          //            return Container(
          //              width: MediaQuery.of(context).size.width,
                   
          //              decoration: BoxDecoration(
          //               borderRadius: BorderRadius.all(Radius.circular(10)
          //               ),
          //               image: DecorationImage(image: AssetImage(  imageUrl,),
          //                fit: BoxFit.fill,
          //               )
          //              ),
                     
          //            );
          //          },
          //        );
          //      }).toList(),
          //         // items: List.generate(
          //         //   homeBanner_controller.userList.value.homeBanner?.bannerUrl == null
          //         //       ? 0
          //         //       : homeBanner_controller.userList.value.homeBanner!.bannerUrl!.length,
          //         //   (index) => Image.network(
          //         //     homeBanner_controller.userList.value.homeBanner?.bannerUrl?[index].toString() ?? "",
          //         //   ),
          //         // ),
          //         options: CarouselOptions(
          // autoPlay: true,
          // aspectRatio: 2.0,
          // enlargeCenterPage: true,
         
          // reverse: false
        
          //         ),
         
         
              
          //             ),
                     
                      SizedBox(height: Get.height*.04,),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                     
           Container(
                       height: Get.height*.1,
                       width: Get.width*.4,
                      
                       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)
                       ),
          color: Color.fromARGB(136, 235, 215, 215),
                       ),
                       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Image.asset( "assets/images/return.png",),
           SizedBox(width: Get.width*.01,),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('إرجاع مجاني', style: 
               TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,fontFamily: 'Almarai'),),
                Text('في غضون 90 يوما',style: 
               TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey,fontFamily: 'Almarai'),),
           
             ],
           )
         ],
                       ),
                      ),
           Container(
                       height: Get.height*.1,
                       width: Get.width*.4,
                      
                       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)
                       ),
         color: Color.fromARGB(135, 236, 213, 213),
                       ),
                       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Image.asset( "assets/images/ship.png",),
           SizedBox(width: Get.width*.01,),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('ًالشحن مجانا', style: 
               TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,fontFamily: 'Almarai'),),
                Text('وقت محدود العرض',style: 
               TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey,fontFamily: 'Almarai'),),
           
             ],
           )
         ],
                       ),
                      ),
                        ],
                      ),
                       SizedBox(height: Get.height*.04,),
                       Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text('فئات', style: 
               TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Almarai'),),
                
                 SizedBox(width: Get.width*.4,),
                GestureDetector(
                 onTap: (){
                   Get.to(CategoryScreen_arabic());
                 },
                  child: Text('اظهار الكل',style: 
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffff8300),fontFamily: 'Almarai'),),
                ),
                       ],),
                     SizedBox(height: Get.height*.04,),
         homeView_controller.userList.value.categoryData ==  null ||
                                 homeView_controller.userList.value
                                         .categoryData?.length ==
                                     0
                             ? Center(child:  Text('Error: ${homeView_controller.error.value}'))
                             : Padding(
                                 padding: const EdgeInsets.only(right: 10.0),
                                 child: GridView.builder(
                                   shrinkWrap: true,
                                   gridDelegate:
                                       SliverGridDelegateWithFixedCrossAxisCount(
                                     mainAxisExtent: Get.height*.2,
                                     crossAxisCount: 4,
                                     mainAxisSpacing: 17.h,
                                     crossAxisSpacing: 15.h,
                                   ),
                                   physics: BouncingScrollPhysics(),
                                   itemCount: 8,
                                   // homeView_controller
                                   //     .userList.value.categoryData?.length,
                                   itemBuilder:
                                       (BuildContext context, int index) {
                                     return Column(
                                       crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                       children: [
                                         ClipRRect(
                                           borderRadius:
                                               BorderRadius.circular(38.0),
                                           child: Image.network(
                                             "${homeView_controller.userList.value.categoryData?[index].imageUrl.toString()}",
                                             height: 68,
                                             width: 68,
                                             fit: BoxFit.cover,
                                           ),
                                         ),
                                         SizedBox(height: 5.v),
                                         Align(
                                           alignment: Alignment.center,
                                           child: Text(
                                             "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                             style:
                                             TextStyle(color: Color(0xFF272727),
         fontSize: 12,
         fontFamily: 'Almarai',
         fontWeight: FontWeight.w500,)
                                            
                                           ),
                                         )
                                       ],
                                     );
                                   },
                                 ),
                               ),
                     SizedBox(height: Get.height*.05,),
                   //    Container(
                   //     height: Get.height * .05,
                   //     child: ListView.builder(
                   //   scrollDirection: Axis.horizontal,
                   //   itemCount: title.length,
                   //   itemBuilder: (context, index) {
                   //  bool isSelected = index == selectedTabIndex; // Assuming you have a variable to track the selected tab index
                     
                   //     return Padding(
                   //       padding: EdgeInsets.symmetric(horizontal: 8.0),
                   //       child: Center(
                   //         child: Column(
                   //           mainAxisSize: MainAxisSize.min,
                   //           children: [
                   //             Text(
                   //               recomemded_text[index],
                   //               style: TextStyle(
                   //                 fontSize: 16,
                   //                 color: isSelected ? Colors.black : Colors.grey,
                   //                 fontWeight: isSelected ? FontWeight.bold:FontWeight.w400 ,
                   //                 fontFamily:  'Almarai',
                   //               ),
                   //             ),
                   //           ],
                   //         ),
                   //       ),
                   //     );
                   //   },
                   //     ),
                   //   )
                    //  Padding(
                    //    padding: const EdgeInsets.only(right:20),
                    //    child: arabic_HomepagesectionItemWidget()

                    //  ),
                      _buildHomePageSection(context),
                       ]),
                   ),
       );
      }
    }
    );
}
Widget _buildHomePageSection(BuildContext context) {
    return   Padding(
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
                                            return  Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                       
                                              width: Get.width,padding: EdgeInsets.only(left: 20),
                                              // height: 160.adaptSize,
                                              // width: 160.adaptSize,
                                              // height: Get.height*.2,
                                              // width: Get.width*.3,
                                              child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Container(
                                                           decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
                                                           
                                                           ),
                                                  
                                                    child: CustomImageView(
                                                      fit: BoxFit.cover,
                                                     imagePath: "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
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
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 10.v,
                                                      right: 10.h,
                                                    ),
                                                    child:CustomIconButton(
                    onTap: () {
                   
      //                   
       Arabic_Add_remove_productid =
                        homeView_controller.userList.value.recommendedProduct![index].id!.toString();
                        ArabicAdd_remove_wishlistController().AddRemoveWishlish_apihit();
                       
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
                                                    onTap: () {
        Add_remove_Arabic_id =
      homeView_controller.userList.value.recommendedProduct![index].id!.toString();
      Add_remove_wishlistController().AddRemoveWishlish_apihit();
     setState(() {
       isButtonTappedList[index] =
        !isButtonTappedList[index];
                       });

        // Get.to(WishlistPage_arabic(), 
        // );
      
      
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
           
            backgroundImage: AssetImage("assets/images/img_ellipse_1.png",),
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

// Widget buildAvatarRow() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: List.generate(
//       4,
//       (index) => buildAvatarColumn(),
//     ),
//   );
// }


}