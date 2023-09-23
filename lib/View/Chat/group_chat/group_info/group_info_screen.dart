import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/api_models/chat_history_model.dart';
import '../../../../models/group_chat/group_details_model.dart';
import '../../../../services/api_services/group_details_service.dart';
import '../../../../utils/colors.dart';

class GroupInfoScreen extends StatelessWidget {
  final String chatId;
  const GroupInfoScreen({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black, // Change the color to your desired color
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Implement your menu actions here
            },
          ),
        ],
      ),
      body: FutureBuilder<GroupDetailsResponseModel?>(
          future: GroupDetailsService.getGroupDetails(groupId: chatId),
          builder:
              (context, AsyncSnapshot<GroupDetailsResponseModel?> snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            GroupDetailsResponseModel resModel = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //top  group icon

                    Center(
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data!.strIconURL),
                        radius:
                            50.0, // Adjust the size of the circle avatar as needed
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        resModel.strGroupName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                          "Group : ${resModel.intParticipants} Participants"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Add button
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundColor: colorPrimary,
                                child: const Icon(Icons.person),
                              ),
                              CircleAvatar(
                                radius: 7,
                                backgroundColor: secondaryColor,
                                child: const Icon(
                                  Icons.add,
                                  size: 7,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Add")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: colorBlack,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        resModel.strDiscription,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Created by : ${resModel.strCreatedBy}, ${DateFormat('dd/MM/yyyy').format(DateTime.parse(resModel.strCreatedTime))}",
                        style: const TextStyle(
                            color: Color.fromRGBO(91, 91, 91, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: colorBlack,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${resModel.intParticipants} Participants",
                            style: const TextStyle(
                                color: Color.fromRGBO(
                                  91,
                                  91,
                                  91,
                                  1,
                                ),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Add Participants",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    resModel.groupUser[index].strProfileIcon),
                              ),
                              title:
                                  Text(resModel.groupUser[index].strFullName),
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: resModel.groupUser.length)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
