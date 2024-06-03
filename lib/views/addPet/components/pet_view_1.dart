import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/addPet/select_breed.dart';
import 'package:pet_project/views/addPet/select_dog_breed.dart';

import '../../../modal/pet_modal.dart';

enum SelectedPet { dog, cat }

class AddPetView1 extends StatefulWidget {

  Pet petData;
  AddPetView1({required this.petData});
  @override
  State<AddPetView1> createState() => _AddPetView1State();
}

class _AddPetView1State extends State<AddPetView1> {

  SelectedPet _selectedPet = SelectedPet.dog;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.petData.petType = "Dog";
  }
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
                    widget.petData.petType = "Dog";
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
                    widget.petData.petType = "Cat";
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
                        builder: (context) =>  SelectDogBreedView(petData: widget.petData,),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Dog Breeds",
                              style: TextStyle(color: Colors.white,fontSize: 22),
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .titleLarge
                              //     ?.copyWith(
                              //       color: Colors.white,
                              //     ),
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
                        builder: (context) =>  SelectBreedView(petData: widget.petData,),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Cat Breeds",
                              style: TextStyle(color: Colors.white,fontSize: 22),
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .titleLarge
                              //     ?.copyWith(
                              //       color: Colors.white,
                              //     ),
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
