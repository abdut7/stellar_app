import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/money_added_to_wallet_success_screen/money_added_to_wallet_success_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/request_money/request_amount_display_screen/request_amount_display_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/request_money/request_money_from_contacts_list/request_money_froom_contacts_list.dart';
import 'package:stellar_chat/stellar_pay/screens/request_money/request_money_success_screen/request_money_success_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/send_amount_display_screen/send_amount_display_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/send_money_success_screen/send_money_success_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/send_money_to_contacts/send_money_to_contacts.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/enter_card_details_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/money_received_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/money_request_send_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/money_send_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_home/widgets/send_or_request_money_buttons.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_home/widgets/send_request_recent_transactions.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_profile_settings/pay_profile_settings.dart';

class MoneyPayHome extends StatefulWidget {
  const MoneyPayHome({Key? key}) : super(key: key);

  @override
  State<MoneyPayHome> createState() => _MoneyPayHomeState();
}

class _MoneyPayHomeState extends State<MoneyPayHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.4,
                      decoration:  BoxDecoration(color: SColors.color22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [const Text('Your Balance', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300,),),

                                // add balance icon

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: GestureDetector(
                                      onTap: (){},
                                      child: SvgPicture.asset(SSvgs.addBalance)),
                                ),
                              ],),),

                          // your balance money displaying area

                          const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text(
                                    'AED',
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500,),),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "00.00",
                                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),),
                              ],
                            ),
                          ),],),),



                    Container(
                      width: Get.width, height: Get.height * 0.1, decoration:  BoxDecoration(color: SColors.color21),
                      child: Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 20.0), child: SvgPicture.asset(SSvgs.logoStellar,),),
                          const SizedBox(width: 10,),
                          Padding(padding: const EdgeInsets.only(top: 8), child: SvgPicture.asset(SSvgs.payText,),),
                        ],
                      ),
                    ),


                    // profile image section
                    Positioned(
                      left: Get.width * 0.68,
                      top: Get.height * 0.02,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=>const PayProfileSettings());
                        },
                        child: Container(
                          width: Get.width * 0.2,
                          height: Get.width * 0.2,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(image: NetworkImage("https://cdn.quotesgram.com/img/8/72/1135141999-074f6884b9f34be89538782d2fc98f8e.jpg"), fit: BoxFit.cover,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.width * 0.1),),),),
                      ),),

                    // send money  and request money  button

                    SendOrRequestMoneyButtons(
                      sendMoneyText: 'Send\nMoney',
                      onSendMoneyTap: () {
                       Get.to(()=>const SendMoneyToContacts());
                      },
                      requestMoneyText: 'Request\nMoney',
                      onRequestMoneyTap: () {
                        Get.to(()=>const RequestMoneyFromContacts());
                      },
                    ),],
                ),

                const SizedBox(height: 60,),

                const Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Recent Transactions', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w500,),),),

                const SizedBox(height: 15,),
                // buttons for showing recent transaction for send and request
                SendRequestRecentTransactionShowButtons(),
              ],
            ),
          )


        )
      ),
    );
  }
}






