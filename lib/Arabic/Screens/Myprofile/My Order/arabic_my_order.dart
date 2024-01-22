import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabic_myorder_Processing.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabic_myorder_cancelled.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabuc_myorder_delievered.dart';
import 'package:mohally/core/app_export.dart';

class MyOrdersTab_arabic extends StatefulWidget {
  const MyOrdersTab_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersTab_arabicState createState() =>
      MyOrdersTab_arabicState();
}

class MyOrdersTab_arabicState extends State<MyOrdersTab_arabic>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: 
         AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Text( "طلباتي", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),)),
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
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22.v),
                _buildTabview(context),
                SizedBox(
                  height: 658.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      MyOrdersPage_arabic_delieverd(),
                      MyOrders_arabic_processing(),
                      MyOrdersTwoPage_cancelled_arabic(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
 
  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 40.v,
      width: 500.h,
      margin: EdgeInsets.only(right: 20.h),
      child: TabBar(
        controller: tabviewController,
        // labelPadding: EdgeInsets.only(left: 5,right: 5),
        labelColor: appTheme.whiteA70002,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w500,
        ),

        unselectedLabelColor: appTheme.gray90001,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            12.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "       تم التوصيل"       ,
            ),
          ),
          Tab(
            child: Text(
              "      يعالج         "  ,
            ),
          ),
          Tab(
            child: Text(
              "     ألغيت      ",
            ),
          ),
        ],
      ),
    );
  }
}
