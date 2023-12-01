import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/send_amount_display_screen/send_amount_display_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/search_bar.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/send_to_contacts_listtile.dart';
import 'package:stellar_chat/widgets/search_text_field.dart';

class SendMoneyToContacts extends StatefulWidget {
  const SendMoneyToContacts({Key? key}) : super(key: key);

  @override
  State<SendMoneyToContacts> createState() => _SendMoneyToContactsState();
}

class _SendMoneyToContactsState extends State<SendMoneyToContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: SColors.color19.withOpacity(0.6),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SvgPicture.asset(
            SSvgs.payStellar,
          ),
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Send Money',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: SColors.color20,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                SSvgs.sendMoneyIcon,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SearchBarTextfield(hintText: 'Search in Stellar Contacts'),
          SendReceiveContactsListTile(
            name: 'Abdul Rasheed',
            onTap: () {
              Get.to(() => const SendAmountDisplayScreen());
            },
          ),
          SendReceiveContactsListTile(
            name: 'Aman',
            onTap: () {},
          ),
          SendReceiveContactsListTile(
            name: 'Basil Mathew',
            onTap: () {},
          ),
          SendReceiveContactsListTile(
            name: 'Abhishek',
            onTap: () {},
          ),
          SendReceiveContactsListTile(
            name: 'Binu Mitran',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
