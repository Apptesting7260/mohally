
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_home_recommended_widgets.dart';
import 'package:mohally/core/app_export.dart';

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

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
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