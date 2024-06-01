


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import '../modal/pet_modal.dart';

Future<void> postPet(Pet petData, BuildContext context) async {
  try {
    final String url = AppConstants.baseUrlPet;
    Map<String, dynamic> requestBody = {
      'user_id': petData.userId,
      'unique_id': petData.hiddenId,
      'pet_category': petData.petType,
      'pet_breed': petData.petBreed,
      'pet_gender': petData.petGender,
      'image': petData.petImage,
      'pet_name': petData.petName,
      'pet_dob': petData.petDob,
      'instagram_id': petData.instagramUsername,
      'tiktok_id': petData.tiktokUsername,
      'vaccination_status': petData.vaccination,
      'neutered_status': petData.spayed,
      'behaviour': petData.behaviour,
      'anxiety': petData.anxiety,
      'diet': petData.diet,
      'weight': petData.weight,
      'notification_status': petData.notify,
    };

    final response = await http.post(Uri.parse('$url/addPet'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Pet added successfully!'),
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
    } else {
      // Show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error',style: TextStyle(color: Colors.black)),
            content: Text('Failed to add pet. Please try again later.',style: TextStyle(color: Colors.black)),
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
  }
  catch(error){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error',style: TextStyle(color: Colors.black),),
          content: Text('Something went wrong! $error.',style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK',style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
