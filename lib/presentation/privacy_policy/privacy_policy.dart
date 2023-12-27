import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_image_view.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key})
      : super(
          key: key,
        );

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomImageView(
                imagePath: ImageConstant.policy,
              ),
            ),

            Gap(20),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(20),
            Text(
              "What is Lorem Ipsum?",
              style: CustomTextStyles.titleMediumMedium16,
            ),
            Gap(10),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(20),
            Text(
              ". What is Lorem Ipsum",
              style: CustomTextStyles.titleSmall15,
            ),
            Gap(10),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(10),
            Text(
              ". What is Lorem Ipsum",
              style: CustomTextStyles.titleSmall15,
            ),
            Gap(10),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(10),
            Text(
              ". What is Lorem Ipsum",
              style: CustomTextStyles.titleSmall15,
            ),
            Gap(10),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20,
          top: 8,
          bottom: 8,
        ),
      ),
      title: AppbarSubtitle(
        text: "Privacy Policy",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }
}
