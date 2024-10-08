import 'package:flutter/material.dart';
import 'package:pet_project/views/walkthrough/page1View.dart';
import 'package:pet_project/views/walkthrough/page2View.dart';
import 'package:pet_project/views/walkthrough/page3View.dart';

import '../auth/login.dart';

class WalkthroughView extends StatefulWidget {
  const WalkthroughView({super.key});

  @override
  State<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<WalkthroughView> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: 3, // Total number of pages
        itemBuilder: (context, index) {
          return _buildPage(context, index);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        return WalkthroughFirstPage(onNext: () async {
          _pageController.animateToPage(
            index + 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        });
      case 1:
        return WalkthroughSecondPage(onNext: () async {
          _pageController.animateToPage(
            index + 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        });
      case 2:
      default:
        return WalkthroughThirdPage(onNext: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>  Login(),
            ),
          );
        });
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pet_project/constants/app_constants.dart';
// import 'package:pet_project/views/auth/login.dart';
// import 'package:pet_project/views/home/home_view.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class WalkthroughView extends StatefulWidget {
//   const WalkthroughView({super.key});
//
//   @override
//   State<WalkthroughView> createState() => _WalkthroughViewState();
// }
//
// class _WalkthroughViewState extends State<WalkthroughView> {
//   late final PageController _pageController;
//
//   final List<String> _images = const [
//     AppConstants.walkthroughPage1,
//     AppConstants.walkthroughPage2,
//     AppConstants.walkthroughPage3,
//   ];
//
//   @override
//   void initState() {
//     _pageController = PageController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: _pageController,
//         itemBuilder: (context, index) {
//           return ImageContainer(
//             image: _images[index],
//             onSlide: () async {
//               if (index == 2) {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) =>  Login(),
//                   ),
//                 );
//               }
//               _pageController.animateToPage(
//                 index + 1,
//                 duration: const Duration(milliseconds: 400),
//                 curve: Curves.easeIn,
//               );
//             },
//           );
//         },
//         itemCount: _images.length,
//       ),
//     );
//   }
// }
//
// class ImageContainer extends StatelessWidget {
//   final String image;
//   final Future<dynamic> Function() onSlide;
//
//   const ImageContainer({
//     super.key,
//     required this.image,
//     required this.onSlide,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Column(
//                   children: [
//                     SlideAction(
//                       onSubmit: onSlide,
//                       elevation: 0.0,
//                       text: AppLocalizations.of(context)?.next,
//                       // alignment: Alignment.bottomLeft,
//                       submittedIcon: null,
//                       sliderButtonIcon: SvgPicture.asset(
//                         AppConstants.sliderIcon,
//                         fit: BoxFit.fill,
//                         height: 30,
//                       ),
//                       outerColor: AppConstants.primaryColor,
//                       textColor: Colors.black,
//                       innerColor: Colors.black,
//                       sliderRotate: false,
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 90,
//           right: 30,
//           child: GestureDetector(
//             onTap: () => Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) =>  Login(),
//               ),
//             ),
//             child: Text(
//               "Skip",
//               style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                     color: Colors.white,
//                   ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
