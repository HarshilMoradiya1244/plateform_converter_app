import 'package:flutter/cupertino.dart';
import 'package:plateform_converter_app/screen/dashscreen/view/android_dash_sceen.dart';
import 'package:plateform_converter_app/screen/dashscreen/view/dash_screen_ios.dart';

Map<String , WidgetBuilder > screen_routes_android = {
  '/':(context) => const DashScreenAndroid(),
};

Map<String , WidgetBuilder > screen_routes_ios = {
  '/':(context) => const DashScreenIos(),
};