import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../modal/home_modal.dart';
import '../provider/contact_provider.dart';

class HomeScreenAndroid extends StatefulWidget {
  const HomeScreenAndroid({super.key});

  @override
  State<HomeScreenAndroid> createState() => _HomeScreenAndroidState();
}

class _HomeScreenAndroidState extends State<HomeScreenAndroid> {
  ContactProvider? providerr;
  ContactProvider? providerw;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNo = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtTime = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerr = context.read<ContactProvider>();
    providerw = context.watch<ContactProvider>();
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Consumer<ContactProvider>(
                          builder: (context, value, child) {
                            return CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey,
                              backgroundImage: value.path != null
                                  ? FileImage(File(value.path!))
                                  : null,
                            );
                          },
                        ),
                        IconButton(
                            onPressed: () async {
                              ImagePicker imgPiker = ImagePicker();
                              XFile? image = await imgPiker.pickImage(
                                  source: ImageSource.gallery);
                              providerr!.updateImagePath(image!.path);
                            },
                            icon: const Icon(Icons.image))
                      ],
                    ),

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a name";
                    }
                    return null;
                  },
                  controller: txtName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                    label: Text("Full Name"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: txtPhoneNo,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.call_outlined),
                    border: OutlineInputBorder(),
                    label: Text("Phone Number"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtChat,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.message_outlined),
                    border: OutlineInputBorder(),
                    label: Text("Chat Conversation"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Date : ${providerr!.date?.day}/${providerr!.date?.month}/${providerr!.date?.year}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTime? d1 = await showDatePicker(
                              context: context,
                              initialDate: providerr!.date!,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2050));
                          providerr!.changeDate(d1!);
                        },
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Time : ${providerr!.time!.hour}:${providerr!.time!.minute}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () async {
                        TimeOfDay? d2 = await showTimePicker(
                            context: context, initialTime: providerr!.time!);
                        providerr!.changeTime(d2!);
                      },
                      icon: const Icon(Icons.timer_outlined),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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
                    }
                  },
                  child: const Text('Save'),
                ),
            ]
              ),
            ),
          ),
        ),
      ),
      )
    );
  }
}
