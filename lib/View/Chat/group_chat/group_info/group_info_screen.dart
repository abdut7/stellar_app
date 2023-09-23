import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/api_models/chat_history_model.dart';
import '../../../../utils/colors.dart';

class GroupInfoScreen extends StatelessWidget {
  final ChatHistoryList chatHistoryList;

  const GroupInfoScreen({super.key, required this.chatHistoryList});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top  group icon

              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(chatHistoryList.strIconURL),
                  radius:
                      50.0, // Adjust the size of the circle avatar as needed
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  chatHistoryList.strName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("Group : 45 Participants"),
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
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "This group is for all purposes...",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Created by : Rajmohan, 30/08/23",
                  style: TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
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
                      "45 Participants",
                      style: TextStyle(
                          color: Color.fromRGBO(
                            91,
                            91,
                            91,
                            1,
                          ),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
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
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(),
                        title: Text("Member name ${index + 1}"),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 20)
            ],
          ),
        ),
      ),
    );
  }
}
