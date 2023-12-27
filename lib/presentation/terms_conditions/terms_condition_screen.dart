import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/app_url/url.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:http/http.dart' as http;
import '../../widgets/app_bar/appbar_subtitle.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key})
      : super(
          key: key,
        );

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  late Future<String> TermsandConditions;
   @override
  void initState() {
    super.initState();
    TermsandConditions = _fetchData();
  }
Future<String> _fetchData() async {
    final response = await http.get(Uri.parse(AppUrl.termsandconditions));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load HTML content');
    }
  }
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: 
        FutureBuilder(
          future: TermsandConditions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Html(data: snapshot.data.toString()),
                  ),
                  SizedBox(height: 20)
                ]
              );
            }
          }
        )
        
        
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Center(
        //       child: CustomImageView(
        //         imagePath: ImageConstant.terms,
        //       ),
        //     ),

        //     Gap(20),
        //     Text(
        //       "Terms of Use",
        //       style: CustomTextStyles.titleMediumMedium16,
        //     ),
        //     Gap(10),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //     Gap(20),
        //     Text(
        //       "1. Clause",
        //       style: CustomTextStyles.titleMediumMedium16,
        //     ),
        //     Gap(10),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //     Gap(20),
        //     Text(
        //       "2. Clause",
        //       style: CustomTextStyles.titleMediumMedium16,
        //     ),
        //     Gap(10),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //     Gap(20),
        //     Text(
        //       "3. Clause",
        //       style: CustomTextStyles.titleMediumMedium16,
        //     ),
        //     Gap(10),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //     Gap(30),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         CustomElevatedButton(
        //           height: 30,
        //           width: 80,
        //           text: "Accept",
        //           margin: EdgeInsets.only(left: 8),
        //           buttonStyle: CustomButtonStyles.fillPrimaryTL15,
        //           buttonTextStyle: CustomTextStyles.labelLargeWhiteA70002_1,
        //         ),
        //         CustomElevatedButton(
        //           height: 30,
        //           width: 80,
        //           text: "Decline",
        //           margin: EdgeInsets.only(left: 8),
        //           buttonStyle: CustomButtonStyles.fillPrimaryTL15,
        //           buttonTextStyle: CustomTextStyles.labelLargeWhiteA70002_1,
        //         ),
        //       ],
        //     )
        //   ],
        // ),
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
        text: "Terms and Conditions",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }
}
