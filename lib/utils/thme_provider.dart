import 'package:flutter/cupertino.dart';
import 'package:plateform_converter_app/utils/share_helper.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight = true;

  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}
