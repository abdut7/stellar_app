import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';

class SendOrRequestMoneyButtons extends StatefulWidget {
  final Function() onSendMoneyTap;
  final Function() onRequestMoneyTap;
  final String sendMoneyText;
  final String requestMoneyText;

  SendOrRequestMoneyButtons({
    required this.onSendMoneyTap,
    required this.onRequestMoneyTap,
    required this.sendMoneyText,
    required this.requestMoneyText,
  });

  @override
  _SendOrRequestMoneyButtonsState createState() =>
      _SendOrRequestMoneyButtonsState();
}

class _SendOrRequestMoneyButtonsState extends State<SendOrRequestMoneyButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: widget.onSendMoneyTap,
            child: Column(
              children: [
                SvgPicture.asset(SSvgs.sendMoneyTransfer),
                const SizedBox(height: 5),
                Text(
                  widget.sendMoneyText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: widget.onRequestMoneyTap,
            child: Column(
              children: [
                SvgPicture.asset(SSvgs.requestMoney),
                const SizedBox(height: 5),
                Text(
                  widget.requestMoneyText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
