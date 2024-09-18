import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/auth/sugnup.dart';
import 'package:http/http.dart' as http;
import 'package:pet_project/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_view.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showLogo = true;
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showCircularProgress = false;

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> _Login(BuildContext context) async {
    // final SharedPreferences prefs1 = await SharedPreferences.getInstance();
    // String? token = await FirebaseMessaging.instance.getToken();
    // if (token != null) {
    //   await prefs1.setString('fcm_token', token);
    // }
    
    String password = _passwordController.text;
    String email = _emailController.text;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _showCircularProgress = true; // Show circular progress indicator
        });

        String? fcmToken = prefs.getString("fcm_token");
        print('Retrieved FCM Token from SharedPreferences: $fcmToken');

        final String url = AppConstants.baseUrl;
        //
        // final Map<String, dynamic> requestBody = {
        //   "device_token": fcmToken,
        //   "email": email,
        //   "password": password
        // };
        // final response  = await http.post(Uri.parse('$url/authin'),body: jsonEncode(requestBody));
        final response = await http.post(Uri.parse(
            '$url/authin?email=$email&password=$password&device_token=$fcmToken'));

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseBody = jsonDecode(response.body);
          final String token = responseBody['data']['response']['token'];
          final int authenticatedUserId = responseBody['data']['user']['id'];
          final int owned_qrs = responseBody['data']['owned_qrs'];

          // Save the token using SharedPreferences

          await prefs.setString('auth_token', token.toString());
          await prefs.setInt('authenticatedUserId', authenticatedUserId);
          await prefs.setInt('owned_qrs', owned_qrs);
          await prefs.setBool("isLoggedIn", true);
          setState(() {
            _showCircularProgress = false; // Hide circular progress indicator
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        } else {
          setState(() {
            _showCircularProgress = false; // Hide circular progress indicator
          });
          print('Failed to login: ${response.statusCode}');
          print('Response body: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${AppLocalizations.of(context)?.failedLogin ?? ''}")),
          );
        }
      } catch (error) {
        setState(() {
          _showCircularProgress = false; // Hide circular progress indicator
        });
        print('Error during login: $error');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${AppLocalizations.of(context)?.errorOccur ?? ''} $error',
              ),
            )

        );
      }
    }
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double paddingValue = MediaQuery
        .of(context)
        .size
        .width * 0.1;

    return WillPopScope(
      onWillPop: () async {
        if (_emailFocus.hasFocus || _passwordFocus.hasFocus) {
          setState(() {
            print("hiding logo");
            _showLogo = true;
            FocusScope.of(context).unfocus(); // Dismisses the keyboard
          });
          print("show logo set to true");
          return false; // Prevents app from being closed
        }
        return true; // Allows app to be closed
      },
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              'assets/svg/loginSvg.svg', // Path to your SVG file
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.6,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFFFAFAFA),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        "${AppLocalizations.of(context)?.welcome ?? ''}",
                        style: TextStyle(fontSize: 26, color: Colors.black),
                      ),
                    ),
                    Text(
                      "${AppLocalizations.of(context)?.signInToYourYaccount ?? ''}.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: paddingValue,
                              right: paddingValue,
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '${AppLocalizations.of(context)?.pleaseEnterYourEmail ?? ''}';
                                }
                                return null;
                              },
                              focusNode: _emailFocus,
                              onTap: () {
                                setState(() {
                                  _showLogo = false;
                                });
                              },
                              onEditingComplete: () {
                                _fieldFocusChange(
                                    context, _emailFocus, _passwordFocus);
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10,
                                ),
                                hintText: '${AppLocalizations.of(context)?.emailHint ?? ''}',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: paddingValue,
                              right: paddingValue,
                            ),
                            child: TextFormField(
                              obscureText: _obscureText,
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '${AppLocalizations.of(context)?.pleaseEnterYourPassword ?? ''}';
                                }
                                return null;
                              },
                              focusNode: _passwordFocus,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffix: GestureDetector(
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _obscureText =
                                      !_obscureText; // Toggle password visibility
                                    });
                                  },
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10,
                                ),
                                hintText:  '${AppLocalizations.of(context)?.passwordHint ?? ''}',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     left: paddingValue,
                          //     right: paddingValue,
                          //   ),
                          //   child: Text(
                          //     "Forgot Password",
                          //     style: TextStyle(
                          //       color: Color(0xFF339FA8),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: paddingValue,
                              right: paddingValue,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  child: Center(
                                    child: Text(
                                      '${AppLocalizations.of(context)?.login ?? ''}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppConstants.primaryColor,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        _Login(context);
                                        print('login tapped');
                                      },
                                    ),
                                  ),
                                ),
                                if (_showCircularProgress)
                                  CircularProgressIndicator(),
                                // Show circular progress indicator
                              ],
                            ),
                          ),

                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     left: paddingValue,
                          //     right: paddingValue,
                          //   ),
                          //   child: GestureDetector(
                          //     onTap: (){
                          //       _Login(context);
                          //       print('login tapped');
                          //     },
                          //     child: Container(
                          //       child: Center(
                          //         child: Text(
                          //           "Login",
                          //           textAlign: TextAlign.center,
                          //         ),
                          //       ),
                          //       height: 50,
                          //       width: double.infinity,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: AppConstants.primaryColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${AppLocalizations.of(context)?.dontHaveanAccount ?? ''}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  '${AppLocalizations.of(context)?.signupNow ?? ''}',
                                  style: TextStyle(
                                    color: Color(0xFF339FA8),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUP()));
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_showLogo)
              Positioned(
                top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4 - 50,
                left: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5 - 50,
                child: SvgPicture.asset(
                  "assets/svg/app_icon.svg",
                  height: 100,
                  width: 100,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:pet_project/constants/app_constants.dart';
//
// class Login extends StatefulWidget {
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _key = GlobalKey();
//   bool _showLogo = true;
//
//   @override
//   Widget build(BuildContext context) {
//     double paddingValue = MediaQuery.of(context).size.width * 0.1;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           SvgPicture.asset(
//             'assets/svg/loginSvg.svg', // Path to your SVG file
//             fit: BoxFit.cover,
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.6,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                 color: Color(0xFFFAFAFA),
//               ),
//               child: Column(
//                 //  mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 70),
//                     child: Text(
//                       "Welcome",
//                       style: TextStyle(fontSize: 26, color: Colors.black),
//                     ),
//                   ),
//                   Text(
//                     "Sign in to your account with your email.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Form(
//                       key: _key,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: paddingValue,
//                               right: paddingValue,
//                             ),
//                             child: TextFormField(
//                                 onTap: (){
//                                   setState(() {
//                                     _showLogo = false;
//                                   });
//                                 },
//                                 onEditingComplete: (){
//                                   setState(() {
//                                     _showLogo = true;
//                                   });
//                                 },
//                                 keyboardType: TextInputType.text,
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 10),
//                                   hintText: 'Your email',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: paddingValue,
//                               right: paddingValue,
//                             ),
//                             child: TextFormField(
//                               onTap: (){
//                                 setState(() {
//                                   _showLogo = false;
//                                 });
//                               },
//                                 onEditingComplete: (){
//                                 setState(() {
//                                   _showLogo = true;
//                                 });
//                                 },
//                                 keyboardType: TextInputType.text,
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 10),
//                                   hintText: 'Password',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: paddingValue,
//                               right: paddingValue,
//                             ),
//                             child: Text("Forgot Password",
//                                 style: TextStyle(
//                                   color: Color(0xFF339FA8),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.01,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: paddingValue,
//                               right: paddingValue,
//                             ),
//                             child: Container(
//                               child: Center(
//                                   child: Text(
//                                     "Login",
//                                     textAlign: TextAlign.center,
//                                   )),
//                               height: 50,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: AppConstants.primaryColor),
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("Don't have an account?",style: TextStyle(
//                                 color: Colors.black,
//                               ),),
//                               Text(
//                                 " Signup now",
//                                 style: TextStyle(
//                                   color: Color(0xFF339FA8),
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//           ),
//           if(_showLogo)
//           Positioned(
//             top: MediaQuery.of(context).size.height * 0.4 -
//                 50, // Adjust as needed
//             left: MediaQuery.of(context).size.width * 0.5 - 50,
//             child: SvgPicture.asset(
//               "assets/svg/app_icon.svg",
//               height: 100,
//               width: 100,
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
