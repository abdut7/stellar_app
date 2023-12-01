import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/search_controllers.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/chat_search_model.dart';

class SearchChatScreen extends StatefulWidget {
  @override
  State<SearchChatScreen> createState() => _SearchChatScreenState();
}

class _SearchChatScreenState extends State<SearchChatScreen> {
  @override
  Widget build(BuildContext context) {
    ChatSearchController searchController = Get.find();
    UserController userController = Get.find();

    return Obx(() => searchController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : searchController.messageChatList.isEmpty
            ? const Center(child: Text("No messages"))
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: searchController.messageChatList.length,
                itemBuilder: (context, index) {
                  SearchFiles searchFiles =
                      searchController.messageChatList.elementAt(index);
                  bool isSent = searchFiles.strUserId ==
                      userController.userDetailsModel.value!.id;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: isSent
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                              color: isSent
                                  ? const Color.fromRGBO(233, 244, 255, 1)
                                  : const Color.fromRGBO(246, 245, 245, 1),
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              !isSent
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8),
                                      child: Text(searchFiles.strName),
                                    )
                                  : SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  searchFiles.strMessage,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 15,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                            color: isSent
                                ? const Color.fromRGBO(233, 244, 255, 1)
                                : const Color.fromRGBO(246, 245, 245, 1),
                            borderRadius: isSent
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                  )
                                : const BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                  ),
                          ),
                          child: Row(
                            mainAxisAlignment: isSent
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 2.0, right: 5, left: 5),
                                child: Text(
                                  searchFiles.strCreatedTime,
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.grey,
                                      fontSize: 10),
                                ),
                              ),
                              isSent
                                  ? SvgPicture.string(
                                      """<svg width="10" height="5" viewBox="0 0 10 5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 2.38197C0.0398437 2.30405 0.0679687 2.21808 0.121875 2.15236C0.317708 1.91496 0.652083 1.91185 0.877083 2.14275C1.37378 2.65358 1.86901 3.16492 2.36276 3.67678L2.48802 3.80665C2.7263 3.55912 2.95521 3.31133 3.19479 3.07392C4.17257 2.10613 5.15122 1.1399 6.13073 0.175222C6.2888 0.0193778 6.46927 -0.0416612 6.68203 0.0295076C7.03568 0.148209 7.12891 0.589508 6.85703 0.863014C6.53854 1.18353 6.21406 1.49834 5.89349 1.81548C4.8796 2.81548 3.86615 3.81574 2.85312 4.81626C2.69687 4.97211 2.51667 5.04016 2.30443 4.96873C2.22209 4.93891 2.1477 4.89066 2.08698 4.82769C1.43924 4.16483 0.794792 3.49929 0.153646 2.83107C0.0869792 2.7612 0.0494792 2.66275 0 2.57756V2.38197Z" fill="#00338E"/>
                            <path d="M10.0001 0.608279C9.96049 0.754513 9.867 0.862565 9.76101 0.96672C8.46205 2.24516 7.16379 3.52447 5.86622 4.80464C5.59903 5.06984 5.31596 5.06438 5.05215 4.7888C4.91726 4.64802 4.78106 4.5088 4.64695 4.36724C4.43393 4.1423 4.42976 3.83503 4.63549 3.63685C4.84122 3.43867 5.14721 3.4501 5.36622 3.67166L5.50684 3.81477C5.88314 3.42516 6.24903 3.03243 6.62846 2.65399C7.45241 1.83295 8.28861 1.02412 9.1084 0.198928C9.4209 -0.115617 9.9032 0.0308762 9.98575 0.40672C9.98911 0.415977 9.99376 0.42472 9.99955 0.432694L10.0001 0.608279Z" fill="#00338E"/>
                            </svg>
                            """)
                                  : const SizedBox(),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
