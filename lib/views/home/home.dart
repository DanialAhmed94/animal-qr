import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet_project/api/getdashBoard.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/modal/dashboard_model.dart';
import 'package:pet_project/views/addPet/add_pet.dart';
import 'package:pet_project/views/home/widgets/all_pets_view.dart';
import 'package:pet_project/views/home/widgets/info_card.dart';
import 'package:tuple/tuple.dart';

import '../scanner/scanner_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tuple2<User, int>>(
        future: getDashBoard(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasError) {
        return Center(child: Text("error ${snapshot.error}"),);
      }
      else {
        final Tuple2<User, int>? data = snapshot.data;
        final User _user = data!.item1;
        final int _ownedQrs = data.item2;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            leadingWidth: 40.0,
            // leading: Padding(
            //   padding: const EdgeInsets.only(left: 14.0),
            //   child: SvgPicture.asset(
            //     AppConstants.drawerIcon,
            //     fit: BoxFit.contain,
            //   ),
            // ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: SvgPicture.asset(AppConstants.notificationIcon),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi ${_user.firstName} 🙌",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.black, fontSize: 26),
                        textAlign: TextAlign.left,
                      ),
                      // Text(
                      //   "Good Morning!!",
                      //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      //     color: Colors.grey[500],
                      //     fontSize: 16.0,
                      //   ),
                      //   textAlign: TextAlign.left,
                      // ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppConstants.appIcon,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppConstants.homeInfo,
                      ),
                      fit: BoxFit.cover),
                  // color: Colors.red,
                ),
                // height: 20,
                padding:
                const EdgeInsets.only(top: 14, left: 40, right: 40, bottom: 20),

                width: double.infinity,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        Card(
                                          elevation: 4.0,
                                          shape: const CircleBorder(),
                                          child: CircleAvatar(
                                            radius: 28,
                                            // backgroundColor: Colors.grey,
                                            child: Image.asset(
                                                AppConstants.exAvatarnew),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0.0,
                                          right: 5.0,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            padding: const EdgeInsets.all(1),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle,
                                              ),
                                              padding: const EdgeInsets.all(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "${_user.firstName}",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        // Text(
                                        //   "Taban",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .titleSmall,
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                    color: Colors.blue[600],
                                  ),
                                  margin: const EdgeInsets.only(right: 20.0),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Member",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 78,
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Phone Number",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .titleSmall
                          //           ?.copyWith(
                          //               color: Colors.grey[700], fontSize: 9),
                          //     ),
                          //     Text(
                          //       "+91455949493",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .titleSmall
                          //           ?.copyWith(fontSize: 9),
                          //     ),
                          //   ],
                          // ),
                          // Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Email",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                    color: Colors.grey[700], fontSize: 9),
                              ),
                              Text(
                                "${_user.email}",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 9),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 36,
                        ),
                        Text(
                          "Member Since ${DateFormat('MMM, yyyy').format(
                              _user.createdAt)}",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                            fontSize: 12.0,
                          ),
                        ),
                        // const Spacer(),
                        // SvgPicture.asset(
                        //   AppConstants.editButton,
                        // ),
                        const SizedBox(
                          width: 26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
               InfoCard(
                imagePath: AppConstants.connectedTags,
                imageBackgroundColor: AppConstants.lightGreenColor,
                title: "TOTAL DEVICES",
                count: "$_ownedQrs",
                percentColor: AppConstants.deepGreenColor,
                percentCount: "4%",
                trailingText: "Connected Tags",
                progressIndicatorValue: 1,
                progressIndicatorBarColor: AppConstants.deepGreenColor,
                progressIndicatorBackgroundColor: AppConstants.lightGreenColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const InfoCard(
                imagePath: AppConstants.notificationBell,
                imageBackgroundColor: AppConstants.lightBlueColor,
                title: "NOTIFICATIONS",
                count: "0",
                percentColor: AppConstants.deepBlueColor,
                percentCount: "43%",
                trailingText: "Unread",
                progressIndicatorValue: 1,
                progressIndicatorBarColor: AppConstants.deepBlueColor,
                progressIndicatorBackgroundColor: AppConstants.lightBlueColor,
              ),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   height: 100,
              //   child: PageView.builder(
              //     itemBuilder: (context, index) {
              //       return Image.asset(
              //         AppConstants.sample1,
              //       );
              //     },
              //     itemCount: 3,
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Pets",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 20.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppConstants.shortDividerColor,
                        ),
                        width: 70,
                        height: 8.0,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>UserPetsView()));
                    },
                    child: SvgPicture.asset(
                      AppConstants.viewAll,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: SizedBox(
                  height: 225,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        children: [
                          const Spacer(),
                         _ownedQrs>0 ?
                          Text(
                            "Add more devices",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                              fontSize: 16.0,
                            ),
                          ):
                             Column(children: [
                               Text(
                               "You haven't connected any pets",
                               style: Theme
                                   .of(context)
                                   .textTheme
                                   .titleSmall
                                   ?.copyWith(
                                 fontSize: 16.0,
                               ),
                             ),
                               Text(
                                 "Add your first pet.",
                                 style: Theme
                                     .of(context)
                                     .textTheme
                                     .titleSmall
                                     ?.copyWith(
                                   fontSize: 16.0,
                                 ),
                               ),],),

                          const Spacer(),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => ScannerView())),
                            // onTap: () => Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const AddPetView(),
                            //   ),
                            // ),
                            child: SvgPicture.asset(
                              AppConstants.addPet,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 16,
                        child: Image.asset(
                          AppConstants.dog,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        );
      }
    });
  }
}
