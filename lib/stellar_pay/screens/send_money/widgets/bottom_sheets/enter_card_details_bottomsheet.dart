import 'package:flutter/material.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/enter_card_details_textfield.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/send_button.dart';

void entercarddetailssheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0),),),
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                child: Divider(thickness: 3, color: Color.fromRGBO(1, 97, 14, 1),),),
              const SizedBox(height: 25,),
              const Row(
                children: <Widget>[
                  Icon(Icons.arrow_back_ios, color: Colors.black, size: 15,),
                  SizedBox(width: 8), // Add some space between the icon and text
                  Text('Enter Card Details', style:  TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w900,),),],),
              const SizedBox(height: 25,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    EnterCardDetailsTextField(
                      headText: 'Name on the Card',
                      keyboardInputType: TextInputType.text,
                    ),

                    const SizedBox(height: 20,),

                    EnterCardDetailsTextField(
                      headText: 'Card Number',
                      keyboardInputType: TextInputType.number,
                    ),

                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child:
                          EnterCardDetailsTextField(
                            headText: 'Expiry',
                            keyboardInputType: TextInputType.number,
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          child:
                          EnterCardDetailsTextField(
                            headText: 'CVV',
                            keyboardInputType: TextInputType.text,
                          ),

                        ),],),
                  ],
                ),
              ),
              const SizedBox(height: 30,),

              SendButton(
                  onTap: (){},
                  buttonText: 'Add Card'
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      );
    },
  );
}






