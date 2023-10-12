import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/money_added_to_wallet_success_screen/money_added_to_wallet_success_screen.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/choose_card_add_money_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/proceed_to_payment_button.dart';

void addmoneythroughvisasheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
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
              child: Divider(thickness: 3, color: Color.fromRGBO(1, 97, 14, 1),),),
            const SizedBox(height: 25,),
            const Row(
              children: <Widget>[
                Icon(Icons.arrow_back_ios, color: Colors.black, size: 15,),
                SizedBox(width: 8), // Add some space between the icon and text
                Text(
                  'Add Money',
                  style:  TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w900,),),
              ],
            ),
            const SizedBox(height: 10,),
            ListTile(
              leading: Padding(padding: const EdgeInsets.only(top: 12), child: SvgPicture.asset(SSvgs.logoVisa),),
              title:const  Text(
                '**** 2356',
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400,),
              ),
              subtitle: const Text(
                'AED 12.00 will be deducted from card',
                style: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w400,),),
              trailing: GestureDetector(
                onTap: (){
                  choosecardaddmoneysheet(context);
                },
                child: Container(
                  width: 75,
                  height: 33,
                  decoration: ShapeDecoration(
                    color:SColors.color19,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Change',
                      textAlign: TextAlign.center, style: TextStyle(color: SColors.color20, fontSize: 11, fontWeight: FontWeight.w400,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ProceedToPaymentButton(
              buttonText: 'Proceed to Add Money',
              onTap: () {
                Get.to(()=>const MoneyAddedToWalletSuccessScreen());
              },
            ),
            const SizedBox(height: 25,),
          ],
        ),
      );
    },
  );
}
