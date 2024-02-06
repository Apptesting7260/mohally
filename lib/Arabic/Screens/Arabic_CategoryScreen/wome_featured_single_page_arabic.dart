import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/widgets/featured_singlepage_arabic.dart';
import 'package:mohally/core/app_export.dart';
class featured_women_clothing_araic extends StatefulWidget {
const featured_women_clothing_araic({Key? key}) : super(key: key);

  @override
  State<featured_women_clothing_araic> createState() => _featured_women_clothing_araicState();
}
class _featured_women_clothing_araicState extends State<featured_women_clothing_araic> {
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar:_buildAppBar(context),
      body: Column(
        children: [
           SizedBox(height:Get.height*.02),
             _buildWishlistGrid(context),
        ],
      ),
    );
  }
  Widget _buildWishlistGrid(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: Get.height*.4,
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return category_womens_clothing_gridItemWidget_arabic();
          },
        ),
      ),
    );
  }
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return 

AppBar(
          title: Text("ملابس نسائية", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),),
          leading: Padding(
            padding: const EdgeInsets.only(top:15, ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Get.width*.07,
                height: Get.height*.03,
                decoration: BoxDecoration(shape: BoxShape.circle, color: const Color.fromARGB(90, 158, 158, 158)),
                child: Icon(Icons.arrow_back, )),
            ),
          ),
        );

  }
}