import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../home/modal/home_modal.dart';
import '../home/provider/contact_provider.dart';

void showWidget(BuildContext context, HomeModal c1) {
  TextEditingController txtName = TextEditingController(text: c1.name);
  TextEditingController txtChat = TextEditingController(text: c1.chat);
  TextEditingController txtPhone = TextEditingController(text: c1.phone);

  showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: const Text("Update Contacts"),
          actions: [
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          alignment: Alignment.bottomCenter,
                          title: const Text("Pick Profile Picture"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  ImagePicker picker = ImagePicker();
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  context.read<ContactProvider>().updateImagePath(image!.path);
                                },
                                child: const Text("Choose Photo")),
                            TextButton(
                                onPressed: () async {
                                  ImagePicker picker = ImagePicker();
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.camera);
                                  context.read<ContactProvider>().updateImagePath(image!.path);
                                },
                                child: const Text("Take Photo")),
                          ],
                        );
                      },
                    );
                  },
                  child: c1.imagePath != null ||
                          context.read<ContactProvider>().path != null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(File("${c1.imagePath}")),
                        )
                      : CircleAvatar(
                          radius: 80,
                          child: Text(
                            "${c1.name!.substring(0, 1).toUpperCase()}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtName,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtChat,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Chat")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtPhone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Phone")),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    HomeModal c1 = HomeModal();
                    c1.name = txtName.text;
                    c1.chat = txtChat.text;
                    c1.phone=txtPhone.text;
                    c1.imagePath = context.read<ContactProvider>().path;
                    context.read<ContactProvider>().editContact(c1);
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ContactProvider>().contactDelete();
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
