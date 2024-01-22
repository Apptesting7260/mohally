// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/widgets/arabic_customSearchView.dart';

class SearchHistory_arabic extends StatefulWidget {
  const SearchHistory_arabic({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchHistory_arabic> createState() => _SearchHistory_arabicState();
}

class _SearchHistory_arabicState extends State<SearchHistory_arabic> {
  
   File imgFile = File("");

  final imgPicker = ImagePicker();
  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  //open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }
  //  TextEditingController _searchController = TextEditingController();
   List<String> searchHistory = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'يبحث',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: Get.width * 0.07,
              height: Get.height * 0.03,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(90, 158, 158, 158),
              ),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      body:
       Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
                
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.04),
               Center(child: Stack(
              children: [
              CustomSearchView_arabic(
               hintText: 'فئة البحث',
               hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                readOnly: false,
                enableTap: false,
              ),
                 Positioned(
                  top: 20,
                  right: 240,
                  child: GestureDetector(
                    onTap: (){
                       File imgFile = File("");

  final imgPicker = ImagePicker();
  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  //open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }
                    },
                    child: Image.asset('assets/images/greycamera.png'))),
                ])),
              SizedBox(height: Get.height * 0.02),
              _buildSearchHistory(),
            ],
          ),
        ),
      ),
    );
  }

// void _handleSearch(String query) {
//   if (_searchController != null) {
//     setState(() {
//       searchHistory.insert(0, query);
//     });
//     // Clear the search input field
//     _searchController.clear();
//   }
// }


  Widget _buildSearchHistory() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           
            Text('بحثت مؤخرا', style: TextStyle(fontFamily: 'Almarai', fontSize: 16, fontWeight:FontWeight.w600, color: Colors.black),),
             Icon(Icons.delete, color: Color(0xffff8300),),
          
          ],),
       SizedBox(height: Get.height*.04,),
          _buildSearchHistorycontainer(),
          SizedBox(height: Get.height*.04,),
           Text('بحثت مؤخرا', style: TextStyle(fontFamily: 'Almarai', fontSize: 16, fontWeight:FontWeight.w600, color: Colors.black),),
          SizedBox(height: Get.height*.04,),
          _buildPopularnow(),
        ],
      ),
    );
    // Expanded(
    //   child:
    //    ListView.builder(
    //     itemCount: searchHistory.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         title: Text(searchHistory[index]),
    //         onTap: () {
    //           _handleSearch(searchHistory[index]);
    //         },
    //       );
    //     },
    //   ),
    // );
  }
   Widget _buildSearchHistorycontainer() {
    return Container(
      height: Get.height*.05,
      width: Get.width*.3,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
         color: Color.fromARGB(28, 158, 158, 158),
      ),
      child: Center(child: Text('الرجال البلوز', style: TextStyle(fontFamily: 'Almarai', fontSize: 14, fontWeight:FontWeight.w400, color: Colors.grey),)), 
    );
   }
   Widget _buildPopularnow() {
    return Container(
      height: Get.height*.05,
      width: Get.width*.3,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
         color: Color.fromARGB(28, 158, 158, 158),
      ),
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('احذية نسائية', style: TextStyle(fontFamily: 'Almarai', fontSize: 14, fontWeight:FontWeight.w400, color: Colors.grey),),
          Image.asset('assets/images/fire.png')
        ],
      )), 
    );
   }
}
