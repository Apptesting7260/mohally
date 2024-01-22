import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_category.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_HomeTab.dart';
import 'package:mohally/Arabic/Screens/Arabic_cart/arabic_cart.dart';
import 'package:mohally/Arabic/Screens/Arabic_whishlishScreen/arabic_whishlish.dart';
import 'package:mohally/Arabic/Screens/Myprofile/my_profile_arabic.dart';
import 'package:mohally/Arabic/widgets/BottomBar/arabic_custom_bottom_bar.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
class arabic_TabScreen extends StatefulWidget {
  final int index;

  const arabic_TabScreen({Key? key, required this.index}) : super(key: key);

  @override
  _arabic_TabScreenState createState() => _arabic_TabScreenState();
}

class _arabic_TabScreenState extends State<arabic_TabScreen> {
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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: drawerKey,
        body: Directionality(
           textDirection: TextDirection.rtl,
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) => pageChanged(index),
                children: [
                  arabic_HomeScreen(),
                  CategoryScreen_arabic(),
                  WishlistPage_arabic(),
                  CartPage_arabic(),
                  MyProfilePage_arabic(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar_arabic(
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