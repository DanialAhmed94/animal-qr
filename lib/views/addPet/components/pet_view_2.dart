import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_constants.dart';

import '../../../modal/pet_modal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Gender { male, female }

class PetView2 extends StatefulWidget {
  Pet petData;
PetView2({required this.petData});
  @override
  State<PetView2> createState() => _PetView2State();
}

class _PetView2State extends State<PetView2> {
  Gender _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    widget.petData.petGender = "Male";
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 42,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppConstants.skyContainerColor.withOpacity(.3),
            ),
            child: Text(
              "${AppLocalizations.of(context)?.gender ?? ''}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _gender = Gender.male;
                      widget.petData.petGender = "Male";
                    });
                  },
                  child: Container(
                    height: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                      //  fit: BoxFit.cover,
                        image: AssetImage(
                          _gender == Gender.male
                              ? AppConstants.maleDogSelected
                              : AppConstants.maleDogUnselected,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 50.0),
                            child: Text(
                              "${AppLocalizations.of(context)?.male?? ''}",
                              style: TextStyle(
                                color: _gender == Gender.male ? Colors.white : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "JakartaBold",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _gender = Gender.female;
                      widget.petData.petGender = "Female";
                    });
                  },
                  child: Container(
                    height: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          _gender == Gender.female
                              ? AppConstants.femaleCatSelected
                              : AppConstants.femaleCatUnselected,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 50.0),
                            child: Text(
                              "${AppLocalizations.of(context)?.female?? ''}",
                              style: TextStyle(
                                color: _gender == Gender.female ? Colors.white : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "JakartaBold",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             _gender = Gender.male;
          //             widget.petData.petGender = "Male";
          //           });
          //         },
          //         child: Image.asset(
          //           _gender == Gender.male
          //               ? AppConstants.maleDogSelected
          //               : AppConstants.maleDogUnselected,
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             _gender = Gender.female;
          //             widget.petData.petGender = "Female";
          //           });
          //         },
          //         child: Image.asset(
          //           _gender == Gender.female
          //               ? AppConstants.femaleCatSelected
          //               : AppConstants.femaleCatUnselected,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
