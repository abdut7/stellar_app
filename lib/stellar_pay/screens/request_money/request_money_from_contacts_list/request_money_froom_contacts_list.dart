import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/request_money/request_amount_display_screen/request_amount_display_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/search_bar.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/send_to_contacts_listtile.dart';

class RequestMoneyFromContacts extends StatefulWidget {
  const RequestMoneyFromContacts({Key? key}) : super(key: key);

  @override
  State<RequestMoneyFromContacts> createState() =>
      _RequestMoneyFromContactsState();
}

class _RequestMoneyFromContactsState extends State<RequestMoneyFromContacts> {
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
                'Request Money',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: SColors.color20,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                SSvgs.requestMoneyIcon,
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
              Get.to(() => const RequestAmountDisplayScreen());
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
