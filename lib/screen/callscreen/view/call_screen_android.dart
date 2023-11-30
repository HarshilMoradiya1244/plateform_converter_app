import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/color_list.dart';
import '../../home/provider/contact_provider.dart';

class CallScreenAndroid extends StatefulWidget {
  const CallScreenAndroid({super.key});

  @override
  State<CallScreenAndroid> createState() => _CallScreenAndroidState();
}

class _CallScreenAndroidState extends State<CallScreenAndroid> {
  ContactProvider? providerr;
  ContactProvider? providerw;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNo = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtTime = TextEditingController();

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
                            "${providerw!.addDataList[index].imagePath}",
                          )),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: boxcolorList[index],
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${providerw!.addDataList[index].name!.isNotEmpty ? providerw!.addDataList[index].name!.substring(0, 1).toUpperCase() : 0}",
                              style: const TextStyle(fontSize: 20,color: Colors.black),
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
                      Text(
                        "${providerr!.addDataList[index].name}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      const Spacer(),
                      Text(
                        "${providerw!.addDataList[index].phone}",
                        style: const TextStyle(fontSize: 15,color: Colors.black),
                      ),
                      const Spacer(),
                    ],
                  ),

                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      Uri uri = Uri.parse(
                          "tel: +91${providerr!.addDataList[index].phone}");
                      await launchUrl(uri);
                    },
                    icon: const Icon(Icons.call,color: Colors.black,),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
