import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class TransactionTile extends StatefulWidget {
  final String title;
  final String id;
  final String timestamp;
  final String amount;
  final String status;
  final VoidCallback onTap;
  final String svgAssetPath;

  TransactionTile({
    required this.title,
    required this.id,
    required this.timestamp,
    required this.amount,
    required this.status,
    required this.onTap,
    required this.svgAssetPath,
  });

  @override
  _TransactionTileState createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: ShapeDecoration(
        color: SColors.color23,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          onTap: widget.onTap,
          leading: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SvgPicture.asset(widget.svgAssetPath),
          ),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w600,),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.id,
                style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500,),),
              Text(
                widget.timestamp, style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500,),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '+ AED ${widget.amount}',
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500,),),
              Text(
                widget.status,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Color(0xFF19AA33), fontSize: 10, fontWeight: FontWeight.w700,),),
            ],
          ),
        ),
      ),
    );
  }
}
