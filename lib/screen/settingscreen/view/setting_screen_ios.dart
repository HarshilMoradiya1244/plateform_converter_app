import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plateform_converter_app/screen/settingScreen/provider/setting_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/share_helper.dart';
import '../../../utils/theme_provider.dart';
import '../../home/provider/contact_provider.dart';

class SettingScreenIos extends StatefulWidget {
  const SettingScreenIos({super.key});

  @override
  State<SettingScreenIos> createState() => _SettingScreenIosState();
}

class _SettingScreenIosState extends State<SettingScreenIos> {
  SettingProvider? providerw;
  SettingProvider? providerr;
  TextEditingController txtName = TextEditingController ();
  TextEditingController txtBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerr = context.read<SettingProvider>();
    providerw = context.watch<SettingProvider>();
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(CupertinoIcons.person),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Update Profile Data",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: providerr!.isVisible!,
                  onChanged: (value) {
                    providerw!.isVisible = value;
                    providerr!.profile();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            (providerr!.isVisible == true)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Consumer<ContactProvider>( builder: (context, value, child) {
                            return
                              CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.blue,
                                backgroundImage: value.path != null
                                    ? FileImage(File(value.path!))
                                    : null,
                              );
                          },),
                          GestureDetector(
                              onTap: () async {
                                ImagePicker imgPiker = ImagePicker();
                                XFile? image = await imgPiker.pickImage(
                                    source: ImageSource.gallery);
                                context.read<ContactProvider>().updateImagePath(image!.path);
                              },
                              child: const Icon(Icons.camera_alt))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       CupertinoTextField.borderless(
                        controller: txtName,
                        textAlign: TextAlign.center,
                        placeholder: "Enter your name..",
                      ),
                       CupertinoTextField.borderless(
                         controller: txtBio,
                        textAlign: TextAlign.center,
                        placeholder: "Enter your bio..",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            child: const Text(
                              "Save",
                              style: TextStyle(color: CupertinoColors.black),
                            ),
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            child: const Text(
                              "Clear",
                              style: TextStyle(color: CupertinoColors.black),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  )
                : Container(
                    height: 10,
                  ),
            Container(
              height: 2,
              width: MediaQuery.sizeOf(context).width,
              color: CupertinoColors.inactiveGray,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(CupertinoIcons.sun_max),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Theme",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "change Theme",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => CupertinoSwitch(
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
    );
  }
}