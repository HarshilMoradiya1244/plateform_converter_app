import 'package:flutter/material.dart';

import '../../../utils/share_helper.dart';

class SettingProvider with ChangeNotifier {

  bool? isVisible = true;


  void profile() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isVisible = isTheme ?? false;
    notifyListeners();
  }

}