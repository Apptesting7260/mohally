import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/address_screen/address_screen.dart';
import 'package:mohally/presentation/shipping_addresses_screen/edit_address.dart';
import 'package:mohally/presentation/shipping_addresses_screen/widgets/default_user_address_detail.dart';
import 'package:mohally/view_models/controller/AddressViewController/address_view_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

String? addressId;
RxString addressname = "".obs;
String? addressIndexId;

class Default_address extends StatefulWidget {
  const Default_address({Key? key})
      : super(
          key: key,
        );

  @override
  State<Default_address> createState() => _Default_addressState();
}

class _Default_addressState extends State<Default_address> {
  List<bool> isSelectedList = List.generate(10, (index) => false);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final RefreshController _refreshController = RefreshController();
  Englishuseraddressviewcontroller viewaddresscontroller =
      Englishuseraddressviewcontroller();
  @override
  void initState() {
    super.initState();
    viewaddresscontroller.UseraddressView_apihit();
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () async {
                viewaddresscontroller.UseraddressView_apihit();
                _refreshController.refreshCompleted();
                setState(() {});
                //_formkey.currentState?.reset();
              },
              child: Form(
                key: _formkey,
                child: Obx(() {
                  if (viewaddresscontroller.rxRequestStatus.value ==
                      Status.LOADING) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  } else if (viewaddresscontroller.rxRequestStatus.value ==
                      Status.ERROR) {
                    return Scaffold(
                        body: Center(
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
                    )));
                  } else {
                    return viewaddresscontroller.userList.value.userAddress ==
                                null ||
                            viewaddresscontroller
                                    .userList.value.userAddress?.length ==
                                0
                        ? Column(
                            children: [
                              DefaultAddressView(),
                              Center(child: _buildSaveAddressButton(context)),
                            ],
                          )
                        : Directionality(
                            textDirection: TextDirection.ltr,
                            child: Column(
                              children: [
                                DefaultAddressView(),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: viewaddresscontroller
                                            .userList.value.userAddress!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin:
                                                EdgeInsets.only(bottom: 10.0),
                                            padding: EdgeInsets.all(10.h),
                                            decoration:
                                                AppDecoration.fillGray.copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 9.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 9.v,
                                                          bottom: 1.v,
                                                        ),
                                                        child: Text(
                                                          "${viewaddresscontroller.userList.value.userAddress?[index].tempUserName}",
                                                          style: theme.textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                                  fontFamily:
                                                                      'Almarai'),
                                                        ),
                                                      ),
                                                      CustomElevatedButton(
                                                        height: 28.v,
                                                        width: 56.h,
                                                        text: "Edit",
                                                        //     onPressed: (){

                                                        //    Updateaddress_controllerin.addressid.value= viewaddresscontroller.userList.value.userAddress![index].id.toString();
                                                        //      Get.to(EditAddress_arabic());

                                                        // print(Updateaddress_controllerin.addressid.value);
                                                        //     },
                                                        onPressed: () async {
                                                          var result =
                                                              await Get.off(
                                                                  EditAddress(),
                                                                  arguments: {
                                                                'user_id': viewaddresscontroller
                                                                    .userList
                                                                    .value
                                                                    .userAddress![
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                'tempUserName':
                                                                    viewaddresscontroller
                                                                        .userList
                                                                        .value
                                                                        .userAddress![
                                                                            index]
                                                                        .tempUserName,
                                                                'address': viewaddresscontroller
                                                                    .userList
                                                                    .value
                                                                    .userAddress![
                                                                        index]
                                                                    .address,
                                                                'country': viewaddresscontroller
                                                                    .userList
                                                                    .value
                                                                    .userAddress![
                                                                        index]
                                                                    .country,
                                                                'city': viewaddresscontroller
                                                                    .userList
                                                                    .value
                                                                    .userAddress![
                                                                        index]
                                                                    .city,
                                                                'state': viewaddresscontroller
                                                                    .userList
                                                                    .value
                                                                    .userAddress![
                                                                        index]
                                                                    .state,
                                                                'zip_code': viewaddresscontroller
                                                                    .userList
                                                                    .value
                                                                    .userAddress![
                                                                        index]
                                                                    .zipCode,
                                                                'mobile_number':
                                                                    viewaddresscontroller
                                                                        .userList
                                                                        .value
                                                                        .userAddress![
                                                                            index]
                                                                        .mobileNumber,
                                                                // Add other fields as needed
                                                              });

                                                          // Check if the result is true (indicating a successful update)
                                                          if (result == true) {
                                                            // Refresh user addresses if the address was updated
                                                            viewaddresscontroller
                                                                .UseraddressView_apihit();
                                                          }
                                                        },

                                                        leftIcon: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 4.h),
                                                          child:
                                                              CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgEditWhiteA70002,
                                                            height:
                                                                12.adaptSize,
                                                            width: 12.adaptSize,
                                                          ),
                                                        ),
                                                        buttonTextStyle:
                                                            CustomTextStyles
                                                                .bodySmallWhiteA70002,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 12.v),
                                                Container(
                                                  width: 239.h,
                                                  margin: EdgeInsets.only(
                                                    // left: 10.h,
                                                    right: 10.h,
                                                  ),
                                                  child: Text(
                                                      "${viewaddresscontroller.userList.value.userAddress?[index].address}",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.grey,
                                                        fontFamily: 'Almarai',
                                                      )),
                                                ),
                                                Text(
                                                    "${viewaddresscontroller.userList.value.userAddress?[index].country}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                      fontFamily: 'Almarai',
                                                    )),
                                                Text(
                                                    "${viewaddresscontroller.userList.value.userAddress?[index].city}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                      fontFamily: 'Almarai',
                                                    )),
                                                Text(
                                                    "${viewaddresscontroller.userList.value.userAddress?[index].mobileNumber}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                      fontFamily: 'Almarai',
                                                    )),
                                                SizedBox(height: 1.v),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.h),
                                                  child: Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Colors.white,
                                                        fillColor:
                                                            MaterialStatePropertyAll(
                                                                Color(
                                                                    0xffff8300)),
                                                        activeColor:
                                                            Color(0xffff8300),
                                                        value: isChecked,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            isChecked =
                                                                !isChecked;
                                                          });
                                                          addressId =
                                                              viewaddresscontroller
                                                                  .userList
                                                                  .value
                                                                  .userAddress?[
                                                                      index]
                                                                  .id
                                                                  .toString();
                                                          addressname.value =
                                                              viewaddresscontroller
                                                                  .userList
                                                                  .value
                                                                  .userAddress?[
                                                                      index]
                                                                  .address;
                                                          addressIndexId =
                                                              viewaddresscontroller
                                                                  .userList
                                                                  .value
                                                                  .userAddress?[
                                                                      index]
                                                                  .id
                                                                  .toString();

                                                          print(addressIndexId);
                                                          print(addressId =
                                                              addressId);
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 6.h,
                                                          top: 3.v,
                                                        ),
                                                        child: Text(
                                                          "Use As Shipping Address",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10.v),
                                              ],
                                            ),
                                          );
                                        },
                                      )),
                                ),
                                SizedBox(height: 30.v),
                                _buildSaveAddressButton(context),
                                SizedBox(
                                  height: Get.height * .05,
                                )
                              ],
                            ),
                          );
                  }
                }),
              ),
            )));
  }

  Widget _buildSaveAddressButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Get.off(() => AddressScreen());
      },
      text: "Add New Address",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
      ),
      buttonTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Shipping Address",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
