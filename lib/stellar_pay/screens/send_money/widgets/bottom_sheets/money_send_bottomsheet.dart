import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
void moneysendreceivedsheet({required BuildContext context, required String title,required String btnTxt, required Function() ontap}) {
  showModalBottomSheet(
    backgroundColor: SColors.color25,
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
              padding:  EdgeInsets.symmetric(horizontal: 60,vertical: 5), child: Divider(thickness: 2,color: Color.fromRGBO(1, 97, 14, 1),),),
            const SizedBox(height: 25,),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w900, height: 0,),),
            const SizedBox(height: 25,),
            detailsRow('Date', '06 Oct 2023 4:30pm'),
            const SizedBox(height: 15,),
            detailsRow('Amount', 'AED 15'),
            const SizedBox(height: 15,),
            detailsRow('Transaction ID', 'RTSTH458796SDF'),
            const SizedBox(height: 15,),
            detailsRow('Status', 'Success'),
            const SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                onTap: ontap,
                child: Container(
                  width: Get.width * 0.55,
                  height: 40,
                  decoration: BoxDecoration(color: SColors.color19, borderRadius: BorderRadius.circular(8),),
                  child: Center(
                    child: Text(
                      btnTxt,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: SColors.color20, fontSize: 17, fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      );
    },
  );
}

Widget detailsRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        value,
        style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600,),
      ),
    ],
  );
}

