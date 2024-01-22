import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/wome_featured_single_page_arabic.dart';
import 'package:mohally/Arabic/widgets/arabic_customSearchView.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_title.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';


class CategoryScreen_arabic extends StatefulWidget {
  const CategoryScreen_arabic({Key? key}) : super(key: key);

  @override
  State<CategoryScreen_arabic> createState() => _CategoryScreen_arabicState();
}

class _CategoryScreen_arabicState extends State<CategoryScreen_arabic> {
   List<String> featured_text = [
  'بيت\n &مطبخ',
 'للنسا\nmءملابس',
'للنساء\nملابس منحنى',
 'للنسا\nmءملابس',
'للنساء\nملابس منحنى',
 'للنسا\nmءملابس',
'للنساء\nملابس منحنى',
 'للنسا\nmءملابس',
'للنساء\nملابس منحنى',
 'للنسا\nmءملابس',
'للنساء\nملابس منحنى',
 'للنسا\nmءملابس',
'للنساء\nملابس منحنى',
];
  @override
  void initState() {
    super.initState();
   
        setInitialLocale();
  }

   void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }
  TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;
  PageController pagecontroller = PageController();
  int pagesCount = 10;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
   

    // mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Center(
              child: Stack(
              children: [
              CustomSearchView_arabic(
               hintText: 'يبحث',
               hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                readOnly: true,
                enableTap: true,
              ),
                 Positioned(
                  top: 20,
                  right: 240,
                  child: Image.asset('assets/images/greycamera.png')),
                
                ])),
            Gap(15),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "متميز",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "تسوق حسب الاقسام",
                      style: theme.textTheme.titleLarge?.copyWith(fontFamily: 'Almarai'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: height * .7,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: ListView.separated(
                        itemCount: pagesCount,
                        itemBuilder: (context, int index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        separatorBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                pagecontroller.jumpToPage(index);
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: (selectedIndex == index) ? 50 : 0,
                                    color: Color(0xffFF8300),
                                  ),
                                  Expanded(
                                      child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: 80,
                                    alignment: Alignment.center,
                                    color: (selectedIndex == index)
                                        ? Colors.orange.shade200
                                            .withOpacity(0.2)
                                        : Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 5),
                                      child: Text( featured_text[index], style: TextStyle(fontFamily: 'Almarai'),),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: pagecontroller,
                          children: [
                            for (var i = 0; i <= pagesCount; i++)
                              Container(
                                color: Colors.white,
                                child: Center(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                      mainAxisExtent: Get.height*.2
                                    ),
                                    itemCount: 18,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Container(
                                          //     height: 50,
                                          //     width: 50,
                                          //     child: Image.asset(
                                          //       "assets/images/img_mask_group_60x56.png",
                                          //       fit: BoxFit.cover,
                                          //     )),
                                          GestureDetector(
                                            onTap: (){
                 _navigateToNewPage(context, index);
              },
                                            child: CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/img_mask_group_60x56.png'),)),
                                          SizedBox(height: 4.v),
                                          Center(
                                            child: Text(
                                              "للنساء\nالبلوزات\n وقمصان",
                                              style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'Almarai'),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  // Text("page $i")
                                ),
                              )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )

            // VerticalTabs(
            //   // selectedTab: _selectedTabIndex,
            //   tabsWidth: 150,
            //   tabs: <Tab>[
            //     Tab(child: Text('1')),
            //     Tab(child: Text('2')),
            //     Tab(child: Text('3')),
            //     Tab(child: Text('4')),
            //     Tab(child: Text('5')),
            //   ],
            //   contents: <Widget>[
            //     buildGridView('1'),
            //     buildGridView('2'),
            //     buildGridView('3'),
            //     buildGridView('4'),
            //     buildGridView('5'),
            //   ],
            //   // onTabChange: (index) {
            //   //   setState(() {
            //   //     _selectedTabIndex = index;
            //   //   });
            //   // },
            // ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      
      title: AppbarTitle(
        text: "فئات",
        margin: EdgeInsets.only(top: 10, right: 20),
      ),
    );
  }

  Widget buildGridView(String category) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 70,
                width: 70,
                child: Image.asset(
                  "assets/images/img_mask_group_60x56.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 2.v),
            Center(
                child: Text(
              "للنساءملابس\n منحنى",
              style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'Almarai'),
            ))
          ],
        );
      },
    );
  }
  void _navigateToNewPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => featured_women_clothing_araic()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => featured_women_clothing_araic()),
      );
      break;
      case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => featured_women_clothing_araic()),
      );
      break;
      case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => featured_women_clothing_araic()),
      );
  }
}
}