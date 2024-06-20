import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/profile/profile_detail.dart';
import 'package:pet_project/views/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/delete_account.dart';
import 'contact_us.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  final String feedbackEmail = 'animalQr@gmail.com.com';

  void _sendFeedback(BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: feedbackEmail,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Feedback',
        'body': 'App Feedback:',
      }),
    );

    try {
      bool launched = await launch(emailLaunchUri.toString());

      if (!launched) {
        // If launching the default email client fails, try opening other installed email applications
        await _openOtherEmailApps();
      }
    } catch (error) {
      // If an error occurs during either attempt, show an error message
      _showErrorDialog(
          context, 'An error occurred while trying to send feedback.');
    }
  }

  Future<void> _openOtherEmailApps() async {
    // List of known email application package names on Android
    final List<String> emailApps = [
      'com.google.android.gm', // Gmail
      'com.microsoft.office.outlook', // Outlook
      // Add more package names for other email apps if needed
    ];

    // Iterate through the list of email apps and try to open them
    for (final String packageName in emailApps) {
      final String url = 'package:$packageName';

      if (await canLaunch(url)) {
        await launch(url);
        return;
      }
    }
    // If no known email apps are found, show an error message
    throw 'No email application is available.';
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        toolbarHeight: 90,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CircleAvatar(),
            SizedBox(
              width: 12,
            ),
            Text("Profile"),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0, bottom: 17),
            child: Text(
              "Account",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ProfileTile(
              title: "My Profile",
              leadingImage: AppConstants.myProfile,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileDetailView()));
              }),
          // const Divider(),
          // ProfileTile(
          //     title: "My Address",
          //     leadingImage: AppConstants.myAddress,
          //     onTap: () {}),
          // const Divider(),
          // ProfileTile(
          //     title: "My Order",
          //     leadingImage: AppConstants.myOrder,
          //     onTap: () {}),
          // const Divider(),
          // ProfileTile(
          //     title: "Language",
          //     leadingImage: AppConstants.language,
          //     onTap: () {}),
          // const Divider(),
          // Padding(
          //   padding: const EdgeInsets.only(left: 22.0, top: 11, bottom: 17),
          //   child: Text(
          //     "Information",
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          // ProfileTile(
          //     title: "Privacy Policy",
          //     leadingImage: AppConstants.privacyPolicy,
          //     onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "Contact us",
              leadingImage: AppConstants.contactUS,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactDetailView()));
              }),
          const Divider(),
          // ProfileTile(
          //     title: "Rate us",
          //     leadingImage: AppConstants.rateUs,
          //     onTap: () {}),
          // const Divider(),
          // ProfileTile(
          //     title: "About us",
          //     leadingImage: AppConstants.aboutUs,
          //     onTap: () {}),
          // const Divider(),
          ProfileTile(
              title: "Feedback",
              leadingImage: AppConstants.feedBack,
              onTap: () {
                _sendFeedback(context);
              }),
          const Divider(),
          ListTile(
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: Image.asset(
                "${AppConstants.logout}",
                height: 35,
                width: 35,
              ),
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                await prefs.setBool("isLoggedIn", false);
                await prefs.remove("fcm_token");
                await prefs.remove("auth_token");
                await prefs.remove('authenticatedUserId');
                prefs.remove('fcm_token');

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashView()));
              }),
          const Divider(),
          ListTile(
              title: Text(
                "Delete Account",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: Image.asset(
                "${AppConstants.delete}",
                height: 35,
                width: 35,
              ),
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                await prefs.setBool("isLoggedIn", false);
                final userId = await prefs.getInt("authenticatedUserId");
                final String? bearerToken = prefs.getString('auth_token');
                deleteAccount(userId.toString(), bearerToken, context);
              }),
          const Divider(),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String leadingImage;

  const ProfileTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.leadingImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(leadingImage),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
