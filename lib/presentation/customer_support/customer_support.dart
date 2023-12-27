import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_image_view.dart';

import '../../theme/theme_helper.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key})
      : super(
          key: key,
        );
  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomImageView(
                imagePath: ImageConstant.customer,
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
            Gap(20),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(5),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(10),
            Gap(20),
            Text(
              "What is Lorem Ipsum?",
              style: CustomTextStyles.titleMediumMedium16,
            ),
            Gap(20),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(5),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
            Gap(10),
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
        text: "Customer Support",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }

}
