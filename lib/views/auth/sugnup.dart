import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/auth/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding/decoding
import 'package:shared_preferences/shared_preferences.dart';

class SignUP extends StatelessWidget {
  SignUP({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  Future<void> _signUp(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        final response = await http.post(
          Uri.parse(
              '${AppConstants.baseUrl}/authup?first_name=${_firstNameController.text}&last_name=${_lastNameController.text}&email=${_emailController.text}&password=${_passwordController.text}'),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Account created successfully.')),
          );
          // // If the server returns a 200 OK response, navigate to the login page.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        } else {
          // If the server did not return a 200 OK response, display an error.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to sign up. Please try again.')),
          );
        }
      }
    } catch (error) {
      print('Error during login: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during registration.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingValue = MediaQuery.of(context).size.width * 0.1;
    double leftPadding = MediaQuery.of(context).size.width * 0.05;
    double rightPadding = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/SignUp.svg', // Path to your SVG file
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                // color: Colors.redAccent,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: leftPadding, right: rightPadding),
                    child: Text(
                      "Welcome! Please enter your information below and get started.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
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
                            controller: _firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10,
                              ),
                              hintText: 'First name',
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
                            controller: _lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10,
                              ),
                              hintText: 'Last name',
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
                            focusNode: _emailFocus,
                            controller: _emailController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
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
                            focusNode: _passwordFocus,
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: paddingValue,
                            right: paddingValue,
                          ),
                          child: GestureDetector(
                            onTap: () => _signUp(context),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Signup",
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
                              "Already  have an account?",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                " Login now",
                                style: TextStyle(
                                  color: Color(0xFF339FA8),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
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
        ],
      ),
    );
  }
}
