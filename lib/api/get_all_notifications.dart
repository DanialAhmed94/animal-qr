import 'dart:convert';

import 'package:pet_project/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/notifications_model.dart';
import 'package:http/http.dart' as http;


Future<List<NotificationData>> fetchNotifications() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("auth_token");
    int? userId = await prefs.getInt("authenticatedUserId");

    if (token == null || userId == null) {
      throw Exception("Authentication token or user ID is missing.");
    }


    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/notifications/$userId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },);

    if (response.statusCode == 200) {

      final notificationResponse = NotificationResponse.fromJson(json.decode(response.body));

      // Handle case when there are no notifications
      if (notificationResponse.data.isEmpty) {
        print('No notifications found.');
        return [];
      }

      return notificationResponse.data;
    } else {
      throw Exception('Failed to load notifications');
    }
  } catch (e) {
    print('Error fetching notifications: $e');
    return [];
  }
}
