
import 'package:flutter/material.dart';
import 'package:plateform_converter_app/screen/callScreen/view/call_screen_android.dart';
import 'package:plateform_converter_app/screen/chatScreen/view/chat_screen_android.dart';
import 'package:plateform_converter_app/screen/home/view/home_screen_android.dart';
import 'package:plateform_converter_app/screen/settingScreen/view/setting_screen_android.dart';

import '../modal/home_modal.dart';

class ContactProvider with ChangeNotifier {

  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();
  int dashIndex = 0;
  int? infoIndex = 0;



  void changeDate(DateTime? d1){
    date = d1;
    notifyListeners();
  }

  void changeTime(TimeOfDay? d2) {
    time = d2;
    notifyListeners();
  }

  List<HomeModal> addDataList = [];
  List<Widget> screen = [
    const HomeScreenAndroid(),
    const ChatScreenAndroid(),
    const CallScreenAndroid(),
    const SettingScreenAndroid(),
  ];


  void changeStep (i) {
    dashIndex = i;
    notifyListeners();
  }

  void addContactData(HomeModal cm) {
    addDataList.add(cm);
    notifyListeners();
  }

  void storeIndex(int index) {
    infoIndex = index;
    notifyListeners();
  }


}