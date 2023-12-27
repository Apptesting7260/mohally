import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/app_url/url.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
late Future<String> AboutUs;
@override
void initState() {
  super.initState();
AboutUs = _fetchData();
}

Future <String> _fetchData() async{
final response =await http.get(Uri.parse(AppUrl.aboutus));
if (response.statusCode==200){
   return response.body;
}
else {
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
        padding: const EdgeInsets.all(22.0),
        child: FutureBuilder(
          future: AboutUs, builder: ((context, snapshot) {
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
          }))
        //  Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Center(
        //       child: CustomImageView(
        //         imagePath: ImageConstant.imgAboutImg,
        //       ),
        //     ),
        //     Gap(20),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //     Gap(20),
        //     Text(
        //       "What is Lorem Ipsum?",
        //       style: CustomTextStyles.titleMediumMedium16,
        //     ),
        //     Gap(20),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //     Gap(5),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //     Gap(10),
        //     Row(
        //       children: [
        //         CustomImageView(
        //           imagePath: ImageConstant.call,
        //           height: 25.adaptSize,
        //           width: 25.adaptSize,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(
        //             left: 10.h,
        //             top: 5.v,
        //             bottom: 2.v,
        //           ),
        //           child: Text(
        //             "9876543210",
        //             style: CustomTextStyles.bodyLarge18,
        //           ),
        //         ),
        //       ],
        //     ),
        //     Gap(5),
        //     Row(
        //       children: [
        //         CustomImageView(
        //           imagePath: ImageConstant.email,
        //           height: 25.adaptSize,
        //           width: 25.adaptSize,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(
        //             left: 10.h,
        //             top: 5.v,
        //             bottom: 2.v,
        //           ),
        //           child: Text(
        //             "example@gmail.com",
        //             style: CustomTextStyles.bodyLarge18,
        //           ),
        //         ),
        //       ],
        //     ),
        //     Gap(5),
        //     Row(
        //       children: [
        //         CustomImageView(
        //           imagePath: ImageConstant.location,
        //           height: 25.adaptSize,
        //           width: 25.adaptSize,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(
        //             left: 10.h,
        //             top: 5.v,
        //             bottom: 2.v,
        //           ),
        //           child: Text(
        //             "Sandfoard RoadSandfoard, Wareham,\nDorset BH207DD",
        //             style: CustomTextStyles.bodyLarge18,
        //           ),
        //         ),
        //       ],
        //     ),
        //     Gap(20),
        //     Text(
        //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        //         maxLines: 4,
        //         overflow: TextOverflow.ellipsis,
        //         style:
        //             theme.textTheme.titleSmall!.copyWith(color: Colors.grey)),
        //   ],
        // ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
        text: "About Us",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
