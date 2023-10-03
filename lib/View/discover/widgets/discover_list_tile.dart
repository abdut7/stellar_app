import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class DiscoverListTile extends StatelessWidget {
  final String title;
  final String svgAsset;
  final Function() onTap;

  DiscoverListTile({required this.title, required this.svgAsset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(svgAsset, height: 40, width: 40,),
      title:Text(
        title, style: TextStyle(
          color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.01,),
      ),
      trailing: Icon(Icons.arrow_forward_ios,color: SColors.color3,size: 17,),
    );
  }
}
