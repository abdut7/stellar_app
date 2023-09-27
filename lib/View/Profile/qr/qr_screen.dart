import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/profile/qr/my_qr_code_tab/my_qr_code_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_controller.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);
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
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: SColors.color12),
                onPressed: () {},
              ),
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
              tabs: const [
                Tab(
                  text: 'My QR Code',
                ),
                Tab(text: 'Scan QR Code'),
              ],
            ),
          ),
          body: TabBarView(
            children: [MyQRCodeTab(controller: controller), ScanQRCodeTab()],
          ),
        ),
      ),
    );
  }
}

class ScanQRCodeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Scan QR Code Tab'),
    );
  }
}
