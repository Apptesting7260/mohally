import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabic_myorderone_list.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MyOrdersPage_arabic_delieverd extends StatefulWidget {
  const MyOrdersPage_arabic_delieverd({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersPage_arabic_delieverdState createState() => MyOrdersPage_arabic_delieverdState();
}

class MyOrdersPage_arabic_delieverdState extends State<MyOrdersPage_arabic_delieverd>
    with AutomaticKeepAliveClientMixin<MyOrdersPage_arabic_delieverd> {
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
              _buildMyOrdersList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyOrdersList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 15.v,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return MyorderslistItemWidget_arabic();
          },
        ),
      ),
    );
  }
}
