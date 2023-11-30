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
  TextEditingController txtPhoneNo= TextEditingController();
  TextEditingController txtChat= TextEditingController();
  TextEditingController txtDate= TextEditingController();
  TextEditingController txtTime= TextEditingController();
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
                  IconButton(
                      onPressed: () async {
                        ImagePicker imgPiker = ImagePicker();
                        XFile? image = await imgPiker.pickImage(
                            source: ImageSource.gallery);
                        providerr!.updateImagePath(image!.path);
                      },
                      icon: const Icon(Icons.camera_alt))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
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
                            controller: txtChat,
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                DateTime? d1 = await showDatePicker(
                                    context: context,
                                    initialDate: providerr!.date!,
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2050));
                                providerr!.changeDate(d1!);
                              },
                              icon: const Icon(CupertinoIcons.calendar),
                            ),
                            const Text(
                              "Pick Date",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Date : ${providerr!.date?.day}/${providerr!.date
                                  ?.month}/${providerr!.date?.year}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () async {
                              TimeOfDay? d2 = await showTimePicker(
                                  context: context,
                                  initialTime: providerr!.time!);
                              providerr!.changeTime(d2!);
                            }, icon: const Icon(CupertinoIcons.time),
                            ),
                            const Text(
                              "Pick Time",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Time : ${providerr!.time!.hour}:${providerw!.time!.minute}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
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
                        );
                        providerr!.updateImagePath(null);
                        providerr!.addContactData(cm);
                        providerw!.dashIndex;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
