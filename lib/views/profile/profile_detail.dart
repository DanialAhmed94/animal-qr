import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileDetailView extends StatefulWidget {
  const ProfileDetailView({super.key});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  DateTime _createdAt = DateTime.now();
  int _ownedQrs =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('userFirstName') ?? '';
      _lastName = prefs.getString('userLastName') ?? '';
      _email = prefs.getString('userEmail') ?? '';
      String? createdAtString = prefs.getString('userCreatedAt');
      if (createdAtString != null) {
        _createdAt = DateTime.parse(createdAtString);
      }
      _ownedQrs = prefs.getInt("owned_qrs")?? 0;
    });
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
        title: Text("${AppLocalizations.of(context)?.profile ?? ''}"),
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
                  Text("${AppLocalizations.of(context)?.name ?? ''}",style: TextStyle(fontSize: 13),),
                    Text(
                      "$_firstName $_lastName",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                ],
              ),
              leading: SvgPicture.asset(AppConstants.myProfile,height: 30,width: 30,),
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
                Text("${AppLocalizations.of(context)?.email ?? ''}: ",style: TextStyle(fontSize: 13),),
                  Text(
                    "$_email",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
              ],
            ),
            leading: Image.asset(AppConstants.email,height: 30,width: 30,),
          ),

          const Divider(),
          ListTile(
            title: Row(
              children: [
                Text("${AppLocalizations.of(context)?.memberSince ?? ''}: ",style: TextStyle(fontSize: 13),),
                Text(
                  "${DateFormat('MMM, yyyy').format(_createdAt)}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            leading: Image.asset(AppConstants.devices,height: 53,width: 40,),
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
                Text("${AppLocalizations.of(context)?.activeDevices ?? ''}: ",style: TextStyle(fontSize: 13),),
                Text(
                  "$_ownedQrs",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            leading: Image.asset(AppConstants.member,height: 30,width: 30,),
          ),
          const Divider(),
        ],
      ),
    );
  }
}


