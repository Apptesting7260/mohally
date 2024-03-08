// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:mohally/app_url/url.dart';
import 'package:http/http.dart' as http;
import 'package:mohally/theme/theme_helper.dart';

class TermsConditions_arabic extends StatefulWidget {
  const TermsConditions_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<TermsConditions_arabic> createState() => _TermsConditions_arabicState();
}

class _TermsConditions_arabicState extends State<TermsConditions_arabic> {
  late Future<String> TermsandConditions;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String? htmlresponse;

  fetchData() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://urlsdemo.net/mohally/api/view-pages'));
    request.fields.addAll(
        {'page_name': 'terms-and-conditions', 'language_type': 'Arabic'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      setState(() {
        htmlresponse = responseBody;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'الأحكام والشروط',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    width: Get.width * .07,
                    height: Get.height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(90, 158, 158, 158)),
                    child: Icon(
                      Icons.arrow_back,
                    )),
              ),
            ),
          ),
          body: htmlresponse == null
              ? Center(child: CircularProgressIndicator())
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          HtmlWidget(
                            '''
            <!-- Your HTML content goes here -->
           $htmlresponse
                      ''',
                          ),
                        ]),
                      ),
                    ),
                  ),
                )),
    );
  }
}
