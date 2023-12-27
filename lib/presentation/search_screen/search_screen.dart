import '../search_screen/widgets/menjumperschipview_item_widget.dart';
import '../search_screen/widgets/vectorchipview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_search_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key})
      : super(
          key: key,
        );

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
                "Search",
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 26.v),
              CustomSearchView(
                controller: searchController,
                hintText: "Search Category",
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
