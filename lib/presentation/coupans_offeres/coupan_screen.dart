import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';

class CoupanScreen extends StatefulWidget {
  const CoupanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CoupanScreen> createState() => _CoupanScreenState();
}

class _CoupanScreenState extends State<CoupanScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 3,
          itemExtent: 90,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/bg.png",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 25,
                          left: 20,
                          child: Image.asset(
                            "assets/images/discou.png",
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Offer",
                        style: theme.textTheme.subtitle1,
                      ),
                      Text(
                        "Summer2020",
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                  Gap(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "6 days remaining",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.grey.shade400),
                      ),
                      Gap(5),
                      CustomElevatedButton(
                        height: 30.v,
                        width: 80.h,
                        text: "_Apply".tr,
                        margin: EdgeInsets.only(left: 8.h),
                        buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                        buttonTextStyle:
                            CustomTextStyles.labelLargeWhiteA70002_1,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

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
        text: "Coupan & Offers",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
