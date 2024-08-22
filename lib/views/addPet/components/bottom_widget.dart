import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/api/postPet.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/pet_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/home.dart';
import '../../home/home_view.dart';

class BottomWidget extends StatefulWidget {
  BottomWidget(
      {super.key,
      this.bearerToken,
      required this.formKeys,
      required this.currentIndex,
      required PageController pageController,
      required this.onBackPress,
      required this.petData})
      : _pageController = pageController;

  Pet petData;
  String? bearerToken;
  final int currentIndex;
  final PageController _pageController;
  final VoidCallback onBackPress;
  final formKeys;

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.onBackPress,
            child: SizedBox(
              height: 60,
              child: Image.asset(
                AppConstants.back,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Proceed based on currentIndex
                switch (widget.currentIndex) {
                  case 0:
                    break;
                  case 1:
                    widget._pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    );

                    break;

                  case 2:
                    if (widget.formKeys.currentState?.validate() ?? false) {
                      widget._pageController.animateToPage(
                        3,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    } else {
                      // Handle form validation failure
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Please complete the form before proceeding.')),
                      );
                      break;
                    }


                  case 3:
                    widget._pageController.animateToPage(
                      4,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    );
                    break;
                  case 4:
                    widget._pageController.animateToPage(
                      5,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    );
                    break;
                  case 5:
                    widget._pageController.animateToPage(
                      6,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    );

                    print('Qr_Id: ${widget.petData.hiddenId}');
                    print('userId: ${widget.petData.userId}');
                    print('Name: ${widget.petData.petName}');
                    print('Type: ${widget.petData.petType}');
                    print('Breed: ${widget.petData.petBreed}');
                    print('Gender: ${widget.petData.petGender}');
                    print('Date of Birth: ${widget.petData.petDob}');
                    print('Phone Number : ${widget.petData.phone}');
                    print('Insta: ${widget.petData.instagramUsername}');
                    print('Tiktok: ${widget.petData.tiktokUsername}');
                    print('Vaccination: ${widget.petData.vaccination}');
                    print('Spayed: ${widget.petData.spayed}');
                    print('Behaviour: ${widget.petData.behaviour}');
                    print('Anxiety: ${widget.petData.anxiety}');
                    print('Diet: ${widget.petData.diet}');
                    print('Weight: ${widget.petData.weight}');
                    print('Notify: ${widget.petData.notify}');
                    print('Base64: ${widget.petData.petImage}');
                    print('parrent1: ${widget.petData.parent1}');
                    print('parrent2: ${widget.petData.parent2}');
                    print('about: ${widget.petData.description}');
                    print('addres: ${widget.petData.address}');

                    postPet(widget.petData, context, widget.bearerToken);
                    break;
                  default:
                }
              },
              // onTap: () {
              //   switch (widget.currentIndex) {
              //     case 0:
              //       break;
              //     case 1:
              //       widget._pageController.animateToPage(
              //         2,
              //         duration: const Duration(milliseconds: 250),
              //         curve: Curves.easeIn,
              //       );
              //       break;
              //     case 2:
              //       widget._pageController.animateToPage(
              //         3,
              //         duration: const Duration(milliseconds: 250),
              //         curve: Curves.easeIn,
              //       );
              //       break;
              //     case 3:
              //
              //           widget._pageController.animateToPage(
              //             4,
              //             duration: const Duration(milliseconds: 250),
              //             curve: Curves.easeIn,
              //           );
              //           break;
              //
              //
              //     case 4:
              //       widget._pageController.animateToPage(
              //         5,
              //         duration: const Duration(milliseconds: 250),
              //         curve: Curves.easeIn,
              //       );
              //       break;
              //     case 5:
              //       widget._pageController.animateToPage(
              //         6,
              //         duration: const Duration(milliseconds: 250),
              //         curve: Curves.easeIn,
              //       );
              //
              //       print('Qr_Id: ${widget.petData.hiddenId}');
              //       print('userId: ${widget.petData.userId}');
              //       print('Name: ${widget.petData.petName}');
              //       print('Type: ${widget.petData.petType}');
              //       print('Breed: ${widget.petData.petBreed}');
              //       print('Gender: ${widget.petData.petGender}');
              //       print('Date of Birth: ${widget.petData.petDob}');
              //       print('Insta: ${widget.petData.instagramUsername}');
              //       print('Tiktok: ${widget.petData.tiktokUsername}');
              //       print('Vaccination: ${widget.petData.vaccination}');
              //       print('Spayed: ${widget.petData.spayed}');
              //       print('Behaviour: ${widget.petData.behaviour}');
              //       print('Anxiety: ${widget.petData.anxiety}');
              //       print('Diet: ${widget.petData.diet}');
              //       print('Weight: ${widget.petData.weight}');
              //       print('Notify: ${widget.petData.notify}');
              //       print('Base64: ${widget.petData.petImage}');
              //       print('parrent1: ${widget.petData.parent1}');
              //       print('parrent2: ${widget.petData.parent2}');
              //       print('about: ${widget.petData.description}');
              //       print('addres: ${widget.petData.address}');
              //
              //
              //       postPet(widget.petData, context, widget.bearerToken);
              //       break;
              //     default:
              //   }
              // },
              child: SizedBox(
                height: 60,
                child: SvgPicture.asset(
                  AppConstants.continueButton2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
