import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_constants.dart';

enum Gender { male, female }

class PetView2 extends StatefulWidget {
  const PetView2({super.key});

  @override
  State<PetView2> createState() => _PetView2State();
}

class _PetView2State extends State<PetView2> {
  Gender _gender = Gender.male;
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
              "Gender",
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
                    });
                  },
                  child: Image.asset(
                    _gender == Gender.male
                        ? AppConstants.maleDogSelected
                        : AppConstants.maleDogUnselected,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _gender = Gender.female;
                    });
                  },
                  child: Image.asset(
                    _gender == Gender.female
                        ? AppConstants.femaleCatSelected
                        : AppConstants.femaleCatUnselected,
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
