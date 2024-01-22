import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

class CoupanScreen_arabic extends StatefulWidget {
  const CoupanScreen_arabic({
    Key? key,
  }) : super(key: key);

  @override
  State<CoupanScreen_arabic> createState() => _CoupanScreen_arabicState();
}

class _CoupanScreen_arabicState extends State<CoupanScreen_arabic> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('القسيمة والعروض', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),),
          leading: Padding(
            padding: const EdgeInsets.only(top:15, ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Get.width*.07,
                height: Get.height*.03,
                decoration: BoxDecoration(shape: BoxShape.circle, color: const Color.fromARGB(90, 158, 158, 158)),
                child: Icon(Icons.arrow_back, )),
            ),
          ),
        ),
      body: Directionality(
          textDirection: TextDirection.rtl,
        child: Padding(
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
                          "عرض شخصي",
                          style: theme.textTheme.subtitle1?.copyWith(fontFamily: 'Almarai'),
                        ),
                        Text(
                          "mypromocode2020",
                          style: theme.textTheme.subtitle2?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ],
                    ),
                    Gap(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "باقي 23 يوم",
                          style: theme.textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade400, fontFamily:  'Almarai'),
                        ),
                        Gap(5),
                        CustomElevatedButton(
                          height: 30.v,
                          width: 80.h,
                          text: "يتقدم",
                          margin: EdgeInsets.only(left: 8.h),
                          buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                          buttonTextStyle:
                              TextStyle(fontFamily: 'Almarai', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

 
}
