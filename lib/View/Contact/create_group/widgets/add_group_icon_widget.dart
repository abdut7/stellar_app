import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddGroupIconWidget extends StatelessWidget {
  final XFile? file;
  const AddGroupIconWidget({
    super.key,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: file == null
          ? const Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50, // Adjust the radius as needed
                  backgroundColor: Colors.grey, // Replace with your image asset
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.add),
                )
              ],
            )
          : CircleAvatar(
              radius: 50, // Adjust the radius as needed
              backgroundColor: Colors.grey, // Replace with your image asset
              backgroundImage: Image.file(
                File(file!.path), // Replace with your XFile
              ).image,
            ),
    );
  }
}
