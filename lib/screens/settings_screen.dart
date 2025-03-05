// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import, implementation_imports
import 'package:flutter/src/widgets/container.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                children: [
                  Icon(Icons.person, color: Colors.grey),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildAccountOptionRow(context, "Change Password"),
              buildAccountOptionRow(context, "Content Settings"),
              buildAccountOptionRow(context, "Social"),
              buildAccountOptionRow(context, "Language"),
              buildAccountOptionRow(context, "Privacy and Security"),
              const SizedBox(
                height: 40,
              ),
              const Row(
                children: [
                  Icon(Icons.volume_up_outlined, color: Colors.grey),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildNotivicationsOptionRow("New for you", true),
              buildNotivicationsOptionRow("Account Activity", true),
              buildNotivicationsOptionRow("Opportunity", false),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "SIGN OUT",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.3,
                            color: Colors.black),
                      )),
                ),
              )
            ],
          )),
    );
  }

  Row buildNotivicationsOptionRow(String title, bool isactive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(value: isactive, onChanged: (bool val) {}))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Option 1'),
                    Text('Option 2'),
                    Text('Option 3'),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[500],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
