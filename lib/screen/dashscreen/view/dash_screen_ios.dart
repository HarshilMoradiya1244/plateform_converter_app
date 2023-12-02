import 'package:flutter/cupertino.dart';
import 'package:plateform_converter_app/screen/callscreen/view/call_screen_ios.dart';
import 'package:plateform_converter_app/screen/chatscreen/view/chat_screen_ios.dart';
import 'package:plateform_converter_app/screen/dashScreen/provider/dash_provider.dart';
import 'package:plateform_converter_app/screen/home/view/home_screen_ios.dart';
import 'package:plateform_converter_app/screen/settingscreen/view/setting_screen_ios.dart';
import 'package:provider/provider.dart';

import '../../../utils/theme_provider.dart';

class DashScreenIos extends StatefulWidget {
  const DashScreenIos({super.key});

  @override
  State<DashScreenIos> createState() => _DashScreenIosState();
}

class _DashScreenIosState extends State<DashScreenIos> {
  DashProvider? providerw;
  DashProvider? providerr;

  List<Widget> screens = [
    const HomeScreenIos(),
    const ChatScreenIos(),
    const CallScreenIos(),
    const SettingScreenIos(),
  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashProvider>();
    providerw = context.watch<DashProvider>();
    return CupertinoPageScaffold(
      navigationBar:  CupertinoNavigationBar(
        middle: const Text(
          "Platform Converter",
        ),
        trailing:  CupertinoSwitch(
          value: context.read<ThemeProvider>().changeUI,
          onChanged: (value) {
            context.read<ThemeProvider>().changeAppUi(value);
          },
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: providerr!.stepIndex, onTap: (value) {
          int i = value;
          providerr!.changeStep(i);
        },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Contact',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return screens[
              providerw!.stepIndex
              ];
            },
          );
        },),
    );
  }
}
