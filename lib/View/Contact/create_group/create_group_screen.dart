import 'package:base_project/View/Contact/create_group/select_participents_screen.dart';
import 'package:base_project/View/Contact/create_group/widgets/add_group_icon_widget.dart';
import 'package:base_project/functions/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  TextEditingController groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Group"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                pickedImage =
                    await picker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  setState(() {});
                }
              },
              child: AddGroupIconWidget(file: pickedImage),
            ),
            Center(
              child: Container(
                width: Get.width * 0.8,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TextField(
                    controller: groupNameController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Group name",
                        prefix: SizedBox(
                          width: 20,
                        )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (groupNameController.text.isEmpty) {
                  showCustomSnackbar(
                      title: "Invalid Group Name",
                      message: "Please enter a valid name to continue");
                  return;
                }
                Get.to(() => SelectGroupParticipents(
                      grpName: groupNameController.text,
                      image: pickedImage,
                    ));
              },
              child: Container(
                width: Get.width * 0.6,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 51, 142, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Accept and Continue",
                    style: TextStyle(color: Color.fromRGBO(159, 196, 232, 1)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
