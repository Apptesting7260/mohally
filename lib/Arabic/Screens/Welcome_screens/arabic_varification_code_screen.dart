import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_forget_password_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_verification_code_controller.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';

RxBool otpbuttonused = false.obs;

// ignore: must_be_immutable
class VerificationCodeScreen_arabic extends StatefulWidget {
  String? emailText;

  final FocusNode? pinPutFocusNode;
  final TextEditingController? controller;
  VerificationCodeScreen_arabic(
      {Key? key,
       this.controller,
       this.emailText,
       this.pinPutFocusNode})
      : super(
          key: key,
        );

  @override
  State<VerificationCodeScreen_arabic> createState() => _VerificationCodeScreen_arabicState();
}

class _VerificationCodeScreen_arabicState extends State<VerificationCodeScreen_arabic> {
  arabic_ResetpasswordOTP_controller resetpasswordOTP_controller =
      Get.put(arabic_ResetpasswordOTP_controller());

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

void resendOtp() {
  resetpasswordOTP_controller.loading.value = true;
  resetpasswordOTP_controller.resendOtp(varificationemail!).then((success) {
    resetpasswordOTP_controller.loading.value = false;
    if (success) {
      Utils.snackBar(context, 'Success', ' Otp Send On Your Email');
      resetpasswordOTP_controller.pinController.value.text = '';
      setState(() {
      print('refreshingggggggg');
      });
    } else {
      Utils.snackBar(context, 'Error', resetpasswordOTP_controller.error.value);
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
    resetpasswordOTP_controller.arabic_ResetpasswordOTP_apihit(context);
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
      height: 50,
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
                 'رمز التحقق',
                style: TextStyle(fontFamily: 'Almarai', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26)
                ),
                SizedBox(height: 19.v),
                Container(
                  width: 261.h,
                  margin: EdgeInsets.symmetric(horizontal: 50.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:'الرجاء كتابة رمز التحقق المرسل إليه',
                            style: TextStyle(fontFamily: 'Almarai', color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16)
                        ),
                        TextSpan(
                          text: varificationemail,
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
                Obx((){
                  return CustomElevatedButton(
                    loading: resetpasswordOTP_controller.loading.value,
                    onPressed: 
                    // () {
                    //   // otpbuttonused.value == true
                    //   //     ? () {}
                    //   //     : () {
                    //           otpbuttonused.value = true;
                    //           if (formKey.currentState!.validate()) {
                    //             formKey.currentState!.save();
                    //             _pinPutFocusNode.unfocus();
                    //             formKey.currentState!.validate();
                    //             resetpasswordOTP_controller
                    //                 .ResetpasswordOTP_apihit(context);
                  
                    //             // resetpasswordOTP_controller.pinController.value.clear();
                    //           }
                    //         // };
                    //   // Get.to(() => TabScreen(
                    //   //       index: 0,
                    //   //     ));
                    // },
                  
                    () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                } else {
                               resetpasswordOTP_controller.loading.value=true;
                               resetpasswordOTP_controller
                                    .arabic_ResetpasswordOTP_apihit(context);
                                    _pinPutFocusNode.unfocus();
                                      formKey.currentState!.save();
                                    // Get.offAll(() =>  Password_ChangedScreen(email: ForgetPassVm.emailcontroller.value.text));
                  
                                }
                                },
                    text: 'يؤكد',
                    margin: EdgeInsets.symmetric(horizontal: 24.h),
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    buttonTextStyle: TextStyle( fontFamily:'Almarai', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                  );
                }

                ),
                SizedBox(height: 24.v),
                InkWell(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:'لا أتلقى رمزًا!',
                          style: TextStyle(fontFamily: 'Almarai', color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)
                        ),
                        TextSpan(
                          text: "إعادة إرسال",
                           style: TextStyle(fontFamily: 'Almarai', color:  Color(0xffff8300), fontWeight: FontWeight.w400, fontSize: 16)
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
                          //               .arabic_ResetpasswordOTP_apihit();
                          //
                          //           waitOtpUpdate();
                          //         }
                          
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: (){
                    resendOtp();
                  },
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
           'تم إرسال الدبوس. قيمة:$pin'.tr,
          
            // style:  TextStyle(fontSize: 25.0,),
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
