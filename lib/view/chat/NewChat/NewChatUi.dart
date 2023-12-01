import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/chat/HomeChat/HomeChatUi.dart';
import 'package:stellar_chat/widgets/appbarContainer.dart';
import 'package:stellar_chat/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewChatUi extends StatefulWidget {
  static const routeName = '/NewChatUi';
  const NewChatUi({Key? key}) : super(key: key);

  @override
  State<NewChatUi> createState() => _NewChatUiState();
}

class _NewChatUiState extends State<NewChatUi> {
  List<bool> _selectedValues = [false, false, false, false, false];

  void _handleCheckboxValueChange(int index, bool value) {
    setState(() {
      _selectedValues[index] = value;
    });
  }

  Widget _buildTitleAndButton(String text, Function()? onPress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 15),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 83,
      decoration: BoxDecoration(color: SColors.color13),
      child: Stack(
        children: [
          Positioned(
            top: 26,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeChatUi.routeName);
              },
              child: Text('DONE',
                  style: TextStyle(fontFamily: 'Inter', color: SColors.color4)),
              style: ElevatedButton.styleFrom(
                backgroundColor: SColors.color12,
                foregroundColor: SColors.color4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomRow(int index, String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: _selectedValues[index],
            onChanged: (value) {
              _handleCheckboxValueChange(index, value!);
            },
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: SColors.color14,
            child: SvgPicture.asset(SSvgs.sv06),
          ),
          const SizedBox(width: 15),
          Text(
            labelText,
            style: TextStyle(
              fontFamily: 'Inter',
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSelectOneMoreText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        'SELECT ONE OR MORE CONTACTS',
        style: TextStyle(
          fontFamily: 'Inter',
          color: SColors.color3,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: ListView(
        children: [
          AppBarContainer(labelText: 'New Chat'),
          const SearchTextField(),
          const SizedBox(
            height: 15,
          ),
          buildSelectOneMoreText(),
          _buildTitleAndButton('JOIN PRIVATE GROUP', () {}),
          const SizedBox(height: 30),
          _buildCustomRow(0, 'RAJMOHAN CHOZHIATH'),
          const SizedBox(height: 15),
          _buildCustomRow(1, 'DULQUER SALMAN'),
          const SizedBox(height: 15),
          _buildCustomRow(2, 'ROY MATHEW'),
          const SizedBox(height: 15),
          _buildCustomRow(3, 'OSAMA ABUHMEIDAN'),
          const SizedBox(height: 15),
          _buildCustomRow(4, 'AMITHAB BACHCHAN'),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }
}
