import 'package:flutter/material.dart';
import 'package:plateform_converter_app/screen/dashScreen/android_dash_sceen.dart';
import 'package:plateform_converter_app/screen/dashScreen/provider/dash_provider.dart';
import 'package:plateform_converter_app/screen/home/provider/contact_provider.dart';
import 'package:plateform_converter_app/utils/app_theme.dart';
import 'package:plateform_converter_app/utils/thme_provider.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => ContactProvider(),
      ),
        ChangeNotifierProvider(
        create: (context) => DashProvider(),
      ),
        ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ],
      child: Consumer<ThemeProvider>(builder: (context, value, child) {
        value.changeThem();
        return MaterialApp(
            theme: value.isLight ? lightTheme : darkTheme,
            debugShowCheckedModeBanner: false,
            routes: {
              '/':(context) => const DashScreenAndroid()
            },
          );
      },
      ),
    ),
  );
}