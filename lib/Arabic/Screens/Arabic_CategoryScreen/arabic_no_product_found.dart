import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/theme/theme_helper.dart';

class NoProductFound02 extends StatefulWidget {
  const NoProductFound02({Key? key}) : super(key: key);

  @override
  State<NoProductFound02> createState() => _NoProductFound02State();
}

class _NoProductFound02State extends State<NoProductFound02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:  Padding(
        padding: const EdgeInsets.fromLTRB(0,150,0,150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          Container(
            child: Center(child: Image.asset('assets/images/no_product.png',color: Color(0xffff8300), width: Get.width*.7,)),
          ),
          Center(child:   Text("No Product Found ",style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey), ),)
        ],
      ),
    
      ),
    ));
    
    
    
    
    
    
    
    
    
    
    
  }
}