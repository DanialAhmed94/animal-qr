import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import '../constants/app_constants.dart';
import '../modal/dashboard_model.dart';

Future<Tuple3<User, int,int>> getDashBoard() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    int? userId = prefs.getInt('authenticatedUserId');

    if (token == null || userId == null) {
      throw Exception('Token or user ID not found in SharedPreferences');
    }

    String url = AppConstants.baseUrl;

    final response = await http.post(
      Uri.parse('$url/dashboard_api'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Add content-type header
      },
      body: jsonEncode({'user_id': userId}), // Encode body to JSON
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final Map<String, dynamic> userData = responseData['user'];

      final int ownedQrs = responseData['owned_qrs'];
      final int notifications_count = responseData['notifications_count'];
      await prefs.setInt('owned_qrs', ownedQrs);
      await prefs.setInt('notifications_count', notifications_count);

      // Parse user data
      final User user = User.fromJson(userData);

      await prefs.setString("userFirstName", user.firstName);
      await prefs.setString("userLastName", user.lastName);
      await prefs.setString("userEmail", user.email);
      await prefs.setString("userCreatedAt", user.createdAt.toString());

      // Now you have both user data and owned_qrs, you can return them as needed
      return Tuple3<User, int,int>(user, ownedQrs,notifications_count);

    } else {
      throw Exception('Failed to load user data');
    }
  } catch (e) {
    // Handle any exceptions here
    throw Exception('Error: $e');
  }
}
