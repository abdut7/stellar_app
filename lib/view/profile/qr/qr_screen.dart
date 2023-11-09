import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/profile/public_profile/public_profile.dart';
import 'package:stellar_chat/view/profile/qr/my_qr_code_tab/my_qr_code_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

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
    ThemeController themeController = Get.find();
    UserController controller = Get.find();
    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: themeController.isDarkTheme.value
                ?  SColors.darkmode
                : SColors.color4,
            leading: IconButton(
              icon: Icon(
                  Icons.arrow_back_ios,
                  color: themeController.isDarkTheme.value
                      ?  SColors.color4
                      : SColors.color3),
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
                color: themeController.isDarkTheme.value
                    ?  SColors.appbarTitleInDark
                    : SColors.color12,
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
            borderColor: const Color.fromRGBO(0, 51, 142, 1),
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.7,
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.string(
                      """<svg width="42" height="43" viewBox="0 0 42 43" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M21 0.0195312C9.40154 0.0195312 0 9.42107 0 21.0195C0 32.618 9.40154 42.0195 21 42.0195C32.5985 42.0195 42 32.618 42 21.0195C41.9838 9.42915 32.5904 0.0356851 21 0.0195312ZM33.4465 21.4961C32.8165 20.8661 31.7908 20.8661 31.1608 21.4961L24.2227 28.4341L12.4385 16.6499C11.8085 16.0199 10.7827 16.0199 10.1527 16.6499L3.40038 23.4022C3.28731 22.6107 3.23077 21.8191 3.22269 21.0195C3.20654 11.2061 11.1542 3.23415 20.9677 3.22607C30.7812 3.21799 38.7531 11.1576 38.7612 20.9711C38.7612 22.6995 38.5108 24.4199 38.0181 26.0757L33.4385 21.4961H33.4465Z" fill="#00338E"/>
<path d="M27.4616 13.3461C28.5768 13.3461 29.4808 12.442 29.4808 11.3268C29.4808 10.2117 28.5768 9.30762 27.4616 9.30762C26.3464 9.30762 25.4424 10.2117 25.4424 11.3268C25.4424 12.442 26.3464 13.3461 27.4616 13.3461Z" fill="#00338E"/>
</svg>
"""),
                  const SizedBox(),
                  GestureDetector(
                    onTap: () {
                      if (controller == null) {
                        return;
                      }
                      setState(() {
                        controller!.toggleFlash();
                      });
                    },
                    child: SvgPicture.string(
                        """<svg width="17" height="23" viewBox="0 0 17 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M3.20945 7.02344L9.70024 16.0548L4.03671 22.6925C3.87307 22.8854 3.63671 22.9906 3.38217 22.9994C2.90945 23.0169 2.51855 22.6662 2.49128 22.2102C2.49128 22.1138 2.49128 22.0261 2.52764 21.9384L5.63667 12.3195H1.6822C1.20949 12.3195 0.827674 11.9513 0.836765 11.4953C0.836765 11.3638 0.873128 11.2323 0.936763 11.1095L3.21854 7.02344H3.20945ZM16.0638 7.84767C15.9183 7.56708 15.6183 7.39172 15.3001 7.39172H10.7911L14.3365 1.22757C14.4911 0.973286 14.4911 0.657626 14.3365 0.403344C14.182 0.149062 13.9002 0 13.6002 0H7.63664C7.31846 0 7.03665 0.166599 6.8912 0.438417L5.0276 3.77916L11.9456 13.4243L15.9547 8.7245C16.1638 8.47899 16.2092 8.13702 16.0638 7.85644V7.8389V7.84767ZM16.8456 21.6929L11.382 14.0995L4.57306 4.58584L1.52766 0.350734C1.23676 0 0.700404 -0.0701468 0.327684 0.21044C-0.0177643 0.464722 -0.099581 0.929445 0.127687 1.28895L3.66399 6.21676L10.2639 15.406L15.4547 22.6399C15.7274 23.0081 16.2547 23.1046 16.6365 22.8415C17.0183 22.5785 17.1183 22.0699 16.8456 21.7017V21.6841V21.6929Z" fill="#99C7FF"/>
                  </svg>
                  """),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        )
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
