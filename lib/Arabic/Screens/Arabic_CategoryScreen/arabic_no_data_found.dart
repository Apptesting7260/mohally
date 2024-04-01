import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/theme_helper.dart';

class NoProductFound extends StatefulWidget {
  const NoProductFound({Key? key}) : super(key: key);

  @override
  State<NoProductFound> createState() => _NoProductFoundState();
}

class _NoProductFoundState extends State<NoProductFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                width: Get.width * .07,
                height: Get.height * .03,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(90, 158, 158, 158)),
                child: Icon(
                  Icons.arrow_back,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                    child: Image.asset(
                  'assets/images/no_product.png',
                  color: Color(0xffff8300),
                  width: 200,
                  height: 200,
                )),
              ),
              Center(
                child: Text(
                  "Oops! No Product Found",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
