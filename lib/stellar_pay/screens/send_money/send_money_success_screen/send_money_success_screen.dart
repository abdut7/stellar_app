import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/go_back_home_button.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/transfer_summary_details_section.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_home/money_pay_home.dart';

class SendMoneySuccessScreen extends StatefulWidget {
  const SendMoneySuccessScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneySuccessScreen> createState() => _SendMoneySuccessScreenState();
}

class _SendMoneySuccessScreenState extends State<SendMoneySuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body:  Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color:  SColors.color25,
              image: DecorationImage(
                image: AssetImage(SImages.image1),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(height: Get.height*0.2,),
                SvgPicture.asset(SSvgs.successLogo),
                const SizedBox(height: 10,),
                SvgPicture.asset(SSvgs.sucessText),
                const SizedBox(height: 15,),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    children: [TextSpan(text: 'You have successfully send\nmoney to ', style: TextStyle(color: SColors.color20, fontSize: 17, fontWeight: FontWeight.w400,
              ),
            ),
      TextSpan(
        text: 'Ravindranath',
        style: TextStyle(color: SColors.color20, fontSize: 17, fontWeight: FontWeight.w600,
        ),
      ),
                    ],
                ),),
                 SizedBox(height:Get.height*0.06,),
               const TransferSummaryDetails(),
                SizedBox(height: Get.height*0.1),
               GoBackHomeButton(
                   buttonText: 'Go Back Home',
                   onTap: (){
                     Get.to(()=>const MoneyPayHome());
                   }
               ),
                SizedBox(height: Get.height*0.1),

              ],
            ),
          ),
          )
        ],
      ),
    );
  }
}
