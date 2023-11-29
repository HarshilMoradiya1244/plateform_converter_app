import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.person_2),
                  const SizedBox(width: 15,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Update Profile Data "),
                    ],
                  ),
                  const Spacer( ),
                  Switch(value: isLight, onChanged:(value) {},),
                ],
              ),
              Divider(),
              Row(
                children: [
                  const Icon(Icons.sunny),
                  const SizedBox(width: 15,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Theme",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Change Theme"),
                    ],
                  ),
                  const Spacer( ),
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
    );
  }
}
