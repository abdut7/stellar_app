import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/add_new_card_button.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/add_money_through_visa.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/enter_card_details_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/send_button.dart';

void choosecardaddmoneysheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: SColors.color25,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 65, vertical: 5),
              child: Divider(thickness: 3, color: Color.fromRGBO(1, 97, 14, 1)),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Choose Card',
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  SSvgs.circleWhite,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(SSvgs.whiteVisaText),
                const SizedBox(width: 15),
                const Text(
                  '**** 2356',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            AddNewCardButton(
                buttonText: 'Add New Card',
                onTap: () {
                  entercarddetailssheet(context);
                }),
            const SizedBox(
              height: 45,
            ),
            SendButton(
                onTap: () {
                  addmoneythroughvisasheet(context);
                },
                buttonText: 'Add Money'),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    },
  );
}
