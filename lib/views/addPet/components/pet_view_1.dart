import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/addPet/select_breed.dart';

enum SelectedPet { dog, cat }

class AddPetView1 extends StatefulWidget {
  const AddPetView1({super.key});

  @override
  State<AddPetView1> createState() => _AddPetView1State();
}

class _AddPetView1State extends State<AddPetView1> {
  SelectedPet _selectedPet = SelectedPet.dog;
  @override
  Widget build(BuildContext context) {
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
              "What type of pet do you have?",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    _selectedPet = SelectedPet.dog;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          _selectedPet == SelectedPet.dog
                              ? AppConstants.dogPetSelected
                              : AppConstants.dogPetUnselected,
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      height: 240,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    _selectedPet = SelectedPet.cat;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          _selectedPet == SelectedPet.cat
                              ? AppConstants.catPetSelected
                              : AppConstants.catPetUnselected,
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      height: 240,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppConstants.skyContainerColor.withOpacity(.3),
            ),
            child: Text(
              "${_selectedPet == SelectedPet.dog ? "Dog" : "Cat"} breed Information",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SelectBreedView(),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        AppConstants.tealContainer,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Text(
                            "Afghan",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 24,
                        child: SvgPicture.asset(
                          AppConstants.forwardIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SelectBreedView(),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        AppConstants.blueContainer,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Text(
                            "Akita",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 24,
                        child: SvgPicture.asset(
                          AppConstants.forwardIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
