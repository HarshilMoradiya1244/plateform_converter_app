import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashProvider with ChangeNotifier {
  int stepIndex = 0;
  bool isChange = false;

  void changeStep(i) {
    stepIndex = i;
    notifyListeners();
  }
  void changeUI(value){
    isChange = value;
    notifyListeners();
  }

}