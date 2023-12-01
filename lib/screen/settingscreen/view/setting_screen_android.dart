import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plateform_converter_app/screen/settingScreen/provider/setting_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/share_helper.dart';
import '../../../utils/theme_provider.dart';
import '../../home/provider/contact_provider.dart';

class SettingScreenAndroid extends StatefulWidget {
  const SettingScreenAndroid({super.key});

  @override
  State<SettingScreenAndroid> createState() => _SettingScreenAndroidState();
}

class _SettingScreenAndroidState extends State<SettingScreenAndroid> {
  SettingProvider? providerr;
  SettingProvider? providerw;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerr = context.read<SettingProvider>();
    providerw = context.watch<SettingProvider>();
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
                    Switch(
                      value: providerr!.isVisible!,
                      onChanged: (value) {
                        providerw!.isVisible = value;
                        providerr!.profile();
                      },
                    )
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
                              Consumer<ContactProvider>(
                                builder: (context, value, child) {
                                  return CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: value.path != null
                                        ? FileImage(File(value.path!))
                                        : null,
                                  );
                                },
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    ImagePicker imgPiker = ImagePicker();
                                    XFile? image = await imgPiker.pickImage(
                                        source: ImageSource.gallery);
                                    context
                                        .read<ContactProvider>()
                                        .updateImagePath(image!.path);
                                  },
                                  child: const Icon(Icons.camera_alt))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: txtName,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                label: Text(
                                  "Enter your name..",
                                ),
                                enabledBorder: InputBorder.none),
                          ),
                          TextField(
                            controller: txtBio,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                label: Text(
                                  "Enter your Bio..",
                                ),
                                enabledBorder: InputBorder.none),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                              ),
                              TextButton(
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      )
                    : const SizedBox(),
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
