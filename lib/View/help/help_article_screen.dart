import 'package:base_project/View/help/widget/like_dislike_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/widgets/bullet_list.dart';
import 'package:base_project/widgets/number_list.dart';

class HelpArticleScreen extends StatelessWidget {
  Widget _buildHeader() {
    return Container(
      height: 75,
      width: double.infinity,
      color: SColors.color12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(SSvgs.stellarLogo),
          Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Text(
              'Help Article',
              style: TextStyle(
                color: SColors.color13,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: SColors.color11,
            onSelected: (value) {
              if (value == 'openInBrowser') {
                // Add your logic here for when 'open in browser' is selected
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Open In Browser'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice,style: TextStyle(color: SColors.color12),),
                );
              }).toList();
            },
            child: SvgPicture.asset(SSvgs.sv08, width: 7, height: 25),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Text(
      text,
      style: TextStyle(color: SColors.color3, fontSize: 20, fontWeight: FontWeight.w700,),
    );
  }

  Widget _buildSubtitle(String text, {double fontSize = 12, FontWeight fontWeight = FontWeight.w400}) {
    return Text(
      text,
      style: TextStyle(color: SColors.color3, fontSize: fontSize, fontWeight: fontWeight,),
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
      body: ListView(
        children: [
          _buildHeader(),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle('How to find contacts'),
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
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                const SizedBox(height: 30,),
                Column(
                  children: [
                    Text(
                      'Does this answer your question?',
                      style: TextStyle(color: SColors.color3, fontSize: 12,fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Your response is anonymous and helps us improve our help resources .',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                        color: SColors.color3, fontSize: 10, fontWeight: FontWeight.w400,),
                      textAlign: TextAlign.center,
                    ),],),
                const SizedBox(height: 50),
              ],),),
        ],
      ),
    );
  }
}
