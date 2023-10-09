import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/profile/public_profile/public_profile.dart';
import 'package:stellar_chat/View/profile/qr/my_qr_code_tab/my_qr_code_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_controller.dart';

class QRScreen extends StatefulWidget {
  final bool isFromSettings;
  const QRScreen({Key? key, this.isFromSettings = false}) : super(key: key);
  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find();
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: SColors.color4,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: SColors.color3),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              // IconButton(
              //   icon: Icon(Icons.more_vert, color: SColors.color12),
              //   onPressed: () {},
              // ),
            ],
            title: Text(
              'QR Code',
              style: TextStyle(
                color: SColors.color12,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            bottom: TabBar(
              labelColor: SColors.color11,
              unselectedLabelColor: SColors.color11.withOpacity(0.5),
              tabs: widget.isFromSettings
                  ? const [
                      Tab(
                        text: 'My QR Code',
                      ),
                      Tab(text: 'Scan QR Code'),
                    ]
                  : const [
                      Tab(text: 'Scan QR Code'),
                      Tab(
                        text: 'My QR Code',
                      ),
                    ],
            ),
          ),
          body: TabBarView(
            children: widget.isFromSettings
                ? [MyQRCodeTab(controller: controller), ScanQRCodeTab()]
                : [
                    ScanQRCodeTab(),
                    MyQRCodeTab(controller: controller),
                  ],
          ),
        ),
      ),
    );
  }
}

class ScanQRCodeTab extends StatefulWidget {
  @override
  State<ScanQRCodeTab> createState() => _ScanQRCodeTabState();
}

class _ScanQRCodeTabState extends State<ScanQRCodeTab> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;

  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Color.fromRGBO(0, 51, 142, 1),
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.7,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (result != null && result!.code != null) {
        Get.to(() => PublicProfileScreen(uid: result!.code!));
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
