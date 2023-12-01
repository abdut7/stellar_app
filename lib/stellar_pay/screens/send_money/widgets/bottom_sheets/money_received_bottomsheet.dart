import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';

void moneyreceivedbottomsheet(
    {required BuildContext context,
    required String title,
    required String btnTxt,
    required Function() ontap}) {
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
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
              child: Divider(
                thickness: 2,
                color: Color.fromRGBO(1, 97, 14, 1),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.w900,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            detailsRow(label: 'Date', value: '06 Oct 2023 4:30pm'),
            const SizedBox(
              height: 15,
            ),
            detailsRow(label: 'Amount', value: 'AED 15'),
            const SizedBox(
              height: 15,
            ),
            toRow(
                label: 'From',
                value: 'Muhammed Riyas',
                phone: '+971 555-3254-254'),
            const SizedBox(
              height: 15,
            ),
            detailsRow(label: 'Status', value: 'Success'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: ontap,
                child: Container(
                  width: Get.width * 0.55,
                  height: 40,
                  decoration: BoxDecoration(
                    color: SColors.color19,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      btnTxt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: SColors.color20,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    },
  );
}

Widget detailsRow({required String label, required String value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget toRow(
    {required String label, required String value, required String phone}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            phone,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ],
  );
}
