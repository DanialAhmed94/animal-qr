import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/all_pets_model.dart';

import '../../modal/recievPet_model.dart';

class ScannerUserDetailView extends StatelessWidget {
  final UserPet rPet;

  ScannerUserDetailView({required this.rPet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                AppConstants.forest,
              ),
            ],
          ),
          Positioned.fill(
            top: 290,
            // right: 0,
            // left: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38),
                  topRight: Radius.circular(38),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62.0),
                      child: Row(
                        children: [
                          Text(
                            "Parents:",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 16,
                                  color: const Color(0xFF2A5F6B),
                                ),
                          ),
                          Text(
                            "${_checkForNull(rPet.parent1)},${_checkForNull(rPet.parent2)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppConstants.locationIcon),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "${_checkForNull(rPet.address)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: const Color(0xFF707070),
                                    fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        "About ${_checkForNull(rPet.name)}",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 16,
                                  color: const Color(0xFF2A5F6B),
                                ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 60.0,
                        right: 100,
                      ),
                      child: Text(
                        "${_checkForNull(rPet.description)}",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF707070),
                              fontSize: 13,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppConstants.backContainerColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstants.frontContainerColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "GENDER",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: const Color(0xFF2B5053),
                                          fontSize: 20.0),
                                ),
                                Text(
                                  "${_checkForNull(rPet.gender)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "AGE",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: const Color(0xFF2B5053),
                                          fontSize: 20.0),
                                ),
                                Text(
                                  "${_checkForNull(rPet.age)} Years",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "PET TYPE",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: const Color(0xFF2B5053),
                                          fontSize: 20.0),
                                ),
                                Text(
                                  "${_checkForNull(rPet.petCategory)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 10,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Breed",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: const Color(0xFF2A5F6B),
                                            fontSize: 16),
                                  ),
                                  Text(
                                    "${_checkForNull(rPet.breed)}" ?? " ",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pet Birthday",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: const Color(0xFF2A5F6B),
                                            fontSize: 16),
                                  ),
                                  Text(
                                    "${_checkForNull(rPet.dob)}" ?? " ",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Weight",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: const Color(0xFF2A5F6B),
                                            fontSize: 16),
                                  ),
                                  Text(
                                    "${_checkForNull(rPet.weight)}kg",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Instagram",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: const Color(0xFF2A5F6B),
                                            fontSize: 16),
                                  ),
                                  Text(
                                    "${_checkForNull(rPet.instaId)}" ?? " ",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "TikTok",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: const Color(0xFF2A5F6B),
                                            fontSize: 16),
                                  ),
                                  Text(
                                    "${_checkForNull(rPet.tiktokId)}" ?? " ",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Image.asset(
              AppConstants.tree,
              height: 80,
            ),
          ),
          Positioned(
            left: 8.0,
            top: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                AppConstants.backIcon,
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 0.0,
              right: 0.0,
              child: rPet.image1 == null || rPet.image2 == null
                  ? Image.asset(AppConstants.qrDog)
                  : _buildBase64Image(rPet.image1)),
        ],
      ),
    );
  }

  String _checkForNull(String? value) {
    if (value == null) {
      return "N/A";
    } else
      return value;
  }

  Widget _buildBase64Image(String? base64String) {
    if (base64String == null) return SizedBox.shrink();

    try {
      final bytes = base64Decode(base64String);
      return CircleAvatar(
        radius: 60,
        backgroundImage: MemoryImage(bytes),
      );
    } catch (e) {
      return Text('Invalid image data');
    }
  }
}
