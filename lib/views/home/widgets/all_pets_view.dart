import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_project/modal/all_pets_model.dart';

import '../../../api/get_all_pets.dart';
import '../../../constants/app_constants.dart';
import '../../scanner/scaner_detail_view_userPet.dart';
import '../../scanner/scanner_detail_view.dart';import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class UserPetsView extends StatelessWidget {
  const UserPetsView({super.key});

  Widget itemCard(UserPet pet, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScannerUserDetailView(rPet: pet,)));
      },
      child: Card(
        elevation: 8.0, color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // margin: const EdgeInsets.symmetric(vertical: 10),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage:
                  //decoded image
                  pet.image1 != null
                      ?  NetworkImage("${AppConstants.baseUrlPet}/${pet.image1}")
                      : AssetImage('assets/home/default.jpg') as ImageProvider,
            ),
            title: Text(
              pet.name ?? '',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text("${pet.petCategory} | ${pet.breed} | ${pet.gender}"),
            trailing: Image.asset(pet.gender!.toLowerCase() != 'male'
                ? AppConstants.maleIcon
                : AppConstants.feMaleIcon),
          ),
        ),
        // SizedBox(
        //   height: 225,
        //   width: double.infinity,
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserPet>>(
        future: getAllPets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(
              child: CircularProgressIndicator(),
            ),);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.data!.isEmpty || !snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                automaticallyImplyLeading: true,
                title: Text('${AppLocalizations.of(context)?.registeredPets ?? ''}'),
                centerTitle: true,
                leadingWidth: 40.0,
              ),
              body: Center(
                child: Text(
                  '${AppLocalizations.of(context)?.youHaventRegisteredPets ?? ''}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16.0,
                      ),
                ),
              ),
            );
          } else {
            List<UserPet> pets = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                automaticallyImplyLeading: true,
                title: Text('${AppLocalizations.of(context)?.registeredPets ?? ''}'),
                centerTitle: true,
                leadingWidth: 40.0,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                    return  itemCard(pets[index],context);
                    }),
              ),
            );
          }
        });
  }
}
