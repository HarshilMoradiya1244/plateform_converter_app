import 'package:flutter/cupertino.dart';
import 'package:plateform_converter_app/utils/share_helper.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight = true;
  bool changeUI=false;


  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
  void changeAppUi(value)
  {
    changeUI=value;
    notifyListeners();
  }
}
