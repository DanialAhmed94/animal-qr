import 'package:flutter/material.dart';
import 'package:pet_project/views/auth/login.dart';
import 'package:pet_project/views/walkthrough/walkthrough_view.dart';
import 'package:provider/provider.dart';

import 'controler/languageSelectionController.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en', 'image': "assets/language/ukFlag.png"},
    {'name': 'French', 'code': 'fr', 'image': "assets/language/frenchFlag.png"},
    {'name': 'Turkish', 'code': 'tr', 'image': "assets/language/turkey.png"},
    {'name': 'Spanish', 'code': 'es', 'image': "assets/language/spainFlag.png"},
    {
      'name': 'Dutch',
      'code': 'nl',
      'image': "assets/language/dutchFlag.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Language")),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(
                languages[index]['image']!,
                width: 40, // Set the desired width
                height: 40, // Set the desired height
              ),
              title: Text(languages[index]['name']!),
              onTap: () {
                Provider.of<LocalizationProvider>(context, listen: false)
                    .setLocale(Locale(languages[index]['code']!));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}


