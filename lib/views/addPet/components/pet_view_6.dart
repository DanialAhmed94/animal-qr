import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/pet_modal.dart';

class PetView6 extends StatefulWidget {
  Pet petData;
  PetView6({required this.petData});

  @override
  State<PetView6> createState() => _PetView6State();
}

class _PetView6State extends State<PetView6> {
  bool notify = true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.petData.notify = 1;
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Card(
            elevation: 4.0,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SvgPicture.asset(AppConstants.notifyMe),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notify Me",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 20),
                        ),
                        Text(
                          "Be notified when your tag is scanned",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: notify,
                    onChanged: (value) {
                      setState(() {
                        notify = value;
                        if(value){
                          widget.petData.notify = 1;
                        }
                        else{
                          widget.petData.notify = 0;

                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
