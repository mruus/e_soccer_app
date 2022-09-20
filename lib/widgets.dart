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
