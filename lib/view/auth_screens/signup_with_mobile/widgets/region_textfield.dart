import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class RegionTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final Function(String? val)? onSaved;
  final Function(String val)? onChanged;

  const RegionTextField({
    Key? key,
    required this.keyboardType,
    this.suffixIcon,
    required this.hintText,
    required this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RegionTextField> createState() => _RegionTextFieldState();
}

class _RegionTextFieldState extends State<RegionTextField> {
  List<String> regions = ['INDIA', 'UAE'];
  String? selectedRegion;

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: TextStyle(
        fontFamily: 'Inter',
        color: SColors.color9,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          showRegionMenu(context);
        },
        child: widget.suffixIcon,
      ),
    );
  }

  void showRegionMenu(BuildContext context) async {
    String? newRegion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: SColors.color11,
          children: regions.map((String region) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, region);
              },
              child: Text(
                region,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            );
          }).toList(),
        );
      },
    );

    if (newRegion != null) {
      setState(() {
        selectedRegion = newRegion;
        widget.controller.text = selectedRegion!;
      });
    }
  }

  Widget textField(TextEditingController controller) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        onTap: () {
          showRegionMenu(context);
        },
        readOnly: true,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        controller: controller,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.black,
        style: TextStyle(
          fontFamily: 'Inter',
          color: SColors.color3,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        autocorrect: true,
        decoration: buildInputDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: textField(widget.controller),
    );
  }
}
