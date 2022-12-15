import 'package:flutter/material.dart';
import 'package:news_app/constants/buttons.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/news/WebView.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBack(color: black),
            SizedBox(
              height: 36,
            ),
            const Text("Data provided by : "),
            Row(
              children: [
                Image.asset(
                  "assets/images/ny-times-logo.jpg",
                  width: Config().deviceWidth(context) * 0.8,
                ),
              ],
            ),
            ListTile(
              onTap: () {
                // Nav().goTo(WebViewStack(), context);
              },
              leading: Icon(Icons.language_rounded),
              title: Text("https://www.nytimes.com/"),
            ),
            const ListTile(
              leading: Icon(Icons.email_rounded),
              title: Text("nytnews@nytimes.com"),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text("1-212-556-1234 "),
            ),
          ],
        ),
      )),
    );
  }
}
