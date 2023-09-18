
import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/widgets/camera_bottom_sheet.dart';
import 'package:flutter/material.dart';

class StartCameraUi extends StatefulWidget {
  const StartCameraUi({Key? key}) : super(key: key);

  @override
  State<StartCameraUi> createState() => _StartCameraUiState();
}

class _StartCameraUiState extends State<StartCameraUi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SColors.color4,
        leading: IconButton(
          icon:  Icon(Icons.cancel_rounded,color: SColors.color3,),
          onPressed: () {},
        ),
      ),
      backgroundColor: SColors.color4,
      bottomSheet: const CameraBottomSheet(),
    );
  }
}


