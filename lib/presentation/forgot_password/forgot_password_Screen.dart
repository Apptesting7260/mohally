import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/presentation/verification_code_screen/verification_code_screen.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/reset_password/reset_password_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

import '../../theme/custom_button_style.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key})
      : super(
          key: key,
        );

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  Resetpassword_controller resetpassword_controller = Get.put(Resetpassword_controller());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 45.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Forgot_Password".tr,
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
                      "Lorem".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLargeGray50001_3.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 41.v),
                SizedBox(height: 17.v),
                Text(
                  "_Email".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 9.v),
                _buildEmail(context),
                SizedBox(height: 20.v),
                _buildContinueButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkvalidate() {
    print("_send");
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      resetpassword_controller.Resetpassword_apihit();
      _formKey.currentState!.save();
      // Get.to(() => VerificationCodeScreen(
      //       controller: TextEditingController(),
      //       pinPutFocusNode: FocusNode(),
      //     ));
    }
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (!isEmail(value!)) {
          return 'enter_valid'.tr;
        }
        return null;
      },
      controller:resetpassword_controller .emailController.value,
      hintText: "enter_mail".tr,
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        // Get.to(() => VerificationCodeScreen(
        //       controller: TextEditingController(),
        //       pinPutFocusNode: FocusNode(),
        //     ));
        checkvalidate();
      },
      text: "_Continue".tr,
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
