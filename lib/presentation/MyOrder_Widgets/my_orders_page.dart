import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mohally/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/OrderStatusController/orderstatuscontroller.dart';

// ignore_for_file: must_be_immutable
class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersPageState createState() => MyOrdersPageState();
}

class MyOrdersPageState extends State<MyOrdersPage>
    with AutomaticKeepAliveClientMixin<MyOrdersPage> {
  @override
  void initState() {
    _orderStatuscontroller.OrderStatus_Apihit(context, "delivered");
    super.initState();
  }

  OrderStatuscontroller _orderStatuscontroller = OrderStatuscontroller();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(body: SafeArea(
      child: Obx(() {
        if (_orderStatuscontroller.rxRequestStatus.value == Status.LOADING) {
          return Center(child: CircularProgressIndicator());
        } else if (_orderStatuscontroller.rxRequestStatus.value ==
            Status.ERROR) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error2.png',
              ),
              Text(
                "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
              ),
            ],
          ));
        } else {
          return Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              children: [
                SizedBox(height: 20.v),
                _orderStatuscontroller.Userlist.value.orders == null ||
                        _orderStatuscontroller.Userlist.value.orders?.length ==
                            0
                    ? Center(
                        child: Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/no_product.png',
                              color: Color(0xffff8300),
                            ),
                            SizedBox(
                              height: Get.height * .03,
                            ),
                            Text(
                              "Page Not Found",
                              style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.normal, fontSize: 18),
                            ),
                          ],
                        ),
                      ))
                    : _buildMyOrdersList(context),
              ],
            ),
          );
        }
      }),
    ));
  }

  /// Section Widget
  Widget _buildMyOrdersList(BuildContext context) {
    return Padding(
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
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 18.v,
            ),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order No: ${_orderStatuscontroller.Userlist.value.orders?[index].orderId}",
                      style: CustomTextStyles.titleMediumMedium16,
                    ),
                    Text(
                      "${_orderStatuscontroller.Userlist.value.orders?[index].orderDate}",
                      //"05-12-2019",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                // SizedBox(height: 15.v),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 1.v),
                //         child: Text(
                //           "Tracking number",
                //           style: theme.textTheme.bodyMedium,
                //         ),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 5.h),
                //         child: Text(
                //           "IW3475453455",
                //           style: CustomTextStyles.bodyMediumGray90001_1,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 9.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "Quantity",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "${_orderStatuscontroller.Userlist.value.orders?[index].Quantity.toString()}",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Total Amount",
                      style: CustomTextStyles.bodyMediumGray90001_1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "${_orderStatuscontroller.Userlist.value.orders?[index].netAmount}",

                        //"199",
                        style: CustomTextStyles.titleMediumPrimary16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      child: Text(
                        "${_orderStatuscontroller.Userlist.value.orders?[index].orderStatus}",

                        // "Delivered",
                        style: CustomTextStyles.bodyMediumGreen40002,
                      ),
                    ),
                    // Spacer(),
                    // CustomOutlinedButton(
                    //   height: 30.v,
                    //   width: 80.h,
                    //   text: "Details",
                    //   buttonTextStyle: CustomTextStyles.labelLargePrimary,
                    // ),
                    // CustomElevatedButton(
                    //   height: 30.v,
                    //   width: 80.h,
                    //   text: "Re Order",
                    //   margin: EdgeInsets.only(left: 8.h),
                    //   buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                    //   buttonTextStyle: CustomTextStyles.labelLargeWhiteA70002_1,
                    // ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
