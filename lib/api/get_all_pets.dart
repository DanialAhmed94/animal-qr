import 'dart:convert';
import 'package:pet_project/modal/pet_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../modal/all_pets_model.dart';

Future<List<UserPet>> getAllPets() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("auth_token");
    int? userId = await prefs.getInt("authenticatedUserId");

    String url = AppConstants.baseUrl;
    final Map<String, dynamic> requestBody = {"user_id": userId};

    if (token == null || userId == null) {
      throw Exception("Authentication token or user ID is missing.");
    }

    final response = await http.post(
      Uri.parse("$url/pets"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      String message = responseBody['message'];
      if(message =="No pets Against this user found")
        {
          return [];
        }
      List<dynamic> petList = responseBody['data'];
      List<UserPet> pets =
          petList.map((petJson) => UserPet.fromJson(petJson)).toList();

      return pets;
    } else {
      throw Exception(
          'Failed to load pets. Server responded with status code ${response.statusCode}.');
    }
  } catch (e) {
    throw e;
  }
}
