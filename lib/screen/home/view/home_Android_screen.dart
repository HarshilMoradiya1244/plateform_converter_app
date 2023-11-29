import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';

class AndroidHomeScreen extends StatefulWidget {
  const AndroidHomeScreen({super.key});

  @override
  State<AndroidHomeScreen> createState() => _AndroidHomeScreenState();
}

class _AndroidHomeScreenState extends State<AndroidHomeScreen> {
  ContactProvider? ProviderR;
  ContactProvider? ProviderW;

  @override
  Widget build(BuildContext context) {
    ProviderR = context.read<ContactProvider>();
    ProviderW = context.watch<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.pink.shade200,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Full Name"),
                      prefixIcon: Icon(Icons.person_2_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone Number"),
                      prefixIcon: Icon(Icons.call_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Chat Conversation"),
                      prefixIcon: Icon(Icons.message_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                        "Date : ${ProviderR!.date?.day}/${ProviderR!.date?.month}/${ProviderR!.date?.year}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            DateTime? d1 = await showDatePicker(
                                context: context,
                                initialDate: ProviderR!.date!,
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2050));
                            ProviderR!.changeDate(d1!);
                          },
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                        "Time : ${ProviderR!.time!.hour}:${ProviderW!.time!.minute}",
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          TimeOfDay? d2 = await showTimePicker(
                              context: context, initialTime: ProviderR!.time!);
                          ProviderR!.changeTime(d2!);
                        },
                        icon: const Icon(Icons.timer_outlined),
                      ),
                    ],
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Save"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
