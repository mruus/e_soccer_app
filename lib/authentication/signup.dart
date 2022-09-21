// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:e_soccer_app/authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constraints.dart';
import '../widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_glitches.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Header Bar
              TopHeaderBar(size: size),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: size.width,
                      // padding: EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: kWhiteColorHex,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kBlackColorHex.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            'CREATE ACCOUNT',
                            style: GoogleFonts.anton(
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: kBlueColorHex,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Please Fill Out All Fields Below To Enjoy The Beauty\nOf E-Soccer Application',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: kBlackColorHex,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 290,
                            height: 45,
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(
                                width: 1,
                                color: kBlackBorderColorHex,
                              ),
                            ),
                            child: TextField(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              cursorColor: kBlackColorHex,
                              // cursorWidth: 0.5,
                              // cursorHeight: 15,
                              // showCursor: true,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 290,
                            height: 45,
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(
                                width: 1,
                                color: kBlackBorderColorHex,
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              cursorColor: kBlackColorHex,
                              // cursorWidth: 0.5,
                              // cursorHeight: 15,
                              // showCursor: true,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 290,
                            height: 45,
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(
                                width: 1,
                                color: kBlackBorderColorHex,
                              ),
                            ),
                            child: TextField(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              cursorColor: kBlackColorHex,
                              // cursorWidth: 0.5,
                              // cursorHeight: 15,
                              // showCursor: true,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 290,
                            height: 45,
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(
                                width: 1,
                                color: kBlackBorderColorHex,
                              ),
                            ),
                            child: TextField(
                              obscureText: true,
                              obscuringCharacter: '*',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              cursorColor: kBlackColorHex,
                              cursorWidth: 0.5,
                              cursorHeight: 15,
                              // showCursor: true,
                              decoration: InputDecoration(
                                hintText: 'Passcode',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              print("----");
                              var client = http.Client();

                              var response = client.get(Uri.parse(
                                  "http://127.0.0.1:8000/student_api/login?Email=hiss@hiss.com&Password=123"));

                              print(response);

                              Get.snackbar("Abdi", "Hello");
                            },
                            child: Container(
                              width: 290,
                              height: 45,
                              padding: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: kBlueColorHex,
                              ),
                              child: Center(
                                child: Text(
                                  "SIGN UP",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: kWhiteColorHex,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 290,
                            margin: EdgeInsets.only(top: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 2,
                                      color: kBlueColorHex,
                                    ),
                                    Text(
                                      "OR",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: kBlueColorHex,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 2,
                                      color: kBlueColorHex,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                SignWithOtherAccounts(
                                  svgPicture: SvgPicture.asset(
                                    'assets/google.svg',
                                    color: kWhiteColorHex,
                                  ),
                                  backColor: kGoogleColor,
                                  iconBackColor: kGoogleBorderColor,
                                  labelText: 'Continue with Google',
                                ),
                                SizedBox(height: 24),
                                SignWithOtherAccounts(
                                  svgPicture: SvgPicture.asset(
                                    'assets/google.svg',
                                    color: kWhiteColorHex,
                                  ),
                                  backColor: kFacebookColor,
                                  iconBackColor: kFacebookBorderColor,
                                  labelText: 'Continue with Facebook',
                                ),
                                SizedBox(height: 15),
                                ShortLinks(
                                  text1: "Already have an account?",
                                  text2: 'SIGN IN',
                                  onTapAction: () => Get.to(LoginPage()),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
