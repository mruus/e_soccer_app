// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:e_soccer_app/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TopHeaderBar extends StatelessWidget {
  const TopHeaderBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.only(
        top: 40.0,
        left: 20.0,
      ),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              'assets/logo.svg',
              color: kBlackColorHex,
            ),
          ),
          SizedBox(width: 12),
          Text(
            'ESOCCER',
            style: GoogleFonts.bebasNeue(
              textStyle: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShortLinks extends StatelessWidget {
  const ShortLinks({
    Key? key,
    required this.text1,
    required this.text2,
    required this.onTapAction,
  }) : super(key: key);
  final String text1, text2;
  final Function()? onTapAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: kBlackColorHex,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapAction,
            child: Text(
              text2,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: kBlackColorHex,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignWithOtherAccounts extends StatelessWidget {
  const SignWithOtherAccounts({
    Key? key,
    required this.labelText,
    required this.svgPicture,
    required this.backColor,
    required this.iconBackColor,
  }) : super(key: key);
  final String labelText;
  final SvgPicture svgPicture;
  final Color backColor;
  final Color iconBackColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 45,
      padding: EdgeInsets.only(left: 20),
      color: backColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColorHex,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 50,
              height: 45,
              color: iconBackColor,
              child: Center(
                child: svgPicture,
              ),
            ),
          )
        ],
      ),
    );
  }
}
