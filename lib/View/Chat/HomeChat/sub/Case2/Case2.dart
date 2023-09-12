import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/widgets/appbarContainer.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Case2 extends StatefulWidget {
  const Case2({Key? key}) : super(key: key);

  @override
  State<Case2> createState() => _Case2State();
}

class _Case2State extends State<Case2> {
  Widget customTile(String text, Function() onTap, String svgAsset) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 35),
          leading: SvgPicture.asset(svgAsset),
          title: Text(
            text,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: ListView(
        children: [
          AppBarContainer(labelText: 'Contact'),
          const SearchTextField(),
          const SizedBox(height: 15,),
          customTile('New Friends', () {},SSvgs.sv19, ),
          customTile('Group Chats', () {},SSvgs.sv20, ),
          customTile('Tags', () {},SSvgs.sv21, ),
          customTile('File Transfer', () {},SSvgs.sv22, ),
          customTile('Stellar Chat Team', () {},SSvgs.sv23, ),

        ],
      ),
    );
  }
}
