import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/const/colors.dart';
import 'core/routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {

  const MainApp({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         getPages: Pages.getPages,
         theme: ThemeData(
           scaffoldBackgroundColor: MyColors.primary,
           appBarTheme: const AppBarTheme(
             backgroundColor: MyColors.primary,
             elevation: 0
           )
         ),
         initialRoute: Routes.START,
       );
  }
}
