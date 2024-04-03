import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:pet_project/constants/app_constants.dart';

class ScannerDetailView extends StatelessWidget {
  const ScannerDetailView({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 54,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 62.0),
                    child: Row(
                      children: [
                        Text(
                          "Parents:",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 16,
                                    color: const Color(0xFF2A5F6B),
                                  ),
                        ),
                        Text(
                          "Ryan, Claire",
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
                          "Ajf lsdkfjdf slofijdsfnj lojfdlf oweifjef owefih",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: const Color(0xFF707070), fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      "About Odie",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
                      "I like hang out and adventure if you find me, please bring me back to my parents! I'm super nice.",
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
                        vertical: 10, horizontal: 22),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
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
                                "Female",
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
                                "5 Years",
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
                                "Dog",
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
                      vertical: 15,
                      horizontal: 18,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 60),
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
                                  "German Shephard",
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
                                  "12/15/2018",
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
                                  "9.5kg",
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
                                const Text(
                                  "@Animal QR",
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
                                const Text(
                                  "@Animal QR",
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
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                AppConstants.backIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
