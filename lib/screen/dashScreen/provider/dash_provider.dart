import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashProvider with ChangeNotifier {
  int stepIndex = 0;

  void changeStep(i) {
    stepIndex = i;
    notifyListeners();
  }
}