import 'package:stellar_chat/View/help_article/widgets/bullet_list.dart';
import 'package:stellar_chat/View/help_article/widgets/like_dislike_button.dart';
import 'package:stellar_chat/View/help_article/widgets/number_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';

class HelpArticleScreen extends StatelessWidget {
  Widget _buildTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: SColors.color3,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildSubtitle(String text,
      {double fontSize = 12, FontWeight fontWeight = FontWeight.w500}) {
    return Text(
      text,
      style: TextStyle(
        color: SColors.color3,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget _buildNumberedList(List<String> items) {
    return NumberList(items);
  }

  Widget _buildBulletList(List<String> items) {
    return BulletList(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Help Article',
          style: TextStyle(
            color: SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: SColors.color11,
            onSelected: (String result) {
              if (result == 'openInBrowser') {
                // Handle opening in browser here
              }
            },
            icon: Icon(
              Icons.more_vert,
              size: 35,
              color: SColors.color11,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'openInBrowser',
                child: Text('Open in Browser'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle('How to Find Contacts'),
                const SizedBox(height: 20),
                _buildSubtitle(
                    'You can quickly and easily identify which of your contacts use Stellar Chat by accessing your phone\'s address book.'),
                const SizedBox(height: 20),
                _buildNumberedList([
                  "Open Stellar Chat and go to the Chats tab.",
                  "Tap on the New chat icon.",
                ]),
                const SizedBox(height: 15),
                _buildSubtitle(
                    fontWeight: FontWeight.w600,
                    "If you can't see your contacts, check the\nfollowing:"),
                const SizedBox(height: 15),
                _buildBulletList([
                  "Your contacts are using Stellar Chat.",
                  "You've saved your contacts' phone numbers in your phone's address book. If they're using a foreign phone number, use the full international format.",
                  "You've allowed Stellar Chat to access your phone's contacts in your phone's Settings app.",
                ]),
                const SizedBox(height: 10),
                _buildSubtitle(
                    fontWeight: FontWeight.w600,
                    "If you'd like to chat to someone you don't have\nsaved as a contact:"),
                const SizedBox(height: 20),
                _buildNumberedList([
                  "Open Stellar Chat and go to the Chats tab.",
                  "Tap the New chat icon.",
                  "Tap the Search icon and add the phone number in Search name or number field.",
                  "If the phone number is already using Stellar Chat:",
                ]),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: _buildBulletList([
                    "Tap Chat to begin chatting.",
                    "Note: To add this person as a contact, tap New Contact and fill in their details.",
                  ]),
                ),
                const SizedBox(height: 15),
                const Text(
                    "5. If the phone number doesn't use Stellar Chat, tap Share invite link to invite the phone number to chat on Stellar Chat.",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text(
                      'Does this answer your question?',
                      style: TextStyle(
                          color: SColors.color3,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Your response is anonymous and helps us improve our help resources .',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LikeDislikeButton(
                          circleColor: Colors.green,
                          iconData: Icons.thumb_up,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 20),
                        LikeDislikeButton(
                          circleColor: Colors.red,
                          iconData: Icons.thumb_down,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Help for something else? Contact Stellar Chat Support',
                      style: TextStyle(
                        color: SColors.color3,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
