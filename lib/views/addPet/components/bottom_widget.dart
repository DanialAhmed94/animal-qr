import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required this.currentIndex,
    required PageController pageController,
    required this.onBackPress,
  }) : _pageController = pageController;

  final int currentIndex;
  final PageController _pageController;
  final VoidCallback onBackPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackPress,
            child: Image.asset(AppConstants.back),
          ),
          GestureDetector(
            onTap: () {
              switch (currentIndex) {
                case 0:
                  break;
                case 1:
                  _pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                  break;
                case 2:
                  _pageController.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                  break;
                case 3:
                  _pageController.animateToPage(
                    4,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                  break;
                case 4:
                  _pageController.animateToPage(
                    5,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                  break;
                case 5:
                  _pageController.animateToPage(
                    6,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                  break;
                default:
              }
            },
            child: SvgPicture.asset(
              AppConstants.continueButton2,
            ),
          ),
        ],
      ),
    );
  }
}
