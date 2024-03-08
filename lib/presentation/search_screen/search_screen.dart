import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../search_screen/widgets/vectorchipview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_search_view.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //SearchProductByName_Controller _searchProductByName_Controller =SearchProductByName_Controller();

  FocusNode _searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
    // _searchProductByName_Controller.Search_Product_By_Name_ApiHit();
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

  Set<String> searchHistory = {};
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

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body:
                //   Obx((){
                //       if (
                //   //searchcategories_controller.rxRequestStatus.value == Status.LOADING &&
                //   _searchProductByName_Controller.rxRequestStatus.value==Status.LOADING) {
                //   return const Scaffold(
                //     body: Center(child: CircularProgressIndicator()),
                //   );
                // }  else {
                //    return
                Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 25.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CustomSearchView(
                          controller: searchController,
                          readOnly: false,
                          enableTap: false,
                          hintText: "Search Category",
                          onFieldSubmitted: (query) => _handleSearch(query),
                          focusNode: _searchFocusNode,
                        ),
                        Positioned(
                            top: 20,
                            left: 240,
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Color(0xFFFF8300),
                                          title: Text(
                                            "Choose",
                                            style: TextStyle(
                                                fontFamily: 'League Spartan',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          content: Row(
                                            children: [
                                              GestureDetector(
                                                child: Text(
                                                  "Camera",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'League Spartan',
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                onTap: () {
                                                  openCameraa(
                                                      ImageSource.camera);
                                                },
                                              ),
                                              SizedBox(width: 80),
                                              GestureDetector(
                                                child: Text("Gallery",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'League Spartan',
                                                        color: Colors.white,
                                                        fontSize: 18)),
                                                onTap: () {
                                                  openCameraa(
                                                      ImageSource.gallery);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Image.asset(
                                    'assets/images/greycamera.png'))),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.v),
                  _buildRecentSearchedRow(context),
                  SizedBox(height: 29.v),
                  Text(
                    "Popular right now",
                    style: CustomTextStyles.titleMedium16,
                  ),

//                   _searchProductByName_Controller.userList.value.products == null ||
//             _searchProductByName_Controller.userList.value.products!.isEmpty
//                                 ? Center(child:  Text('Error: ${_searchProductByName_Controller.error.value}'))
//                                 :  Container(
//                                    height: Get.height * .2,
//  // height: Get.height *.4,
//   child: ListView.builder(
//                                     shrinkWrap: true,
//                                     scrollDirection: Axis.horizontal,
//                                     itemCount:_searchProductByName_Controller.userList.value.products?.length ?? 0,
//                                     itemBuilder: (context, index) {
//       return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(38.0),
//                                               child: Image.network(
//                                                 "${_searchProductByName_Controller.userList.value.products?[index].imageUrl.toString()}",
//                                                 height: 68,
//                                                 width: 68,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                             SizedBox(height: 5.v),
//                                             Align(
//                                               alignment: Alignment.center,
//                                               child: Text(
//                                                 "${_searchProductByName_Controller.userList.value.products?[index].aTitle.toString()}",
//                                                 style:
//                                                 TextStyle(color: Color(0xFF272727, ),
// fontSize: 8,
// fontFamily: 'Almarai',

// fontWeight: FontWeight.w500,), maxLines: 3,
//                                                 // theme.textTheme.bodySmall,
//                                                 // overflow: TextOverflow.ellipsis,
//                                                 // maxLines: 1,
//                                               ),
//                                             )
//                                           ],
//                                         );
//                                       },
//   )),
                  _buildVectorChipView(context),
                  SizedBox(height: 5.v),
                ],
              ),
            )));
  }

  //     ),
  //   ),
  // );
  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        searchHistory.add(query);
        searchController.clear(); // Clear the search field
      });
      _saveSearchHistory(); // Save the search history
      _searchFocusNode.unfocus(); // Remove focus from the search field
    }
  }

  /// Section Widget
  Widget _buildRecentSearchedRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "recent searched",
                  style: CustomTextStyles.titleMedium16,
                ),
              ),
              CustomImageView(
                onTap: () {
                  setState(() {
                    searchHistory.clear(); // Remove the search history entry
                  });
                },
                imagePath: ImageConstant.imgDelete1,
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.04),
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
        text: "Search",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildVectorChipView(BuildContext context) {
    return Wrap(
      runSpacing: 10.v,
      spacing: 10.h,
      children: List<Widget>.generate(3, (index) => VectorchipviewItemWidget()),
    );
  }
}
