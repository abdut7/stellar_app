import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/send_money_success_screen/send_money_success_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/amount_display_textfield.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/choose_card_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/choose_payment_options_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/search_bar.dart';

class SendAmountDisplayScreen extends StatefulWidget {
  const SendAmountDisplayScreen({Key? key}) : super(key: key);

  @override
  State<SendAmountDisplayScreen> createState() =>
      _SendAmountDisplayScreenState();
}

class _SendAmountDisplayScreenState extends State<SendAmountDisplayScreen> {
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
                  width: 8,
                ),
                SvgPicture.asset(
                  SSvgs.sendMoneyIcon,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                SImages.moneyPayVector,
              ),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              colors: [Colors.white, SColors.color19],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 26),
                width: Get.width,
                height: 75,
                decoration: ShapeDecoration(
                  color: SColors.color19,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 35, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abdul Rasheed',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '+971 55-2356-554',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SearchBarTextfield(hintText: 'Add notes'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'AED',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const AmountDisplayTextField(),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  choosepaymentoptionssheet(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.58,
                  height: 40,
                  decoration: BoxDecoration(
                    color: SColors.color19,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    'Send Money',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: SColors.color20,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
              )
            ],
          ),
        ));
  }
}
