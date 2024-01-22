import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabic_my_order_processing_list.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MyOrders_arabic_processing extends StatefulWidget {
  const MyOrders_arabic_processing({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrders_arabic_processingState createState() => MyOrders_arabic_processingState();
}

class MyOrders_arabic_processingState extends State<MyOrders_arabic_processing>
    with AutomaticKeepAliveClientMixin<MyOrders_arabic_processing> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              _buildMyOrdersOne(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyOrdersOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 15.v,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return MyordersoneItemWidget_arabic();
        },
      ),
    );
  }
}
