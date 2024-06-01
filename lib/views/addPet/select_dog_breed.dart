import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/pet_modal.dart';

class SelectDogBreedView extends StatelessWidget {
  Pet petData;
  SelectDogBreedView({required this.petData});

  final List<String> dogBreeds = [
    'Labrador Retriever',
    'German Shepherd',
    'Golden Retriever',
    'Bulldog',
    'Beagle',
    'Poodle',
    'Rottweiler',
    'Yorkshire Terrier',
    'Boxer',
    'Dachshund',
    'Siberian Husky',
    'Great Dane',
    'Doberman Pinscher',
    'Australian Shepherd',
    'Shih Tzu',
    'Boston Terrier',
    'Pomeranian',
    'Havanese',
    'Shetland Sheepdog',
    'Cavalier King Charles Spaniel',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Select Breed",
        ),
      ),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 40),
          //   child: SearchAnchor(
          //     builder: (context, controller) {
          //       return const SearchBar(
          //         hintText: "Search breeds",
          //         backgroundColor: MaterialStatePropertyAll(Colors.white),
          //         surfaceTintColor: MaterialStatePropertyAll(Colors.white),
          //       );
          //     },
          //     suggestionsBuilder: (context, controller) {
          //       return List.generate(
          //         8,
          //             (index) => const ListTile(
          //           title: Text("Akita"),
          //         ),
          //       );
          //     },
          //     viewBackgroundColor: Colors.white,
          //     viewSurfaceTintColor: Colors.white,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          //   child: Material(
          //     borderRadius: BorderRadius.circular(10),
          //     surfaceTintColor: Colors.white,
          //     elevation: 5,
          //     color: Colors.white,
          //     child: const Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 20),
          //       child: TextField(
          //         decoration: InputDecoration(
          //           label: Text("Breed name"),
          //           hintText: "Input breeds",
          //           border: InputBorder.none,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            itemBuilder: (context, index) {
              return  Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      petData.petBreed= dogBreeds[index].toString();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text(dogBreeds[index]),
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount:  dogBreeds.length,
          ),
        ],
      ),
    );
  }
}
