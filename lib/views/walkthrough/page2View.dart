import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../auth/login.dart';

class WalkthroughSecondPage extends StatelessWidget {
  final Future<void> Function() onNext; // Change to Future<void>

  const WalkthroughSecondPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          "assets/walkthrough/walkthrough2.png",
          fit: BoxFit.cover,
        )),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: 16,
            child: Container(
   //            color: Colors.red,
              height: 150,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Text(
                    "${AppLocalizations.of(context)?.findThePerfect}",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "PlusJakartaSansExtrabold",
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "${AppLocalizations.of(context)?.pet}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "PlusJakartaSansExtrabold",
                              fontSize: 30),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset("assets/walkthrough/litleCat.png",height: 50,width: 50,),
                      Flexible(
                        child: Text(
                          "${AppLocalizations.of(context)?.forYou}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "PlusJakartaSansExtrabold",
                              fontSize: 30),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Positioned(
          top: 90,
          right: 30,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            ),
            child: Text(
              "${AppLocalizations.of(context)?.skip}",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        Positioned(
          child: _buildSlideButton(context),
          bottom: 16,
          left: 0,
          right: 0,
        )
      ],
    );
  }

  Widget _buildSlideButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SlideAction(
        onSubmit: onNext,
        elevation: 0.0,
        text: AppLocalizations.of(context)?.next,
        // alignment: Alignment.bottomLeft,
        submittedIcon: null,
        sliderButtonIcon: SvgPicture.asset(
          AppConstants.sliderIcon,
          fit: BoxFit.fill,
          height: 30,
        ),
        outerColor: AppConstants.primaryColor,
        textColor: Colors.black,
        innerColor: Colors.black,
        sliderRotate: false,
      ),
    );
  }
}
