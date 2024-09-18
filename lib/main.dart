import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pet_project/app_theme.dart';
import 'package:pet_project/views/home/home_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pet_project/views/splash_view.dart';
import 'package:provider/provider.dart'; // Added Provider
import 'package:shared_preferences/shared_preferences.dart';
import 'controler/languageSelectionController.dart';
import 'firebase_options.dart';
import 'local.notification.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.requestPermission();
  if (Platform.isAndroid) {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
  }
  FirebaseMessaging.instance.getInitialMessage();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? token = await messaging.getToken();
  print('Registration Token=$token');

  await prefs.setString('fcm_token', token.toString());

  await LocalNotification.initialize(flutterLocalNotificationsPlugin);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
      builder: (context, localizationProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Animal QR",
          locale: localizationProvider.locale, // Locale from provider
          supportedLocales: [
            Locale("en"),
            Locale("es"),
            Locale("fr"),
            Locale("tr"),
            Locale("nl"),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (localizationProvider.locale != null) {
              return localizationProvider.locale;
            }
            return supportedLocales.first;
          },
          theme: AppTheme.lightTheme,
          home: const SplashView(),
        );
      },
    );
  }

  Future<bool> _checkLanguageSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLanguageSelected') ?? false;
  }
}

//
// import 'dart:io';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:pet_project/app_theme.dart';
// import 'package:pet_project/views/home/home_view.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// import 'package:pet_project/views/splash_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'firebase_options.dart';
// import 'local.notification.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//
//
//   print("Handling a background message: ${message.messageId}");
// }
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await FirebaseMessaging.instance.requestPermission();
//   if (Platform.isAndroid) {
//     await FirebaseMessaging.instance.setAutoInitEnabled(true);
//   }
//   FirebaseMessaging.instance.getInitialMessage();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   final messaging = FirebaseMessaging.instance;
//
//   final settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//
//   if (kDebugMode) {
//     print('Permission granted: ${settings.authorizationStatus}');
//   }
//
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   // try {
//   //   String? token = await FirebaseMessaging.instance.getToken();
//   //   if (token != null) {
//   //     await prefs.setString('fcm_token', token);
//   //     print('FCM Token=$token');
//   //   } else {
//   //     print('Failed to get FCM token');
//   //   }
//   // } catch (e) {
//   //   print('Error getting FCM token: $e');
//   // }
//   String? token = await messaging.getToken();
//   print('Registration Token=$token');
//
//   await prefs.setString('fcm_token', token.toString());
//
//   await LocalNotification.initialize(flutterLocalNotificationsPlugin);
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor: Colors.white,
//       statusBarIconBrightness: Brightness.dark,
//     ),
//   );
//   runApp(const MyApp());
// }
//
// // Future<void> initializeNotificationSettings() async {
// //   String? token = await FirebaseMessaging.instance.getToken();
// //   print("FCM Token: $token");
// //   FirebaseMessaging.instance.getInitialMessage();
// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //   FlutterLocalNotificationsPlugin();
// //   await LocalNotification.initialize(flutterLocalNotificationsPlugin);
// //   FirebaseMessaging messaging = FirebaseMessaging.instance;
// //
// //   NotificationSettings settings = await messaging.requestPermission(
// //     alert: true,
// //     announcement: false,
// //     badge: true,
// //     carPlay: false,
// //     criticalAlert: false,
// //     provisional: false,
// //     sound: true,
// //   );
// //
// //   print('User granted permission: ${settings.authorizationStatus}');
// //
// //   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
// //     alert: true, // Required to display a heads up notification
// //     badge: true,
// //     sound: true,
// //   );
// //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //     print('Got a message whilst in the foreground!');
// //     print('Message data: ${message.data}');
// //
// //     if (message.notification != null) {
// //       print('Message also contained a notification: ${message.notification!.body.toString()}');
// //     }
// //   });
// //
// // }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Animal QR",
//       locale: Locale("es"),
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate
//       ],
//       supportedLocales: [
//         Locale("en"),
//         Locale("es"),
//       ],
//       theme: AppTheme.lightTheme,
//       home: const SplashView(),
//     );
//   }
// }
