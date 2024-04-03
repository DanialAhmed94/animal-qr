import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/addPet/add_pet.dart';
import 'package:pet_project/views/addPet/components/pet_view_1.dart';

import 'package:pet_project/views/home/home.dart';
import 'package:pet_project/views/profile/profile.dart';
import 'package:pet_project/views/scanner/scanner_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          Home(),
          ScannerView(),
          AddPetView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppConstants.homeUnselected),
              activeIcon: SvgPicture.asset(AppConstants.homeSelected),
              label: ""),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppConstants.barcodeUnselected),
            activeIcon: SvgPicture.asset(AppConstants.barcodeSelected),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppConstants.addPetUnselected),
            activeIcon: SvgPicture.asset(AppConstants.addPetSelected),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppConstants.profileUnselected),
            activeIcon: SvgPicture.asset(AppConstants.profileSelected),
            label: "",
          ),
        ],
      ),
    );
  }
}
