import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_home_recommended_widgets.dart';
import 'package:mohally/core/app_export.dart';

class content_of_all extends StatefulWidget {
  const content_of_all({Key? key}) : super(key: key);

  @override
  State<content_of_all> createState() => _content_of_allState();
}

class _content_of_allState extends State<content_of_all> {
  
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
    SingleChildScrollView(
      child: Column(
        children: [
      CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true, // Set to true for automatic sliding
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: carouselImages.map((String imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)
                         ),
                         image: DecorationImage(image: AssetImage(  imageUrl,),
                          fit: BoxFit.fill,
                         )
                        ),
                        // child: Image.asset(
                        //   imageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                      );
                    },
                  );
                }).toList(),
       ),
      
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
                 Text('اظهار الكل',style: 
                TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffff8300),fontFamily: 'Almarai'),),
        ],),
      SizedBox(height: Get.height*.04,),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //      Column(
      //        children: [
      //          CircleAvatar(
      //            radius: 30,
      //          ),
      //          Text('dsata')
      //        ],
      //      ),
      //       Column(
      //        children: [
      //          CircleAvatar(
      //            radius: 30,
      //          ),
      //          Text('dsata')
      //        ],
      //      ),
      //       Column(
      //        children: [
      //          CircleAvatar(
      //            radius: 30,
      //          ),
      //          Text('dsata')
      //        ],
      //      ),
      //       Column(
      //        children: [
      //          CircleAvatar(
      //            radius: 30,
      //          ),
      //          Text('dsata')
      //        ],
      //      )
      //   ],
      // ),
      buildAvatarRow(['إلكترونيات', 'للنساءملابس', 'مِلك الرجالملابس', 'منحنى وزائد']),
      SizedBox(height: Get.height*.1,),
      buildAvatarRow(['إلكترونيات', 'للنساءملابس', 'مِلك الرجالملابس', 'منحنى وزائد']),
      SizedBox(height: Get.height*.05,),
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
      ),
      
      Padding(
        padding: const EdgeInsets.only(right:20),
        child: _buildHomePageSection(context),
      ),
      
        ]),
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
        return arabic_HomepagesectionItemWidget();
      },
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