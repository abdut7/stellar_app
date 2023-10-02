import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class AboutMeText extends StatefulWidget {
  const AboutMeText({Key? key}) : super(key: key);

  @override
  State<AboutMeText> createState() => _AboutMeTextState();
}

class _AboutMeTextState extends State<AboutMeText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'About Me\n',
              style: TextStyle(
                color: SColors.color3,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text:
                  'The availability of low-cost flights and last minute internet deals means that cheap holidays are far easier to come by than they used to be, but it can still take a bit of shopping around to get the best discounts.',
              style: TextStyle(
                color: SColors.color3,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
