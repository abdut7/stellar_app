import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/go_back_home_button.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/transfer_summary_details_section.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_home/money_pay_home.dart';

class MoneyAddedToWalletSuccessScreen extends StatefulWidget {
  const MoneyAddedToWalletSuccessScreen({Key? key}) : super(key: key);

  @override
  State<MoneyAddedToWalletSuccessScreen> createState() =>
      _MoneyAddedToWalletSuccessScreenState();
}

class _MoneyAddedToWalletSuccessScreenState
    extends State<MoneyAddedToWalletSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: SColors.color25,
              image: DecorationImage(
                image: AssetImage(SImages.image1),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  SvgPicture.asset(SSvgs.successLogo),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(SSvgs.sucessText),
                  const SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'You have successfully added \nmoney to ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: SColors.color20,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'your wallet',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: SColors.color20,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  const TransferSummaryDetails(),
                  SizedBox(height: Get.height * 0.1),
                  GoBackHomeButton(
                      buttonText: 'Go Back Home',
                      onTap: () {
                        Get.to(() => const MoneyPayHome());
                      }),
                  SizedBox(height: Get.height * 0.1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
