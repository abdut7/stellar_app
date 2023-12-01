import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/chat/NewChat/NewChatUi.dart';
import 'package:stellar_chat/widgets/search_text_field.dart';
import 'package:stellar_chat/widgets/welcome_chat.dart';
import 'package:flutter/material.dart';

class CreateNewChatUi extends StatefulWidget {
  static const routeName = '/CreateNewChatUi';
  const CreateNewChatUi({Key? key}) : super(key: key);

  @override
  State<CreateNewChatUi> createState() => _CreateNewChatUiState();
}

class _CreateNewChatUiState extends State<CreateNewChatUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTextField(),
          const SizedBox(height: 30),
          WelcomeChatContainer(),
          const SizedBox(height: 30),
          buildInviteFriendsRow(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, NewChatUi.routeName);
          },
        ),
      ],
    );
  }

  Widget buildInviteFriendsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'INVITE FRIENDS TO REGISTER',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            color: SColors.color3,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 10,
          ),
          color: SColors.color3,
          onPressed: () {},
        ),
      ],
    );
  }
}
