import 'package:flutter/material.dart';
import 'package:pet_project/views/auth/login.dart';
import 'package:pet_project/views/splash_view.dart';
import 'package:provider/provider.dart';

import '../../controler/languageSelectionController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en', 'image': "assets/language/ukFlag.png"},
    {'name': 'French', 'code': 'fr', 'image': "assets/language/frenchFlag.png"},
    {'name': 'Turkish', 'code': 'tr', 'image': "assets/language/turkey.png"},
    {'name': 'Spanish', 'code': 'es', 'image': "assets/language/spainFlag.png"},
    {'name': 'Dutch',
      'code': 'nl',
      'image': "assets/language/dutchFlag.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black,
      toolbarHeight: 90,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //CircleAvatar(),
          SizedBox(
            width: 12,
          ),
          Text("${AppLocalizations.of(context)?.selectLanguage ?? ''}"),
        ],
      ),
    ),
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
              onTap: () async{
                Provider.of<LocalizationProvider>(context, listen: false)
                    .setLocale(Locale(languages[index]['code']!));

              //  await Future.delayed(Duration(milliseconds: 200));

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SplashView()),
                      (Route<dynamic> route) => false, // This removes all previous routes
                );
                // After selecting, you can navigate to the Login Screen or wherever needed
              },
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'controler/languageSelectionController.dart';
//
// class LanguageSelectionScreen extends StatelessWidget {
//   final List<Map<String, String>> languages = [
//     {'name': 'English', 'code': 'en','image':"assets/ukFlag.png"},
//     {'name': 'French', 'code': 'fr','image':"assets/frenchFlag.png"},
//     {'name': 'Turkish', 'code': 'tr','image':"assets/turkey.png"},
//     {'name': 'Spanish', 'code': 'es','image':"assets/spainFlag.png"},
//     {'name': ' Bulgaria', 'code': 'es','image':"assets/bulgariaFlag.png"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Select Language")),
//       body: ListView.builder(
//         itemCount: languages.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(languages[index]['name']!),
//             onTap: () {
//               Provider.of<LocalizationProvider>(context, listen: false)
//                   .setLocale(Locale(languages[index]['code']!));
//               // After selecting, you can navigate to the Login Screen or wherever needed
//             },
//           );
//         },
//       ),
//     );
//   }
// }
