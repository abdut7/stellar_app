import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';

class TopSection extends StatefulWidget {
  const TopSection ({Key? key}) : super(key: key);

  @override
  State<TopSection > createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection > {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        color: SColors.color11,
        borderRadius: new BorderRadius.vertical(
            bottom: new Radius.elliptical(MediaQuery.of(context).size.width, 100.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(SSvgs.sv05, height: 50, width: 50,),
            const SizedBox(height: 10,),
             Text(
              'Discover', style: TextStyle(color: SColors.color12, fontSize: 24, fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }

}
