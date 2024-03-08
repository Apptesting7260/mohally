import 'package:flutter/material.dart';
import 'package:mohally/theme/theme_helper.dart';

class NoProductFound extends StatefulWidget {
  const NoProductFound({Key? key}) : super(key: key);

  @override
  State<NoProductFound> createState() => _NoProductFoundState();
}

class _NoProductFoundState extends State<NoProductFound> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 150, 0, 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(
                child: Image.asset(
              'assets/images/no_product.png',
              color: Color(0xffff8300),
            )),
          ),
          Center(
            child: Text(
              "No Product Categories Found",
              style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
