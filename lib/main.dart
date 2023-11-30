import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plateform_converter_app/screen/dashScreen/provider/dash_provider.dart';
import 'package:plateform_converter_app/screen/dashscreen/view/android_dash_sceen.dart';
import 'package:plateform_converter_app/screen/home/provider/contact_provider.dart';
import 'package:plateform_converter_app/screen/settingScreen/provider/setting_provider.dart';
import 'package:plateform_converter_app/utils/app_routes.dart';
import 'package:plateform_converter_app/utils/app_theme.dart';
import 'package:plateform_converter_app/utils/app_theme_ios.dart';
import 'package:plateform_converter_app/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
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
        ChangeNotifierProvider(
          create: (context) => SettingProvider(),
        ),
      ],
      child: Platform.isAndroid
          ? Consumer<ThemeProvider>(builder: (context, value, child) {
              value.changeThem();
              return MaterialApp(
                  theme: value.isLight ? lightTheme : darkTheme,
                  debugShowCheckedModeBanner: false,
                  routes: screen_routes_android);
            })
          : Consumer<ThemeProvider>(
              builder: (context, value, child) {
                value.changeThem();
                return CupertinoApp(
                    theme: value.isLight ? lightThemeIos : darkThemeIos,
                    debugShowCheckedModeBanner: false,
                    routes: screen_routes_ios);
              },
            ),
    ),
  );
}
