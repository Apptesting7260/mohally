import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_title.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_search_view.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;
  PageController pagecontroller = PageController();
  int pagesCount = 10;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: CustomSearchView(
                controller: searchController,
                hintText: "Search",
              ),
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Featured",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Shop By Category",
                      style: theme.textTheme.titleMedium,
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
                                    height: 50,
                                    alignment: Alignment.center,
                                    color: (selectedIndex == index)
                                        ? Colors.orange.shade200
                                            .withOpacity(0.2)
                                        : Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 5),
                                      child: Text('Electronics'),
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
                                    ),
                                    itemCount: 18,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                "assets/images/img_mask_group_60x56.png",
                                                fit: BoxFit.cover,
                                              )),
                                          SizedBox(height: 4.v),
                                          Text(
                                            "Headphones",
                                            style: theme.textTheme.bodySmall,
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
        text: "Categories",
        margin: EdgeInsets.only(left: 20),
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
              "Electronics",
              style: theme.textTheme.bodySmall,
            ))
          ],
        );
      },
    );
  }
}
