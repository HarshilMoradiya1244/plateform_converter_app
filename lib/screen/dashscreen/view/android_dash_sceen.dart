import 'package:flutter/material.dart';
import 'package:plateform_converter_app/screen/callScreen/view/call_screen_android.dart';
import 'package:plateform_converter_app/screen/chatScreen/view/chat_screen_android.dart';
import 'package:plateform_converter_app/screen/dashScreen/provider/dash_provider.dart';
import 'package:plateform_converter_app/screen/home/view/home_screen_android.dart';
import 'package:plateform_converter_app/screen/settingScreen/view/setting_screen_android.dart';
import 'package:provider/provider.dart';

import '../../../utils/theme_provider.dart';

class DashScreenAndroid extends StatefulWidget {
  const DashScreenAndroid({super.key});

  @override
  State<DashScreenAndroid> createState() => _DashScreenAndroidState();
}

class _DashScreenAndroidState extends State<DashScreenAndroid> {
  DashProvider? providerr;
  DashProvider? providerw;

  List<Widget> screen = [
    const HomeScreenAndroid(),
    const ChatScreenAndroid(),
    const CallScreenAndroid(),
    const SettingScreenAndroid(),
  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashProvider>();
    providerw = context.watch<DashProvider>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Plateform Converter"),
          actions: [
            Consumer(
              builder: (BuildContext context, value, Widget? child) {
                return Switch(
                  value: context.read<ThemeProvider>().changeUI,
                  onChanged: (value) {
                    context.read<ThemeProvider>().changeAppUi(value);
                  },
                );
              },
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person_add_alt),
              ),
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Call",
              ),
              Tab(
                text: "Setting",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: screen,
        ),
      ),
    );
  }
}
