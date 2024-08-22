import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../modal/pet_modal.dart';
import '../views/home/home_view.dart';

Future<void> postPet(Pet petData, BuildContext context, String? bearerToken) async {
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
    final String url = AppConstants.baseUrl;
    Map<String, dynamic> requestBody = {
      'user_id': petData.userId,
      'unique_id': petData.hiddenId,
      'pet_category': petData.petType,
      'pet_breed': petData.petBreed,
      'pet_gender': petData.petGender,
      'image': petData.petImage,
      'pet_name': petData.petName,
      'pet_dob': petData.petDob,
      'phone': petData.phone,
      'instagram_id': petData.instagramUsername,
      'tiktok_id': petData.tiktokUsername,
      'vaccination_status': petData.vaccination,
      'neutered_status': petData.spayed,
      'behaviour': petData.behaviour,
      'anxiety': petData.anxiety,
      'diet': petData.diet,
      'weight': petData.weight,
      'notification_status': petData.notify,
      'description': petData.description,
      'parent1': petData.parent1,
      'parent2': petData.parent2,
      'address': petData.address,
      'age': petData.age,
    };

    final response = await http.post(
      Uri.parse('$url/addPet'),
      headers: <String, String>{
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    Navigator.pop(context); // Hide circular progress indicator

    if (response.statusCode == 200) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success',style: TextStyle(color: Colors.black)),
            content: Text('Pet added successfully!',style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
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
  } catch (error) {
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

//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:pet_project/constants/app_constants.dart';
// import 'package:http/http.dart' as http;
// import '../modal/pet_modal.dart';
// import '../views/home/home_view.dart';
//
// Future<void> postPet(Pet petData, BuildContext context, String? bearerToken) async {
//   try {
//     final String url = AppConstants.baseUrl;
//     Map<String, dynamic> requestBody = {
//       'user_id': petData.userId,
//       'unique_id': petData.hiddenId,
//       'pet_category': petData.petType,
//       'pet_breed': petData.petBreed,
//       'pet_gender': petData.petGender,
//       'image': petData.petImage,
//       'pet_name': petData.petName,
//       'pet_dob': petData.petDob,
//       'instagram_id': petData.instagramUsername,
//       'tiktok_id': petData.tiktokUsername,
//       'vaccination_status': petData.vaccination,
//       'neutered_status': petData.spayed,
//       'behaviour': petData.behaviour,
//       'anxiety': petData.anxiety,
//       'diet': petData.diet,
//       'weight': petData.weight,
//       'notification_status': petData.notify,
//       'description': petData.description,
//       'parent1': petData.parent1,
//       'parent2': petData.parent2,
//       'address': petData.address,
//       'age': petData.age,
//     };
//
//     final response = await http.post(Uri.parse('$url/addPet'),
//         headers: <String, String>{
//           'Authorization': 'Bearer $bearerToken',
//           'Content-Type': 'application/json',
//         },
//
//         body: jsonEncode(requestBody));
//     print("parssing obj: $requestBody");
//
//     if (response.statusCode == 200) {
//       print("success");
//       showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Success',style: TextStyle(color: Colors.black)),
//             content: Text('Pet added successfully!',style: TextStyle(color: Colors.black)),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       // Show an error dialog
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error',style: TextStyle(color: Colors.black)),
//             content: Text('Failed to add pet. Please try again later.',style: TextStyle(color: Colors.black)),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//   catch(error){
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error',style: TextStyle(color: Colors.black),),
//           content: Text('Something went wrong! $error.',style: TextStyle(color: Colors.black)),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK',style: TextStyle(color: Colors.black)),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
