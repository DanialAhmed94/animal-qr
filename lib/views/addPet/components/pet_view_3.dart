import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';

class PetView3 extends StatelessWidget {
  const PetView3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppConstants.skyContainerColor.withOpacity(.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pet Details",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Please provide details about your pet\nThis information will assist with\n identification in the future",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Image.asset(
            AppConstants.addImage,
          ),
          Text(
            "Upload a Picture",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 18,
          ),
          Card(
            elevation: 8.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 31.0,
                horizontal: 22,
              ),
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          label: const Text("Pet Name"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.idIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          label: const Text("Date of Birth"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.calenderIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          label: const Text("Instagram Username"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.instagramIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          label: const Text("Tiktok Username"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.tiktokIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
