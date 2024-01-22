import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  late Locale currentLocale;

  // Load saved language from SharedPreferences
  loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String selectedLanguage = prefs.getString('selectedLanguage') ?? "en";
    changeLanguage(selectedLanguage);
  }

  // Change the app language and save it to SharedPreferences
  changeLanguage(String languageCode) async {
    currentLocale = Locale(languageCode);
    Get.updateLocale(currentLocale);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedLanguage', languageCode);
    update();
  }
}
