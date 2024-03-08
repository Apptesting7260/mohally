import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
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

  FocusNode _mobilePinPutFocusNode = FocusNode();
  FocusNode _emailPinPutFocusNode = FocusNode();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    // signup_controller.loading=true;
    signup_controller.signup_apihit(context);
    _formKey.currentState!.save();
  }

  bool resetverification = true;
  String email = " ";
  String mobile = " ";
  RxBool verifyemail = false.obs;
  RxBool verifyphone = false.obs;
  bool _passwordVisible = true;
  bool isEmailValid(String email) {
    // Regular expression to validate email format
    // final emailRegExp =
    //     RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(?:com)$');

    // Check if email matches the regular expression and contains "@" and ".com"
    if (email.contains('@') && email.endsWith('.com')) {
      return true;
    }
    return false;
  }

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  void initState() {
    signup_controller.countryController.value.text = 'IN';
    verifyemailOTP_controller.pinController.value.clear();
    signup_controller.firstNameController.value.clear();
    signup_controller.lastNameController.value.clear();
    signup_controller.passwordController.value.clear();
    signup_controller.emailController.value.clear();
    signup_controller.phoneController.value.clear();
    // TODO: implement initState
    super.initState();
  }

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
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

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
                              'Sign-up',
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
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
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
                            'First Name',
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildFirstName(context),
                          SizedBox(height: 17.v),
                          Text(
                            'Last Name',
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildLastName(context),
                          SizedBox(height: 17.v),
                          Text(
                            'Country/Region',
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildCountry(context),
                          SizedBox(height: 17.v),
                          Text(
                            'Mobile Number',
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildPhoneField(context),
                          SizedBox(height: 17.v),
                          Text(
                            'Email',
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 9.v),
                          _buildEmailField(context),
                          SizedBox(height: 17.v),
                          Text(
                            'Password',
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
                                    text: 'Already have an account? ',
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
                                    text: 'Sign-in',
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
          return 'Please Enter First Name';
        } else if (signup_controller.firstNameController.value.length <= 2) {
          return 'The first name must be at least 3 characters. ';
        } else if (RegExp(r'[0-9]').hasMatch(value)) {
          // Check if the value contains numbers
          return ' Name should not contain numbers';
        }
        //  else if (value.length >= 2) {
        //               return 'The first name must be at least 3 characters.';}

        return null;
      },
      controller: signup_controller.firstNameController.value,
      hintText: 'Enter your first name',
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return CustomTextFormField(
      onChanged: (value) {
        if (value!.isEmpty) {
          verifyemail.value = false;
        }
        return null;
      },
      // validator: (value) {
      //   if (!isEmail(value!)) {
      //     return 'Please enter the correct email.';
      //   }
      //   return null;
      // },
      controller: signup_controller.emailController.value,
      hintText: 'Enter your email address',
      textInputType: TextInputType.emailAddress,
      suffix: Padding(
        padding: const EdgeInsets.only(top: 17, left: 10),
        child: GestureDetector(
          onTap: () {
            String email = signup_controller.emailController.value.text;
            if (email.isEmpty) {
              Utils.snackBar(context, 'Failed', 'Please enter your email');
            } else if (!isEmailValid(email)) {
              Utils.snackBar(context, 'Failed', 'Please enter a valid email');
            } else {
              // Only perform actions if the email is valid
              if (!verifyemail.value) {
                verifyemailOTP_controller.pinController.value.clear();
                verifyemail_controller.Verifyeusermail_apihit(email);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Container(
                        height: Get.height * .4,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 10.v),
                              Text(
                                'verification code',
                                style: theme.textTheme.headlineLarge,
                              ),
                              SizedBox(height: 19.v),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Please enter the verification code sent to\n',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                    TextSpan(
                                      text: '\n',
                                    ),
                                    TextSpan(
                                        text: email,
                                        style: TextStyle(
                                            color: Color(0xffFE8300),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10)),
                                    TextSpan(
                                      text: '\n',
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     verifyemailOTP_controller.pinController.value
                              //         .clear();

                              //     verifyemail_controller.Verifyeusermail_apihit(
                              //         email);
                              //     Utils.snackBar(context, 'Success',
                              //         'OTP Resent Successfully');
                              //   },
                              //   child: Text(
                              //     'Resend Otp',
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 14),
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  verifyemailOTP_controller.pinController.value
                                      .clear();
                                  verifyemail_controller.Verifyeusermail_apihit(
                                      email);
                                  verifyemail_controller.rxRequestStatus ==
                                          Status.LOADING
                                      ? CircularProgressIndicator()
                                      : Utils.snackBar(context, 'Success',
                                          'OTP Resent Successfully');
                                },
                                child: Text(
                                  'Resend Otp',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(height: 36.v),
                              Container(
                                height: Get.height * .04,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                width: Get.width * .9,
                                child: Pinput(
                                  length: 6,
                                  // autofocus: true,
                                  useNativeKeyboard: true,
                                  keyboardType: TextInputType.phone,
                                  defaultPinTheme: defaultPinTheme,
                                  onSubmitted: (String pin) =>
                                      _showSnackBar(pin, context),
                                  focusNode: _emailPinPutFocusNode,
                                  controller: verifyemailOTP_controller
                                      .pinController.value,
                                  submittedPinTheme: defaultPinTheme,
                                  focusedPinTheme: defaultPinTheme,
                                  followingPinTheme: defaultPinTheme,
                                ),
                              ),
                              SizedBox(height: 20.v),
                              CustomElevatedButton(
                                onPressed: () {
                                  otpbuttonused.value = true;
                                  if (verifyemailOTP_controller
                                      .pinController.value.text.isEmpty) {
                                    Utils.snackBar(context, 'Failed',
                                        'Please enter the OTP');
                                  } else {
                                    if (verifyemail_controller
                                            .userList.value.otp
                                            .toString() ==
                                        verifyemailOTP_controller
                                            .pinController.value.text) {
                                      verifyemail.value = true;

                                      if (verifyemail_controller
                                              .userList.value.otp
                                              .toString() ==
                                          verifyemailOTP_controller
                                              .pinController.value.text) {
                                        Get.back();
                                        verifyemailOTP_controller
                                            .pinController.value
                                            .clear();
                                      }
                                    } else {
                                      Utils.snackBar(context, 'Failed',
                                          'Please Enter Correct Otp');
                                      print('Incorrect OTP');
                                    }
                                  }
                                },
                                text: 'Confirms',
                                margin: EdgeInsets.symmetric(horizontal: 24.h),
                                buttonStyle: CustomButtonStyles.fillPrimary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                Utils.snackBar(
                    context, 'Failed', 'Email has already been verified');
                print('Email is already verified');
              }
            }
          },
          child: !(verifyemail.value == true)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Email verification',
                    style: TextStyle(color: Color(0xffFE8300), fontSize: 12),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Verified',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Last Name';
        } else if (signup_controller.lastNameController.value.length <= 2) {
          return 'The first name must be at least 3 characters. ';
        } else if (RegExp(r'[0-9]').hasMatch(value)) {
          // Check if the value contains numbers
          return 'Last Name should not contain numbers';
        } else {
          return null;
        }
      },
      controller: signup_controller.lastNameController.value,
      hintText: 'Enter your last name',
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
              return 'Please Enter Mobile Number';
            } else {
              return null;
            }
          },
          controller: signup_controller.phoneController.value,
          hintText: 'Enter your mobile number',
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
        if (!isEmailValid(value!)) {
          return 'Please Enter a valid Email Address';
        }
        return null;
      },
      controller: signup_controller.emailController.value,
      hintText: 'Please enter a  email.',
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      obscureText: !_passwordVisible,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Password';
        } else if (signup_controller.passwordController.value.length < 6) {
          return 'The password must be at least 6 characters. ';
        } else {
          return null;
        }
      },
      controller: signup_controller.passwordController.value,
      hintText: 'Enter your password',
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

  Widget _buildCountry(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        controller: signup_controller.countryController.value,
        decoration: InputDecoration(
          prefix: CountryCodePicker(
            padding: EdgeInsets.only(bottom: 1),
            onChanged: (element) {
              signup_controller.countryController.value.text =
                  element.toString();
            },
            initialSelection: 'IN',
            showCountryOnly: false,
            showOnlyCountryWhenClosed: true,
            showDropDownButton: true,
            showFlag: true,
            alignLeft: true,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 17.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Color(0XFFE6E6E6),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Color(0XFFE6E6E6)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Color(0XFFE6E6E6),
            ),
          ),
          filled: true,
          fillColor: Color(0XFFF4F4F4),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        isDisabled: !(verifyemail.value && verifyphone.value),
        loading: signup_controller.loading.value,
        onPressed: () {
          checkvalidate();
        },
        text: 'Continue',
        buttonStyle: CustomButtonStyles.fillPrimary,
      );
    });
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
            'Pin Submitted. Value:$pin',
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

  String? mobileNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Mobile Number';
    } else if (value.length != 10) {
      return 'Mobile number must be 10 digits long';
    } else if (value.startsWith('0') || value.startsWith('1')) {
      return 'Mobile number should not start with 0 or 1';
    } else {
      return null;
    }
  }

  Widget _buildPhoneField(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.phone,
      onChanged: (value) {
        if (value!.isEmpty) {
          verifyphone.value = false;
        } else {
          if (value.length > 10) {
            Utils.snackBar(
                context, 'Error', 'Phone number must only be 10 digits');
          }
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter mobile number';
        } else {
          return null;
        }
      },
      controller: signup_controller.phoneController.value,
      hintText: 'Enter your  mobile number',
      suffix: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10),
        child: GestureDetector(
          onTap: () {
            if (!verifyphone.value) {
              verifyemailOTP_controller.pinController.value.clear();
              String phoneNumber = signup_controller.phoneController.value.text;

              if (phoneNumber.isEmpty) {
                Utils.snackBar(context, 'Failed', 'Please enter mobile number');
              } else if (phoneNumber.length < 10) {
                Utils.snackBar(
                    context, 'Failed', 'Please enter a valid Mobile Number');
              }
              if (signup_controller.phoneController.value.text.isNotEmpty &&
                  signup_controller.phoneController.value.text.length == 10) {
                userVerify_controller.UserVerify_apihit(
                    signup_controller.phoneController.value.text.toString());
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Container(
                        height: Get.height * .4,
                        width: 500,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 10.v),
                              Text(
                                'verification code',
                                style: theme.textTheme.headlineLarge,
                              ),
                              SizedBox(height: 19.v),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Please enter the verification code sent to\n',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                    TextSpan(
                                      text: '\n',
                                    ),
                                    TextSpan(
                                        text: signup_controller
                                            .phoneController.value.text,
                                        style: TextStyle(
                                            color: Color(0xffFE8300),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10)),
                                    TextSpan(
                                      text: '\n',
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // GestureDetector(
                              //     onTap: () {
                              //       // Clear the PIN input field
                              //       verifyemailOTP_controller
                              //           .pinController.value
                              //           .clear();
                              //       Future.delayed(Duration(seconds: 1), () {
                              //         Utils.snackBar(context, 'Success',
                              //             'OTP Resent Successfully');
                              //       });
                              //     },
                              //     child: Text('Resend Otp',
                              //         style: TextStyle(
                              //             color: Colors.black,
                              //             fontWeight: FontWeight.w600,
                              //             fontSize: 14))),

                              GestureDetector(
                                onTap: () {
                                  verifyemailOTP_controller.pinController.value
                                      .clear();
                                  verifyemail_controller.Verifyeusermail_apihit(
                                      phoneNumber);
                                  verifyemail_controller.rxRequestStatus ==
                                          Status.LOADING
                                      ? CircularProgressIndicator()
                                      : Utils.snackBar(context, 'Success',
                                          'OTP Resent Successfully');
                                },
                                child: Text(
                                  'Resend Otp',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(height: 36.v),
                              Container(
                                height: Get.height * .04,
                                // width: Get.width*.8,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),

                                child: Pinput(
                                  length: 6,
                                  autofocus: false,
                                  useNativeKeyboard: true,
                                  keyboardType: TextInputType.phone,
                                  defaultPinTheme: defaultPinTheme,
                                  onSubmitted: (String pin) =>
                                      _showSnackBar(pin, context),
                                  focusNode: _mobilePinPutFocusNode,
                                  controller: verifyemailOTP_controller
                                      .pinController.value,
                                  submittedPinTheme: defaultPinTheme,
                                  focusedPinTheme: defaultPinTheme,
                                  followingPinTheme: defaultPinTheme,
                                ),
                              ),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                onPressed: () {
                                  if (verifyemailOTP_controller
                                      .pinController.value.text.isEmpty) {
                                    // Display an error message indicating that the OTP is required
                                    Utils.snackBar(context, 'Failed',
                                        'Please enter the OTP');
                                  } else {
                                    if (userVerify_controller.userList.value.otp
                                            .toString() ==
                                        verifyemailOTP_controller
                                            .pinController.value.text) {
                                      // Set verifyphone.value to true immediately
                                      verifyphone.value = true;

                                      if (userVerify_controller
                                              .userList.value.otp
                                              .toString() ==
                                          verifyemailOTP_controller
                                              .pinController.value.text) {
                                        // Email verification logic (if needed)
                                        verifyemailOTP_controller
                                            .pinController.value
                                            .clear();
                                        Get.back();
                                      }
                                    } else {
                                      Utils.snackBar(context, 'Failed',
                                          'Please Enter Correct Otp');
                                      print('Incorrect OTP');
                                    }
                                  }
                                },
                                text: 'Verify',
                                margin: EdgeInsets.symmetric(horizontal: 24.h),
                                buttonStyle: CustomButtonStyles.fillPrimary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              Utils.snackBar(
                  context, 'Failed', 'Phone has already been verified');
              print('Phone is already verified');
            }
          },
          child: !(verifyphone.value == true)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Mobile verification',
                    style: TextStyle(color: Color(0xffFE8300), fontSize: 12),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Verified',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
        ),
      ),
    );
  }
}
