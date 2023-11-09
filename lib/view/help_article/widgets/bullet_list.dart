import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  BulletList(this.texts);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      widgetList.add(UnorderedListItem(text));
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        Expanded(
          child: Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
        ),
      ],
    );
  }
}