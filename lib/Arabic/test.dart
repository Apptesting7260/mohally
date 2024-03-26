import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryElectronics.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryMensScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_subcategoryWomensCategory.dart';

class ArabicNavigationController {
  static Widget getSubcategoryScreen(String categoryId) {
    if (categoryId == "133") {
      return arabic_subcategory_MensScreen();
    } else if (categoryId == "134") {
      return arabic_subcategory_ElectronicsScreen();
    } else if (categoryId == "175") {
      return arabic_subcategory_womensCategory();
    } else {
      // Handle other cases if needed
      return Container(); // Return a default screen or handle the error case
    }
  }
}
