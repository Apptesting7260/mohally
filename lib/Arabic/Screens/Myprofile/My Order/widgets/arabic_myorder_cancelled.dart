
import 'package:flutter/material.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabic_myorder_cancelled_list.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MyOrdersTwoPage_cancelled_arabic extends StatefulWidget {
  const MyOrdersTwoPage_cancelled_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersTwoPage_cancelled_arabicState createState() => MyOrdersTwoPage_cancelled_arabicState();
}

class MyOrdersTwoPage_cancelled_arabicState extends State<MyOrdersTwoPage_cancelled_arabic>
    with AutomaticKeepAliveClientMixin<MyOrdersTwoPage_cancelled_arabic> {
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
              _buildMyOrdersTwo(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyOrdersTwo(BuildContext context) {
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
          return MyorderstwoItemWidget_arabic();
        },
      ),
    );
  }
}
