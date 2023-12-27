import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:mohally/view_models/controller/reset_password/reset_password_controller.dart';
import 'package:mohally/view_models/controller/resetpasswordotp_controller/resetpasswordotp_controller.dart';
import 'package:pinput/pinput.dart';

import '../home_page_one_tab_container_page/home_page_one_tab_container_page.dart';

import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

import '../home_page_tab_container_screen/home_page_tab_container_screen.dart';
import '../tab_screen/tab_bar.dart';

RxBool otpbuttonused = false.obs;

class VerificationCodeScreen extends StatefulWidget {
  String? emailText;

  final FocusNode pinPutFocusNode;
  final TextEditingController controller;
  VerificationCodeScreen(
      {Key? key,
      required this.controller,
      required this.emailText,
      required this.pinPutFocusNode})
      : super(
          key: key,
        );

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  ResetpasswordOTP_controller resetpasswordOTP_controller =
      Get.put(ResetpasswordOTP_controller());
  Resetpassword_controller resetpassword_controller =
      Get.put(Resetpassword_controller());
  RxInt waitOtp = 60.obs;
  RxBool waitOtpShow = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode _pinPutFocusNode = FocusNode();

  waitOtpUpdate() {
    waitOtpShow.value = true;
    Future.delayed(Duration(seconds: 1), () {
      if (waitOtp.value > 0) {
        waitOtp.value--;

        waitOtpUpdate();
      } else {
        waitOtpShow.value = false;
      }
    });
  }

  @override
  void initState() {
    resetpasswordOTP_controller.pinController.value.clear();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    resetpasswordOTP_controller.ResetpasswordOTP_apihit();
    resetpasswordOTP_controller.pinController.value.dispose();
    // pinController.dispose();
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Color(0xffFF8300), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF8300)),
        borderRadius: BorderRadius.circular(30),
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 45.v,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 10.v),
                Text(
                  "Verification Code",
                  style: theme.textTheme.headlineLarge,
                ),
                SizedBox(height: 19.v),
                Container(
                  width: 261.h,
                  margin: EdgeInsets.symmetric(horizontal: 50.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Please type the verification code sent to ",
                          style: CustomTextStyles.bodyLargeGray50001_2,
                        ),
                        TextSpan(
                          text: "Email",
                          style: CustomTextStyles.titleMediumPrimary16_1,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 36.v),
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: 19.h,
                //     right: 18.h,
                //   ),
                //   child: CustomPinCodeTextField(
                //     context: context,
                //     onChanged: (value) {},
                //   ),
                // ),
                Pinput(
                  length: 6,
                  autofocus: true,
                  useNativeKeyboard: true,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: defaultPinTheme,
                  onSubmitted: (String pin) => _showSnackBar(pin, context),
                  focusNode: _pinPutFocusNode,
                  controller: resetpasswordOTP_controller.pinController.value,
                  submittedPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme,
                  followingPinTheme: defaultPinTheme,
                ),

                SizedBox(height: 20.v),
                CustomElevatedButton(
                  loading: resetpasswordOTP_controller.loading.value,
                  onPressed: () {
                    // otpbuttonused.value == true
                    //     ? () {}
                    //     : () {
                            otpbuttonused.value = true;
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              _pinPutFocusNode.unfocus();
                              formKey.currentState!.validate();
                              resetpasswordOTP_controller
                                  .ResetpasswordOTP_apihit();

                              // resetpasswordOTP_controller.pinController.value.clear();
                            }
                          // };
                    // Get.to(() => TabScreen(
                    //       index: 0,
                    //     ));
                  },
                  text: "Verify",
                  margin: EdgeInsets.symmetric(horizontal: 24.h),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                ),
                SizedBox(height: 24.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I don’t receive a code!",
                        style: CustomTextStyles.bodyLargeLight,
                      ),
                      TextSpan(
                        text: "Resend",
                        style: CustomTextStyles.titleMediumPrimary,
                        // !waitOtpShow.value == true
                        //     ? "Resend"
                        //     : waitOtp.value.toString(),
                        // style: CustomTextStyles.titleMediumPrimary,
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = waitOtpShow.value == true
                        //       ? () {}
                        //       : () {
                        //           waitOtp.value = 60;
                        //           resetpasswordOTP_controller
                        //               .ResetpasswordOTP_apihit();
                        //
                        //           waitOtpUpdate();
                        //         }
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                // Spacer(),
                // _buildVerificationCodeGrid(context),
                // SizedBox(height: 7.v),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Padding(
                //     padding: EdgeInsets.only(right: 44.h),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         CustomElevatedButton(
                //           height: 46.v,
                //           width: 117.h,
                //           text: "0",
                //           buttonStyle: CustomButtonStyles.outlineBlueGray,
                //           buttonTextStyle: theme.textTheme.headlineSmall!,
                //         ),
                //         CustomImageView(
                //           imagePath: ImageConstant.imgDelete,
                //           height: 18.v,
                //           width: 22.h,
                //           margin: EdgeInsets.only(
                //             left: 55.h,
                //             top: 13.v,
                //             bottom: 15.v,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  // Widget _buildVerificationCodeGrid(BuildContext context) {
  //   return GridView.builder(
  //     shrinkWrap: true,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       mainAxisExtent: 47.v,
  //       crossAxisCount: 3,
  //       mainAxisSpacing: 6.h,
  //       crossAxisSpacing: 6.h,
  //     ),
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: 9,
  //     itemBuilder: (context, index) {
  //       return VerificationcodegridItemWidget();
  //     },
  //   );
  // }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
