import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
            CircleAvatar(),
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
              onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "My Address",
              leadingImage: AppConstants.myAddress,
              onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "My Order",
              leadingImage: AppConstants.myOrder,
              onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "Language",
              leadingImage: AppConstants.language,
              onTap: () {}),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 22.0, top: 11, bottom: 17),
            child: Text(
              "Information",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ProfileTile(
              title: "Privacy Policy",
              leadingImage: AppConstants.privacyPolicy,
              onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "Contact us",
              leadingImage: AppConstants.contactUS,
              onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "Rate us",
              leadingImage: AppConstants.rateUs,
              onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "About us",
              leadingImage: AppConstants.aboutUs,
              onTap: () {}),
          const Divider(),
          ProfileTile(
              title: "Feedback",
              leadingImage: AppConstants.feedBack,
              onTap: () {}),
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
