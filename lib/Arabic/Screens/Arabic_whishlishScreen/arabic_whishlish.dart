import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_viewwishlistController.dart';
import 'package:mohally/Arabic/widgets/arabic_single_page_screen.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/theme/app_decoration.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
// ignore_for_file: must_be_immutable
class WishlistPage_arabic extends StatefulWidget {
  const WishlistPage_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<WishlistPage_arabic> createState() => _WishlistPage_arabicState();
}

class _WishlistPage_arabicState extends State<WishlistPage_arabic> {
  List<bool> isButtonTappedList = List.generate(8, (index) => false);
  HomeView_controller homeView_controller = HomeView_controller();
  ArabicViewwishlist viewWishlistcontroller =ArabicViewwishlist();
//viewwishlistController viewWishlist =viewwishlistController();
Add_remove_wishlistController add_remove_wishlistController =Add_remove_wishlistController();

    @override
  void initState() {
    super.initState();
    viewWishlistcontroller.ViewWishlish_apihit();
    homeView_controller.homeview_apihit();
   // viewWishlist.ViewWishlish_apihit();
    //add_remove_wishlistController.AddRemoveWishlish_apihit();
      //  setInitialLocale();
  }
  //   void setInitialLocale() {
  //   if (Get.locale == null || Get.locale?.languageCode == 'ar') {
  //     Get.updateLocale(Locale('ar', 'DZ'));
  //   } else {
  //     Get.updateLocale(Locale('en', 'US'));
  //   }
  // }
  @override

  
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Obx((){
         if (viewWishlistcontroller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
        }
           else  if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
        }
        else{
      return       Scaffold(
          body: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                // width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20.h,),
                  child: Column(
                    children: [
                      SizedBox(height: 25.v),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "قائمة الرغبات",
                            style: theme.textTheme.headlineMedium?.copyWith(fontFamily: "Almarai"),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.v),
                      _buildEdit(context),
                      SizedBox(height: 27.v),
                                           Padding(
                         padding: const EdgeInsets.only(right:10),
                         child:_buildWishlistGrid(context)
              
                       ),
                       
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        }
        
      } 
      )
      );
      }

      

  /// Section Widget
  Widget _buildEditButton(BuildContext context) {
    return CustomElevatedButton(
      height: 35.v,
      width: 65.h,
      text: "يحرر",
      margin: EdgeInsets.only(bottom: 2.v),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEdit,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: CustomTextStyles.bodyMediumGray9000115?.copyWith(fontFamily: "Almarai"),
    );
  }

  /// Section Widget
  Widget _buildEdit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10,0,10,10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '20 عنصر',
                  style: theme.textTheme.titleMedium?.copyWith(fontFamily: "Almarai"),
                ),
              ),
              SizedBox(height: 6.v),
              Text(
               'في قائمة الرغبات',
                style: CustomTextStyles.bodyLargeGray50001_3?.copyWith(fontFamily: "Almarai"),
              ),
            ],
          ),
          _buildEditButton(context),
        ],
      ),
    );
  }

Widget _buildWishlistGrid(BuildContext context) {
  return viewWishlistcontroller.userList.value.wishlistViewList == null ||
          viewWishlistcontroller.userList.value.wishlistViewList!.isEmpty
      ? Center(child:Column(
          children: [
            Image.asset('assets/images/wishlist.png',width: 100,),
            SizedBox(height: Get.height*.03,),
           Text("قائمة رغباتك فارغة!",style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal, fontSize: 18, fontFamily: 'Almarai'), ),
            SizedBox(height: Get.height*.01,),
             Text("استكشف المزيد وقم بوضع قائمة مختصرة لبعض العناصر",style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.grey,fontFamily: 'Almarai'), ),
          ],
        ),)
      : Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: Get.height * .4,
                crossAxisCount: 2,
                crossAxisSpacing: 10.h,
              ),
              physics: BouncingScrollPhysics(),
              itemCount: viewWishlistcontroller.userList.value.wishlistViewList!.length,
              itemBuilder: (context, index) {
                final wishlistProduct = viewWishlistcontroller.userList.value.wishlistViewList![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.only(left: 20),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: CustomImageView(
                              fit: BoxFit.cover,
                              imagePath: wishlistProduct.imageUrl.toString(),
                              onTap: () {
                                productid = wishlistProduct.id!.toString();
                                setState(() {
                                  productid;
                                });
                                Get.to(SinglePageScreen_arabic());
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
                            child: CustomIconButton(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              padding: EdgeInsets.all(5.h),
                              decoration: IconButtonStyleHelper.fillWhiteA,
                              alignment: Alignment.topRight,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGroup239531, // Default image
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(71, 228, 193, 204),
                      ),
                      child: Center(
                        child: Text(
                          'خصم 10',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xffff8300),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Almarai',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 131.h,
                      child: Text(
                        wishlistProduct.aTitle.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelLarge!.copyWith(
                          height: 1.33,
                        ).copyWith(fontFamily: 'Almarai'),
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
                                    style: theme.textTheme.labelMedium?.copyWith(fontFamily: 'Almarai'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Text(
                                  "2k+ مُباع  ",
                                  style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'Almarai'),
                                ),
                                Text(
                                 wishlistProduct.price.toString(), 
                                  style: CustomTextStyles.titleMediumPrimary_2.copyWith(fontFamily: 'Almarai'),
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

  
}
