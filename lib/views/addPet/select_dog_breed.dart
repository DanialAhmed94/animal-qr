import 'package:flutter/material.dart';
import 'package:pet_project/modal/pet_modal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectDogBreedView extends StatelessWidget {
  Pet petData;
  SelectDogBreedView({required this.petData});

  @override
  Widget build(BuildContext context) {
    // Localized dog breed names
    final List<String> dogBreeds = [
      AppLocalizations.of(context)?.labradorRetriever ?? 'Labrador Retriever',
      AppLocalizations.of(context)?.germanShepherd ?? 'German Shepherd',
      AppLocalizations.of(context)?.goldenRetriever ?? 'Golden Retriever',
      AppLocalizations.of(context)?.bulldog ?? 'Bulldog',
      AppLocalizations.of(context)?.beagle ?? 'Beagle',
      AppLocalizations.of(context)?.poodle ?? 'Poodle',
      AppLocalizations.of(context)?.rottweiler ?? 'Rottweiler',
      AppLocalizations.of(context)?.yorkshireTerrier ?? 'Yorkshire Terrier',
      AppLocalizations.of(context)?.boxer ?? 'Boxer',
      AppLocalizations.of(context)?.dachshund ?? 'Dachshund',
      AppLocalizations.of(context)?.siberianHusky ?? 'Siberian Husky',
      AppLocalizations.of(context)?.greatDane ?? 'Great Dane',
      AppLocalizations.of(context)?.dobermanPinscher ?? 'Doberman Pinscher',
      AppLocalizations.of(context)?.australianShepherd ?? 'Australian Shepherd',
      AppLocalizations.of(context)?.shihTzu ?? 'Shih Tzu',
      AppLocalizations.of(context)?.bostonTerrier ?? 'Boston Terrier',
      AppLocalizations.of(context)?.pomeranian ?? 'Pomeranian',
      AppLocalizations.of(context)?.havanese ?? 'Havanese',
      AppLocalizations.of(context)?.shetlandSheepdog ?? 'Shetland Sheepdog',
      AppLocalizations.of(context)?.cavalierKingCharlesSpaniel ?? 'Cavalier King Charles Spaniel',
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)?.selectBreed ?? '',
        ),
      ),
      body: ListView(
        children: [
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      petData.petBreed = dogBreeds[index].toString();
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
            itemCount: dogBreeds.length,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pet_project/constants/app_constants.dart';
// import 'package:pet_project/modal/pet_modal.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class SelectDogBreedView extends StatelessWidget {
//   Pet petData;
//   SelectDogBreedView({required this.petData});
//
//   final List<String> dogBreeds = [
//     'Labrador Retriever',
//     'German Shepherd',
//     'Golden Retriever',
//     'Bulldog',
//     'Beagle',
//     'Poodle',
//     'Rottweiler',
//     'Yorkshire Terrier',
//     'Boxer',
//     'Dachshund',
//     'Siberian Husky',
//     'Great Dane',
//     'Doberman Pinscher',
//     'Australian Shepherd',
//     'Shih Tzu',
//     'Boston Terrier',
//     'Pomeranian',
//     'Havanese',
//     'Shetland Sheepdog',
//     'Cavalier King Charles Spaniel',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title:  Text(
//           "${AppLocalizations.of(context)?.selectBreed ?? ''}",
//         ),
//       ),
//       body: ListView(
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 40),
//           //   child: SearchAnchor(
//           //     builder: (context, controller) {
//           //       return const SearchBar(
//           //         hintText: "Search breeds",
//           //         backgroundColor: MaterialStatePropertyAll(Colors.white),
//           //         surfaceTintColor: MaterialStatePropertyAll(Colors.white),
//           //       );
//           //     },
//           //     suggestionsBuilder: (context, controller) {
//           //       return List.generate(
//           //         8,
//           //             (index) => const ListTile(
//           //           title: Text("Akita"),
//           //         ),
//           //       );
//           //     },
//           //     viewBackgroundColor: Colors.white,
//           //     viewSurfaceTintColor: Colors.white,
//           //   ),
//           // ),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
//           //   child: Material(
//           //     borderRadius: BorderRadius.circular(10),
//           //     surfaceTintColor: Colors.white,
//           //     elevation: 5,
//           //     color: Colors.white,
//           //     child: const Padding(
//           //       padding: EdgeInsets.symmetric(horizontal: 20),
//           //       child: TextField(
//           //         decoration: InputDecoration(
//           //           label: Text("Breed name"),
//           //           hintText: "Input breeds",
//           //           border: InputBorder.none,
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           ListView.builder(
//             primary: false,
//             shrinkWrap: true,
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             itemBuilder: (context, index) {
//               return  Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       petData.petBreed= dogBreeds[index].toString();
//                       Navigator.pop(context);
//                     },
//                     child: ListTile(
//                       visualDensity: VisualDensity.compact,
//                       title: Text(dogBreeds[index]),
//                     ),
//                   ),
//                   Divider(),
//                 ],
//               );
//             },
//             itemCount:  dogBreeds.length,
//           ),
//         ],
//       ),
//     );
//   }
// }
