import 'package:flutter/material.dart';
import 'package:plateform_converter_app/screen/home/provider/contact_provider.dart';
import 'package:provider/provider.dart';

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${providerr!.addDataList[index].name}",),
                      Text("${providerw!.addDataList[index].phone}"),
                    ],
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