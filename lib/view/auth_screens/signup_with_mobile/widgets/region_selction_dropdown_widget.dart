import 'package:flutter/material.dart';

class RegionSelectionDropdownWidget extends StatelessWidget {
  const RegionSelectionDropdownWidget({
    super.key,
    required this.size,
    required this.selectedRegion,
    required this.regions,
    required this.controller,
    this.validator,
  });

  final Size size;
  final String? selectedRegion;
  final List<String> regions;
  final TextEditingController controller;
  final String? Function(String? val)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonFormField<String>(
              validator: (value) {
                final error = validator!(value);
                return error;
              },
              hint: const Text(
                "Pick a region",
                style: TextStyle(
                    color: Color(0xFFABA8A8),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter"),
              ),
              decoration: const InputDecoration(border: InputBorder.none),
              value: selectedRegion,
              items: regions.map((String region) {
                return DropdownMenuItem<String>(
                  value: region,
                  child: Text(
                    region,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  controller.text = value;
                }
                // Handle onChanged event
                // You can set the selected region in your state or perform any other logic here
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
