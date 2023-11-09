import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/view/QRScan/Scanning/ScanningUi.dart';
import 'package:stellar_chat/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class TakeScanUi extends StatefulWidget {
  static const routeName = '/TakeScanUi';

  const TakeScanUi({Key? key}) : super(key: key);

  @override
  State<TakeScanUi> createState() => _TakeScanUiState();
}

class _TakeScanUiState extends State<TakeScanUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SColors.color11,
        body: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              SImages.image4,
            ),
            const SizedBox(height: 150),
            CustomElevatedButton(
                text: 'START SCAN',
                textColor: SColors.color4,
                foregroundColor: SColors.color4,
                backgroundColor: SColors.color15,
                onPressed: () {
                  Navigator.pushNamed(context, ScanningUi.routeName);
                }),
          ],
        ));
  }
}
