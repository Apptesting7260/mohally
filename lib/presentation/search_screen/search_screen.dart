import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/view_models/controller/EnglishSearchController/EnglishsearchController.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../search_screen/widgets/vectorchipview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  EnglishSearchController _searchcontroller = EnglishSearchController();

  FocusNode _searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    // _loadSearchHistory();
    _searchcontroller.searchProducts("");
    // _searchFocusNode = FocusNode();
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

  // TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  width: Get.width * .06,
                  height: Get.height * .02,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(90, 158, 158, 158)),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  )),
            ),
          ),
          title: SizedBox(
            width: Get.width * .9,
            child: TextFormField(
              style: CustomTextStyles.bodyLargeOnError_1,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: CustomTextStyles.bodyLargeOnError_1,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(
                    15.h,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 50.v,
                ),
                suffixIcon: Container(
                  padding: EdgeInsets.all(15.h),
                  margin: EdgeInsets.only(
                    left: 30.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(
                        55.h,
                      ),
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgSearchWhiteA70002,
                    height: 30.adaptSize,
                    width: 20.adaptSize,
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 60.v,
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(
                  left: 16.h,
                  top: 17.v,
                  bottom: 17.v,
                ),
                fillColor: appTheme.gray100,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide(
                    color: appTheme.gray300,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide(
                    color: appTheme.gray300,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide(
                    color: appTheme.gray300,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) {
                _searchcontroller.searchProducts(value);
              },
            ),
          )),
      body: SafeArea(
        child: Obx(() {
          if (_searchcontroller.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_searchcontroller.error.value.isNotEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/error2.png',
                ),
                Text(
                  "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
                  style: theme.textTheme.headlineMedium?.copyWith(
                      color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
                ),
              ],
            ));
          } else if (_searchcontroller.products.value.products!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nosearch.png',
                  height: Get.height * .1,
                  width: Get.width * .3,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Text(
                      'Ooops! We couldn\'t find any products that match your search criteria.',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Almarai',
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: _searchcontroller.products.value.products!.length,
                itemBuilder: (context, index) {
                  final product =
                      _searchcontroller.products.value.products![index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text('Price: ${product.price.toString()}'),
                    leading: GestureDetector(
                      child: Image.network(product.imageUrl),
                      onTap: () {
                        mainCatId = _searchcontroller
                            .products.value.products?[index].mainCategoryId!
                            .toString();
                        String? productId = _searchcontroller
                            .products.value.products?[index].id!
                            .toString();

                        setState(() {
                          Englishproductid = productId;
                          EnglishMainCatId = mainCatId;
                        });
                        print("$Englishproductid==");
                        if (mainCatId == "153") {
                          Get.to(SingleProductView());
                          print(
                              "$mainCatId===========Mens Appearl main category id ");
                        } else if (mainCatId == "154") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "155") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "156") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "157") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "174") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "166") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "170") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "171") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "172") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "173") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "176") {
                          Get.to(SingleProductView());
                        } else if (mainCatId == "177") {
                          Get.to(SingleProductView());
                        } else {
                          print('not found ');
                        }
                      },
                    ),
                    trailing:
                        // Text(
                        //   "${_searchcontroller.products.value.products?[index].averageRating.toString()}",
                        // ),
                        CustomRatingBar(
                      ignoreGestures: true,
                      initialRating: _searchcontroller
                          .products.value.products?[index].averageRating
                          ?.toDouble(),
                    ),
                    // Add more details or customize the UI as needed
                  );
                },
              ),
            );
          }
        }),
      ),
    );
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
