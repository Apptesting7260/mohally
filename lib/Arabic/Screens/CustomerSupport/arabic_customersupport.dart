// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';

class CustomerSupport_arabic extends StatefulWidget {
  const CustomerSupport_arabic({Key? key})
      : super(
          key: key,
        );
  @override
  State<CustomerSupport_arabic> createState() => _CustomerSupport_arabicState();
}

class _CustomerSupport_arabicState extends State<CustomerSupport_arabic> {
  String? htmlresponse;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://urlsdemo.net/mohally/api/view-pages'));
    request.fields
        .addAll({'page_name': 'customer-support', 'language_type': 'Arabic'});

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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "دعم العملاء",
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
              ));
  }
}
