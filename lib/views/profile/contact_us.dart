import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactDetailView extends StatefulWidget {
  const ContactDetailView({super.key});

  @override
  State<ContactDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ContactDetailView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        toolbarHeight: 90,
        title: Text("${AppLocalizations.of(context)?.contactUs ?? ''}"),
      ),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 22.0, bottom: 17),
          //   child: Text(
          //     "Account",
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          ListTile(
            title: Row(
              children: [
                Text(
                  "info@animalQr.com",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            leading: Image.asset(AppConstants.email, height: 30,width: 30,),
          ),
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
          ListTile(
            title: Row(
              children: [
                Text(
                  "www.anaimalQr.com",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            leading: Image.asset(AppConstants.web,height: 30,width: 30,),
          ),

          const Divider(),
          ListTile(
            title: Row(
              children: [
                Text(
                  "facebook/animalQr",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            leading: Image.asset(AppConstants.facebook,height: 30,width: 30,),
          ),
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
          const Divider(),
          ListTile(
            title: Row(
              children: [
                Text(
                  "instagram/animal_Qr",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            leading: Image.asset(AppConstants.instagram,height: 30,width: 30,),
          ),
          const Divider(),
        ],
      ),
    );
  }
}


