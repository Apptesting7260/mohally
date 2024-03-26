import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabicSearchController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/content_of_all.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/search_screen/widgets/vectorchipview_item_widget.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEcameraview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEheadphonesView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicElaptopview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEphoneSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicElectronicsSingleView/arabicEwearableView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBootsSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMBottomSingleview.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMFormalSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMJacketSingleView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMShirtSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicMensSingleView/arabicMactivewearView.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicWomensSingleViewScreens/arabicWomenDressSingleViewScreen.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/arabicWomensSingleViewScreens/arabicWomensTopsSingleViewScreen.dart';

class SearchHistoryArabic extends StatefulWidget {
  const SearchHistoryArabic({Key? key}) : super(key: key);

  @override
  State<SearchHistoryArabic> createState() => _SearchHistoryArabicState();
}

class _SearchHistoryArabicState extends State<SearchHistoryArabic> {
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
  ArabicSearchController _searchcontroller = ArabicSearchController();
  @override
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
  String _typedText = '';

  void _onKeyPressed(String keyPressed) {
    setState(() {
      _typedText += keyPressed;
    });
  }

  TextEditingController textEditingController = TextEditingController();
  bool showKeyboard = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    _searchcontroller.searchProducts("");
    // listen to focus changes
    focusNode.addListener(() {
      if (focusNode.hasFocus == false && showKeyboard == false) {
        setState(() {
          showKeyboard = false;
        });
      }
    });
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // title: GestureDetector(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Container(
          //       width: Get.width * .07,
          //       height: Get.height * .03,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: const Color.fromARGB(90, 158, 158, 158)),
          //       child: Center(
          //         child: Icon(
          //           Icons.arrow_back,
          //         ),
          //       )),
          // ),
          leading: GestureDetector(
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                focusNode: focusNode,
                keyboardType: TextInputType.multiline,
                controller: textEditingController,
                textDirection: TextDirection.rtl,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "يبحث",
                  hintStyle: CustomTextStyles.bodyLargeOnError_1,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 15),

                    //  Icon(
                    //   Icons.search,
                    //   color: Colors.grey.shade600,
                    // ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 50.v,
                  ),
                  suffixIcon:
                      //  Image.asset('assets/images/greycamera.png'),
                      Container(
                    padding: EdgeInsets.all(15.h),
                    margin: EdgeInsets.only(
                      right: 30.h,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(
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
            ),
          ),
        ),
        body: Center(
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
                  Center(
                    child: Text(
                      "عفوا! تواجه خوادمنا مشكلة في الاتصال.\nيرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى",
                      style: theme.textTheme.headlineMedium?.copyWith(
                          color: Color.fromARGB(73, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: 'Almarai'),
                      textAlign: TextAlign.center,
                    ),
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
                    child: Text(
                      'أُووبس! لم نتمكن من العثور على أي منتجات\nتطابق معايير بحثك.',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Almarai',
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
                      title: Text(product.aTitle),
                      subtitle: Text('Price: ${product.price.toString()}'),
                      leading: GestureDetector(
                        child: Image.network(product.imageUrl),
                        onTap: () {
                          arabicMainCatId = _searchcontroller
                              .products.value.products?[index].mainCategoryId!
                              .toString();
                          String? productId = _searchcontroller
                              .products.value.products?[index].id!
                              .toString();

                          setState(() {
                            MainCatId = arabicMainCatId;
                            productid = productId;
                          });
                          print("$Englishproductid==");
                          if (arabicMainCatId == "153") {
                            Get.to(ArabicMensSingleShirtViewScreen());
                            print(
                                "$arabicMainCatId===========Mens Appearl main category id ");
                          } else if (arabicMainCatId == "154") {
                            Get.to(ArabicMensBottomSingleShViewScreen());
                          } else if (arabicMainCatId == "155") {
                            Get.to(ArabicMensJacketSingleShViewScreen());
                          } else if (arabicMainCatId == "156") {
                            Get.to(ArabicMensActivewearSingleShViewScreen());
                          } else if (arabicMainCatId == "157") {
                            Get.to(ArabicMensFormalsSingleShViewScreen());
                          } else if (arabicMainCatId == "174") {
                            Get.to(ArabicMensShoesSingleShViewScreen());
                          } else if (arabicMainCatId == "166") {
                            Get.to(ArabicElectronicsPhoneSingleShViewScreen());
                          } else if (arabicMainCatId == "170") {
                            Get.to(
                                ArabicElectronicsLaptopsSingleShViewScreen());
                          } else if (arabicMainCatId == "171") {
                            Get.to(
                                ArabicElectronicsHeadphonesSingleShViewScreen());
                          } else if (arabicMainCatId == "172") {
                            Get.to(ArabicElectronicsCameraSingleShViewScreen());
                          } else if (arabicMainCatId == "173") {
                            Get.to(
                                ArabicElectronicswearableSingleShViewScreen());
                          } else if (arabicMainCatId == "176") {
                            Get.to(ArabicWomensDressSingleShViewScreen());
                          } else if (arabicMainCatId == "177") {
                            Get.to(ArabicWomensTopSingleShViewScreen());
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
        bottomNavigationBar: Visibility(
          visible: showKeyboard,
          child: Container(
            color: Colors.white,
            child: VirtualKeyboard(
              fontSize: 20,
              textColor: Colors.grey,
              textController: textEditingController,
              type: VirtualKeyboardType.Alphanumeric,
              defaultLayouts: const [VirtualKeyboardDefaultLayouts.Arabic],
            ),
          ),
        ),
      ),
    );
  }

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
