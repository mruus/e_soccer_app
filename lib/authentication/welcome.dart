// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace
import 'package:e_soccer_app/authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constraints.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColorHex,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_glitches.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 114.0),
            child: Column(
              children: [
                // Welcome Text Widget
                Text(
                  'WELCOME',
                  style: GoogleFonts.anton(
                    textStyle: TextStyle(
                      fontSize: 58,
                    ),
                  ),
                ),

                // Spacer
                SizedBox(height: 7),

                // Description Text Widget
                Text(
                  'Never Miss A Goal - Get Live Match\nAlerts, Fixtures, And Results Of Your\nFavorite Teams And Competitions',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Spcer
                SizedBox(height: 36),

                // List indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LineIndictor(color: Color(0xFF2470A0)),
                    SizedBox(width: 4),
                    LineIndictor(color: Color(0xFFFAD3CF)),
                    SizedBox(width: 4),
                    LineIndictor(color: Color(0xFFFAD3CF)),
                  ],
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 90,
                      bottom: 19,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Sliding Images
                        Container(
                          width: 300,
                          height: 200,
                          child: SvgPicture.asset(
                            'assets/man_with_ball.svg',
                            color: kBlackColorHex,
                          ),
                        ),

                        // Buttton
                        Column(
                          children: [
                            Container(
                              width: 300,
                              height: 55,
                              child: OutlinedButton(
                                onPressed: () => Get.to(LoginPage()),
                                child: Text(
                                  "SING IN!",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: kBlackColorHex,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      width: 2.0,
                                      strokeAlign: StrokeAlign.inside,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8.0),
                              width: 300,
                              height: 55,
                              child: OutlinedButton(
                                onPressed: null,
                                child: Text(
                                  "SING UP!",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: kWhiteColorHex,
                                    ),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: kBlackColorHex,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LineIndictor extends StatelessWidget {
  const LineIndictor({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66.67,
      height: 2,
      decoration: BoxDecoration(color: color),
    );
  }
}
