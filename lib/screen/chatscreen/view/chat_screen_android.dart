import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plateform_converter_app/screen/home/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/color_list.dart';

class ChatScreenAndroid extends StatefulWidget {
  const ChatScreenAndroid({super.key});

  @override
  State<ChatScreenAndroid> createState() => _ChatScreenAndroidState();
}

class _ChatScreenAndroidState extends State<ChatScreenAndroid> {
  ContactProvider? providerr;
  ContactProvider? providerw;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNo= TextEditingController();
  TextEditingController txtChat= TextEditingController();
  TextEditingController txtDate= TextEditingController();
  TextEditingController txtTime= TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerr = context.read<ContactProvider>();
    providerw = context.watch<ContactProvider>();
    return ListView.builder(
      itemCount: providerw!.addDataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  providerw!.addDataList[index].imagePath != null
                      ? CircleAvatar(
                    radius: 25,
                    backgroundImage: FileImage(File(
                      "${providerw!.addDataList[index].imagePath}",)),
                  )
                      : Container(
                    height:
                    MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: boxcolorList[index],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${providerw!.addDataList[index].name!.isNotEmpty ? providerw!.addDataList[index].name!.substring(0, 1).toUpperCase() : 0}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${providerr!.addDataList[index].name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${providerw!.addDataList[index].chat}",style: TextStyle(fontSize: 14),),
                      Spacer(),
                      Row(
                        children: [
                          Text("${providerr!.addDataList[index].date}",),
                          Text("${providerw!.addDataList[index].time}"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}