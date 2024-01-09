import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/app_constant.dart';
import 'package:mohally/core/utils/messages.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/routes/app_routes.dart';
import 'package:mohally/view_models/controller/LanguageController/language_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  // final Map<String, Map<String,String>> languages;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // return GetBuilder<LocalizationController>(builder: (localizationController){
return GetMaterialApp(
      theme: theme,
      title: 'mohally',
      debugShowCheckedModeBanner: false,
      locale: Locale('en', 'US'),
      translations: Language_message(),
      fallbackLocale: Locale('en','US'),
      // AppConstants.languages[0].countryCode
      // ),
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );

  //   })
    
  }
}
