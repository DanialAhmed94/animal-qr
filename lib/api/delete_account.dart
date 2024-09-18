import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../views/splash_view.dart';

Future<void> deleteAccount(
    String userid, String? bearerToken, BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(), // Show circular progress indicator
      );
    },
  );
  try {
    final String url = "${AppConstants.baseUrl}/delete_user/$userid";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
    );
    Navigator.pop(context); // Hide circular progress indicator

    if (response.statusCode == 200) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('${AppLocalizations.of(context)?.success}', style: TextStyle(color: Colors.black)),
            content: Text(
                '${AppLocalizations.of(context)?.accountDeletedSuccessfully}',
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  await prefs.setBool("isLoggedIn", false); await prefs.setBool("isLoggedIn", false);
                  await prefs.remove("fcm_token");
                  await prefs.remove("auth_token");
                  await prefs.remove('authenticatedUserId');
                  prefs.remove('fcm_token');

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashView()));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('${AppLocalizations.of(context)?.error}', style: TextStyle(color: Colors.black)),
            content: Text(
                '${AppLocalizations.of(context)?.failedToDeleteAccount}',
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(color: Colors.black),
          ),
          content: Text('Something went wrong!',
              style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
