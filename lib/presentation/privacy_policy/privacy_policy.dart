import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/app_url/url.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:http/http.dart' as http;
class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key})
      : super(
          key: key,
        );

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
late Future<String> PrivacyPolicy;
@override
void initState() {
  super.initState();
PrivacyPolicy = _fetchData();
}

Future <String> _fetchData() async{
final response =await http.get(Uri.parse(AppUrl.privacypolicy));
if (response.statusCode==200){
   return response.body;
}
else {
      throw Exception('Failed to load HTML content');
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FutureBuilder(
            future: PrivacyPolicy,
            builder: (context, snapshot){
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
                    SizedBox(height: 20),
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
          //         imagePath: ImageConstant.policy,
          //       ),
          //     ),
        
          //     Gap(20),
          //     Text(
          //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          //         maxLines: 4,
          //         overflow: TextOverflow.ellipsis,
          //         style:
          //         theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
          //     Gap(20),
          //     Text(
          //       "What is Lorem Ipsum?",
          //       style: CustomTextStyles.titleMediumMedium16,
          //     ),
          //     Gap(10),
          //     Text(
          //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          //         maxLines: 4,
          //         overflow: TextOverflow.ellipsis,
          //         style:
          //         theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
          //     Gap(20),
          //     Text(
          //       ". What is Lorem Ipsum",
          //       style: CustomTextStyles.titleSmall15,
          //     ),
          //     Gap(10),
          //     Text(
          //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          //         maxLines: 4,
          //         overflow: TextOverflow.ellipsis,
          //         style:
          //         theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
          //     Gap(10),
          //     Text(
          //       ". What is Lorem Ipsum",
          //       style: CustomTextStyles.titleSmall15,
          //     ),
          //     Gap(10),
          //     Text(
          //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          //         maxLines: 4,
          //         overflow: TextOverflow.ellipsis,
          //         style:
          //         theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
          //     Gap(10),
          //     Text(
          //       ". What is Lorem Ipsum",
          //       style: CustomTextStyles.titleSmall15,
          //     ),
          //     Gap(10),
          //     Text(
          //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          //         maxLines: 4,
          //         overflow: TextOverflow.ellipsis,
          //         style:
          //         theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
          //   ],
          // ),
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
        text: "Privacy_Policy".tr,
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }
}
