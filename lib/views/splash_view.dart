import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_project/views/walkthrough/walkthrough_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../languageSelection.dart';
import 'auth/login.dart';
import 'home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), whereToGo); // Call whereToGo after the 3-second delay
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    SystemChrome.restoreSystemUIOverlays();
    super.dispose();
  }
  Future<void> whereToGo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if language is selected
    bool isLanguageSelected = prefs.getBool('isLanguageSelected') ?? false;

    // Check if user is logged in
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn && isLanguageSelected) {
      // If user is logged in and language is selected, go to HomeView
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    } else if (!isLoggedIn && isLanguageSelected) {
      // If user is not logged in but language is selected, go to WalkthroughView
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LanguageSelectionScreen(destination: WalkthroughView()),
        ),
            (Route<dynamic> route) => false, // This removes all previous routes
      );

    } else {
      // If user is not logged in and language is not selected, go to LanguageSelectionView
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  LanguageSelectionScreen(destination: WalkthroughView(),), // Replace with your language selection screen
        ),
      );
    }
  }


  // Future<void> whereToGo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   if (isLoggedIn) {
  //     // Navigate to logged-in screen
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const HomeView(),
  //     ));
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => const WalkthroughView(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/splash.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
