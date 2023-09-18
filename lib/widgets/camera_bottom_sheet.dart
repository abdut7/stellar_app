import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class CameraBottomSheet extends StatefulWidget {
  const CameraBottomSheet({Key? key}) : super(key: key);

  @override
  State<CameraBottomSheet> createState() => _CameraBottomSheetState();
}

class _CameraBottomSheetState extends State<CameraBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(color: SColors.color3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
        children: [
          _buildCircle(Colors.black, Colors.white, null, 45, 45,(){}),
          _buildCircle(Colors.red, Colors.white, null, 30, 30,(){}),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: _buildCircle(Colors.white, Colors.black, null, 60, 60,(){}),
          ),
          _buildCircle(Colors.black, Colors.white, Icons.flip_camera_android_sharp, 35, 35,(){}),
        ],
      ),
    );
  }

  Widget _buildCircle(Color color, Color borderColor, IconData? icon, double width, double height, Function() onpress) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 3),
        ),
        child: icon != null ? Icon(icon,size: 15, color: borderColor) : null,
      ),
    );
  }
}
