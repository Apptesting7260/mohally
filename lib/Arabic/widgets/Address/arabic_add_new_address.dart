import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/widgets/Address/arabic_shippingaddress.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_switch.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class add_new_Address_arabic extends StatelessWidget {
  add_new_Address_arabic({Key? key})
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
        appBar: AppBar(
          title: Text('إضافة عنوان جديد', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),),
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
                    alignment: Alignment.centerRight,
                    child: Text(
                      "اسم",
                      style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildNameEditText(context),
                  SizedBox(height: 17.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "عنوان",
                      style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildAddressEditText(context),
                  SizedBox(height: 19.v),
                  _buildCityRow(context),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الدولة / الإقليم / المنطقة",
                      style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                    ),
                  ),
                  SizedBox(height: 7.v),
                  _buildCaliforniaEditText(context),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الرمز البريدي / الرمز البريدي)",
                      style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                    ),
                  ),
                  SizedBox(height: 7.v),
                  _buildZipcodeEditText(context),
                  SizedBox(height: 17.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "رقم الهاتف المحمول",
                      style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildGroup184(context),
                  SizedBox(height: 20.v),
                  _buildSaveRow(context),
                  SizedBox(height: 30.v),
                  _buildSaveAddressButton(context),
 SizedBox(height: 20.v),
                 
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
        imagePath: ImageConstant.imgArrowRightPrimary,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "عنوان الشحن",
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
      hintText: "ولايات المتحدة",
        hintStyle: TextStyle(fontFamily: 'Almarai', fontSize: 12, fontWeight: FontWeight.w400, ),
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
        right: 10.v
      ),
    );
  }

  /// Section Widget
  Widget _buildCountryEditText(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: countryEditTextController,
      hintText: "تشينو هيلز",
      hintStyle: TextStyle(fontFamily: 'Almarai', fontSize: 12, fontWeight: FontWeight.w400, ),
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
        right: 10.v
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
                  "دولة",
                  style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
                ),
                SizedBox(height: 7.v),
                _buildCityEditText(context),
              ],
            ),
          ),
        ),
        SizedBox(width: Get.width*.02,),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "المدينة",
                  style: theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
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
            "حفظ كعنوان أساسي",
            style: theme.textTheme.bodyLarge?.copyWith(fontFamily: 'Almarai'),
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
        Get.to(() => ShippingaddressesItemWidget_arabic());
      },
      text: "يُقدِّم",
      margin: EdgeInsets.only(
        left: 8.h,
        right: 12.h,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
   
}
