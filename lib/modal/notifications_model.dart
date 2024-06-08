import 'dart:convert';

class NotificationResponse {
  String message;
  List<NotificationData> data;

  NotificationResponse({
    required this.message,
    required this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      message: json['message'],
      data: List<NotificationData>.from(json['data'].map((x) => NotificationData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class NotificationData {
  int id;
  String message;
  String userId;
  String createdAt;
  String updatedAt;

  NotificationData({
    required this.id,
    required this.message,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'],
      message: json['message'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}