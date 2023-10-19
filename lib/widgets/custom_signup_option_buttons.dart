import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color? svgColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? prefixIcon;
  final String? svgAssetPath;
  final String? imageAssetPath; // New property for image asset
  final void Function() onPressed;

  CustomButton({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.prefixIcon,
    this.svgColor,
    this.svgAssetPath,
    this.imageAssetPath, // New property for image asset
    required this.onPressed,
    required this.foregroundColor,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: SizedBox(
        width: Get.width,
        height: MediaQuery.of(context).size.height*0.045,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.prefixIcon != null)
                Icon(
                  widget.prefixIcon,
                  size: 20,
                  color: Colors.black,
                )
              else if (widget.svgAssetPath != null)
                SvgPicture.asset(
                  widget.svgAssetPath!,
                  width: 30,
                  height: 20,
                  color: widget.svgColor,
                )
              else if (widget.imageAssetPath != null) // Check if image asset is provided
                  Image.asset(
                    widget.imageAssetPath!,
                    width: 30,
                    height: 20,
                  ),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: widget.textColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
