import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/verification_code_screen/verification_code_screen.dart';
import 'package:mohally/view_models/controller/signUp/signup_controller.dart';
import 'package:mohally/view_models/controller/user_verify_controller/user_verify_controller.dart';
import 'package:mohally/view_models/controller/verify_email/verify_email_controller.dart';
import 'package:mohally/view_models/controller/verifyemailotp_controller/verifyemailotp_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:pinput/pinput.dart';

import '../login_screen/login_screen.dart';

RxString countryCode = '+1'.obs;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Signup_controller signup_controller = Get.put(Signup_controller());
  VerifyEmailOTP_controller verifyemailOTP_controller =
      Get.put(VerifyEmailOTP_controller());
  Verifyemail_controller verifyemail_controller =
      Get.put(Verifyemail_controller());
  UserVerify_controller userVerify_controller =
      Get.put(UserVerify_controller());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode _pinPutFocusNode = FocusNode();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signup_controller.signup_apihit();
    _formKey.currentState!.save();
  }

  String email = " ";
  String mobile = " ";
  RxBool verifyemail = false.obs;
  RxBool verifyphone = false.obs;
  bool _passwordVisible = true;
  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  void initState() {
    signup_controller.firstNameController.value.clear();
    signup_controller.lastNameController.value.clear();
    signup_controller.passwordController.value.clear();
    signup_controller.emailController.value.clear();
    signup_controller.phoneController.value.clear();
    // TODO: implement initState
    super.initState();
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
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 59.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 30.h,
                        right: 30.h,
                        bottom: 26.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sign-up",
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                          SizedBox(height: 15.v),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 268.h,
                              margin: EdgeInsets.only(
                                left: 22.h,
                                right: 23.h,
                              ),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodyLargeGray50001_3
                                    .copyWith(
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 41.v),
                          Text(
                            "First Name",
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildFirstName(context),
                          SizedBox(height: 17.v),
                          Text(
                            "Last Name",
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildLastName(context),
                          SizedBox(height: 17.v),
                          Text(
                            "Mobile Number",
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          // Row(
                          //   children: [
                          //     CountryCodePicker(
                          //       // dialogSize: Size(Get.width * 0.6, Get.height * 0.6),
                          //       onChanged: (_) {
                          //         countryCode.value = _.toString();
                          //       },
                          //       // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          //       initialSelection: 'ca',
                          //       // favorite: ['+39', 'FR'],
                          //       // optional. Shows only country name and flag
                          //       showCountryOnly: false,
                          //       // optional. Shows only country name and flag when popup is closed.
                          //       showOnlyCountryWhenClosed: false,
                          //       // optional. aligns the flag and the Text left
                          //       alignLeft: false,
                          //       // dialogTextStyle: ,
                          //     ),
                          //     Expanded(
                          //       child: TextFormField(
                          //         controller: mobileController,
                          //         keyboardType: TextInputType.phone,
                          //         decoration: InputDecoration(
                          //             filled: true,
                          //             fillColor: Colors.white,
                          //             hintText: "Enter mobile number",
                          //             hintStyle: TextStyle(
                          //                 color: Color(0xff9796A1),
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.w300,
                          //
                          //          ),
                          //             contentPadding:
                          //             EdgeInsets.fromLTRB(20, 10, 20, 10),
                          //             enabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.circular(30),
                          //                 borderSide:
                          //                 BorderSide(color: Color(0xff9796A1))),
                          //             focusedBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.circular(30),
                          //                 borderSide:
                          //                 BorderSide(color: Color(0xff9796A1))),
                          //             border: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.circular(30),
                          //                 borderSide: BorderSide(
                          //                     color: Color(0xff9796A1)))),
                          //         onFieldSubmitted: (value) {},
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return 'enter mobile number';
                          //           }
                          //           return null;
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          // _buildGroup281(context),
                          CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Mobile Number";
                              } else {
                                return null;
                              }
                            },
                            controller: signup_controller.phoneController.value,
                            hintText: "Enter your mobile number",
                          ),
                          SizedBox(height: 7.v),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                userVerify_controller.UserVerify_apihit(
                                    signup_controller.emailController.value.text
                                        .toString());
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // title: Text(
                                      //   "Enter Otp",
                                      //   style: theme.textTheme.titleMedium,
                                      // ),
                                      content: Container(
                                        height: 400,
                                        width: 500,
                                        child: Form(
                                          key: formKey,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10.v),
                                              Text(
                                                "Verification Code",
                                                style: theme
                                                    .textTheme.headlineLarge,
                                              ),
                                              SizedBox(height: 19.v),
                                              Container(
                                                width: 261.h,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 50.h),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            "Please type the verification code sent to ",
                                                        style: CustomTextStyles
                                                            .bodyLargeGray50001_2,
                                                      ),
                                                      TextSpan(
                                                        text: "Mobile",
                                                        style: CustomTextStyles
                                                            .titleMediumPrimary16_1,
                                                      ),
                                                    ],
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(height: 36.v),

                                              Pinput(
                                                length: 6,
                                                autofocus: true,
                                                useNativeKeyboard: true,
                                                keyboardType:
                                                    TextInputType.number,
                                                defaultPinTheme:
                                                    defaultPinTheme,
                                                onSubmitted: (String pin) =>
                                                    _showSnackBar(pin, context),
                                                focusNode: _pinPutFocusNode,
                                                controller:
                                                    verifyemailOTP_controller
                                                        .pinController.value,
                                                submittedPinTheme:
                                                    defaultPinTheme,
                                                focusedPinTheme:
                                                    defaultPinTheme,
                                                followingPinTheme:
                                                    defaultPinTheme,
                                              ),

                                              SizedBox(height: 20.v),
                                              CustomElevatedButton(
                                                // loading: resetpasswordOTP_controller.loading.value,
                                                onPressed: () {
                                                  // otpbuttonused.value == true
                                                  //     ? () {}
                                                  //     : () {
                                                  otpbuttonused.value = true;
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    formKey.currentState!
                                                        .save();
                                                    _pinPutFocusNode.unfocus();
                                                    formKey.currentState!
                                                        .validate();

                                                    // verifyemailOTP_controller
                                                    //     .pinController.value
                                                    //     .clear();
                                                  }
                                                  if (userVerify_controller
                                                          .userList.value.otp
                                                          .toString() ==
                                                      verifyemailOTP_controller
                                                          .pinController
                                                          .value
                                                          .text) {
                                                    verifyphone.value = true;
                                                    Get.back();
                                                    verifyemailOTP_controller
                                                        .pinController
                                                        .value
                                                        .clear();
                                                  } else {
                                                    _showSnackBar(
                                                        "wrong otp", context);
                                                  }
                                                  // verifyemailOTP_controller
                                                  //     .VerifyEmailOTP_apihit(
                                                  //         signup_controller
                                                  //             .emailController
                                                  //             .value
                                                  //             .text
                                                  //             .toString(),
                                                  //         context);
                                                },
                                                text: "Verify",
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 24.h),
                                                buttonStyle: CustomButtonStyles
                                                    .fillPrimary,
                                              ),
                                              SizedBox(height: 24.v),
                                              // RichText(
                                              //   text: TextSpan(
                                              //     children: [
                                              //       TextSpan(
                                              //         text: "I don’t receive a code!",
                                              //         style: CustomTextStyles.bodyLargeLight,
                                              //       ),
                                              //       TextSpan(
                                              //         text: "Resend",
                                              //         style: CustomTextStyles.titleMediumPrimary,
                                              //         // !waitOtpShow.value == true
                                              //         //     ? "Resend"
                                              //         //     : waitOtp.value.toString(),
                                              //         // style: CustomTextStyles.titleMediumPrimary,
                                              //         // recognizer: TapGestureRecognizer()
                                              //         //   ..onTap = waitOtpShow.value == true
                                              //         //       ? () {}
                                              //         //       : () {
                                              //         //           waitOtp.value = 60;
                                              //         //           resetpasswordOTP_controller
                                              //         //               .ResetpasswordOTP_apihit();
                                              //         //
                                              //         //           waitOtpUpdate();
                                              //         //         }
                                              //       ),
                                              //     ],
                                              //   ),
                                              //   textAlign: TextAlign.left,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: !(verifyemail.value == true &&
                                      verifyphone.value == true)
                                  ? Text(
                                      "Verify Mobile",
                                      style: theme.textTheme.titleSmall!
                                          .copyWith(color: Color(0xffFE8300)),
                                    )
                                  : Text(
                                      "Verified",
                                      style: theme.textTheme.titleSmall!
                                          .copyWith(color: Colors.green),
                                    ),
                            ),
                          ),
                          SizedBox(height: 17.v),
                          Text(
                            "Email",
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildEmail(context),
                          SizedBox(height: 6.v),

                          GestureDetector(
                            onTap: () {
                              verifyemail_controller.Verifyeusermail_apihit(
                                  signup_controller.emailController.value.text
                                      .toString());
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // title: Text(
                                    //   "Enter Otp",
                                    //   style: theme.textTheme.titleMedium,
                                    // ),
                                    content: Container(
                                      height: 400,
                                      width: 500,
                                      child: Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.v),
                                            Text(
                                              "Verification Code",
                                              style:
                                                  theme.textTheme.headlineLarge,
                                            ),
                                            SizedBox(height: 19.v),
                                            Container(
                                              width: 261.h,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 50.h),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "Please type the verification code sent to ",
                                                      style: CustomTextStyles
                                                          .bodyLargeGray50001_2,
                                                    ),
                                                    TextSpan(
                                                      text: "Email",
                                                      style: CustomTextStyles
                                                          .titleMediumPrimary16_1,
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(height: 36.v),

                                            Pinput(
                                              length: 6,
                                              autofocus: true,
                                              useNativeKeyboard: true,
                                              keyboardType:
                                                  TextInputType.number,
                                              defaultPinTheme: defaultPinTheme,
                                              onSubmitted: (String pin) =>
                                                  _showSnackBar(pin, context),
                                              focusNode: _pinPutFocusNode,
                                              controller:
                                                  verifyemailOTP_controller
                                                      .pinController.value,
                                              submittedPinTheme:
                                                  defaultPinTheme,
                                              focusedPinTheme: defaultPinTheme,
                                              followingPinTheme:
                                                  defaultPinTheme,
                                            ),

                                            SizedBox(height: 20.v),
                                            CustomElevatedButton(
                                              // loading: resetpasswordOTP_controller.loading.value,
                                              onPressed: () {
                                                // otpbuttonused.value == true
                                                //     ? () {}
                                                //     : () {
                                                otpbuttonused.value = true;
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  formKey.currentState!.save();
                                                  _pinPutFocusNode.unfocus();
                                                  formKey.currentState!
                                                      .validate();

                                                  // verifyemailOTP_controller
                                                  //     .pinController.value
                                                  //     .clear();
                                                }
                                                if (verifyemail_controller
                                                        .userList.value.otp
                                                        .toString() ==
                                                    verifyemailOTP_controller
                                                        .pinController
                                                        .value
                                                        .text) {
                                                  verifyemail.value = true;
                                                  Get.back();
                                                } else {
                                                  _showSnackBar(
                                                      "wrong otp", context);
                                                }
                                                // verifyemail_controller.
                                              },
                                              text: "Verify",
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 24.h),
                                              buttonStyle: CustomButtonStyles
                                                  .fillPrimary,
                                            ),
                                            SizedBox(height: 24.v),
                                            // RichText(
                                            //   text: TextSpan(
                                            //     children: [
                                            //       TextSpan(
                                            //         text: "I don’t receive a code!",
                                            //         style: CustomTextStyles.bodyLargeLight,
                                            //       ),
                                            //       TextSpan(
                                            //         text: "Resend",
                                            //         style: CustomTextStyles.titleMediumPrimary,
                                            //         // !waitOtpShow.value == true
                                            //         //     ? "Resend"
                                            //         //     : waitOtp.value.toString(),
                                            //         // style: CustomTextStyles.titleMediumPrimary,
                                            //         // recognizer: TapGestureRecognizer()
                                            //         //   ..onTap = waitOtpShow.value == true
                                            //         //       ? () {}
                                            //         //       : () {
                                            //         //           waitOtp.value = 60;
                                            //         //           resetpasswordOTP_controller
                                            //         //               .ResetpasswordOTP_apihit();
                                            //         //
                                            //         //           waitOtpUpdate();
                                            //         //         }
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   textAlign: TextAlign.left,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: !(verifyemail.value == true &&
                                        verifyphone.value == true)
                                    ? Text(
                                        "Verify Email",
                                        style: theme.textTheme.titleSmall!
                                            .copyWith(color: Color(0xffFE8300)),
                                      )
                                    : Text(
                                        "Verified",
                                        style: theme.textTheme.titleSmall!
                                            .copyWith(color: Colors.green),
                                      )),
                          ),
                          SizedBox(height: 17.v),
                          Text(
                            "Password",
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildPassword(context),
                          SizedBox(height: 20.v),
                          _buildContinueButton(context),
                          SizedBox(height: 109.v),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: CustomTextStyles
                                        .bodyMediumGray90001Light,
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => LoginScreen());
                                        // Handle the tap gesture
                                        print('TextSpan tapped!');
                                      },
                                    text: "Sign-In",
                                    style:
                                        CustomTextStyles.titleSmallPrimaryBold,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter First Name";
        } else {
          return null;
        }
      },
      controller: signup_controller.firstNameController.value,
      hintText: "Enter your first name",
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Last Name";
        } else {
          return null;
        }
      },
      controller: signup_controller.lastNameController.value,
      hintText: "Enter your last name",
    );
  }

  /// Section Widget
  Widget _buildGroup280(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.h,
          top: 3.v,
        ),
        child: CustomTextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter Mobile Number";
            } else {
              return null;
            }
          },
          controller: signup_controller.phoneController.value,
          hintText: "Enter your mobile number",
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup281(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // CustomImageView(
        //   imagePath: ImageConstant.imgImage11,
        //   height: 20.adaptSize,
        //   width: 20.adaptSize,
        // ),
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
        _buildGroup280(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (!isEmail(value!)) {
          return 'Please enter a valid email.';
        }
        return null;
      },
      controller: signup_controller.emailController.value,
      hintText: "Enter your email",
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      obscureText: !_passwordVisible,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Password";
        } else {
          return null;
        }
      },
      controller: signup_controller.passwordController.value,
      hintText: "Enter your password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffix: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          )),

      // suffix: Container(
      //   margin: EdgeInsets.fromLTRB(12.h, 13.v, 16.h, 13.v),
      //   child: CustomImageView(
      //     imagePath: ImageConstant.imgIconEye,
      //     height: 24.adaptSize,
      //     width: 24.adaptSize,
      //   ),
      // ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.v,
      ),
      contentPadding: EdgeInsets.only(
        left: 20.h,
        top: 17.v,
        bottom: 17.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      isDisabled: !(verifyemail.value &&
          verifyphone.value),
      onPressed: () {
        checkvalidate();
      },
      text: "Continue",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  checkvalidate() {
    print("send");
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _submit();
    }
  }

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
