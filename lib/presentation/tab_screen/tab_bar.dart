import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohally/presentation/cart_page/cart_page.dart';
import 'package:mohally/presentation/category_page/category_page.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/home_page_tab_container_screen/home_page_tab_container_screen.dart';
import 'package:mohally/presentation/my_profile_page/my_profile_page.dart';
import 'package:mohally/presentation/single_page_screen/single_page_screen.dart';
import 'package:mohally/presentation/wishlist_page/wishlist_page.dart';
import '../../widgets/custom_bottom_bar.dart';

class TabScreen extends StatefulWidget {
  final int index;

  const TabScreen({Key? key, required this.index}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int? bottomSelectedIndex;
  PageController? pageController;
  DateTime currentBackPressTime = DateTime.now();
  bool loading = false;
  var data;
  final drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // fetchApi();

    // TODO: implement initState
    bottomSelectedIndex = widget.index;
    pageController = PageController(initialPage: widget.index, keepPage: true);

    super.initState();
    // studentType = MySharedPreferences.localStorage?.getString(MySharedPreferences.studentType) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.white,
        //   onPressed: () {},
        //   child: Icon(
        //     Icons.add,
        //     size: 30,
        //     color: Color(0xffFE0091),
        //   ),
        // ),
        key: drawerKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => pageChanged(index),
              children: [
                HomePageTabContainerScreen(),
                CategoryScreen(),
                WishlistPage(),
                CartPage(),
                MyProfilePage(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          bottomSelectedIndex: bottomSelectedIndex!,
          bottomTapped: bottomTapped,
        ),
      ),
    );
  }

  void bottomTapped(int index) {
    setState(
      () {
        bottomSelectedIndex = index;
        pageController!.animateToPage(index,
            duration: const Duration(microseconds: 1), curve: Curves.ease);
      },
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Future<bool> _onWillPop() {
    if (bottomSelectedIndex != 1) {
      setState(
        () {
          pageController!.jumpTo(0);
        },
      );
      return Future.value(false);
    } else if (bottomSelectedIndex == 1) {
      setState(
        () {
          pageController!.jumpTo(1);
        },
      );
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(milliseconds: 500)) {
      currentBackPressTime = now;
      return Future.value(false);
    } else {
      SystemNavigator.pop();
    }
    return Future.value(true);
  }

  goAtLikeTab() {
    pageController!.animateToPage(1,
        duration: const Duration(microseconds: 1), curve: Curves.ease);
  }
}
