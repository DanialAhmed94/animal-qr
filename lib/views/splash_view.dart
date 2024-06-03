import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_project/views/walkthrough/walkthrough_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _timer = Timer(const Duration(seconds: 3), () {});
    whereToGo();
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
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // Navigate to logged-in screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeView(),
      ));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WalkthroughView(),
        ),
      );
    }
  }

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
