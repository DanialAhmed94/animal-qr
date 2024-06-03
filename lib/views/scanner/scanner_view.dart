import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/scanner/qr_camScanner.dart';
import 'package:pet_project/views/scanner/scanner_detail_view.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 64,
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 4.0,
                    color: AppConstants.appBarLightYellow,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(34),
                        bottomRight: Radius.circular(34),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Scan Device",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 20.0,
                                ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "SCAN QR",
                      // scan me now
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 20.0,
                          ),
                    ),
                    // Text(
                    //   "I JUST WANT TO GO HOME",
                    //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    //         fontSize: 20.0,
                    //       ),
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        SvgPicture.asset(
                          AppConstants.scanBig,
                        ),
                        Positioned(
                          left: 0.0,
                          right: 0.0,
                          child: Image.asset(
                            AppConstants.barCodeIcon2,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Image.asset(
                AppConstants.dog2,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: AppConstants.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppConstants.sunIcon,color: AppConstants.primaryColor,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppConstants.undoIcon,color: AppConstants.primaryColor,),
              label: "",
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => QRScannerView()));
          //   MaterialPageRoute(
          //     builder: (context) => const ScannerDetailView(),
          //   ),
          // );
        },
        child: Card(
          shape: const CircleBorder(),
          child: SizedBox(
            height: 80,
            width: 80,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                AppConstants.barCodeIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
