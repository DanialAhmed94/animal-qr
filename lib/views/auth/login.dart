import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/auth/sugnup.dart';
import 'package:http/http.dart' as http;
import 'package:pet_project/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  Future<void> _Login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://animal.animalqr.com/public/api/authin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final String token = responseBody['data']['response']['token'];
        final String authenticatedUserId = responseBody['data']['user']['id'];
        final String owned_qrs =  responseBody['data']['owned_qrs'];
        // Save the token using SharedPreferences
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token.toString());
        await prefs.setString('authenticatedUserId', authenticatedUserId.toString());
        await prefs.setString('owned_qrs', owned_qrs.toString());
        // If the server returns a 200 OK response, navigate to the login page.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        // If the server did not return a 200 OK response, display an error.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to Login. Please try again.')),
        );
      }
    }
  }
  // Future<void> _Login(BuildContext context) async {
  //   if (_formKey.currentState!.validate()) {
  //     final response = await http.post(
  //       Uri.parse('${AppConstants.baseUrl}/authin'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         'email': _emailController.text,
  //         'password': _passwordController.text,
  //       }),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double paddingValue = MediaQuery.of(context).size.width * 0.1;

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
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
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
                        "Welcome",
                        style: TextStyle(fontSize: 26, color: Colors.black),
                      ),
                    ),
                    Text(
                      "Sign in to your account with your email.",
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
                                  return 'Please enter your email';
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
                                setState(() {
                                  _showLogo = true;
                                });
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10,
                                ),
                                hintText: 'Your email',
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
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              focusNode: _passwordFocus,
                              onTap: () {
                                setState(() {
                                  _showLogo = false;
                                });
                              },
                              onEditingComplete: () {
                                setState(() {
                                  _showLogo = true;
                                });
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10,
                                ),
                                hintText: 'Password',
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
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Color(0xFF339FA8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: paddingValue,
                              right: paddingValue,
                            ),
                            child: GestureDetector(
                              onTap: (){
                                _Login(context);
                                print('login tapped');
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Login",
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
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  " Signup now",
                                  style: TextStyle(
                                    color: Color(0xFF339FA8),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
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
                top: MediaQuery.of(context).size.height * 0.4 - 50,
                left: MediaQuery.of(context).size.width * 0.5 - 50,
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
