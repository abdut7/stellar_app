import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/View/create_post/function/generate_thumbnile.dart';
import 'package:stellar_chat/View/create_post/tag_people_screen/tag_people_screen.dart';
import 'package:stellar_chat/controllers/new_post/fliq_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';

class FlicksUploadNewPost extends StatefulWidget {
  const FlicksUploadNewPost({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  State<FlicksUploadNewPost> createState() => _FlicksUploadNewPostState();
}

class _FlicksUploadNewPostState extends State<FlicksUploadNewPost> {
  bool hideLikeAndView = false;
  bool turnOffComment = false;
  Uint8List? thumbnile;
  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find();
    FliqController fliqController = Get.put(FliqController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SColors.color18,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: SColors.color3,
            size: 15,
          ),
          onPressed: () {},
        ),
        title: Text(
          'New Post',
          style: TextStyle(
            color: SColors.color12,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (thumbnile == null) {
                showCustomSnackbar(title: "No Thumbnile", message: "");
                return;
              }
            },
            child: Text('Share',
                style: TextStyle(
                  color: SColors.color12,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(controller
                              .userDetailsModel.value!.strProfileUrl.isEmpty
                          ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                          : controller.userDetailsModel.value!.strProfileUrl),
                      radius: 25,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Type a caption",
                          border: InputBorder.none,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: generateVideoThumbnail(widget.path),
                      builder: (context, AsyncSnapshot<Uint8List?> snapshot) {
                        if (thumbnile != null) {
                          return Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: FractionalOffset.topCenter,
                              image: MemoryImage(thumbnile!),
                            )),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data == null) {
                          return Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: const BoxDecoration(),
                          );
                        }
                        thumbnile = snapshot.data;

                        return Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(thumbnile!),
                          )),
                        );
                      }),
                ],
              ),
            ),
            divider(),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleTextButton('Add Location', () {}),
                  Container(
                    height: 30,
                    decoration: ShapeDecoration(
                      color: SColors.color18,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Dubai, United Arab Emirates',
                          style: TextStyle(
                            color: SColors.color3,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: titleTextButton('Tag People', () {
                  Get.to(() => TagPeopleScreen(
                        videoFilePath: widget.path,
                        thumbnile: thumbnile!,
                      ));
                })),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Obx(() => Row(
                      children: List.generate(
                        fliqController.tagPeople.length,
                        (index) {
                          return Container(
                            width: 112,
                            height: 26,
                            margin: const EdgeInsets.all(5),
                            decoration: ShapeDecoration(
                              color: SColors.color18,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                fliqController.tagPeople
                                    .elementAt(index)
                                    .strFullName,
                                style: TextStyle(
                                    color: SColors.color3,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleTextButton('Add Music', () {}),
                  const SizedBox(height: 10),
                  Container(
                    width: 104,
                    height: 26,
                    decoration: ShapeDecoration(
                      color: SColors.color18,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: Center(
                      child: Text(
                        'Music , Artist',
                        style: TextStyle(
                            color: SColors.color3,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            divider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Advance Settings',
                style: TextStyle(
                  color: SColors.color12,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headText('Like and Views'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hide like and view counts \non your post',
                        style: TextStyle(
                          color: SColors.color3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      //likes and views
                      Switch(
                        value: hideLikeAndView,
                        onChanged: (bool newValue) {
                          setState(() {
                            hideLikeAndView = newValue;
                          });
                        },
                        activeColor: SColors.color11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headText('Comments'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Turn off comments on your\npost. You can always change it\nfrom the menu ',
                        style: TextStyle(
                          color: SColors.color3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      //Comments
                      Switch(
                        value: turnOffComment,
                        onChanged: (bool newValue) {
                          setState(() {
                            turnOffComment = newValue;
                          });
                        },
                        activeColor: SColors.color11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget divider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Divider(
      thickness: 1,
      color: SColors.color9.withOpacity(0.3),
    ),
  );
}

Widget headText(String head) {
  return Text(
    head,
    style: TextStyle(
      color: SColors.color3,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget titleTextButton(String btnTxt, Function() onPress) {
  return GestureDetector(
    onTap: onPress,
    child: Text(
      btnTxt,
      style: TextStyle(
        color: SColors.color12,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
