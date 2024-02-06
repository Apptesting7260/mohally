
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/widgets/arabic_single_page_screen.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class content_of_women extends StatefulWidget {
  const content_of_women({Key? key}) : super(key: key);

  @override
  State<content_of_women> createState() => _content_of_womenState();
}

class _content_of_womenState extends State<content_of_women> {
  
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
HomeView_controller homeView_controller = HomeView_controller();
@override
void initState() {
  super.initState();
    homeView_controller.homeview_apihit();
}
  @override
  Widget build(BuildContext context) {
    return 
    Obx((){
 if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
 }
        else{
      return  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height*.04,),
      buildAvatarRow(['إلكترونيات', 'للنساءملابس', 'مِلك الرجالملابس', 'منحنى وزائد']),
        
         SizedBox(height: Get.height*.04,),
         Container(
        height: Get.height * .05,
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: title.length,
      itemBuilder: (context, index) {
         bool isSelected = index == selectedTabIndex; // Assuming you have a variable to track the selected tab index
      
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 78,
      height: 28,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white, border: Border.all(color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,)
      ),
                  child: Center(
                    child: Text(
                      title[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontFamily:  'Almarai',
                      ),
                    ),
                  ),
                ),
          //       if (isSelected)
          //       Container(
          //     width: 30,
          //     height: 2,
          //     decoration:     BoxDecoration(
          // borderRadius: BorderRadius.circular(30), 
          // color: Color(0xffff8300))
          //     ),
                  SizedBox(width: Get.width*.2,),
              ],
            ),
          ),
        );
      },
        ),
      ),
        SizedBox(height: Get.height*.04,),
        Padding(
          padding: const EdgeInsets.only(right:20),
          child: _buildHomePageSection(context),
        ),
        
          ]),
      );
        }
    }

    );
}

Widget _buildHomePageSection(BuildContext context) {
    return   Container(
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
                                                CustomImageView(
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
  Widget buildAvatarColumn(String text) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage:  AssetImage(categoriesImages[0]),
      ),
      SizedBox(height: Get.height*.01,),
      Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:Colors.black, fontFamily:'Almarai' ),),
    ],
  );
}

Widget buildAvatarRow(List<String> texts) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: texts.map((text) => buildAvatarColumn(text)).toList(),
  );
}
}