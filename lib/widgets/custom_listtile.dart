import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String text;
  final String subtitle;
  final Function() onPressed;

  CustomListTile({required this.text, required this.subtitle, required this.onPressed});

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration: ShapeDecoration(
            color: SColors.color14,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        title: Text(widget.text,style: TextStyle(fontSize: 15,color: SColors.color3),),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(fontSize: 11,color:SColors.color3),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios, size: 20,color: SColors.color3,),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
