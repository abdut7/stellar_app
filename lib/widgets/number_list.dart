import 'package:flutter/material.dart';

class NumberList extends StatelessWidget {
  NumberList(this.texts);
  final List<dynamic> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    int counter = 0;
    for (var text in texts) {
      counter++;
      widgetList.add(OrderedListItem(counter, text));
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class OrderedListItem extends StatelessWidget {
  OrderedListItem(this.counter, this.text);
  final int counter;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$counter. ",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
        Expanded(
          child: Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
        ),
      ],
    );
  }
}