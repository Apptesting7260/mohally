import '../my_orders_two_page/widgets/myorderstwo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MyOrdersTwoPage extends StatefulWidget {
  const MyOrdersTwoPage({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersTwoPageState createState() => MyOrdersTwoPageState();
}

class MyOrdersTwoPageState extends State<MyOrdersTwoPage>
    with AutomaticKeepAliveClientMixin<MyOrdersTwoPage> {
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
          return MyorderstwoItemWidget();
        },
      ),
    );
  }
}
