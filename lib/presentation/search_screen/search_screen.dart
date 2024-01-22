import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../search_screen/widgets/menjumperschipview_item_widget.dart';
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 25.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "search",
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 26.v),
              Center(
                child: Stack(
                  children: [
                    CustomSearchView(
                      controller: searchController,
                      readOnly: false,
                      enableTap: false,
                      hintText: "Search Category",
                    ),
                    Positioned(
                  top: 20,
                  left: 240,
                  child: GestureDetector(
                    onTap: (){
                       showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Choose"),
                                  content: Row(
                                    children: [
                                      GestureDetector(
                                        child: Text("Camera"),
                                        onTap: () {
                                          openCameraa(ImageSource.camera);
                                        },
                                      ),
                                      SizedBox(width: 80),
                                      GestureDetector(
                                        child: Text("Gallery"),
                                        onTap: () {
                                          openCameraa(ImageSource.gallery);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                    },
                    child: Image.asset('assets/images/greycamera.png'))),
                  ],
                ),
              ),
              SizedBox(height: 26.v),
              _buildRecentSearchedRow(context),
              SizedBox(height: 12.v),
              _buildMenJumpersChipView(context),
              SizedBox(height: 29.v),
              _buildVectorChipView(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentSearchedRow(BuildContext context) {
    return Row(
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
          imagePath: ImageConstant.imgDelete1,
          height: 18.adaptSize,
          width: 18.adaptSize,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildMenJumpersChipView(BuildContext context) {
    return Wrap(
      runSpacing: 10.v,
      spacing: 10.h,
      children:
          List<Widget>.generate(3, (index) => MenjumperschipviewItemWidget()),
    );
  }

  /// Section Widget
  Widget _buildVectorChipView(BuildContext context) {
    return Wrap(
      runSpacing: 10.v,
      spacing: 10.h,
      children: List<Widget>.generate(3, (index) => VectorchipviewItemWidget()),
    );
  }
}
