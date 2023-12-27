import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class ListwidgetItemWidget extends StatelessWidget {
  const ListwidgetItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 70.h,
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 8.v,
          ),
          decoration: AppDecoration.fillGray10003.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder15,
          ),
          child: Text(
            "S(36)",
            style: theme.textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
