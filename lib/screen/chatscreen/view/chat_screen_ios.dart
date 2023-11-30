import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color_list.dart';
import '../../home/modal/home_modal.dart';
import '../../home/provider/contact_provider.dart';
import '../../widget/update_widget_ios.dart';

class ChatScreenIos extends StatefulWidget {
  const ChatScreenIos({super.key});

  @override
  State<ChatScreenIos> createState() => _ChatScreenIosState();
}

class _ChatScreenIosState extends State<ChatScreenIos> {
  ContactProvider? providerr;
  ContactProvider? providerw;
  @override
  Widget build(BuildContext context) {
    providerr = context.read<ContactProvider>();
    providerw = context.watch<ContactProvider>();
    return  CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "Plateform Converter",
            style: TextStyle(fontSize: 20),
          )),
      child: ListView.builder(
    itemCount: providerw!.addDataList.length,
    itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              HomeModal c1 = HomeModal(
                  name: providerr!.addDataList[index].name,
                  phone: providerr!.addDataList[index].phone,
                  imagePath: providerr!.addDataList[index].imagePath);
              showCupertinoWidget(context, c1);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 0.10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.inactiveGray),
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
                              style: const TextStyle(
                                  fontSize: 20, color:CupertinoColors.black),
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
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${providerw!.addDataList[index].chat}",
                          style:
                          const TextStyle(fontSize: 14, color: CupertinoColors.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${providerw!.time!.hour}:${providerw!.time!.minute}",
                          style: const TextStyle(color: CupertinoColors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${providerr!.date!.day}/${providerr!.date!.month}/${providerr!.date!.year}",
                          style: const TextStyle(color: CupertinoColors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}