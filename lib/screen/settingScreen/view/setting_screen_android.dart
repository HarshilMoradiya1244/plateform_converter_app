import 'package:flutter/material.dart';
import 'package:plateform_converter_app/screen/settingScreen/provider/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/share_helper.dart';
import '../../../utils/thme_provider.dart';

class SettingScreenAndroid extends StatefulWidget {
  const SettingScreenAndroid({super.key});

  @override
  State<SettingScreenAndroid> createState() => _SettingScreenAndroidState();
}

class _SettingScreenAndroidState extends State<SettingScreenAndroid> {
  bool isLight = true;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_2),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Update Profile Data "),
                      ],
                    ),
                    const Spacer(),
                    Consumer<SettingProvider>(
                      builder: (context, value, child) {
                        return Switch(
                          value: isVisible,
                          onChanged: (value1) {
                            ShareHelper shr = ShareHelper();
                            shr.profileOn(value1);
                            value.profile();
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 60,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                  ),
                                ),
                                const TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    label: Text("Enter Your Name"),
                                  ),
                                ),
                                const TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    label: Text("Enter Your Bio"),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text("Save")),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text("Clear")),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const Icon(Icons.sunny),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Theme",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Change Theme"),
                      ],
                    ),
                    const Spacer(),
                    Consumer<ThemeProvider>(
                      builder: (context, value, child) => Switch(
                        value: value.isLight,
                        onChanged: (value1) {
                          ShareHelper shr = ShareHelper();
                          shr.setTheme(value1);
                          value.changeThem();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
