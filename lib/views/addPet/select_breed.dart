import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/pet_modal.dart';

class SelectBreedView extends StatelessWidget {
   Pet petData;
   SelectBreedView({required this.petData});
   List<String> catBreeds = [
    'Ragdoll',
    'Maine Coon',
    'Devon Rex',
    'Exotic Shorthair',
    'Persian',
    'British Shorthair',
    'Abyssinian',
    'Scottish Fold',
    'Sphynx',
    'Siberian',
    'American Shorthair',
    'Bengal',
    'Russian Blue',
    'Norwegian Forest Cat',
    'Oriental Shorthair',
    'Siamese',
    'Cornish Rex',
    'Selkirk Rex',
    'Burmese',
    'Tonkinese',
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
          //         (index) => const ListTile(
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
                      petData.petBreed= catBreeds[index].toString();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text(catBreeds[index]),
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount:  catBreeds.length,
          ),
        ],
      ),
    );
  }
}
