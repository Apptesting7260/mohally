import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_searchCategories_Controller.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/Arabic/Screens/widgets/arabic_customSearchView.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/search_screen/widgets/vectorchipview_item_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryArabic extends StatefulWidget {
  const SearchHistoryArabic({Key? key}) : super(key: key);

  @override
  State<SearchHistoryArabic> createState() => _SearchHistoryArabicState();
}

class _SearchHistoryArabicState extends State<SearchHistoryArabic> {
  SearchCategories_Controller searchcategories_controller =
      SearchCategories_Controller();
  // SearchProductByName_Controller _searchProductByName_Controller =
  //     SearchProductByName_Controller();
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

  FocusNode _searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    //searchcategories_controller.Search_Categories();
    // _searchProductByName_Controller.Search_Product_By_Name_ApiHit();
    _loadSearchHistory();
    _searchFocusNode = FocusNode();
  }

  void _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      searchHistory = prefs.getStringList('searchHistory')?.toSet() ?? {};
    });
  }

  void _saveSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('searchHistory', searchHistory.toList());
  }

  TextEditingController _searchController = TextEditingController();
  Set<String> searchHistory = {};

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    //   if (
    //       //searchcategories_controller.rxRequestStatus.value == Status.LOADING &&
    //       _searchProductByName_Controller.rxRequestStatus.value ==
    //           Status.LOADING) {
    //     return const Scaffold(
    //       body: Center(child: CircularProgressIndicator()),
    //     );
    //   } else {
    //     return
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "يبحث",
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
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                    child: Stack(children: [
                  CustomSearchView_arabic(
                    controller: _searchController,
                    hintText: 'يبحث',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                    readOnly: false,
                    enableTap: false,
                    onFieldSubmitted: (query) => _handleSearch(query),
                    focusNode: _searchFocusNode,
                  ),
                  Positioned(
                      top: 20,
                      right: 240,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: AlertDialog(
                                      backgroundColor: Color(0xFFFF8300),
                                      title: Text(
                                        "يختار",
                                        style: TextStyle(
                                            fontFamily: 'Almarai',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      content: Row(
                                        children: [
                                          GestureDetector(
                                            child: Text(
                                              "آلة تصوير",
                                              style: TextStyle(
                                                  fontFamily: 'Almarai',
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            onTap: () {
                                              openCameraa(ImageSource.camera);
                                            },
                                          ),
                                          SizedBox(width: 80),
                                          GestureDetector(
                                            child: Text("صالة عرض",
                                                style: TextStyle(
                                                    fontFamily: 'Almarai',
                                                    color: Colors.white,
                                                    fontSize: 16)),
                                            onTap: () {
                                              openCameraa(ImageSource.gallery);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Image.asset('assets/images/greycamera.png'))),
                ])),
              ),
              SizedBox(height: Get.height * 0.02),
              _buildSearchHistory(),
              SizedBox(height: 29.v),
//                   _searchProductByName_Controller.userList.value.products ==
//                               null ||
//                           _searchProductByName_Controller
//                               .userList.value.products!.isEmpty
//                       ? Center(
//                           child: Text(
//                               'Error: ${_searchProductByName_Controller.error.value}'))
//                       : Container(
//                           height: Get.height * .2,
//                           // height: Get.height *.4,
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,

//                             //  gridDelegate:
// //                                         SliverGridDelegateWithFixedCrossAxisCount(
// //                                       crossAxisCount: 3,
// //                                       crossAxisSpacing: 8.0,
// // //mainAxisSpacing: 8.0,
// //                                       mainAxisExtent: Get.height*.2
// //                                     ),
//                             itemCount: _searchProductByName_Controller
//                                     .userList.value.products?.length ??
//                                 0,
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(38.0),
//                                     child: Image.network(
//                                       "${_searchProductByName_Controller.userList.value.products?[index].imageUrl.toString()}",
//                                       height: 68,
//                                       width: 68,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   SizedBox(height: 5.v),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "${_searchProductByName_Controller.userList.value.products?[index].aTitle.toString()}",
//                                       style: TextStyle(
//                                         color: Color(
//                                           0xFF272727,
//                                         ),
//                                         fontSize: 8,
//                                         fontFamily: 'Almarai',
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                       maxLines: 3,
//                                       // theme.textTheme.bodySmall,
//                                       // overflow: TextOverflow.ellipsis,
//                                       // maxLines: 1,
//                                     ),
//                                   )
//                                 ],
//                               );
//                             },
//                           )),

              // searchcategories_controller.userList.value.searchMainCat == null ||
              // searchcategories_controller.userList.value.searchMainCat!.isEmpty
              //                     ? Center(child:  Text('Error: ${searchcategories_controller.error.value}'))
              //                     :  Container(
              //                       height: Get.height*.2,
              //                       child: GridView.builder(
              // shrinkWrap: true,
              // scrollDirection: Axis.vertical,
              // gridDelegate:
              //     SliverGridDelegateWithFixedCrossAxisCount(

              //   crossAxisCount: 5,
              //   // crossAxisSpacing: 8.0,
              //   // mainAxisSpacing: 8.0,
              //   mainAxisExtent: Get.height*.2
              // ),
              // itemCount:searchcategories_controller.userList.value.searchMainCat?.length ?? 0,
              // itemBuilder: (context, index) {
              //                           return Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             ClipRRect(
              //                               borderRadius:
              //                                   BorderRadius.circular(38.0),
              //                               child: Image.network(
              //                                 "${searchcategories_controller.userList.value.searchMainCat?[index].imageUrl.toString()}",
              //                                 height: 68,
              //                                 width: 68,
              //                                 fit: BoxFit.cover,
              //                               ),
              //                             ),
              //                             SizedBox(height: 5.v),
              //                             Align(
              //                               alignment: Alignment.center,
              //                               child: Text(
              //                                 "${searchcategories_controller.userList.value.searchMainCat?[index].aCategoryName.toString()}",
              //                                 style:
              //                                 TextStyle(fontSize: 8)
              //                                 // theme.textTheme.bodySmall,
              //                                 // overflow: TextOverflow.ellipsis,
              //                                 // maxLines: 1,
              //                               ),
              //                             )
              //                           ],
              //                         );
              //                         Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             // Container(
              //                             //     height: 50,
              //                             //     width: 50,
              //                             //     child: Image.asset(
              //                             //       "assets/images/img_mask_group_60x56.png",
              //                             //       fit: BoxFit.cover,
              //                             //     )),
              //                             GestureDetector(
              //                               onTap: (){
              //    _navigateToNewPage(context, index);
              // },
              //                               child:
              //                                CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/img_mask_group_60x56.png'),)),
              //                             SizedBox(height: 4.v),
              //                             Center(
              //                               child: Text(
              //                                 "للنساء\nالبلوزات\n وقمصان",
              //                                 style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'Almarai'),
              //                               ),
              //                             )
              //                           ],
              //                         );
              //     },
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "شعبية الآن",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: 'Almarai',
                  ),
                ),
              ),
              SizedBox(height: 25.v),
              _buildVectorChipView(context),
              SizedBox(height: Get.height * .05),
            ],
          ),
        ),
      ),
    );
  }
  //   });
  // }

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        searchHistory.add(query);
        _searchController.clear(); // Clear the search field
      });
      _saveSearchHistory(); // Save the search history
      _searchFocusNode.unfocus(); // Remove focus from the search field
    }
  }

  Widget _buildVectorChipView(BuildContext context) {
    return Wrap(
      runSpacing: 10.v,
      spacing: 10.h,
      children: List<Widget>.generate(3, (index) => VectorchipviewItemWidget()),
    );
  }

  Widget _buildSearchHistory() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'بحثت مؤخرا',
                style: TextStyle(
                  fontFamily: 'Almarai',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      searchHistory.clear(); // Remove the search history entry
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: Icon(
                      Icons.delete,
                      color: Color(0xffff8300),
                    ),
                  ))
            ],
          ),
          SizedBox(height: Get.height * 0.04),
//          GridView.builder(
//   shrinkWrap: true,
//   physics: NeverScrollableScrollPhysics(),
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     mainAxisExtent: Get.height*.05,

//     crossAxisCount: 2, // Set the number of columns as per your design
//     crossAxisSpacing: 8.0, // Set the horizontal spacing between columns
//     // mainAxisSpacing: 8.0, // Set the vertical spacing between rows
//   ),
//   itemCount: searchHistory.length,
//   itemBuilder: (context, index) {
//     return _buildSearchHistoryContainer(searchHistory.elementAt(index));
//   },
// )
          Wrap(
            runAlignment: WrapAlignment.center,
            runSpacing: 8.0,
            children: searchHistory.map((query) {
              return _buildSearchHistoryContainer(query);
            }).toList(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: GestureDetector(
          onTap: () {
            Get.offAll(arabic_TabScreen(
              index: 0,
            ));
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
      title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "يبحث",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
          )),
    );
  }

  Widget _buildSearchHistoryContainer(String query) {
    return Expanded(
      child: Container(
          height: Get.height * .05,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(28, 158, 158, 158),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                query,
                style: TextStyle(
                  fontFamily: 'Almarai',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8f959e),
                ),
              ),
            ),
          )),
    );
  }
}
