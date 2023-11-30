import 'package:flutter/material.dart';

import '../../../utils/share_helper.dart';

class SettingProvider with ChangeNotifier {

  bool? isVisible = false;
  bool isLight = true;


  void profile()  {
   isVisible != isVisible;
    notifyListeners();
  }
  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }



}