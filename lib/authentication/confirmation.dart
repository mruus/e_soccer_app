// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:e_soccer_app/authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constraints.dart';
import '../widgets.dart';
import 'signup.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Header Bar
              TopHeaderBar(size: size),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: size.width,
                      padding: EdgeInsets.only(bottom: 20.0),
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
                            'CHECK YOUR INBOX',
                            style: GoogleFonts.anton(
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: kBlueColorHex,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'We Have Sent You A 4-Digit Code To Your Email\nTo Verify That This Account Is Your Account ',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 63,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 3,
                                    color: kBlueColorHex,
                                  ),
                                ),
                                child: TextField(
                                  controller: TextEditingController()
                                    ..text = '0',
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: GoogleFonts.orelegaOne(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                      color: kBlueColorHex,
                                    ),
                                  ),
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                width: 63,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 3,
                                    color: kBlueColorHex,
                                  ),
                                ),
                                child: TextField(
                                  controller: TextEditingController()
                                    ..text = '0',
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: GoogleFonts.orelegaOne(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                      color: kBlueColorHex,
                                    ),
                                  ),
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                width: 63,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 3,
                                    color: krEDlIGHTBorderColor,
                                  ),
                                ),
                                child: TextField(
                                  controller: TextEditingController()
                                    ..text = '0',
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: GoogleFonts.orelegaOne(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                      color: krEDlIGHTBorderColor,
                                    ),
                                  ),
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                width: 63,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 3,
                                    color: krEDlIGHTBorderColor,
                                  ),
                                ),
                                child: TextField(
                                  controller: TextEditingController()
                                    ..text = '0',
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: GoogleFonts.orelegaOne(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                      color: krEDlIGHTBorderColor,
                                    ),
                                  ),
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 290,
                            height: 45,
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              color: kBlueColorHex,
                            ),
                            child: Center(
                              child: Text(
                                "VERIFY",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: kWhiteColorHex,
                                    fontWeight: FontWeight.bold,
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
                                ShortLinks(
                                  text1: "Do you wanna go back?",
                                  text2: 'GO BACK',
                                  onTapAction: () => {Get.to(LoginPage())},
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
