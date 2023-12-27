import '../my_orders_one_page/widgets/myordersone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MyOrdersOnePage extends StatefulWidget {
  const MyOrdersOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersOnePageState createState() => MyOrdersOnePageState();
}

class MyOrdersOnePageState extends State<MyOrdersOnePage>
    with AutomaticKeepAliveClientMixin<MyOrdersOnePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
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
          return MyordersoneItemWidget();
        },
      ),
    );
  }
}
