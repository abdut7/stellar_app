import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/request_money/request_money_success_screen/request_money_success_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/amount_display_textfield.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/search_bar.dart';

class RequestAmountDisplayScreen extends StatefulWidget {
  const RequestAmountDisplayScreen({Key? key}) : super(key: key);

  @override
  State<RequestAmountDisplayScreen> createState() =>
      _RequestAmountDisplayScreenState();
}

class _RequestAmountDisplayScreenState
    extends State<RequestAmountDisplayScreen> {
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
                  Get.to(() => const RequestMoneySuccessScreen());
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
                    'Request Money',
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
