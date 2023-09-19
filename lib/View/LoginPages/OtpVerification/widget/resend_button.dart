import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class ResendButton extends StatefulWidget {
  @override
  _ResendButtonState createState() => _ResendButtonState();
}

class _ResendButtonState extends State<ResendButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              title: Text(
                'VERIFICATION OTP RESEND TO',
                textAlign: TextAlign.center,
                style: TextStyle(color: SColors.color3, fontSize: 12, fontWeight: FontWeight.w500,),),
              content: Text(
                '+971 - ** *** **35',
                textAlign: TextAlign.center,
                style: TextStyle(color: SColors.color3, fontSize: 15, fontWeight: FontWeight.w600,),
              ),
              backgroundColor: SColors.color11,
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 45,
                      decoration: BoxDecoration(color: SColors.color12, borderRadius: BorderRadius.circular(12),),
                      child:  Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(color:SColors.color4, fontSize: 17, fontWeight: FontWeight.w400,
                          ),),),
                    ),),
                ),
              ],
            );
          },
        );
      },
      child: Text(
        'Resend',
        style: TextStyle(color: SColors.color4, fontSize: 12, fontWeight: FontWeight.w800, height: 0,),),
    );
  }
}
