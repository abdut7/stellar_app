import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferSummaryDetails extends StatefulWidget {
  const TransferSummaryDetails({Key? key}) : super(key: key);

  @override
  State<TransferSummaryDetails> createState() => _TransferSummaryDetailsState();
}

class _TransferSummaryDetailsState extends State<TransferSummaryDetails> {
  Widget detailsRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500,),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: Get.width,
      height: Get.height * 0.23,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            detailsRow('Date', '06 Oct 2023 4:30pm'),
            detailsRow('Amount', 'AED 15'),
            detailsRow('Transaction ID', 'RTSTH458796SDF'),
            detailsRow('Status', 'Success'),
          ],
        ),
      ),
    );
  }
}
