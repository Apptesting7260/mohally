import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mohally/presentation/cart_page/cart_page.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/home_page_tab_container_screen/home_page_tab_container_screen.dart';
import 'package:mohally/presentation/my_profile_page/my_profile_page.dart';
import 'package:mohally/presentation/wishlist_page/wishlist_page.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
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
  final drawerKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(MyAccountController());

  @override
  void initState() {
    bottomSelectedIndex = widget.index;
    pageController = PageController(initialPage: widget.index, keepPage: true);
    _controller.fetchMyAccountData();

    // Ensure that the initial locale is set when the screen initializes

    super.initState();
  }

  // Function to set the initial locale

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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

  Future<bool> _onWillPop() async {
    if (bottomSelectedIndex != 1) {
      setState(
        () {
          pageController!.jumpTo(0);
        },
      );
      return false;
    } else if (bottomSelectedIndex == 1) {
      setState(
        () {
          pageController!.jumpTo(1);
        },
      );
      return false;
    }
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(milliseconds: 500)) {
      currentBackPressTime = now;
      return false;
    } else {
      SystemNavigator.pop();
    }
    return true;
  }

  void goAtLikeTab() {
    pageController!.animateToPage(1,
        duration: const Duration(microseconds: 1), curve: Curves.ease);
  }
}
