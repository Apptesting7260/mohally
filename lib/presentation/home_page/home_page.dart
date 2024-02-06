import '../home_page/widgets/bagssection_item_widget.dart';
import '../home_page/widgets/homepagesection1_item_widget.dart';
import '../home_page/widgets/widgetsection_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
const HomePage({Key? key})
 : super(
key: key,
);
@override
HomePageState createState() => HomePageState();
}

 class HomePageState extends State<HomePage>
 with AutomaticKeepAliveClientMixin<HomePage> {
 @override
 bool get wantKeepAlive => true;
  @override
 Widget build(BuildContext context) {
 super.build(context);
mediaQueryData = MediaQuery.of(context);
return SafeArea(
 child: Scaffold(
body: SizedBox(
width: mediaQueryData.size.width,
child: SingleChildScrollView(
child: Column(
 children: [
Align(
alignment: Alignment.centerRight,
child: Padding(
padding: EdgeInsets.only(left: 20.h),
child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
Align(
alignment: Alignment.centerRight,
child: Text(
"Bags",
style: CustomTextStyles.titleSmallInterGray50001,),),
SizedBox(height: 37.v),
_buildBagsSection(context),
SizedBox(height: 15.v),
_buildWidgetSection(context),
SizedBox(height: 20.v),
_buildHomePageSection(context),],),),),],),),
),
 ),
);
}

/// Section Widget
Widget _buildBagsSection(BuildContext context) {
return SizedBox(
 height: 99.v,
 child: ListView.separated(
padding: EdgeInsets.only(right: 23.h),
scrollDirection: Axis.horizontal,
separatorBuilder: (
context,
index,
) {
return SizedBox(
width: 21.h,
);
},
itemCount: 4,
itemBuilder: (context, index) {
return BagssectionItemWidget();
},
 ),
);
}

/// Section Widget
Widget _buildWidgetSection(BuildContext context) {
return SizedBox(
 height: 28.v,
 child: ListView.separated(
scrollDirection: Axis.horizontal,
separatorBuilder: (
context,
index,
) {
return SizedBox(
width: 10.h,
);
},
  itemCount: 5,
  itemBuilder: (context, index) {
return WidgetsectionItemWidget();
},
 ),
);
}

/// Section Widget
Widget _buildHomePageSection(BuildContext context) {
return Padding(
 padding: EdgeInsets.only(right: 20.h),
 child: GridView.builder(
shrinkWrap: true,
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
mainAxisExtent: 265.v,
crossAxisCount: 2,
mainAxisSpacing: 15.h,
crossAxisSpacing: 15.h,
),
physics: BouncingScrollPhysics(),
itemCount: 6,
itemBuilder: (context, index) {
return Homepagesection1ItemWidget();
},
 ),
);
}
}
