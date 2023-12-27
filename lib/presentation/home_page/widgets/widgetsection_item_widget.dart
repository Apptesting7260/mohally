import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class WidgetsectionItemWidget extends StatelessWidget {
  const WidgetsectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder12,
      ),
      child: Text(
        "All",
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}
