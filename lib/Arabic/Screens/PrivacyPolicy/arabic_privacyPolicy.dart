import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class PrivacyPolicy_arabic extends StatefulWidget {
  const PrivacyPolicy_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<PrivacyPolicy_arabic> createState() => _PrivacyPolicy_arabicState();
}

class _PrivacyPolicy_arabicState extends State<PrivacyPolicy_arabic> {
late Future<String> AboutUs;
@override
void initState() {
  super.initState();
  fetchData();

}

String? htmlresponse;
fetchData() async {
    var request = http.MultipartRequest('POST', Uri.parse('https://urlsdemo.net/mohally/api/view-pages'));
    request.fields.addAll({
      'page_name': 'privacy-policy',
      'language_type': 'Arabic'
    });

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
    return Scaffold(
      appBar:  AppBar(
          title: Text('سياسة الخصوصية', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),),
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
        body:htmlresponse==null?Center(child: CircularProgressIndicator()):
   Directionality(
    textDirection: TextDirection.rtl,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,child: SingleChildScrollView(
         child: Column(
           children: [HtmlWidget(
                    '''
          <!-- Your HTML content goes here -->
         $htmlresponse
                    ''',
                  ),
            
             ] ),
       ),),
     ),
   )
 
    );
  }
}