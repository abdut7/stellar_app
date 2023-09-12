import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:flutter/material.dart';

class ScanningUi extends StatefulWidget {
  static const routeName = '/ScanningUi';
  const ScanningUi({Key? key}) : super(key: key);

  @override
  State<ScanningUi> createState() => _ScanningUiState();
}

class _ScanningUiState extends State<ScanningUi> {
  IconButton customIconButton(IconData icon, Function() onPressed) {
    return IconButton(
      icon: Icon(icon, color: SColors.color9),
      onPressed: onPressed,
    );
  }
  Widget customBottomAppBar() {
    return BottomAppBar(
      color: SColors.color13,
      child: const SizedBox(width: double.infinity, height: 85,),
    );
  }

  Widget customFloatingActionButton(Function() onpress) {
    return Container(
      width: 80,
      height: 80,
      decoration:  BoxDecoration(shape: BoxShape.circle, color: SColors.color14),
      child: IconButton(
        icon:  Icon(Icons.qr_code_scanner, color: SColors.color4, size: 25,),
        onPressed: onpress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SColors.color4,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.cancel_rounded, color: SColors.color3),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: SColors.color16,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                customIconButton(Icons.photo, () {}),
                customIconButton(Icons.flash_on, () {}),
                customIconButton(Icons.flip_camera_ios_sharp, () {}),
              ],
            ),
          ),
          const SizedBox(height: 170),
          Image.asset(SImages.image5, width: 200, height: 200),
        ],
      ),
      bottomNavigationBar: customBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFloatingActionButton(() {}),

    );
  }
}
