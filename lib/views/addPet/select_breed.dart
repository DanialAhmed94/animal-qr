import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../modal/pet_modal.dart';

class SelectBreedView extends StatelessWidget {
  final Pet petData;

  SelectBreedView({required this.petData});

  @override
  Widget build(BuildContext context) {
    // Fetch localized breed names directly from AppLocalizations
    List<String> catBreeds = [
      AppLocalizations.of(context)!.ragDoll,
      AppLocalizations.of(context)!.manieCoon,
      AppLocalizations.of(context)!.devonRex,
      AppLocalizations.of(context)!.exoticShorthair,
      AppLocalizations.of(context)!.persian,
      AppLocalizations.of(context)!.britishShorthair,
      AppLocalizations.of(context)!.abyssinian,
      AppLocalizations.of(context)!.scottishFold,
      AppLocalizations.of(context)!.sphynx,
      AppLocalizations.of(context)!.siberian,
      AppLocalizations.of(context)!.americanShorthair,
      AppLocalizations.of(context)!.bengal,
      AppLocalizations.of(context)!.russianBlue,
      AppLocalizations.of(context)!.norwegianCat,
      AppLocalizations.of(context)!.orientalShorthair,
      AppLocalizations.of(context)!.siamese,
      AppLocalizations.of(context)!.cornishRex,
      AppLocalizations.of(context)!.selkirkRex,
      AppLocalizations.of(context)!.burmese,
      AppLocalizations.of(context)!.tonkinese,
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)?.selectBreed ?? '',
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        itemCount: catBreeds.length,
        itemBuilder: (context, index) {
          String breedName = catBreeds[index]; // Directly using localized breed name

          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  petData.petBreed = breedName; // Set the selected breed
                  Navigator.pop(context);
                },
                child: ListTile(
                  visualDensity: VisualDensity.compact,
                  title: Text(breedName), // Show localized breed name
                ),
              ),
              const Divider(),
            ],
          );
        },
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
// class SelectBreedView extends StatelessWidget {
//    Pet petData;
//    SelectBreedView({required this.petData});
//    List<String> catBreeds = [
//      'ragdoll',
//      'maineCoon',
//      'devonRex',
//      'exoticShorthair',
//      'persian',
//      'britishShorthair',
//      'abyssinian',
//      'scottishFold',
//      'sphynx',
//      'siberian',
//      'americanShorthair',
//      'bengal',
//      'russianBlue',
//      'norwegianForestCat',
//      'orientalShorthair',
//      'siamese',
//      'cornishRex',
//      'selkirkRex',
//      'burmese',
//      'tonkinese',
//    ];
//    Map<String, String> getBreedNames(BuildContext context) {
//      return {
//        'ragdoll': AppLocalizations.of(context)!.ragDoll,
//        'maineCoon': AppLocalizations.of(context)!.manieCoon,
//        'devonRex': AppLocalizations.of(context)!.devonRex,
//        'exoticShorthair': AppLocalizations.of(context)!.exoticShorthair,
//        'persian': AppLocalizations.of(context)!.persian,
//        'britishShorthair': AppLocalizations.of(context)!.britishShorthair,
//        'abyssinian': AppLocalizations.of(context)!.abyssinian,
//        'scottishFold': AppLocalizations.of(context)!.scottishFold,
//        'sphynx': AppLocalizations.of(context)!.sphynx,
//        'siberian': AppLocalizations.of(context)!.siberian,
//        'americanShorthair': AppLocalizations.of(context)!.americanShorthair,
//        'bengal': AppLocalizations.of(context)!.bengal,
//        'russianBlue': AppLocalizations.of(context)!.russianBlue,
//        'norwegianForestCat': AppLocalizations.of(context)!.norwegianCat,
//        'orientalShorthair': AppLocalizations.of(context)!.orientalShorthair,
//        'siamese': AppLocalizations.of(context)!.siamese,
//        'cornishRex': AppLocalizations.of(context)!.cornishRex,
//        'selkirkRex': AppLocalizations.of(context)!.selkirkRex,
//        'burmese': AppLocalizations.of(context)!.burmese,
//        'tonkinese': AppLocalizations.of(context)!.tonkinese,
//      };
//    }
//
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
//           ListView.builder(
//             primary: false,
//             shrinkWrap: true,
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             itemCount: catBreeds.length,
//             itemBuilder: (context, index) {
//               String breedKey = catBreeds[index];
//               Map<String, String> breedNames = getBreedNames(context);
//               String breedName = breedNames[breedKey] ?? breedKey;
//               return Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       petData.petBreed = breedName;
//                       Navigator.pop(context);
//                     },
//                     child: ListTile(
//                       visualDensity: VisualDensity.compact,
//                       title: Text(breedName),
//                     ),
//                   ),
//                   const Divider(),
//                 ],
//               );
//             },
//           ),
//
//           // ListView.builder(
//           //   primary: false,
//           //   shrinkWrap: true,
//           //   padding: const EdgeInsets.symmetric(horizontal: 40),
//           //   itemBuilder: (context, index) {
//           //     return  Column(
//           //       children: [
//           //         GestureDetector(
//           //           onTap: () {
//           //             petData.petBreed= catBreeds[index].toString();
//           //             Navigator.pop(context);
//           //           },
//           //           child: ListTile(
//           //             visualDensity: VisualDensity.compact,
//           //             title: Text(catBreeds[index]),
//           //           ),
//           //         ),
//           //         Divider(),
//           //       ],
//           //     );
//           //   },
//           //   itemCount:  catBreeds.length,
//           // ),
//         ],
//       ),
//     );
//   }
// }
