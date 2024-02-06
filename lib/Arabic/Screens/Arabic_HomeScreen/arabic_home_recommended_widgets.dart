import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/widgets/arabic_single_page_screen.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class arabic_HomepagesectionItemWidget extends StatefulWidget {
  const arabic_HomepagesectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  State<arabic_HomepagesectionItemWidget> createState() => _arabic_HomepagesectionItemWidgetState();
}

class _arabic_HomepagesectionItemWidgetState extends State<arabic_HomepagesectionItemWidget> {
HomeView_controller homeView_controller = HomeView_controller();
SingleProductViewController singleProductViewController =SingleProductViewController();
  @override
void initState() {
  super.initState();
  homeView_controller.homeview_apihit();
}
  @override
  Widget build(BuildContext context) {
    return Obx((){
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
      });
  }
}
