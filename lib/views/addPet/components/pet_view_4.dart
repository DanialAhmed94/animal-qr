import 'package:flutter/material.dart';

import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/pet_modal.dart';

class PetView4 extends StatefulWidget {
  Pet petData;
  PetView4({required this.petData});

  @override
  State<PetView4> createState() => _PetView4State();
}

class _PetView4State extends State<PetView4> {
 late TextEditingController _behaviourController;
 late TextEditingController _anxietyController;
 late TextEditingController _dietController;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _behaviourController = TextEditingController();
    _dietController= TextEditingController();
    _anxietyController = TextEditingController();
    widget.petData.vaccination = 1;
    widget.petData.spayed = 1;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _dietController.dispose();
    _anxietyController.dispose();
    _behaviourController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppConstants.skyContainerColor.withOpacity(.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Health Summary",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Access further options upon profile creation",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 4.0,
                    child: SizedBox(
                      height: 155,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 18.0,
                              ),
                              Text(
                                "Vaccination",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          Text(
                            "Vaccination for Rabies",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        widget.petData.vaccination = 1;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 10),
                                        child: Text(
                                          "Yes",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        widget.petData.vaccination = 0;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 12),
                                        child: Text(
                                          "No",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Card(
                    elevation: 4.0,
                    child: SizedBox(
                      height: 155,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 18.0,
                          ),
                          Text(
                            "Neutered/\nSpayed",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        widget.petData.spayed = 1;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 10),
                                        child: Text(
                                          "Yes",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        widget.petData.spayed = 0;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 12),
                                        child: Text(
                                          "No",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppConstants.appBarLightYellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8.0),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(10),
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  color: Colors.white,
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _behaviourController,
                      onChanged: (value){
                        widget.petData.behaviour = value;
                      },
                      //readOnly: true,
                      decoration: InputDecoration(
                        label: Text("Behavior"),
                        border: InputBorder.none,
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
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _anxietyController,
                      onChanged: (value){
                        widget.petData.anxiety = value;
                     },
                     // readOnly: true,
                      decoration: InputDecoration(
                        label: Text("Anxiety"),
                        border: InputBorder.none,
                        // suffixIcon: Icon(
                        //   Icons.arrow_forward_ios_rounded,
                        // ),
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
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _dietController,
                      onChanged: (value){
                        widget.petData.diet = value;
                      },
                      //readOnly: true,
                      decoration: InputDecoration(
                        label: Text("Diet"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
