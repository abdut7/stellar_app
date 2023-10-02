import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/widgets/custom_elevated_button.dart';
import 'package:stellar_chat/widgets/money_custom_row_tile.dart';
import 'package:stellar_chat/widgets/service_agreement_info.dart';
import 'package:flutter/material.dart';

class MoneyPaymentUi extends StatefulWidget {
  static const routeName = '/MoneyPaymentUi';

  const MoneyPaymentUi({Key? key}) : super(key: key);
  @override
  State<MoneyPaymentUi> createState() => _MoneyPaymentUiState();
}

class _MoneyPaymentUiState extends State<MoneyPaymentUi> {
  bool isSelected = false;
  Widget buildText(
    String text,
    double fontSize,
    Color color,
    FontWeight fontWeight,
  ) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  AppBar buildCustomAppBar(Function() onPressed) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.cancel_rounded,
          color: SColors.color3,
        ),
        onPressed: onPressed,
      ),
      title: Text(
        'MONEY',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: SColors.color3,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: SColors.color11,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color11,
      appBar: buildCustomAppBar(() {}),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 360,
            decoration: ShapeDecoration(
              color: SColors.color4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 21,
                      height: 21,
                      decoration: ShapeDecoration(
                        color: SColors.color14,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    buildText(
                      'USE PAYMENT CODE',
                      14,
                      SColors.color3,
                      FontWeight.w400,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                ServiceAgreement(),
                CustomElevatedButton(
                    text: 'ENABLE NOW',
                    textColor: SColors.color3,
                    foregroundColor: SColors.color4,
                    backgroundColor: SColors.color14,
                    onPressed: () {}),
                const SizedBox(
                  height: 50,
                ),
                buildText(
                  'STELLAR CHAT ENSURES THE SECURITY OF YOUR FUNDS',
                  8,
                  SColors.color9,
                  FontWeight.w400,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomRowTile(
            text: 'RECEIVE MONEY',
            onPressed: () {},
          ),
          CustomRowTile(
            text: 'REWARD CODE ',
            onPressed: () {},
          ),
          CustomRowTile(
            text: 'SPLIT BILL',
            onPressed: () {},
          ),
          CustomRowTile(
            text: 'PACKETS NEARBY',
            onPressed: () {},
          ),
          CustomRowTile(
            text: 'TRANSFER TO BANK CARDS',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
