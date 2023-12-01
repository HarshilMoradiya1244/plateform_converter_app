import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../modal/home_modal.dart';
import '../provider/contact_provider.dart';

class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({super.key});

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
  ContactProvider? providerr;
  ContactProvider? providerw;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNo = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtTime = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerr = context.read<ContactProvider>();
    providerw = context.watch<ContactProvider>();

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text(
        "Plateform Converter",
        style: TextStyle(fontSize: 20),
      )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
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
                      XFile? image =
                          await imgPiker.pickImage(source: ImageSource.gallery);
                      providerr!.updateImagePath(image!.path);
                    },
                    child: const Icon(Icons.camera_alt))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.person,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 280,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        controller: txtName,
                        cursorColor: CupertinoColors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.phone,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 280,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.phone,
                        controller: txtPhoneNo,
                        cursorColor: CupertinoColors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.text_bubble,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 280,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        controller: txtChat,
                        cursorColor: CupertinoColors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${providerr!.date?.day}/${providerr!.date?.month}/${providerr!.date?.year}"
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 200,
                              child: CupertinoDatePicker(
                                initialDateTime: providerr!.date,
                                backgroundColor: Colors.grey.shade500,
                                onDateTimeChanged: (value) {
                                  providerr!.changeDate(value);
                                },
                                minimumDate: DateTime(2001),
                                minimumYear: 2001,
                                maximumDate: DateTime(2050),
                                maximumYear: 2050,
                              ),
                            ),
                          );
                        },
                        child: const Icon(CupertinoIcons.calendar)),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 200,
                                child: CupertinoTimerPicker(
                                  mode: CupertinoTimerPickerMode.hm,
                                  backgroundColor: CupertinoColors.white,
                                  onTimerDurationChanged: (value) {
                                    List<String> l1 =
                                        value.toString().split(':');
                                    TimeOfDay? t1 = TimeOfDay(
                                        hour: int.parse(l1[0]),
                                        minute: int.parse(l1[1]));
                                    providerr!.changeTime(t1);
                                  },
                                  initialTimerDuration: Duration(
                                      hours: providerr!.time!.hour,
                                      minutes: providerr!.time!.minute),
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(CupertinoIcons.time)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Time : ${providerr!.time!.hour}:${providerr!.time!.minute}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CupertinoButton.filled(
                      child: const Text("Save"),
                      onPressed: () {
                        HomeModal cm = HomeModal(
                          name: txtName.text,
                          chat: txtChat.text,
                          phone: txtPhoneNo.text,
                          date: txtDate.text,
                          time: txtTime.text,
                          imagePath: providerw!.path,
                        );
                        providerr!.updateImagePath(null);
                        providerr!.addContactData(cm);
                        providerw!.dashIndex;
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
