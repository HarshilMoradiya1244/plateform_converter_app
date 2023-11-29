
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {

  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();



  void changeDate(DateTime? d1){
    date = d1;
    notifyListeners();
  }

  void changeTime(TimeOfDay? d2) {
    time = d2;
    notifyListeners();
  }

}