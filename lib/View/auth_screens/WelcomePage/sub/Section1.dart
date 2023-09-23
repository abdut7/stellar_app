import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Section1 extends StatefulWidget {
  const Section1({Key? key}) : super(key: key);

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
           SColors.color11,
           SColors.color12
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 350,
            left: 50,
            width: MediaQuery.of(context).size.width - 100,
            child: SvgPicture.asset(SSvgs.sv01,),
          ),
        ],
      ),
    );
  }
}
