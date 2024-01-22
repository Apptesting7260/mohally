import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/shipping_addresses_screen/widgets/shippingaddresses_item_widget.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_switch.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController addressEditTextController = TextEditingController();

  TextEditingController cityEditTextController = TextEditingController();

  TextEditingController countryEditTextController = TextEditingController();

  TextEditingController californiaEditTextController = TextEditingController();

  TextEditingController zipcodeEditTextController = TextEditingController();

  TextEditingController group184EditTextController = TextEditingController();

  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 19.v),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                right: 20.h,
                bottom: 5.v,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildNameEditText(context),
                  SizedBox(height: 17.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Address",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildAddressEditText(context),
                  SizedBox(height: 19.v),
                  _buildCityRow(context),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "State/Province/Region",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  _buildCaliforniaEditText(context),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Zip Code (Postal Code)",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  _buildZipcodeEditText(context),
                  SizedBox(height: 17.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mobile Number",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildGroup184(context),
                  SizedBox(height: 20.v),
                  _buildSaveRow(context),
                  SizedBox(height: 30.v),
                  _buildSaveAddressButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
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

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
      controller: nameEditTextController,
      hintText: "John Due",
    );
  }

  /// Section Widget
  Widget _buildAddressEditText(BuildContext context) {
    return CustomTextFormField(
      controller: addressEditTextController,
      hintText: "3 Newbridge Court",
    );
  }

  /// Section Widget
  Widget _buildCityEditText(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: cityEditTextController,
      hintText: "Chino Hills",
      suffix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 23.v, 17.h, 23.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgVectorGray900014x8,
          height: 4.v,
          width: 8.h,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.v,
      ),
      contentPadding: EdgeInsets.only(
        left: 17.h,
        top: 17.v,
        bottom: 17.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildCountryEditText(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: countryEditTextController,
      hintText: "United States",
      suffix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 23.v, 17.h, 23.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgVectorGray900014x8,
          height: 4.v,
          width: 8.h,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.v,
      ),
      contentPadding: EdgeInsets.only(
        left: 16.h,
        top: 17.v,
        bottom: 17.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildCityRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "City",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 7.v),
                _buildCityEditText(context),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Country",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 7.v),
                _buildCountryEditText(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCaliforniaEditText(BuildContext context) {
    return CustomTextFormField(
      controller: californiaEditTextController,
      hintText: "California",
    );
  }

  /// Section Widget
  Widget _buildZipcodeEditText(BuildContext context) {
    return CustomTextFormField(
      controller: zipcodeEditTextController,
      hintText: "91709",
    );
  }

  /// Section Widget
  Widget _buildGroup184EditText(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.h,
          top: 3.v,
        ),
        child: CustomTextFormField(
          controller: group184EditTextController,
          hintText: "1453-987533",
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup184(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage11,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.h,
            top: 3.v,
          ),
          child: Text(
            "+880",
            style: CustomTextStyles.titleMediumMedium16,
          ),
        ),
        _buildGroup184EditText(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildSaveRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 6.v,
            bottom: 3.v,
          ),
          child: Text(
            "Save as primary address",
            style: theme.textTheme.bodyLarge,
          ),
        ),
        CustomSwitch(
          value: isSelectedSwitch,
          onChange: (value) {
            isSelectedSwitch = value;
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSaveAddressButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Get.to(() => ShippingaddressesItemWidget());
      },
      text: "Save Address",
      margin: EdgeInsets.only(
        left: 8.h,
        right: 12.h,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
