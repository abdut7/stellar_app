import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/money_received_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/money_request_send_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/send_money/widgets/bottom_sheets/money_send_bottomsheet.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_home/widgets/transaction_tile.dart';

class SendRequestRecentTransactionShowButtons extends StatefulWidget {
  @override
  _SendRequestRecentTransactionShowButtonsState createState() =>
      _SendRequestRecentTransactionShowButtonsState();
}

class _SendRequestRecentTransactionShowButtonsState
    extends State<SendRequestRecentTransactionShowButtons> {
  bool isSendSelected = true;
  bool isRequestSelected = false;

  void _selectSend() {
    setState(() {
      isSendSelected = true;
      isRequestSelected = false;
    });
  }

  void _selectRequest() {
    setState(() {
      isSendSelected = false;
      isRequestSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _selectSend,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isSendSelected
                              ? SColors.color19
                              : Colors.transparent,
                          border: Border.all(
                            color: SColors.color19,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 11,
                              color: isSendSelected ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _selectRequest,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isRequestSelected
                              ? SColors.color19
                              : Colors.transparent,
                          border: Border.all(
                            color: SColors.color19,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Request',
                            style: TextStyle(
                              fontSize: 11,
                              color:
                                  isRequestSelected ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              isSendSelected
                  // Tile in the side of while selected send button
                  ? Column(
                      children: [
                        TransactionTile(
                          title: 'Money Added',
                          id: 'ID : RTSTH458796SDF',
                          timestamp: '06 October 2023 4:35pm',
                          amount: '25.00',
                          status: 'Success',
                          onTap: () {
                            moneysendreceivedsheet(
                                context: context,
                                title: 'Money Send',
                                btnTxt: 'Got it',
                                ontap: () {
                                  Navigator.pop(context);
                                });
                          },
                          svgAssetPath: SSvgs.addedMoney,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TransactionTile(
                          title: 'Money Send',
                          id: 'To Muhammed Riyas',
                          timestamp: '07 October 2023 4:35pm',
                          amount: '15.00',
                          status: 'Success',
                          onTap: () {
                            moneysendrequestbottomsheet(
                                context: context,
                                title: 'Money Send',
                                btnTxt: 'Got it',
                                ontap: () {
                                  Navigator.pop(context);
                                });
                          },
                          svgAssetPath: SSvgs.addedMoney,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TransactionTile(
                          title: 'Money Received',
                          id: 'To Jakson James',
                          timestamp: '07 October 2023 4:35pm',
                          amount: '1000.00',
                          status: 'Success',
                          onTap: () {
                            moneyreceivedbottomsheet(
                                context: context,
                                title: 'Money Received',
                                btnTxt: 'Got it',
                                ontap: () {
                                  Navigator.pop(context);
                                });
                          },
                          svgAssetPath: SSvgs.addedMoney,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  // Tile in the side of while selected Request button
                  : Column(
                      children: [
                        TransactionTile(
                          title: 'Request Send',
                          id: 'To Muhammed Riyas',
                          timestamp: '06 October 2023 4:35pm',
                          amount: '50.00',
                          status: 'Pending',
                          onTap: () {
                            moneysendrequestbottomsheet(
                                context: context,
                                title: 'Request Send',
                                btnTxt: 'Got it',
                                ontap: () {
                                  Navigator.pop(context);
                                });
                          },
                          svgAssetPath: SSvgs.sendRequest,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TransactionTile(
                          title: 'Request Send',
                          id: 'To Muhammed Niyas',
                          timestamp: '06 October 2023 4:35pm',
                          amount: '25.00',
                          status: 'Pending',
                          onTap: () {},
                          svgAssetPath: SSvgs.sendRequest,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TransactionTile(
                          title: 'Request Send',
                          id: 'To Jakson James',
                          timestamp: '06 October 2023 4:35pm',
                          amount: '25.00',
                          status: 'Success',
                          onTap: () {},
                          svgAssetPath: SSvgs.sendRequest,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
            ],
          )
        ],
      ),
    );
  }
}
