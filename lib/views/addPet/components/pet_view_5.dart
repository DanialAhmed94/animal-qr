import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/pet_modal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Weight { lbs, kg }

class PetView5 extends StatefulWidget {
  Pet petData;
  PetView5({required this.petData});

  @override
  State<PetView5> createState() => _PetView5State();
}

class _PetView5State extends State<PetView5> {
  Weight weight = Weight.lbs;
  int _counter = 1;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.petData.weight = 1;
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 13,
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
                  "${AppLocalizations.of(context)?.currentWeight ?? ''}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "${AppLocalizations.of(context)?.pleaseProvidePetWeight ?? ''}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _counter--;
                    widget.petData.weight = _counter;
                  });
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "$_counter",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 100,
                    ),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                    widget.petData.weight = _counter;
                  });
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SegmentedButton<Weight>(
            segments: const [
              ButtonSegment(
                value: Weight.lbs,
                label: Text("LBS"),
              ),
              ButtonSegment(
                value: Weight.kg,
                label: Text("KG"),
              ),
            ],
            selected: {weight},
            onSelectionChanged: (selected) {
              setState(() {
                weight = selected.first;
              });
            },
          ),
        ],
      ),
    );
  }
}
